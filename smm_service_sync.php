<?php
// --- CRON JOB (Fixed Removed Count) ---
require_once __DIR__ . '/../config.php';
require_once __DIR__ . '/../db.php';
require_once __DIR__ . '/../helpers.php';
require_once __DIR__ . '/../smm_api.class.php';

$log_file = __DIR__ . '/../../assets/logs/smm_service_sync.log';
function writeLog($msg) {
    global $log_file;
    $entry = "[" . date('Y-m-d H:i:s') . "] " . $msg . "\n";
    file_put_contents($log_file, $entry, FILE_APPEND);
}

writeLog("--- Sync Started ---");

try {
    // 1. Table Check
    $db->exec("CREATE TABLE IF NOT EXISTS `service_updates` (
      `id` int(11) NOT NULL AUTO_INCREMENT,
      `service_id` int(11) DEFAULT NULL,
      `service_name` varchar(255) NOT NULL,
      `category_name` varchar(255) NOT NULL,
      `rate` decimal(10,4) NOT NULL,
      `type` enum('new','removed','enabled','price_increase','price_decrease') NOT NULL,
      `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
      PRIMARY KEY (`id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;");

    // 2. Settings
    $usd_rate = (float)($GLOBALS['settings']['currency_conversion_rate'] ?? 280.00);
    $providers = $db->query("SELECT * FROM smm_providers WHERE is_active = 1")->fetchAll(PDO::FETCH_ASSOC);
    
    // Counters
    $new_count = 0; 
    $upd_count = 0;
    $rem_count = 0; // Added Removed Counter

    foreach ($providers as $provider) {
        $api = new SmmApi($provider['api_url'], $provider['api_key']);
        $res = $api->getServices();
        
        if (!$res['success']) {
            writeLog("API Error ({$provider['name']}): " . ($res['error'] ?? 'Unknown'));
            continue;
        }
        
        $db->beginTransaction();
        $seen_ids = [];

        foreach ($res['services'] as $s) {
            if (empty($s['service']) || !isset($s['rate'])) continue;
            
            $sid = (int)$s['service'];
            $seen_ids[] = $sid;

            // Data
            $name = sanitize($s['name']);
            $cat = sanitize($s['category']);
            $min = (int)$s['min'];
            $max = (int)$s['max'];
            $avg = sanitize($s['average_time'] ?? $s['avg_time'] ?? 'N/A');
            $desc = sanitize($s['description'] ?? $s['desc'] ?? '');
            $type = sanitize($s['type'] ?? 'Default');
            $refill = (!empty($s['refill']) && ($s['refill'] == 1 || $s['refill'] === true)) ? 1 : 0;
            $cancel = (!empty($s['cancel']) && ($s['cancel'] == 1 || $s['cancel'] === true)) ? 1 : 0;
            $drip = (!empty($s['dripfeed']) && ($s['dripfeed'] == 1 || $s['dripfeed'] === true)) ? 1 : 0;

            // Price
            $rate_usd = (float)$s['rate'];
            $base_price_pkr = $rate_usd * $usd_rate;
            $selling_price = $base_price_pkr * (1 + ($provider['profit_margin'] / 100));

            // DB Check
            $stmt = $db->prepare("SELECT id, manually_deleted FROM smm_services WHERE provider_id=? AND service_id=?");
            $stmt->execute([$provider['id'], $sid]);
            $existing = $stmt->fetch(PDO::FETCH_ASSOC);

            if ($existing) {
                if ($existing['manually_deleted'] == 1) continue;

                // Update
                $sql = "UPDATE smm_services SET name=?, category=?, base_price=?, service_rate=?, min=?, max=?, avg_time=?, description=?, has_refill=?, has_cancel=?, service_type=?, dripfeed=?, is_active=1 WHERE id=?";
                $db->prepare($sql)->execute([$name, $cat, $base_price_pkr, $selling_price, $min, $max, $avg, $desc, $refill, $cancel, $type, $drip, $existing['id']]);
                $upd_count++;
            } else {
                // Insert
                $sql = "INSERT INTO smm_services (provider_id, service_id, name, category, base_price, service_rate, min, max, avg_time, description, has_refill, has_cancel, service_type, dripfeed, is_active, manually_deleted) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,1,0)";
                $db->prepare($sql)->execute([$provider['id'], $sid, $name, $cat, $base_price_pkr, $selling_price, $min, $max, $avg, $desc, $refill, $cancel, $type, $drip]);
                
                // Log New
                $new_id = $db->lastInsertId();
                $db->prepare("INSERT INTO service_updates (service_id, service_name, category_name, rate, type) VALUES (?, ?, ?, ?, 'new')")
                   ->execute([$new_id, $name, $cat, $selling_price]);
                   
                $new_count++;
            }
        }

        // Handle Removed Services
        if (!empty($seen_ids)) {
            $in = implode(',', array_fill(0, count($seen_ids), '?'));
            $params = array_merge([$provider['id']], $seen_ids);
            
            // Fetch what we are about to remove
            $to_remove = $db->prepare("SELECT id, name, category, service_rate FROM smm_services WHERE provider_id=? AND is_active=1 AND manually_deleted=0 AND service_id NOT IN ($in)");
            $to_remove->execute($params);
            $removed_list = $to_remove->fetchAll();
            
            // Count Removed
            $rem_count += count($removed_list);

            foreach ($removed_list as $rm) {
                // Log Removal
                $db->prepare("INSERT INTO service_updates (service_id, service_name, category_name, rate, type) VALUES (?, ?, ?, ?, 'removed')")
                   ->execute([$rm['id'], $rm['name'], $rm['category'], $rm['service_rate']]);
            }

            // Disable Them
            $db->prepare("UPDATE smm_services SET is_active=0 WHERE provider_id=? AND manually_deleted=0 AND service_id NOT IN ($in)")->execute($params);
        }

        // Update Categories
        $db->query("INSERT IGNORE INTO smm_categories (name, is_active) SELECT DISTINCT category, 1 FROM smm_services WHERE is_active=1 AND manually_deleted=0");

        // Cleanup Logs (3 Days)
        $db->query("DELETE FROM service_updates WHERE created_at < NOW() - INTERVAL 3 DAY");

        $db->commit();
    }

    // Final Log with Removed Count
    writeLog("Success. New: $new_count, Updated: $upd_count, Removed: $rem_count");

} catch (Exception $e) {
    if ($db->inTransaction()) $db->rollBack();
    writeLog("Error: " . $e->getMessage());
}
?>