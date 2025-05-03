<?php
require_once('../../database/conexion.php');
$conex = new Database;
$con = $conex->conectar();
session_start();


if (!isset($_GET['id_sala'])) {
    die("Error: No se recibió el ID de la sala.");
}

$id_sala = $_GET['id_sala'];
$username = $_SESSION['username']; // Obtenemos el usuario actual

// Verificar si el usuario ya está en la sala
$sql_check = $con->prepare("SELECT COUNT(*) FROM detalle_sala WHERE id_sala = ? AND username = ?");
$sql_check->execute([$id_sala, $username]);
$ya_esta = $sql_check->fetchColumn();

if ($ya_esta == 0) {
    // Si no está en la sala, lo agregamos
    $sqlJoin = $con->prepare("INSERT INTO detalle_sala (id_sala, username) VALUES (?, ?)");
    $sqlJoin->execute([$id_sala, $username]);
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sala de Espera</title>
    <!-- <link rel="stylesheet" href="../../css/sala_espera.css"> -->
 
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            height: 100%;
            width: 100%;
        }

        .container {
            background-image: url('../../img/fondo_login.png');
            background-size: cover;
            background-position: center;
            min-height: 100vh;
            width: 100%;
            display: flex;
            flex-direction: column;
            align-items: center;
            position: relative;
        }

        .header {
            margin-top: 4%;
            margin-bottom: 2rem;
        }

        .header h1 {
            color: white;
            font-size: 2.5rem;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
            margin: 0;
        }

        .jugadores-container {
            background-color: rgba(0, 0, 0, 0.7);
            padding: 2rem;
            border-radius: 10px;
            width: 80%;
            max-width: 600px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.5);
        }

        .jugadores-container p {
            color: white;
            font-size: 1.2rem;
            margin-bottom: 1rem;
            text-align: center;
        }

        #lista-jugadores {
            list-style: none;
            padding: 0;
            margin: 0;
            width: 100%;
            display: flex;
            flex-direction: column;
            gap: 1rem;
            max-height: 300px;
            overflow-y: auto;
        }

        #lista-jugadores li {
            background-color: rgba(255, 255, 255, 0.1);
            padding: 1rem;
            border-radius: 8px;
            font-size: 1.2rem;
            color: white;
            text-align: center;
            border: 1px solid rgba(255, 255, 255, 0.2);
            transition: all 0.3s ease;
        }

        #lista-jugadores li:hover {
            background-color: rgba(255, 255, 255, 0.2);
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
        }

        .contador-container {
            background-color: rgba(0, 0, 0, 0.7);
            padding: 1.5rem;
            border-radius: 10px;
            margin-top: 2rem;
            width: 80%;
            max-width: 600px;
            text-align: center;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.5);
        }

        #contador {
            font-size: 1.5rem;
            color: #4CAF50;
            font-weight: bold;
            margin: 0;
        }

        .regresar {
            position: absolute;
            top: 20px;
            left: 20px;
            width: 40px;
            height: auto;
            cursor: pointer;
            transition: transform 0.3s ease;
            filter: brightness(0) invert(1);
        }

        .regresar:hover {
            transform: scale(1.1);
        }
    </style>
</head> 
<body>
<div class="container">
        <!-- Encabezado -->
        <div class="header">
            <h1>Sala de Espera</h1>
        </div>

        <!-- Lista de jugadores -->
        <div class="jugadores-container">
            <p>Jugadores en la sala:</p>
            <ul id="lista-jugadores"></ul>
        </div>

        <!-- Contador -->
        <div class="contador-container">
            <p id="contador">Esperando jugadores...</p>
        </div>
    </div>

    <!-- Botón de regresar -->
    <a href="salas.php">
        <img src="../../img/regresar.png" alt="regresar" class="regresar">
    </a>
    <script>
        let tiempoRestante = null;
        let contadorActivo = false;
        let intervalo = null;
        let redireccionIniciada = false;
        
        async function actualizarListaJugadores() {
            try {
                const response = await fetch("verificar_jugadores.php?id_sala=<?php echo $id_sala; ?>");
                const data = await response.json();
                
                const listaJugadores = document.getElementById("lista-jugadores");
                //recorre todos los jugadores del array y con .join los une todos 
                listaJugadores.innerHTML = data.jugadores.map(j => `<li>${j}</li>`).join("");
            
                if (data.total >= 2) {
                    if (!contadorActivo || tiempoRestante > data.segundos_restantes) {
                        tiempoRestante = data.segundos_restantes;
                        iniciarCuentaRegresiva();
                    }
                } else {
                    document.getElementById("contador").textContent = "Esperando jugadores...";
                    contadorActivo = false;
                    if (intervalo) clearInterval(intervalo);
                }
            
                if (data.redirigir && !redireccionIniciada) {
                    redireccionIniciada = true;
                    window.location.href = "batalla.php?id_sala=<?php echo $id_sala; ?>";
                }
            } catch (error) {
                console.error("Error:", error);
            }
            
            if (!redireccionIniciada) {
                setTimeout(actualizarListaJugadores, 1000);
            }
        }
    
        function iniciarCuentaRegresiva() {
            contadorActivo = true;
            const contadorElemento = document.getElementById("contador");
        
            if (intervalo) clearInterval(intervalo);
        
            intervalo = setInterval(() => {
                if (tiempoRestante <= 0) {
                    clearInterval(intervalo);
                    if (!redireccionIniciada) {
                        redireccionIniciada = true;
                        window.location.href = "batalla.php?id_sala=<?php echo $id_sala; ?>";
                    }
                } else {
                    contadorElemento.textContent = `La batalla inicia en: ${tiempoRestante}s`;
                    tiempoRestante--;
                }
            }, 1000);
        }
    
        window.addEventListener("beforeunload", () => {
            fetch("eliminar_usuario.php?id_sala=<?php echo $id_sala; ?>", { 
                method: "GET",
                //keepalive hace que el fetch siga ejecutandose asi el usuario cierre la pagina o navegue en otro lado
                keepalive: true 
            });
        });
    
        // Iniciar la actualización cuando carga la página
        actualizarListaJugadores();
    </script>
</body>
</html>