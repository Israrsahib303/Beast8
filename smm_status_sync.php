<?php
// --- CRON JOB (Run every 5 minutes) ---
// Yeh script 'in_progress' orders ko provider se check karti hai

// --- BUG FIX: Log file ka path pehle define karein ---
$log_file = __DIR__ . '/../../assets/logs/smm_status_sync.log';
// --- FIX END ---

chdir(dirname(__DIR__)); 
require_once 'config.php';
require_once 'db.php';
require_once 'smm_api.class.php';
require_once 'wallet.class.php'; // Wallet class ko include karein
// Yahan formatCurrency function ko use karne ke liye 'helpers.php' include karna zaroori hai
require_once 'helpers.php'; 

$log_message = "Status Sync Cron started at " . date('Y-m-d H:i:s') . "\n";

try {
    // 1. Provider
    $stmt_provider = $db->prepare("SELECT * FROM smm_providers WHERE is_active = 1 LIMIT 1");
    $stmt_provider->execute();
    $provider = $stmt_provider->fetch();

    if (!$provider) {
        throw new Exception('No active SMM provider found.');
    }
    
    $api = new SmmApi($provider['api_url'], $provider['api_key']);
    $wallet = new Wallet($db); // Wallet object tayyar karein

    // 2. 'in_progress' orders (limit 50) fetch karein
    $stmt_orders = $db->prepare("
        SELECT id, user_id, provider_order_id, quantity, charge 
        FROM smm_orders 
        WHERE status = 'in_progress'
        LIMIT 50
    ");
    $stmt_orders->execute();
    $in_progress_orders = $stmt_orders->fetchAll();

    if (empty($in_progress_orders)) {
        $log_message .= "No in_progress orders found.\n";
    } else {
        $log_message .= count($in_progress_orders) . " in_progress orders found. Processing...\n";
    }

    // 3. Har order ko check karein
    foreach ($in_progress_orders as $order) {
        $order_id = $order['id'];
        $provider_order_id = $order['provider_order_id'];
        
        $result = $api->getOrderStatus($provider_order_id);

        if ($result['success']) {
            $status_data = $result['status_data'];
            $api_status = strtolower($status_data['status']);
            
            // NOTE: API response se milne wali values ko integer ya float mein convert karna zaroori hai
            $start_count = (int)($status_data['start_count'] ?? 0);
            $remains = (int)($status_data['remains'] ?? 0); // Agar remains null aata hai, toh 0 maan lenge

            // Default SQL: sirf counts update karein
            $sql = "UPDATE smm_orders SET start_count = ?, remains = ? WHERE id = ?";
            $params = [$start_count, $remains, $order_id];

            // --- FIXED REFUND AND STATUS LOGIC ---
            if ($api_status == 'completed') {
                $sql = "UPDATE smm_orders SET status = 'completed', start_count = ?, remains = ? WHERE id = ?";
                $log_message .= "  SUCCESS: Order #$order_id (Provider: $provider_order_id) marked as COMPLETED.\n";
            
            } elseif ($api_status == 'partial' || $api_status == 'cancelled' || $api_status == 'canceled') {
                
                // Final Status decide karein
                $final_status = ($api_status == 'partial') ? 'partial' : 'cancelled';
                
                // SQL query for final status
                $sql = "UPDATE smm_orders SET status = ?, start_count = ?, remains = ? WHERE id = ?";
                $params = [$final_status, $start_count, $remains, $order_id];
                
                // Refund Calculation: Sirf remaining quantity ka refund karein
                if ($remains > 0) {
                    $charge_per_item = (float)$order['charge'] / (float)$order['quantity'];
                    $refund_amount = $charge_per_item * $remains;

                    // Refund ko process karein
                    $wallet->addCredit($order['user_id'], $refund_amount, 'refund', $order_id, "Auto Refund for $final_status Order #$order_id (Remaining: $remains)");
                    
                    $log_message .= "  REFUND PROCESSED: Order #$order_id marked as " . strtoupper($final_status) . ". Refunded " . formatCurrency($refund_amount) . " for $remains remaining items.\n";
                
                } elseif ($remains == 0) {
                     $log_message .= "  STATUS UPDATED: Order #$order_id marked as " . strtoupper($final_status) . ". Remains is 0 (No refund needed as full qty used or delivered).\n";
                } else {
                     $log_message .= "  WARNING: Order marked " . strtoupper($final_status) . ", but 'remains' value is invalid/negative. Manual check required.\n";
                }
                
            } elseif ($api_status == 'processing' || $api_status == 'in progress' || $api_status == 'pending' || $api_status == 'waiting') {
                 // Status 'in_progress' hi rahega, sirf start_count/remains update honge
                $log_message .= "  UPDATING: Order #$order_id (Provider: $provider_order_id) is still in progress. Counts updated.\n";
            } else {
                // Koi aur status
                $log_message .= "  INFO: Order #$order_id received status: $api_status. No action taken.\n";
            }
            
            // DB update karein (final status update aur counts update dono ke liye)
            // Note: $sql aur $params ko har block mein set kiya gaya hai.
            $db->prepare($sql)->execute($params);

        } else {
            // API call fail
            $error_msg = $result['error'] ?? 'Unknown API error';
            $log_message .= "  FAILED: Could not get status for Order #$order_id. Error: $error_msg\n";
        }
    }

} catch (Exception $e) {
    $log_message .= "CRITICAL ERROR: " . $e->getMessage() . "\n";
}

$log_message .= "Cron finished at " . date('Y-m-d H:i:s') . "\n\n";
file_put_contents($log_file, $log_message, FILE_APPEND);
echo $log_message;
?>