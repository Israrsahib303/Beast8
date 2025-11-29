<?php
// NAYI FILE: forgot_password.php
session_start();
include 'includes/config.php';
include 'includes/db.php';
include 'includes/helpers.php'; // helpers.php ab PHPMailer ko load karta hai

$error = '';
$success = '';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $email = filter_var($_POST['email'], FILTER_SANITIZE_EMAIL);

    if (empty($email) || !filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $error = "Please enter a valid email address.";
    } else {
        $stmt = $db->prepare("SELECT id, name FROM users WHERE email = ?");
        $stmt->execute([$email]);
        $user = $stmt->fetch();

        if ($user) {
            // User mil gaya, token banayein
            $token = bin2hex(random_bytes(32));
            $expires = new DateTime('now');
            $expires->add(new DateInterval('PT1H')); // Token 1 ghante ke liye valid hai
            
            $stmt_token = $db->prepare("UPDATE users SET password_reset_token = ?, reset_token_expires_at = ? WHERE id = ?");
            if ($stmt_token->execute([$token, $expires->format('Y-m-d H:i:s'), $user['id']])) {
                
                // Reset link banayein
                $reset_link = SITE_URL . '/reset_password.php?token=' . $token;

                // Email bhejein
                $subject = "Password Reset Request for " . ($settings['site_name'] ?? 'Beast2 Panel');
                $body = "Hi " . $user['name'] . ",<br><br>We received a request to reset your password. Click the link below to reset it:<br><br>";
                $body .= "<a href='$reset_link'>$reset_link</a><br><br>";
                $body .= "This link will expire in 1 hour.<br><br>If you did not request this, please ignore this email.";
                
                $email_result = sendEmail($email, $user['name'], $subject, $body);

                if ($email_result['success']) {
                    $success = "A password reset link has been sent to your email. Please check your inbox (and spam folder).";
                } else {
                    $error = "Could not send email. " . $email_result['message'];
                }
            } else {
                $error = "Failed to generate reset token. Please try again.";
            }
        } else {
            // Email nahi mila, lekin user ko batayein nahi (Security)
            $success = "If an account with that email exists, a reset link has been sent.";
        }
    }
}

$page_title = "Forgot Password";
include 'user/_header.php';
?>

<div class="form-container">
    <h2>Reset Password</h2>
    <p>Enter your email address to receive a password reset link.</p>
    
    <?php if ($error): ?>
        <div class="message error"><?php echo $error; ?></div>
    <?php endif; ?>
    <?php if ($success): ?>
        <div class="message success"><?php echo $success; ?></div>
    <?php endif; ?>

    <form action="forgot_password.php" method="POST">
        <div class="form-group">
            <label for="email">Email</label>
            <input type="email" id="email" name="email" required>
        </div>
        <div class="form-group">
            <button type="submit" class="btn btn-primary">Send Reset Link</button>
        </div>
    </form>
    <div class="form-footer">
        <p>Remembered your password? <a href="login.php">Login here</a></p>
    </div>
</div>

<?php include 'user/_footer.php'; ?>