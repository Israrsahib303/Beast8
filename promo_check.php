<?php
// includes/promo_check.php - Validates Code & Calculates % Bonus

require_once 'config.php';
require_once 'db.php';
require_once 'helpers.php'; // For formatCurrency function

header('Content-Type: application/json');

// Input
$code = strtoupper(sanitize($_POST['code'] ?? ''));
$amount = (float)($_POST['amount'] ?? 0);
$user_id = $_SESSION['user_id'] ?? 0;

if (!$user_id) { echo json_encode(['valid'=>false, 'error'=>'Please login first']); exit; }
if (empty($code)) { echo json_encode(['valid'=>false, 'error'=>'Code required']); exit; }
if ($amount <= 0) { echo json_encode(['valid'=>false, 'error'=>'Enter amount']); exit; }

// 1. Fetch Code
$stmt = $db->prepare("SELECT * FROM promo_codes WHERE code = ? AND is_active = 1");
$stmt->execute([$code]);
$promo = $stmt->fetch(PDO::FETCH_ASSOC);

// 2. Validate
if (!$promo) {
    echo json_encode(['valid'=>false, 'error'=>'Invalid Promo Code']);
    exit;
}

if ($promo['max_uses'] > 0 && $promo['current_uses'] >= $promo['max_uses']) {
    echo json_encode(['valid'=>false, 'error'=>'Promo Limit Reached']);
    exit;
}

if ($amount < $promo['min_deposit']) {
    echo json_encode(['valid'=>false, 'error'=>'Minimum deposit '.formatCurrency($promo['min_deposit']).' required']);
    exit;
}

// 3. Calculate Percentage Bonus
// Formula: (Deposit Amount * Percentage) / 100
$bonus_amount = ($amount * $promo['deposit_bonus']) / 100;
$total_get = $amount + $bonus_amount;

// 4. Return Success
echo json_encode([
    'valid' => true,
    'symbol' => '', // Symbol already handled by formatCurrency helper if used, but sending raw for calculation
    'bonus_amount' => number_format($bonus_amount, 2),
    'total_amount' => number_format($total_get, 2),
    'percent' => $promo['deposit_bonus']
]);
?>