<?php
// NAYI FILE: reset_password.php
session_start();
include 'includes/config.php';
include 'includes/db.php';
include 'includes/helpers.php';

$error = '';
$success = '';
$token = $_GET['token'] ?? '';
$show_form = false;

if (empty($token)) {
    $error = "Invalid or missing reset token.";
} else {
    // Token check karein
    $stmt = $db->prepare("SELECT id FROM users WHERE password_reset_token = ? AND reset_token_expires_at > NOW()");
    $stmt->execute([$token]);
    $user = $stmt->fetch();

    if ($user) {
        $show_form = true;
        $user_id = $user['id'];
    } else {
        $error = "Token is invalid or has expired. Please request a new one.";
    }
}

// Naya password set karein
if ($show_form && $_SERVER['REQUEST_METHOD'] == 'POST') {
    $password = $_POST['password'];
    $confirm_password = $_POST['confirm_password'];

    if (empty($password) || empty($confirm_password)) {
        $error = "Both password fields are required.";
    } elseif ($password !== $confirm_password) {
        $error = "Passwords do not match.";
    } elseif (strlen($password) < 6) {
        $error = "Password must be at least 6 characters long.";
    } else {
        // Password update karein
        $hashed_password = password_hash($password, PASSWORD_DEFAULT);
        // Token ko NULL kar dein taake dobara istemaal na ho sake
        $stmt_update = $db->prepare("UPDATE users SET password = ?, password_reset_token = NULL, reset_token_expires_at = NULL WHERE id = ?");
        
        if ($stmt_update->execute([$hashed_password, $user_id])) {
            // Kamyab! Login page par bhej dein
            redirect(SITE_URL . '/login.php?success=reset');
        } else {
            $error = "Failed to update password. Please try again.";
        }
    }
}

$page_title = "Reset Password";
include 'user/_header.php';
?>

<div class="form-container">
    <h2>Set New Password</h2>
    
    <?php if ($error): ?>
        <div class="message error"><?php echo $error; ?></div>
    <?php endif; ?>
    <?php if ($success): ?>
        <div class="message success"><?php echo $success; ?></div>
    <?php endif; ?>

    <?php if ($show_form): // Agar token sahi hai toh form dikhayein ?>
        <form action="reset_password.php?token=<?php echo sanitize($token); ?>" method="POST">
            <div class="form-group">
                <label for="password">New Password</label>
                <input type="password" id="password" name="password" required>
            </div>
            <div class="form-group">
                <label for="confirm_password">Confirm New Password</label>
                <input type="password" id="confirm_password" name="confirm_password" required>
            </div>
            <div class="form-group">
                <button type="submit" class="btn btn-primary">Set New Password</button>
            </div>
        </form>
    <?php else: // Agar token ghalat hai ?>
        <div class="form-footer">
            <p><a href="forgot_password.php">Request a new reset link</a></p>
        </div>
    <?php endif; ?>
</div>

<?php include 'user/_footer.php'; ?>