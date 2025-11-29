<?php
include '_header.php';

$error = '';
$success = '';
$user_id = $_SESSION['user_id'];

// User Data Fetch
$stmt_user = $db->prepare("SELECT email, api_key FROM users WHERE id = ?");
$stmt_user->execute([$user_id]);
$user = $stmt_user->fetch();

// --- 1. Change Password Logic ---
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['change_password'])) {
    $current_pass = $_POST['current_password'];
    $new_pass = $_POST['new_password'];
    $confirm_pass = $_POST['confirm_password'];
    
    $stmt = $db->prepare("SELECT password_hash FROM users WHERE id = ?");
    $stmt->execute([$user_id]);
    $user_pass = $stmt->fetch();

    if ($new_pass !== $confirm_pass) {
        $error = 'New passwords do not match.';
    } elseif (strlen($new_pass) < 6) {
        $error = 'Password must be at least 6 characters.';
    } elseif (password_verify($current_pass, $user_pass['password_hash'])) {
        $new_hash = password_hash($new_pass, PASSWORD_DEFAULT);
        $db->prepare("UPDATE users SET password_hash = ? WHERE id = ?")->execute([$new_hash, $user_id]);
        $success = 'Password updated successfully!';
    } else {
        $error = 'Incorrect current password.';
    }
}

// --- 2. Generate API Key Logic ---
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['generate_api_key'])) {
    try {
        $new_api_key = bin2hex(random_bytes(16)); 
        $db->prepare("UPDATE users SET api_key = ? WHERE id = ?")->execute([$new_api_key, $user_id]);
        // Update local variable to show new key immediately
        $user['api_key'] = $new_api_key;
        $success = 'New API Key generated!';
    } catch (PDOException $e) {
        $error = 'Error generating key. Please try again.';
    }
}
?>

<style>
/* --- 🎨 DARK THEME CSS (UNCHANGED) --- */
.profile-page {
    min-height: 85vh; /* Adjusted for footer */
    background: linear-gradient(135deg, #0a0a0a 0%, #1a1a2e 50%, #16213e 100%);
    color: #fff;
    font-family: 'Inter', sans-serif;
    position: relative;
    overflow: hidden;
    border-radius: 20px;
    margin-bottom: 30px;
}

/* Animations */
.animated-background { position: absolute; top: 0; left: 0; width: 100%; height: 100%; z-index: 0; overflow: hidden; pointer-events: none; }
.gradient-orb { position: absolute; border-radius: 50%; filter: blur(80px); opacity: 0.3; animation: float 20s infinite ease-in-out; }
.orb-1 { width: 500px; height: 500px; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); top: -200px; left: -200px; }
.orb-2 { width: 400px; height: 400px; background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%); bottom: -150px; right: -150px; animation-delay: 5s; }
@keyframes float { 0%, 100% { transform: translate(0, 0) scale(1); } 50% { transform: translate(-30px, 50px) scale(0.9); } }

.profile-container { max-width: 1200px; margin: 0 auto; padding: 3rem 2rem; position: relative; z-index: 1; }

/* Header */
.header {
    background: rgba(255, 255, 255, 0.05); backdrop-filter: blur(20px);
    border: 1px solid rgba(255, 255, 255, 0.1); border-radius: 20px;
    padding: 2rem; margin-bottom: 2rem; display: flex; align-items: center; gap: 1.5rem;
}
.header-icon {
    width: 60px; height: 60px; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    border-radius: 15px; display: flex; align-items: center; justify-content: center;
    box-shadow: 0 8px 24px rgba(102, 126, 234, 0.4);
}
.header-title { font-size: 1.8rem; font-weight: 700; margin: 0; color: #fff; }
.header-subtitle { color: rgba(255, 255, 255, 0.6); font-size: 0.9rem; margin: 5px 0 0 0; }

/* Grid Layout */
.two-column-layout {
    display: grid; grid-template-columns: repeat(auto-fit, minmax(450px, 1fr)); gap: 2rem;
}

/* Cards */
.card {
    background: rgba(255, 255, 255, 0.05); backdrop-filter: blur(20px);
    border: 1px solid rgba(255, 255, 255, 0.1); border-radius: 20px;
    padding: 2rem; transition: 0.3s;
}
.card:hover { transform: translateY(-5px); border-color: rgba(255, 255, 255, 0.2); }

.card-header { display: flex; gap: 1rem; margin-bottom: 2rem; padding-bottom: 1.5rem; border-bottom: 1px solid rgba(255, 255, 255, 0.1); }
.card-icon {
    width: 45px; height: 45px; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    border-radius: 12px; display: flex; align-items: center; justify-content: center; flex-shrink: 0;
}
.card-icon.secondary { background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%); }
.card-title { font-size: 1.25rem; font-weight: 700; margin: 0 0 5px 0; }
.card-desc { font-size: 0.85rem; color: rgba(255, 255, 255, 0.5); margin: 0; }

/* Forms */
.form-group { margin-bottom: 1.5rem; }
.form-label { display: block; font-weight: 600; color: rgba(255, 255, 255, 0.8); margin-bottom: 8px; font-size: 0.9rem; }
.form-input {
    width: 100%; padding: 12px 15px; background: rgba(0, 0, 0, 0.2);
    border: 1px solid rgba(255, 255, 255, 0.1); border-radius: 10px;
    color: #fff; font-size: 1rem; transition: 0.3s; outline: none;
}
.form-input:focus { border-color: #764ba2; background: rgba(0, 0, 0, 0.4); }

.input-btn-group { display: flex; gap: 10px; }
.btn-copy {
    background: rgba(255,255,255,0.1); border: 1px solid rgba(255,255,255,0.1);
    color: #fff; width: 50px; border-radius: 10px; cursor: pointer;
    display: flex; align-items: center; justify-content: center; transition: 0.2s;
}
.btn-copy:hover { background: rgba(255,255,255,0.2); }

.btn-submit {
    width: 100%; padding: 14px; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    color: #fff; border: none; border-radius: 10px; font-weight: 600; cursor: pointer;
    transition: 0.3s; font-size: 1rem; margin-top: 10px;
}
.btn-submit:hover { transform: translateY(-2px); box-shadow: 0 5px 15px rgba(118, 75, 162, 0.4); }
.btn-danger { background: rgba(255, 87, 108, 0.15); border: 1px solid rgba(255, 87, 108, 0.3); }
.btn-danger:hover { background: rgba(255, 87, 108, 0.25); }

/* Mobile */
@media (max-width: 768px) {
    .two-column-layout { grid-template-columns: 1fr; }
    .header { flex-direction: column; text-align: center; }
}
</style>

<div class="profile-page">
    <div class="animated-background">
        <div class="gradient-orb orb-1"></div>
        <div class="gradient-orb orb-2"></div>
    </div>

    <div class="profile-container">
        
        <?php if ($error): ?>
            <div style="background:rgba(239,68,68,0.2); border:1px solid rgba(239,68,68,0.4); padding:15px; border-radius:10px; margin-bottom:20px; color:#fca5a5;">
                ⚠️ <?php echo $error; ?>
            </div>
        <?php endif; ?>
        <?php if ($success): ?>
            <div style="background:rgba(16,185,129,0.2); border:1px solid rgba(16,185,129,0.4); padding:15px; border-radius:10px; margin-bottom:20px; color:#86efac;">
                ✅ <?php echo $success; ?>
            </div>
        <?php endif; ?>

        <div class="header">
            <div class="header-icon">
                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path><circle cx="12" cy="7" r="4"></circle></svg>
            </div>
            <div>
                <h1 class="header-title">Account Settings</h1>
                <p class="header-subtitle">Manage security and API access for <?php echo htmlspecialchars($user['email']); ?></p>
            </div>
        </div>

        <div class="two-column-layout">
            
            <div class="card">
                <div class="card-header">
                    <div class="card-icon">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><rect x="3" y="11" width="18" height="11" rx="2" ry="2"></rect><path d="M7 11V7a5 5 0 0 1 10 0v4"></path></svg>
                    </div>
                    <div>
                        <h3 class="card-title">Security</h3>
                        <p class="card-desc">Update your login password</p>
                    </div>
                </div>

                <form method="POST">
                    <input type="hidden" name="change_password" value="1">
                    <div class="form-group">
                        <label class="form-label">Current Password</label>
                        <input type="password" name="current_password" class="form-input" placeholder="••••••" required>
                    </div>
                    <div class="form-group">
                        <label class="form-label">New Password</label>
                        <input type="password" name="new_password" class="form-input" placeholder="••••••" required>
                    </div>
                    <div class="form-group">
                        <label class="form-label">Confirm New Password</label>
                        <input type="password" name="confirm_password" class="form-input" placeholder="••••••" required>
                    </div>
                    <button type="submit" class="btn-submit">Update Password</button>
                </form>
            </div>

            <div class="card">
                <div class="card-header">
                    <div class="card-icon secondary">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><path d="M21 2l-2 2m-7.61 7.61a5.5 5.5 0 1 1-7.778 7.778 5.5 5.5 0 0 1 7.777-7.777zm0 0L15.5 7.5m0 0l3 3L22 7l-3-3m-3.5 3.5L19 4"></path></svg>
                    </div>
                    <div>
                        <h3 class="card-title">Developer API</h3>
                        <p class="card-desc">Access services via API</p>
                    </div>
                </div>

                <div class="form-group">
                    <label class="form-label">Your API Key</label>
                    <div class="input-btn-group">
                        <input type="text" id="apiKey" class="form-input" value="<?php echo $user['api_key'] ? $user['api_key'] : 'Not Generated'; ?>" readonly>
                        <button type="button" class="btn-copy" onclick="copyToClipboard('apiKey')">📋</button>
                    </div>
                </div>

                <div class="form-group">
                    <label class="form-label">API Endpoint URL</label>
                    <div class="input-btn-group">
                        <input type="text" id="apiUrl" class="form-input" value="<?php echo SITE_URL; ?>/api_v2.php" readonly>
                        <button type="button" class="btn-copy" onclick="copyToClipboard('apiUrl')">📋</button>
                    </div>
                </div>

                <form method="POST" onsubmit="return confirm('Generating a new key will stop the old one from working. Continue?');">
                    <input type="hidden" name="generate_api_key" value="1">
                    <button type="submit" class="btn-submit btn-danger">
                        <?php echo $user['api_key'] ? 'Regenerate Key' : 'Generate New Key'; ?>
                    </button>
                </form>
            </div>

        </div>
    </div>
</div>

<script>
function copyToClipboard(id) {
    var copyText = document.getElementById(id);
    copyText.select();
    copyText.setSelectionRange(0, 99999); 
    document.execCommand("copy");
    alert("Copied: " + copyText.value);
}
</script>

<?php include '_footer.php'; ?>