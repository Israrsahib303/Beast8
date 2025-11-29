<?php
include '_header.php'; 
require_once __DIR__ . '/../includes/smm_api.class.php';

// --- NAYI SQL Queries (Sirf SMM ke liye) ---
try {
    // 1. Total SMM Revenue (Jo user ne pay kiya)
    $smm_total_revenue = $db->query("SELECT SUM(charge) FROM smm_orders")->fetchColumn() ?? 0;

    // 2. Total SMM Orders
    $smm_total_orders = $db->query("SELECT COUNT(id) FROM smm_orders")->fetchColumn() ?? 0;

    // 3. SMM Orders (Pending)
    $smm_pending_orders = $db->query("SELECT COUNT(id) FROM smm_orders WHERE status = 'pending'")->fetchColumn() ?? 0;

    // 4. SMM Orders (In Progress)
    $smm_in_progress = $db->query("SELECT COUNT(id) FROM smm_orders WHERE status = 'in_progress'")->fetchColumn() ?? 0;
    
    // 5. Total SMM Profit (Asal Munafa)
    $stmt_profit = $db->query("
        SELECT SUM(o.charge - ( (o.quantity / 1000) * s.base_price )) 
        FROM smm_orders o
        JOIN smm_services s ON o.service_id = s.id
        WHERE o.status = 'completed' OR o.status = 'partial'
    ");
    $smm_total_profit = $stmt_profit->fetchColumn() ?? 0;
    
    // 6. Provider Balance (Live API Call)
    $provider_balance = 'N/A';
    $provider_currency = '';
    $stmt_provider = $db->query("SELECT * FROM smm_providers WHERE is_active = 1 LIMIT 1");
    $provider = $stmt_provider->fetch();
    if ($provider) {
        $api = new SmmApi($provider['api_url'], $provider['api_key']);
        $balance_result = $api->getBalance();
        if ($balance_result['success']) {
            $provider_balance = number_format($balance_result['balance'], 2);
            $provider_currency = $balance_result['currency'];
        } else {
            $provider_balance = 'Error';
        }
    }
    
    // 7. Recent SMM Orders
    $stmt_recent = $db->query("
        SELECT o.*, u.email, s.name 
        FROM smm_orders o
        JOIN users u ON o.user_id = u.id
        JOIN smm_services s ON o.service_id = s.id
        ORDER BY o.created_at DESC
        LIMIT 5
    ");
    $recent_smm_orders = $stmt_recent->fetchAll();

} catch (PDOException $e) {
    echo "<div class='message error'>Failed to load SMM dashboard stats: " . $e->getMessage() . "</div>";
}

// --- NAYA FEATURE: System Health Function ---
function getCronJobStatus() {
    $log_files = [
        'Order Placer' => 'smm_order_placer.log',
        'Status Sync' => 'smm_status_sync.log',
        'Service Sync' => 'smm_service_sync.log',
        'Email Payments' => 'email_payments.log'
    ];
    
    $log_dir = __DIR__ . '/../assets/logs/';
    $status_data = [];
    $now = new DateTime();

    foreach ($log_files as $name => $file) {
        $file_path = $log_dir . $file;
        $status_text = 'Not Run Yet';
        $status_class = 'status-unknown';

        if (file_exists($file_path)) {
            $file_mod_time = filemtime($file_path);
            $last_run = new DateTime('@' . $file_mod_time);
            $diff = $now->getTimestamp() - $last_run->getTimestamp(); // seconds

            if ($diff < 300) { // 5 minutes
                $status_text = 'Running OK';
                $status_class = 'status-ok';
            } elseif ($diff < 3600) { // 1 hour
                $status_text = 'Warning';
                $status_class = 'status-warning';
            } else { // Over 1 hour
                $status_text = 'CRITICAL DOWN';
                $status_class = 'status-down';
            }
            
            // Time formatting
            if ($diff < 60) {
                 $time_ago = $diff . ' sec ago';
            } elseif ($diff < 3600) {
                 $time_ago = floor($diff / 60) . ' min ago';
            } else {
                 $time_ago = floor($diff / 3600) . ' hr ago';
            }

            $status_data[] = [
                'name' => $name,
                'time_ago' => $time_ago,
                'status_text' => $status_text,
                'status_class' => $status_class
            ];

        } else {
            $status_data[] = [
                'name' => $name,
                'time_ago' => 'N/A',
                'status_text' => 'Log File Missing',
                'status_class' => 'status-down'
            ];
        }
    }
    return $status_data;
}

$system_health = getCronJobStatus();
// --- NAYA FEATURE ENDS ---
?>

<style>
    @keyframes pulseGlow {
        0% { box-shadow: 0 0 10px rgba(40, 167, 69, 0.2); }
        50% { box-shadow: 0 0 20px rgba(40, 167, 69, 0.6); }
        100% { box-shadow: 0 0 10px rgba(40, 167, 69, 0.2); }
    }
    .stat-card .positive { color: #28a745; }
    .stat-card .negative { color: #dc3545; }
    .stat-card .live-balance {
        color: #007bff;
        animation: pulseGlow 2s infinite;
    }
    
    /* --- NAYA CSS: System Health Box --- */
    .system-health-card {
        background: #fff;
        border: 1px solid #e0e0e0;
        border-radius: 12px;
        box-shadow: 0 4px 12px rgba(0,0,0,0.03);
        margin-top: 25px;
    }
    .system-health-card h2 {
        font-size: 20px;
        font-weight: 600;
        color: #333;
        padding: 20px 25px;
        margin: 0;
        border-bottom: 1px solid #f0f0f0;
    }
    .health-list {
        padding: 0;
        margin: 0;
    }
    .health-item {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 18px 25px;
        border-bottom: 1px solid #f5f5f5;
        font-size: 15px;
    }
    .health-item:last-child {
        border-bottom: none;
    }
    .health-item .job-name {
        font-weight: 600;
        color: #555;
    }
    .health-item .job-status {
        display: flex;
        align-items: center;
        gap: 15px;
    }
    .health-item .time-ago {
        color: #777;
        font-size: 14px;
    }
    .health-item .status-badge {
        font-weight: 700;
        padding: 5px 10px;
        border-radius: 20px;
        font-size: 12px;
        text-transform: uppercase;
    }
    .health-item .status-ok {
        background-color: rgba(40, 167, 69, 0.1);
        color: #28a745;
    }
    .health-item .status-warning {
        background-color: rgba(255, 193, 7, 0.1);
        color: #ffc107;
    }
    .health-item .status-down {
        background-color: rgba(220, 53, 69, 0.1);
        color: #dc3545;
    }
    .health-item .status-unknown {
        background-color: #f0f0f0;
        color: #666;
    }
    /* --- NAYA CSS ENDS --- */
</style>

<h1>SMM Panel Dashboard</h1>

<div class="stat-grid">
    <div class="stat-card">
        <h3>SMM Total Revenue</h3>
        <p class="positive"><?php echo formatCurrency($smm_total_revenue); ?></p>
    </div>
    <div class="stat-card">
        <h3>SMM Total Profit</h3>
        <p class="positive"><?php echo formatCurrency($smm_total_profit); ?></p>
    </div>
    <div class="stat-card">
        <h3>SMM Total Orders</h3>
        <p><?php echo number_format($smm_total_orders); ?></p>
    </div>
    <div class="stat-card">
        <h3>Orders Pending</h3>
        <p class="negative"><?php echo number_format($smm_pending_orders); ?></p>
    </div>
    <div class="stat-card">
        <h3>Orders In Progress</h3>
        <p><?php echo number_format($smm_in_progress); ?></p>
    </div>
     <div class="stat-card">
        <h3>Provider Balance</h3>
        <p class="live-balance"><?php echo $provider_balance . ' ' . $provider_currency; ?></p>
    </div>
</div>

<div class="system-health-card">
    <h2>System Health (Cron Heartbeat)</h2>
    <ul class="health-list">
        <?php foreach ($system_health as $job): ?>
            <li class="health-item">
                <span class="job-name"><?php echo $job['name']; ?></span>
                <span class="job-status">
                    <span class="time-ago"><?php echo $job['time_ago']; ?></span>
                    <span class="status-badge <?php echo $job['status_class']; ?>">
                        <?php echo $job['status_text']; ?>
                    </span>
                </span>
            </li>
        <?php endforeach; ?>
    </ul>
</div>
<h2>Recent SMM Orders</h2>
<div class="admin-table-responsive">
    <table class="admin-table">
        <thead>
            <tr>
                <th>Order ID</th>
                <th>User</th>
                <th>Service</th>
                <th>Charge</th>
                <th>Status</th>
                <th>Provider ID</th>
            </tr>
        </thead>
        <tbody>
            <?php if (empty($recent_smm_orders)): ?>
                <tr><td colspan="6" style="text-align: center;">No recent SMM orders.</td></tr>
            <?php else: ?>
                <?php foreach ($recent_smm_orders as $order): ?>
                <tr>
                    <td><strong>#<?php echo $order['id']; ?></strong></td>
                    <td><?php echo sanitize($order['email']); ?></td>
                    <td><?php echo sanitize($order['name']); ?></td>
                    <td><?php echo formatCurrency($order['charge']); ?></td>
                    <td><span class="status-badge status-<?php echo str_replace(' ', '_', strtolower($order['status'])); ?>"><?php echo ucfirst($order['status']); ?></span></td>
                    <td><?php echo $order['provider_order_id'] ?? 'N/A'; ?></td>
                </tr>
                <?php endforeach; ?>
            <?php endif; ?>
        </tbody>
    </table>
</div>

<?php include '_footer.php'; ?>