<?php
include '_header.php';

// --- DYNAMIC PATH SYSTEM (AUTOMATIC) ---
// Ye code khud dhoond lega ke aap kis folder/domain mein hain.
// Aapko kabhi path change karne ki zaroorat nahi padegi.
$cron_path = realpath(__DIR__ . '/../includes/cron');
$php_cmd = '/usr/local/bin/php'; // Standard PHP Path
?>

<style>
    .cron-box {
        background: #1a1a1a;
        border: 1px solid #333;
        border-radius: 8px;
        padding: 1.5rem;
        margin-bottom: 2rem;
    }
    .cron-table {
        width: 100%;
        border-collapse: collapse;
    }
    .cron-table th {
        text-align: left;
        color: #888;
        padding-bottom: 1rem;
        border-bottom: 1px solid #333;
    }
    .cron-table td {
        padding: 1.5rem 0;
        border-bottom: 1px solid #2a2a2a;
        vertical-align: top;
    }
    .command-display {
        background: #111;
        border: 1px solid #444;
        padding: 10px;
        border-radius: 4px;
        font-family: monospace;
        color: #0f0;
        margin-top: 5px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        word-break: break-all;
    }
    .btn-copy {
        background: #333;
        color: #fff;
        border: none;
        padding: 5px 10px;
        cursor: pointer;
        border-radius: 4px;
        margin-left: 10px;
        font-size: 0.8rem;
    }
    .btn-copy:hover { background: #555; }
    .badge {
        padding: 5px 10px;
        border-radius: 4px;
        font-size: 0.8rem;
        font-weight: bold;
    }
    .badge-blue { background: rgba(13, 110, 253, 0.2); color: #0d6efd; }
    .badge-green { background: rgba(25, 135, 84, 0.2); color: #198754; }
    .btn-run {
        background: linear-gradient(135deg, #6366f1 0%, #8b5cf6 100%);
        color: white;
        border: none;
        padding: 10px 20px;
        border-radius: 6px;
        cursor: pointer;
        font-weight: 600;
        transition: 0.3s;
    }
    .btn-run:hover { transform: translateY(-2px); box-shadow: 0 5px 15px rgba(99, 102, 241, 0.4); }
    
    /* Overlay */
    .loading-overlay {
        position: fixed; top: 0; left: 0; width: 100%; height: 100%;
        background: rgba(0,0,0,0.85); z-index: 9999;
        display: none; justify-content: center; align-items: center; flex-direction: column;
    }
    .loading-overlay.active { display: flex; }
    .spinner {
        width: 50px; height: 50px; border: 4px solid #333;
        border-top: 4px solid #6366f1; border-radius: 50%;
        animation: spin 1s linear infinite; margin-bottom: 20px;
    }
    @keyframes spin { 100% { transform: rotate(360deg); } }
</style>

<div class="admin-container">
    <h1>🤖 Cron Job Manager</h1>
    <p style="color: #888; margin-bottom: 20px;">
        Neeche di gayi commands ko copy karke apne <strong>cPanel > Cron Jobs</strong> mein add karein.<br>
        "Critical Down" agar show ho raha hai, to ek baar <strong>"Run Now"</strong> par click karein taake system refresh ho jaye.
    </p>

    <div class="cron-box">
        <table class="cron-table">
            <thead>
                <tr>
                    <th style="width: 40%;">Job Name & Command</th>
                    <th style="width: 20%;">Timing</th>
                    <th style="width: 20%;">Status/Action</th>
                </tr>
            </thead>
            <tbody>
                
                <tr>
                    <td>
                        <strong style="font-size: 1.1rem; color: #fff;">💰 Auto Payments (NayaPay)</strong>
                        <p style="margin: 5px 0; font-size: 0.9rem; color: #aaa;">Emails check karke wallet mein funds add karta hai.</p>
                        <div class="command-display">
                            <span id="cmd_email"><?php echo $php_cmd . ' ' . $cron_path . '/check_email.php'; ?></span>
                            <button class="btn-copy" onclick="copyToClipboard('cmd_email')">Copy</button>
                        </div>
                    </td>
                    <td><span class="badge badge-green">Every 5 Minutes</span></td>
                    <td>
                        <button class="btn-run" 
                                data-job="check_email"
                                data-file="../includes/cron/check_email.php"
                                data-msg="Checking Emails...">
                            ▶ Run Now
                        </button>
                    </td>
                </tr>

                <tr>
                    <td>
                        <strong style="font-size: 1.1rem; color: #fff;">🔄 Sync Services & Rates</strong>
                        <p style="margin: 5px 0; font-size: 0.9rem; color: #aaa;">Provider se Rates, Avg Time aur Status update karta hai.</p>
                        <div class="command-display">
                            <span id="cmd_sync"><?php echo $php_cmd . ' ' . $cron_path . '/smm_service_sync.php'; ?></span>
                            <button class="btn-copy" onclick="copyToClipboard('cmd_sync')">Copy</button>
                        </div>
                    </td>
                    <td><span class="badge badge-blue">Once per Hour</span></td>
                    <td>
                        <button class="btn-run" 
                                data-job="smm_service_sync"
                                data-file="smm_sync_action.php"
                                data-msg="Syncing Services... (Wait 1-2 mins)">
                            ▶ Run Now
                        </button>
                    </td>
                </tr>

                <tr>
                    <td>
                        <strong style="font-size: 1.1rem; color: #fff;">📊 Sync Order Status</strong>
                        <p style="margin: 5px 0; font-size: 0.9rem; color: #aaa;">Pending orders ka status check karta hai.</p>
                        <div class="command-display">
                            <span id="cmd_status"><?php echo $php_cmd . ' ' . $cron_path . '/smm_status_sync.php'; ?></span>
                            <button class="btn-copy" onclick="copyToClipboard('cmd_status')">Copy</button>
                        </div>
                    </td>
                    <td><span class="badge badge-green">Every 5 Minutes</span></td>
                    <td>
                        <button class="btn-run" 
                                data-job="smm_status_sync"
                                data-file="../includes/cron/smm_status_sync.php"
                                data-msg="Updating Status...">
                            ▶ Run Now
                        </button>
                    </td>
                </tr>

                <tr>
                    <td>
                        <strong style="font-size: 1.1rem; color: #fff;">🚀 Place Orders</strong>
                        <p style="margin: 5px 0; font-size: 0.9rem; color: #aaa;">Orders ko API par bhejta hai.</p>
                        <div class="command-display">
                            <span id="cmd_place"><?php echo $php_cmd . ' ' . $cron_path . '/smm_order_placer.php'; ?></span>
                            <button class="btn-copy" onclick="copyToClipboard('cmd_place')">Copy</button>
                        </div>
                    </td>
                    <td><span class="badge badge-blue">Every Minute</span></td>
                    <td>
                        <button class="btn-run" 
                                data-job="smm_order_placer"
                                data-file="../includes/cron/smm_order_placer.php"
                                data-msg="Sending Orders...">
                            ▶ Run Now
                        </button>
                    </td>
                </tr>

                 <tr>
                    <td>
                        <strong style="font-size: 1.1rem; color: #fff;">⏰ Expire Subscriptions</strong>
                        <p style="margin: 5px 0; font-size: 0.9rem; color: #aaa;">Netflix/Canva expiry check karta hai.</p>
                        <div class="command-display">
                            <span id="cmd_expire"><?php echo $php_cmd . ' ' . $cron_path . '/expire_subscriptions.php'; ?></span>
                            <button class="btn-copy" onclick="copyToClipboard('cmd_expire')">Copy</button>
                        </div>
                    </td>
                    <td><span class="badge badge-blue">Once per Hour</span></td>
                    <td>
                        <button class="btn-run" 
                                data-job="expire_subscriptions"
                                data-file="../includes/cron/expire_subscriptions.php"
                                data-msg="Checking Expiry...">
                            ▶ Run Now
                        </button>
                    </td>
                </tr>

            </tbody>
        </table>
    </div>
</div>

<div id="loading" class="loading-overlay">
    <div class="spinner"></div>
    <h3 style="color: white;" id="loading-text">Processing...</h3>
</div>

<script>
function copyToClipboard(elementId) {
    var text = document.getElementById(elementId).innerText;
    navigator.clipboard.writeText(text).then(() => {
        alert("Command Copied! Paste it in cPanel.");
    });
}

document.addEventListener('DOMContentLoaded', function() {
    const buttons = document.querySelectorAll('.btn-run');
    const overlay = document.getElementById('loading');
    const loadingText = document.getElementById('loading-text');

    buttons.forEach(btn => {
        btn.addEventListener('click', function(e) {
            e.preventDefault();
            
            // Confirmation for full sync
            if(this.dataset.job === 'smm_service_sync' && !confirm('Full sync takes time. Continue?')) {
                return;
            }

            const file = this.dataset.file;
            const job = this.dataset.job;
            loadingText.innerText = this.dataset.msg;
            overlay.classList.add('active');

            // AJAX Request
            fetch(`${file}?job=${job}`)
            .then(response => {
                const type = response.headers.get("content-type");
                if (type && type.includes("application/json")) {
                    return response.json();
                } else {
                    return response.text().then(text => ({ success: true, message: text }));
                }
            })
            .then(data => {
                overlay.classList.remove('active');
                alert("Output:\n\n" + data.message.replace(/<br>/g, '\n'));
                if(job === 'smm_service_sync') {
                    window.location.href = 'smm_services.php';
                } else {
                    window.location.reload();
                }
            })
            .catch(err => {
                overlay.classList.remove('active');
                alert("Error: " + err);
            });
        });
    });
});
</script>

<?php include '_footer.php'; ?>