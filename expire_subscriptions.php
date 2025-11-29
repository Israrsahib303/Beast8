<?php
// --- CRON JOB (Run every day at 1:00 AM) ---
// Purani (expired) Subscriptions ko 'expired' mark karta hai

// --- BUG FIX: Log file ka path pehle define karein ---
$log_file = __DIR__ . '/../../assets/logs/subscriptions.log';
// --- FIX END ---

chdir(dirname(__DIR__)); 
require_once 'config.php';
require_once 'db.php';

// $log_file = '../../assets/logs/subscriptions.log'; // YEH LINE GHALAT THI
$log_message = "Subscription Expire Cron started at " . date('Y-m-d H:i:s') . "\n";

try {
    // Woh tamam 'active' orders dhoondein jinki 'end_at' date aaj se purani hai
    $stmt = $db->prepare("
        UPDATE orders 
        SET status = 'expired'
        WHERE status = 'active' AND end_at < NOW()
    ");
    
    $stmt->execute();
    $expired_count = $stmt->rowCount();

    if ($expired_count > 0) {
        $log_message .= "Successfully marked $expired_count subscriptions as 'expired'.\n";
    } else {
        $log_message .= "No active subscriptions found that needed expiration.\n";
    }

} catch (Exception $e) {
    $log_message .= "CRITICAL ERROR: " . $e->getMessage() . "\n";
}

$log_message .= "Cron finished at " . date('Y-m-d H:i:s') . "\n\n";
file_put_contents($log_file, $log_message, FILE_APPEND);
echo $log_message;
?>