<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>¡Tienes una sorpresa!</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 20px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
        }
        
        .email-container {
            max-width: 600px;
            margin: 0 auto;
            background: white;
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 20px 40px rgba(0,0,0,0.1);
        }
        
        .header {
            background: linear-gradient(45deg, #FF6B6B, #4ECDC4);
            color: white;
            padding: 30px;
            text-align: center;
        }
        
        .header h1 {
            margin: 0;
            font-size: 2.5em;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.3);
        }
        
        .scratch-section {
            padding: 40px;
            text-align: center;
            background: #f8f9fa;
        }
        
        .scratch-instruction {
            font-size: 1.3em;
            color: #333;
            margin-bottom: 30px;
            font-weight: bold;
        }
        
        .scratch-card {
            position: relative;
            width: 400px;
            height: 300px;
            margin: 0 auto;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0,0,0,0.2);
            cursor: pointer;
            user-select: none;
        }
        
        .scratch-surface {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(45deg, #silver, #darkgray);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.2em;
            font-weight: bold;
            color: #333;
            transition: opacity 0.3s ease;
            z-index: 2;
        }
        
        .scratch-surface::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-image: 
                radial-gradient(circle at 20% 50%, transparent 20%, rgba(255,255,255,0.3) 21%, rgba(255,255,255,0.3) 34%, transparent 35%, transparent),
                linear-gradient(0deg, rgba(255,255,255,0.1) 50%, transparent 50%);
        }
        
        .prize-content {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            color: white;
            text-align: center;
            padding: 20px;
            box-sizing: border-box;
            opacity: 0;
            z-index: 1;
            transition: opacity 0.5s ease;
        }
        
        .prize-revealed {
            opacity: 1;
        }
        
        .congratulations {
            font-size: 2em;
            font-weight: bold;
            margin-bottom: 20px;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.3);
            animation: bounce 1s ease-in-out infinite alternate;
        }
        
        @keyframes bounce {
            0% { transform: translateY(0px); }
            100% { transform: translateY(-10px); }
        }
        
        .trip-details {
            background: rgba(255,255,255,0.95);
            color: #333;
            border-radius: 15px;
            padding: 30px;
            margin: 30px 20px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
        }
        
        .trip-info {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin: 15px 0;
            padding: 15px 0;
            border-bottom: 1px solid #eee;
        }
        
        .trip-info:last-child {
            border-bottom: none;
        }
        
        .trip-label {
            font-weight: bold;
            color: #667eea;
        }
        
        .trip-value {
            font-weight: bold;
        }
        
        .boat-icon {
            font-size: 2em;
            margin: 10px 0;
        }
        
        .scratch-hint {
            margin-top: 20px;
            font-size: 0.9em;
            color: #666;
            font-style: italic;
        }
        
        .scratched {
            opacity: 0;
            pointer-events: none;
        }
        
        .footer {
            background: #333;
            color: white;
            padding: 20px;
            text-align: center;
        }
        
        @media (max-width: 480px) {
            .scratch-card {
                width: 320px;
                height: 240px;
            }
            
            .congratulations {
                font-size: 1.5em;
            }
        }
    </style>
</head>
<body>
    <div class="email-container">
        <div class="header">
            <h1>🎉 ¡TIENES UNA SORPRESA! 🎉</h1>
        </div>
        
        <div class="scratch-section">
            <div class="scratch-instruction">
                ¡Hola Rubén! Tienes algo muy especial esperándote...
                <br>¡Haz clic para descubrir qué es!
            </div>
            
            <div class="scratch-card" id="scratchCard">
                <div class="scratch-surface" id="scratchSurface">
                    🪙 RASCA AQUÍ 🪙
                    <br>
                    <small>¡Haz clic para revelar!</small>
                </div>
                
                <div class="prize-content">
                    <div class="congratulations">
                        ¡¡¡FELICIDADES RUBÉN!!!
                    </div>
                    <div class="boat-icon">🛥️</div>
                    <div style="font-size: 1.3em; font-weight: bold;">
                        ¡Has ganado un viaje a FORMENTERA!
                    </div>
                </div>
            </div>
            
            <div class="scratch-hint">
                ¡Haz clic en la tarjeta para descubrir tu sorpresa!
            </div>
        </div>
        
        <div class="trip-details" id="tripDetails" style="display: none;">
            <h3 style="text-align: center; color: #667eea; margin-top: 0;">
                🏝️ Detalles de tu Viaje a Formentera 🏝️
            </h3>
            
            <div class="trip-info">
                <span class="trip-label">📅 Fecha:</span>
                <span class="trip-value">Sábado, 05 de julio 2025</span>
            </div>
            
            <div class="trip-info">
                <span class="trip-label">🛥️ Barco:</span>
                <span class="trip-value">RAMON LLULL</span>
            </div>
            
            <div class="trip-info">
                <span class="trip-label">🚢 Salida:</span>
                <span class="trip-value">08:30 desde DENIA</span>
            </div>
            
            <div class="trip-info">
                <span class="trip-label">🏝️ Llegada:</span>
                <span class="trip-value">10:35 a FORMENTERA</span>
            </div>
            
            <div class="trip-info">
                <span class="trip-label">🌅 Regreso:</span>
                <span class="trip-value">21:00 desde FORMENTERA</span>
            </div>
            
            <div class="trip-info">
                <span class="trip-label">🏠 Llegada:</span>
                <span class="trip-value">23:15 a DENIA</span>
            </div>
            
            <div style="text-align: center; margin-top: 25px; padding: 20px; background: linear-gradient(45deg, #FF6B6B, #4ECDC4); color: white; border-radius: 10px;">
                <strong>¡Tu reserva ha sido confirmada! 🎊</strong>
                <br>
                <small>¡Prepárate para un día increíble en el paraíso!</small>
            </div>
        </div>
        
        <div class="footer">
            <p>¡Espero que disfrutes mucho tu sorpresa! 🌊🏖️</p>
        </div>
    </div>

    <script>
        let isScratched = false;
        
        document.getElementById('scratchCard').addEventListener('click', function() {
            if (!isScratched) {
                const scratchSurface = document.getElementById('scratchSurface');
                const prizeContent = document.querySelector('.prize-content');
                const tripDetails = document.getElementById('tripDetails');
                
                scratchSurface.classList.add('scratched');
                prizeContent.classList.add('prize-revealed');
                
                setTimeout(() => {
                    tripDetails.style.display = 'block';
                    tripDetails.scrollIntoView({ behavior: 'smooth' });
                }, 1000);
                
                isScratched = true;
            }
        });
        
        // Efecto de hover para la tarjeta
        document.getElementById('scratchCard').addEventListener('mouseenter', function() {
            if (!isScratched) {
                this.style.transform = 'scale(1.05)';
                this.style.transition = 'transform 0.3s ease';
            }
        });
        
        document.getElementById('scratchCard').addEventListener('mouseleave', function() {
            if (!isScratched) {
                this.style.transform = 'scale(1)';
            }
        });
    </script>
</body>
</html>
