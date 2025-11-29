<?php
require_once __DIR__ . '/includes/helpers.php';

// Google Config Check
if (file_exists(__DIR__ . '/includes/google_config.php')) {
    require_once __DIR__ . '/includes/google_config.php';
}

$error_param = $_GET['error'] ?? '';

// Redirect if already logged in
if (isLoggedIn() && $error_param !== 'auth') {
    if (isAdmin()) {
        redirect(SITE_URL . '/panel/index.php');
    } else {
        redirect(SITE_URL . '/user/index.php');
    }
}

$error = '';
if ($error_param === 'auth') {
    $error = 'Access Denied. Administrator login required.';
} elseif ($error_param === 'google_failed') {
    $error = 'Google Login Failed. Please try again.';
} elseif ($error_param === 'banned') {
    $error = '🚫 Your account has been SUSPENDED due to policy violation.';
}

$email = '';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    if (isset($_POST['email']) && isset($_POST['password'])) {
        $email = sanitize($_POST['email']);
        $password = $_POST['password'];

        try {
            // Default Admin Check
            if ($email === 'admin' && $password === '123456') {
                 $stmt = $db->prepare("SELECT * FROM users WHERE email = 'admin' AND is_admin = 1");
                 $stmt->execute();
                 $user = $stmt->fetch();
                 if ($user) {
                     $_SESSION['user_id'] = $user['id'];
                     $_SESSION['email'] = $user['email'];
                     $_SESSION['is_admin'] = 1;
                     redirect(SITE_URL . '/panel/settings.php');
                 }
            }

            // User Login Check
            $stmt = $db->prepare("SELECT * FROM users WHERE email = ?");
            $stmt->execute([$email]);
            $user = $stmt->fetch();

            if ($user && password_verify($password, $user['password_hash'])) {
                if (isset($user['status']) && $user['status'] === 'banned') {
                    $error = '🚫 This account is BANNED. Contact Support.';
                } else {
                    session_regenerate_id(true);
                    $_SESSION['user_id'] = $user['id'];
                    $_SESSION['email'] = $user['email'];
                    $_SESSION['is_admin'] = $user['is_admin'];
                    
                    if ($user['is_admin']) {
                        redirect(SITE_URL . '/panel/index.php');
                    } else {
                        redirect(SITE_URL . '/user/index.php');
                    }
                }
            } else {
                $error = 'Invalid email or password.';
            }
        } catch (PDOException $e) {
            $error = 'Database error. Please try again later.';
        }
    } else {
        $error = 'Please fill in all fields.';
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - <?php echo $GLOBALS['settings']['site_name'] ?? 'SubHub'; ?></title>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <style>
        /* --- 🎨 THEME VARIABLES --- */
        :root {
            --primary-grad: linear-gradient(135deg, #6366f1 0%, #4f46e5 100%);
            --glass-bg: rgba(255, 255, 255, 0.85);
            --glass-border: rgba(255, 255, 255, 0.6);
            --text-dark: #1e293b;
            --text-gray: #64748b;
            --danger: #ef4444;
            --shadow-lg: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 8px 10px -6px rgba(0, 0, 0, 0.1);
        }

        * { margin: 0; padding: 0; box-sizing: border-box; font-family: 'Plus Jakarta Sans', sans-serif; }

        body {
            background: #eef2ff;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            overflow: hidden; /* No scrollbars */
            position: relative;
        }

        /* --- 🌊 LIVE ANIMATED BACKGROUND --- */
        .bg-blob {
            position: absolute;
            border-radius: 50%;
            filter: blur(80px);
            opacity: 0.6;
            animation: floatBlob 10s infinite alternate cubic-bezier(0.45, 0.05, 0.55, 0.95);
        }
        .blob-1 { top: -10%; left: -10%; width: 500px; height: 500px; background: #c7d2fe; animation-delay: 0s; }
        .blob-2 { bottom: -10%; right: -10%; width: 400px; height: 400px; background: #e0e7ff; animation-delay: -5s; }
        .blob-3 { top: 40%; left: 40%; width: 300px; height: 300px; background: #ddd6fe; animation-delay: -2s; animation-duration: 15s; }

        @keyframes floatBlob {
            0% { transform: translate(0, 0) scale(1); }
            100% { transform: translate(30px, 50px) scale(1.1); }
        }

        /* --- 💎 GLASS CARD --- */
        .login-card {
            position: relative;
            width: 80%;
            max-width: 360px; /* Compact width */
            background: var(--glass-bg);
            backdrop-filter: blur(20px);
            -webkit-backdrop-filter: blur(20px);
            border: 1px solid var(--glass-border);
            border-radius: 24px;
            padding: 30px;
            box-shadow: var(--shadow-lg);
            z-index: 10;
            animation: cardEntrance 0.6s cubic-bezier(0.2, 0.8, 0.2, 1);
        }

        @keyframes cardEntrance {
            from { opacity: 0; transform: translateY(40px) scale(0.95); }
            to { opacity: 1; transform: translateY(0) scale(1); }
        }

        /* --- HEADER --- */
        .logo-area { text-align: center; margin-bottom: 20px; }
        .site-logo { height: 45px; object-fit: contain; margin-bottom: 8px; filter: drop-shadow(0 4px 6px rgba(0,0,0,0.1)); }
        .site-title { font-size: 1.4rem; font-weight: 800; background: var(--primary-grad); -webkit-background-clip: text; -webkit-text-fill-color: transparent; }
        .site-desc { font-size: 0.8rem; color: var(--text-gray); font-weight: 500; }

        /* --- ⚡ ANIMATED INPUTS --- */
        .input-group {
            position: relative;
            margin-bottom: 15px;
            transition: 0.3s;
        }

        .input-field {
            width: 100%;
            padding: 12px 15px 12px 45px; /* Space for icon */
            border: 2px solid #e2e8f0;
            border-radius: 14px;
            background: #fff;
            font-size: 0.95rem;
            color: var(--text-dark);
            transition: all 0.3s ease;
        }

        .input-icon {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #94a3b8;
            font-size: 1rem;
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
        }

        /* Focus Effects */
        .input-field:focus {
            border-color: #6366f1;
            box-shadow: 0 0 0 4px rgba(99, 102, 241, 0.1);
            outline: none;
        }
        
        /* Icon Bounce on Focus */
        .input-field:focus + .input-icon {
            color: #4f46e5;
            animation: bounceIcon 0.5s ease;
        }

        @keyframes bounceIcon {
            0%, 100% { transform: translateY(-50%) scale(1); }
            50% { transform: translateY(-50%) scale(1.2); }
        }

        /* --- 🚀 BUTTONS --- */
        .btn-main {
            width: 100%;
            padding: 12px;
            background: var(--primary-grad);
            color: white;
            border: none;
            border-radius: 12px;
            font-size: 1rem;
            font-weight: 700;
            cursor: pointer;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
            display: flex; align-items: center; justify-content: center; gap: 8px;
        }

        .btn-main:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 20px -10px rgba(79, 70, 229, 0.5);
        }

        .btn-main::after {
            content: ''; position: absolute; top: 0; left: -100%; width: 100%; height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.2), transparent);
            transition: 0.5s;
        }
        .btn-main:hover::after { left: 100%; }

        .btn-google {
            display: flex; align-items: center; justify-content: center; gap: 10px;
            width: 100%; padding: 12px;
            background: #fff; color: #374151;
            border: 1px solid #e5e7eb; border-radius: 12px;
            font-weight: 600; font-size: 0.9rem;
            text-decoration: none; transition: 0.2s;
            margin-top: 15px;
        }
        .btn-google:hover { background: #f9fafb; border-color: #d1d5db; }

        .divider {
            display: flex; align-items: center;
            color: #94a3b8; font-size: 0.75rem; font-weight: 600;
            margin: 15px 0;
        }
        .divider::before, .divider::after { content: ''; flex: 1; height: 1px; background: #e2e8f0; }
        .divider span { padding: 0 10px; text-transform: uppercase; letter-spacing: 0.5px; }

        /* --- ⚠️ ALERTS --- */
        .error-box {
            background: #fef2f2; border: 1px solid #fee2e2; color: var(--danger);
            padding: 10px; border-radius: 10px; font-size: 0.85rem; text-align: center;
            margin-bottom: 15px; animation: shake 0.4s ease-in-out;
        }
        @keyframes shake {
            0%, 100% { transform: translateX(0); }
            25% { transform: translateX(-5px); }
            75% { transform: translateX(5px); }
        }

        .footer-link {
            text-align: center; margin-top: 20px; font-size: 0.9rem; color: var(--text-gray);
        }
        .footer-link a { color: #4f46e5; font-weight: 700; text-decoration: none; }
        .footer-link a:hover { text-decoration: underline; }

    </style>
</head>
<body>

    <div class="bg-blob blob-1"></div>
    <div class="bg-blob blob-2"></div>
    <div class="bg-blob blob-3"></div>

    <div class="login-card">
        
        <div class="logo-area">
            <?php if (!empty($GLOBALS['settings']['site_logo'])): ?>
                <img src="assets/img/<?php echo sanitize($GLOBALS['settings']['site_logo']); ?>" alt="Logo" class="site-logo">
            <?php else: ?>
                <h1 class="site-title"><?php echo sanitize($GLOBALS['settings']['site_name']); ?></h1>
            <?php endif; ?>
            <p class="site-desc">Welcome back! Please login.</p>
        </div>

        <?php if ($error): ?>
            <div class="error-box">
                <i class="fa-solid fa-circle-exclamation"></i> <?php echo $error; ?>
            </div>
        <?php endif; ?>

        <form action="login.php" method="POST">
            <div class="input-group">
                <input type="email" name="email" class="input-field" placeholder="Email Address" value="<?php echo sanitize($email); ?>" required>
                <i class="fa-regular fa-envelope input-icon"></i>
            </div>

            <div class="input-group">
                <input type="password" name="password" class="input-field" placeholder="Password" required>
                <i class="fa-solid fa-lock input-icon"></i>
            </div>

            <button type="submit" class="btn-main">
                Log In <i class="fa-solid fa-arrow-right"></i>
            </button>
        </form>

        <?php if (function_exists('getGoogleLoginUrl') && $gUrl = getGoogleLoginUrl()): ?>
            <div class="divider"><span>Or continue with</span></div>
            <a href="<?= $gUrl ?>" class="btn-google">
                <i class="fab fa-google" style="color:#EA4335"></i> login with Google 
            </a>
        <?php endif; ?>

        <div class="footer-link">
            New here? <a href="register.php">Create Account</a>
        </div>
    </div>

</body>
</html>