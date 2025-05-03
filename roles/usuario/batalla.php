<?php
require_once('../../database/conexion.php');
$conex = new Database;
$con = $conex->conectar();
session_start();

$username = $_SESSION['username'];
$id_sala = $_GET['id_sala'] ?? null;

if (!$id_sala) {
    header("Location: salas.php");
    exit;
}

// Verificar si ya existe un registro de estadística para esta sala
$sql_check_sala = $con->prepare("
    SELECT fecha_ini 
    FROM estadistica 
    WHERE id_sala = ?   
    ORDER BY fecha_ini ASC 
    LIMIT 1
");
$sql_check_sala->execute([$id_sala]);
$fecha_inicio_sala = $sql_check_sala->fetchColumn();

if(!$fecha_inicio_sala){
    $fecha_inicio_sala = date("Y-m-d H:i:s");

       $sqlVerificarJugadores = $con->prepare("
       SELECT COUNT(*) as total
       FROM detalle_sala
       WHERE id_sala = ?
   ");
   $sqlVerificarJugadores->execute([$id_sala]);
   $total = $sqlVerificarJugadores->fetchColumn();

   if($total >= 2) {

       $sqlMoverJugadores = $con->prepare("
           INSERT INTO estadistica (id_sala, username, fecha_ini, Id_estado)
           SELECT id_sala, username, ?, ?
           FROM detalle_sala
           WHERE id_sala = ?
       ");
       $sqlMoverJugadores->execute([$fecha_inicio_sala, 7, $id_sala]);
       
       $sqlVerificarMovimiento = $con->prepare("
           SELECT COUNT(*) FROM estadistica WHERE id_sala = ?
       ");
       $sqlVerificarMovimiento->execute([$id_sala]);
       
       if($sqlVerificarMovimiento->fetchColumn() >= 2) {
           $sqlUpdateEstado = $con->prepare("UPDATE sala SET Id_estado = 5 WHERE id_sala = ?");
           $sqlUpdateEstado->execute([$id_sala]);
           
           $sqlLimpiarDetalle = $con->prepare("DELETE FROM detalle_sala WHERE id_sala = ?");
           $sqlLimpiarDetalle->execute([$id_sala]);
       }
   }

}

// Obtener jugadores en la sala
$sql_jugadores = $con->prepare("
    SELECT u.username, u.vida, CONCAT('../../img/avatares/', a.foto) AS avatar , (SELECT Id_estado FROM estadistica WHERE username = u.username AND id_sala = e.id_sala ORDER BY fecha_ini DESC LIMIT 1) as Id_estado
    FROM estadistica e 
    INNER JOIN usuario u ON e.username = u.username 
    INNER JOIN avatar a ON u.Id_avatar = a.Id_avatar 
    WHERE e.id_sala = ? 
");
$sql_jugadores->execute([$id_sala]);
$jugadores = $sql_jugadores->fetchAll(PDO::FETCH_ASSOC);

// Primero obtener los puntos del usuario
// Obtener nivel del usuario
$sql_puntos = $con->prepare("
    SELECT n.Id_nivel 
    FROM usuario u 
    INNER JOIN niveles n ON u.puntos >= n.Puntos 
    WHERE u.username = ? 
    ORDER BY n.Puntos DESC 
    LIMIT 1
");
$sql_puntos->execute([$username]);
$nivel = $sql_puntos->fetchColumn();

// Obtener armas disponibles según el nivel del usuario
$sql_armas = $con->prepare("
    SELECT a.Id_armas, a.nom_arma, a.cant_balas, CONCAT('../../img/armas/', a.foto) AS foto, t.daño
    FROM armas a 
    INNER JOIN tipo_arma t ON a.Id_tipo_arma = t.Id_tipo_arma 
    WHERE t.nivel = ?
");
$sql_armas->execute([$nivel]);
$armas = $sql_armas->fetchAll(PDO::FETCH_ASSOC);
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Batalla</title>
    <link rel="stylesheet" href="../../css/batalla.css">
</head>
<body>
    <h1>Batalla</h1>
    <h2>Jugadores en la batalla:</h2>
    <div class="jugadores">
        <?php foreach ($jugadores as $jugador){ ?>
            <div>
                <img src="<?php echo $jugador['avatar']; ?>" alt="Avatar" width="50">
                <p><?php echo $jugador['username']; ?> - Vida: <span id="vida_<?php echo $jugador['username']; ?>"><?php echo $jugador['vida']; ?></span></p>
                <?php if ($jugador['username'] !== $username && $jugador['Id_estado'] !== 8){ ?>
                    <button onclick="atacar('<?php echo $jugador['username']; ?>', document.getElementById('arma').value, document.getElementById('parte_cuerpo').value)">Atacar a <?php echo $jugador['username']; ?></button>
                <?php } elseif ($jugador['Id_estado'] === 8) { ?>
                    <p class="eliminado">Jugador eliminado</p>
                <?php }; ?>
            </div>
        <?php }; ?>
    </div>
    
    <h3>Selecciona tu arma y objetivo:</h3>
    <div class="controles-ataque">
        <select id="arma" name="arma" required>
            <option value="">Selecciona un arma</option>
            <?php foreach ($armas as $arma){ ?>
                <option value="<?php echo $arma['Id_armas'] ?>"><?php echo $arma['nom_arma'] ?>, Balas: <?php echo $arma['cant_balas'] ?>, Daño: <?php echo $arma['daño'] ?> </option>
            <?php }; ?>
        </select>

        <select id="parte_cuerpo" name="parte_cuerpo" required>
            <option value="">Selecciona donde atacar</option>
            <option value="cabeza">Cabeza</option>
            <option value="torso">Torso</option>
            <option value="brazos">Brazos</option>
            <option value="piernas">Piernas</option>
        </select>
    </div>

    <a href="index.php">
    <img src="../../img/regresar.png" alt="regresar" class="regresar">
    </a>

    <script>
        
        async function atacar(victima, arma, parte) {
            if (!arma || !parte) {
                alert('Selecciona un arma y una parte del cuerpo para atacar');
                return;
            }
        
            try {
                const response = await fetch('atacar.php?id_sala=<?php echo $id_sala; ?>', {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                    body: `atacante=<?php echo $username; ?>&victima=${victima}&arma=${arma}&parte=${parte}`
                });
            
                const data = await response.json();
            
                if (data.success) {
                    const vidaElement = document.getElementById("vida_" + victima);
                    if (vidaElement) {
                        vidaElement.innerText = data.nueva_vida;
                    }
                
                    if (data.eliminado) {
                        const victima = data.eliminado;
                        if (victima === '<?php echo $username; ?>') {
                            alert("Has sido eliminado de la batalla!");
                            // Desactivar todos los botones de ataque para el jugador eliminado
                            document.querySelectorAll('button[onclick*="atacar"]').forEach(btn =>       {
                                btn.disabled = true;
                            });
                        } else {
                            alert(`${victima} ha sido eliminado de la batalla!`);
                            // Desactivar solo los botones de ataque hacia el jugador eliminado
                            document.querySelectorAll(`button[onclick*="atacar('${victima}'"]`).        forEach(btn => {
                                btn.disabled = true;
                            });
                        }
                    }
                } else {
                    alert(data.message);
                }
            } catch (error) {
                console.error("Error en el ataque:", error);
            }
        }


        async function verificarEstadoBatalla() {
            try {
                const response = await fetch('verificar_batalla.php?id_sala=<?php echo $id_sala; ?>', {
                    method: 'GET',
                    headers: { 'Content-Type': 'application/json' }
                });

                const data = await response.json();
                if (data.batalla_terminada) {
                    if (data.ganador) {
                        if (data.ganador === '<?php echo $username; ?>') {
                            if (data.por_tiempo) {
                                alert("¡Felicidades! Has ganado la batalla por mayor daño causado");
                            } else if (data.por_eliminacion) {
                                alert("¡Felicidades! Has ganado la batalla por eliminar a todos los jugadores");
                            }
                        } else {
                            if (data.por_tiempo) {
                                alert("La batalla ha terminado. El ganador es " + data.ganador + " por mayor daño causado");
                            } else if (data.por_eliminacion) {
                                alert("La batalla ha terminado. El ganador es " + data.ganador + " por eliminar a todos los jugadores");
                            }
                        }
                        window.location.href = "index.php";
                    }
                }
            } catch(error) {
                console.error("Error al verificar estado:", error);
            }
        }
        
        async function actualizarVidasJugadores() {
            try {
                const response = await fetch('batalla.php?id_sala=<?php echo $id_sala; ?>', {
                    method: 'GET'
                });
                
                const parser = new DOMParser();
                const doc = parser.parseFromString(await response.text(), 'text/html');
                
                const contenedorJugadores = document.querySelector('.jugadores');
                const jugadoresNuevos = doc.querySelector('.jugadores');
                
                if (jugadoresNuevos) {
                    contenedorJugadores.innerHTML = jugadoresNuevos.innerHTML;
                }

                // Reactivar los event listeners de los botones
                document.querySelectorAll('button[onclick*="atacar"]').forEach(btn => {
                    const onclick = btn.getAttribute('onclick');
                    btn.onclick = function() {
                        eval(onclick);
                    };
                });
            } catch (error) {
                console.error("Error al actualizar vidas:", error);
            }
        }
        setInterval(verificarEstadoBatalla, 2000);
        setInterval(actualizarVidasJugadores, 2000);

        window.onload = function() {
            verificarEstadoBatalla();
            actualizarVidasJugadores();
        };
        
        window.addEventListener("beforeunload", () => {
            fetch("eliminar_usuario.php?id_sala=<?php echo $id_sala; ?>", { 
                method: "GET",
                //keepalive hace que el fetch siga ejecutandose asi el usuario cierre la pagina o navegue en otro lado
                keepalive: true 
            });
        });

    </script>
</body>
</html>