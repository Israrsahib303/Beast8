</div> </div> <div id="loading-overlay"><div id="loading-spinner"></div><span id="loading-text">Processing...</span></div>

<div id="jarvis-container">
    <div id="jarvis-status">SYSTEM ONLINE</div>
    <div id="jarvis-arc" onclick="toggleJarvis()" title="Tap to Command"></div>
</div>

<style>
    /* --- ARC REACTOR (Iron Man Style) --- */
    #jarvis-container { position: fixed; bottom: 30px; right: 30px; z-index: 9999; display: flex; flex-direction: column; align-items: flex-end; }
    
    #jarvis-arc {
        width: 75px; height: 75px; border-radius: 50%;
        background: radial-gradient(circle, #60a5fa 10%, #2563eb 60%, #1e3a8a 100%);
        box-shadow: 0 0 20px #3b82f6, 0 0 40px #2563eb, inset 0 0 15px #fff;
        border: 3px solid #93c5fd; cursor: pointer;
        transition: all 0.3s ease; animation: breathe 4s infinite;
        display: flex; align-items: center; justify-content: center;
    }
    #jarvis-arc::after { content: '🎙️'; font-size: 30px; filter: drop-shadow(0 0 5px rgba(0,0,0,0.5)); }
    #jarvis-arc:hover { transform: scale(1.1); box-shadow: 0 0 60px #3b82f6; }
    
    #jarvis-arc.listening {
        background: radial-gradient(circle, #f87171 10%, #dc2626 60%, #7f1d1d 100%);
        box-shadow: 0 0 30px #ef4444, 0 0 60px #b91c1c;
        animation: pulse-fast 1s infinite;
        border-color: #fecaca;
    }
    #jarvis-arc.listening::after { content: '👂'; }
    
    #jarvis-arc.speaking {
        background: radial-gradient(circle, #facc15 10%, #ca8a04 60%, #713f12 100%);
        box-shadow: 0 0 40px #eab308;
        animation: pulse-slow 0.5s infinite;
        border-color: #fef08a;
    }
    #jarvis-arc.speaking::after { content: '🔊'; }

    /* Status Box */
    #jarvis-status {
        background: rgba(15, 23, 42, 0.9); color: #0ea5e9;
        padding: 12px 20px; border-radius: 12px; border: 1px solid #0284c7;
        font-family: 'Courier New', monospace; font-weight: 900;
        display: none; font-size: 13px; margin-bottom: 15px;
        text-transform: uppercase; letter-spacing: 1px;
        box-shadow: 0 10px 30px rgba(0,0,0,0.5); backdrop-filter: blur(5px);
    }
    
    @keyframes breathe { 0%,100% { box-shadow: 0 0 20px #2563eb; } 50% { box-shadow: 0 0 40px #2563eb; } }
    @keyframes pulse-fast { 0% { transform: scale(1); } 50% { transform: scale(1.1); } 100% { transform: scale(1); } }
    @keyframes pulse-slow { 0% { box-shadow: 0 0 10px #eab308; } 50% { box-shadow: 0 0 30px #eab308; } 100% { box-shadow: 0 0 10px #eab308; } }
    
    /* Loading Overlay */
    #loading-overlay { position: fixed; top:0; left:0; width:100%; height:100%; background: rgba(255,255,255,0.8); z-index: 10000; display: none; align-items: center; justify-content: center; flex-direction: column; }
    #loading-overlay.active { display: flex; }
    #loading-spinner { width: 50px; height: 50px; border: 5px solid #f3f3f3; border-top: 5px solid #4f46e5; border-radius: 50%; animation: spin 1s linear infinite; }
    @keyframes spin { 100% { transform: rotate(360deg); } }
</style>

<script>
    const arc = document.getElementById('jarvis-arc');
    const status = document.getElementById('jarvis-status');
    let recognition;
    
    // --- 1. POWERFUL VOICE ENGINE (With Fallback) ---
    function speak(text) {
        // Show Text
        status.innerText = "JARVIS: " + text;
        status.style.display = 'block';
        setTimeout(() => { if(status.innerText.includes("JARVIS")) status.style.display = 'none'; }, 6000);

        // Stop any ongoing speech
        window.speechSynthesis.cancel();

        const speech = new SpeechSynthesisUtterance(text);
        speech.pitch = 0.7; // Deep Male Pitch
        speech.rate = 1.0;  // Steady Speed
        speech.volume = 1;  // Max Volume

        // Voice Hunting Logic
        let voices = window.speechSynthesis.getVoices();
        
        // Priority 1: Google US English (Best Male)
        let voice = voices.find(v => v.name.includes("Google US English"));
        
        // Priority 2: Microsoft David (Windows Default Male)
        if (!voice) voice = voices.find(v => v.name.includes("David"));
        
        // Priority 3: Any English Voice
        if (!voice) voice = voices.find(v => v.lang.includes("en"));

        if (voice) {
            speech.voice = voice;
            console.log("Jarvis Voice Set To:", voice.name);
        } else {
            console.warn("No specific male voice found. Using default.");
        }

        // Animation trigger
        arc.className = ''; 
        arc.classList.add('speaking');
        
        speech.onend = () => { arc.className = ''; };
        speech.onerror = (e) => { console.error("Speech Error:", e); };
        
        window.speechSynthesis.speak(speech);
    }

    // --- 2. BRAIN CONNECTION ---
    function askJarvis(query) {
        arc.className = ''; 
        arc.classList.add('speaking'); // Yellow mode
        status.innerText = "PROCESSING...";
        status.style.display = 'block';

        let formData = new FormData();
        formData.append('query', query);
        formData.append('current_page', window.location.pathname);

        fetch('../includes/jarvis_logic.php', { method: 'POST', body: formData })
        .then(res => res.text())
        .then(raw => {
            console.log("AI Response:", raw);
            
            if(!raw.includes('|')) {
                speak(raw); return;
            }

            let parts = raw.split('|');
            let type = parts[0];
            let payload = parts[1];
            let msg = parts[2] || payload;

            if (type == 'NAV') {
                speak(msg);
                setTimeout(() => window.location.href = payload, 1500);
            } 
            else if (type == 'REFRESH') {
                speak(msg);
                setTimeout(() => location.reload(), 2000);
            }
            else {
                speak(payload); // Talk
            }
        })
        .catch(err => {
            arc.className = '';
            speak("Sir, network connection weak hai.");
        });
    }

    // --- 3. LISTENER ---
    function toggleJarvis() {
        const SpeechRecognition = window.SpeechRecognition || window.webkitSpeechRecognition;
        if (!SpeechRecognition) { 
            alert("Voice Control requires Google Chrome."); 
            return; 
        }

        if (!recognition) {
            recognition = new SpeechRecognition();
            recognition.lang = 'en-US'; 
            
            recognition.onstart = () => { 
                arc.className = 'listening'; 
                status.innerText = "LISTENING..."; 
                status.style.display = 'block'; 
                window.speechSynthesis.cancel();
            };
            
            recognition.onend = () => { arc.className = ''; };
            
            recognition.onresult = (event) => {
                const command = event.results[0][0].transcript;
                status.innerText = "YOU: " + command;
                askJarvis(command);
            };
            
            recognition.onerror = (event) => {
                console.error("Mic Error:", event.error);
                status.innerText = "MIC ERROR";
            };
        }
        recognition.start();
    }
    
    // Load voices immediately
    window.speechSynthesis.onvoiceschanged = function() {
        window.speechSynthesis.getVoices();
    };

    // Auto Welcome
    window.addEventListener('load', () => {
        if (!sessionStorage.getItem('jarvis_greeted')) {
            setTimeout(() => {
                askJarvis("Say greeting: Welcome back Sir Israr."); 
                sessionStorage.setItem('jarvis_greeted', 'true');
            }, 1500);
        }

        // Settings Logic (Keep existing)
        const testButton = document.getElementById('send-test-email-btn');
        if(testButton) {
            testButton.addEventListener('click', function() {
                // Logic preserved in settings.php
            });
        }
    });
</script>