<?php
// includes/jarvis_logic.php - Advanced Groq Brain
require_once 'db.php';
header('Content-Type: text/plain');

// Error Handling Off for cleaner output
error_reporting(0);
ini_set('display_errors', 0);

// 1. AUTH & SETTINGS
$stmt = $db->query("SELECT setting_key, setting_value FROM settings");
$settings = [];
while ($row = $stmt->fetch()) { $settings[$row['setting_key']] = $row['setting_value']; }

// API Key Check (Groq)
$api_key = isset($settings['gemini_api_key']) ? trim($settings['gemini_api_key']) : '';
$admin_name = "Sir Israr";
$user_query = $_POST['query'] ?? '';
$current_page = $_POST['current_page'] ?? 'Unknown';

if (empty($api_key)) { echo "TALK|Sir, API Key missing hai settings mein."; exit; }

// 2. GATHER DEEP INTELLIGENCE (Live Data)
try {
    $sales_today = $db->query("SELECT SUM(amount) FROM payments WHERE status='approved' AND DATE(created_at) = CURDATE()")->fetchColumn() ?? 0;
    $pending_orders = $db->query("SELECT COUNT(*) FROM smm_orders WHERE status='pending'")->fetchColumn();
    $active_tickets = $db->query("SELECT COUNT(*) FROM tickets WHERE status='pending'")->fetchColumn();
    $total_users = $db->query("SELECT COUNT(*) FROM users")->fetchColumn();
    
    // Recent Activity
    $last_order = $db->query("SELECT id, service_id, charge FROM smm_orders ORDER BY id DESC LIMIT 1")->fetch();
    $last_user = $db->query("SELECT email FROM users ORDER BY id DESC LIMIT 1")->fetch();
} catch (Exception $e) {
    echo "TALK|Database Error: " . $e->getMessage(); exit;
}

// 3. ADMIN MAP (Navigation Context)
$admin_map = "
[DASHBOARD] index.php
[USERS] users.php (Manage users, ban/unban, add funds)
[SMM ORDERS] smm_orders.php (Check order status, cancel, refill)
[SERVICES] smm_services.php (Edit prices, add services)
[CATEGORIES] smm_categories.php (Manage icons, sort)
[PAYMENTS] payments.php (Approve/Reject deposits)
[METHODS] methods.php (Add JazzCash, EasyPaisa, Bank)
[TICKETS] tickets.php (Reply to support)
[SETTINGS] settings.php (Logo, Name, API Keys)
[REWARDS] testimonials.php (Video proofs, approve rewards)
[DOWNLOADS] downloads_manager.php (Manage digital files)
[LOGOUT] ../logout.php
";

// 4. SYSTEM INSTRUCTION (Strict & Smart)
$system_prompt = "
You are J.A.R.V.I.S, an advanced AI system managing the 'SubHub' Panel.
User: $admin_name (The Boss).
Current Page: $current_page.

[LIVE SYSTEM STATUS]
- Sales Today: $sales_today PKR
- Pending SMM Orders: $pending_orders
- Open Tickets: $active_tickets
- Total Users: $total_users
- Last Order ID: " . ($last_order['id'] ?? 'None') . "
- Newest User: " . ($last_user['email'] ?? 'None') . "

[NAVIGATION MAP]
$admin_map

[YOUR INSTRUCTIONS]
1. You are capable of executing SQL commands and Navigating the admin panel.
2. If the user asks to **GO/OPEN/SHOW** a page -> Output `NAV|filename.php|Message`.
3. If the user asks to **CHANGE/DELETE/UPDATE** data -> Output `SQL|SQL_QUERY|Message`.
4. If the user asks for **INFO/STATUS** -> Output `TALK|Message`.
5. **Tone:** Robotic, Loyal, Efficient. Speak in **Hinglish** (Urdu/Hindi mixed with English).
6. **Safety:** Do NOT allow DROP or TRUNCATE queries.

[EXAMPLES]
User: 'Order 50 cancel karo' -> SQL|UPDATE smm_orders SET status='cancelled' WHERE id=50|Order 50 has been cancelled Sir.
User: 'User 10 ko ban kar do' -> SQL|UPDATE users SET status='banned' WHERE id=10|User 10 is now banned.
User: 'Payment settings kholo' -> NAV|methods.php|Opening payment configuration.
User: 'Aaj ka hisaab batao' -> TALK|Sir, aaj total sales $sales_today PKR hain.

User Query: \"$user_query\"
";

// 5. CALL GROQ API (Llama 3.1)
$url = "https://api.groq.com/openai/v1/chat/completions";

$data = [
    "model" => "llama-3.1-8b-instant",
    "messages" => [
        ["role" => "system", "content" => "You are a helpful assistant."],
        ["role" => "user", "content" => $system_prompt]
    ],
    "temperature" => 0.3 // Low temp for accuracy
];

$ch = curl_init($url);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_POST, true);
curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($data));
curl_setopt($ch, CURLOPT_HTTPHEADER, [
    'Content-Type: application/json',
    'Authorization: Bearer ' . $api_key
]);

$response = curl_exec($ch);
$curl_error = curl_error($ch);
curl_close($ch);

if ($curl_error) { echo "TALK|Connection Failed: $curl_error"; exit; }

$result = json_decode($response, true);
$reply_text = $result['choices'][0]['message']['content'] ?? 'TALK|Sir, brain connection lost.';

// Clean formatting
$reply_text = trim(str_replace(['```sql', '```', '`'], '', $reply_text));

// 6. EXECUTE ACTION (Server Side Power)
$parts = explode('|', $reply_text);
$type = trim($parts[0] ?? 'TALK');
$payload = trim($parts[1] ?? '');
$msg = trim($parts[2] ?? 'Done.');

if ($type == 'SQL') {
    // Execute Query
    if (!empty($payload)) {
        try {
            $db->query($payload); 
            echo "REFRESH|" . $msg; 
        } catch (Exception $e) {
            echo "TALK|Sir, SQL Error aaya hai: " . $e->getMessage();
        }
    }
} else {
    // NAV or TALK pass through
    echo $reply_text;
}
?>