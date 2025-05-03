<?php

require_once('../../database/conexion.php');
$conex = new Database;
$con = $conex->conectar();
session_start();

if (!isset($_SESSION['username'])) {
    echo "Inicio de sesion invalida";
    exit();
}

$username = $_SESSION['username'];
$sqlVida = $con->prepare("UPDATE usuario SET vida = 100 WHERE username = ?");
$sqlVida->execute([$username]);

$sql = $con->prepare("SELECT u.username, u.puntos, u.Id_mundo, u.Id_avatar,
    n.nom_nivel, n.Id_nivel
    FROM usuario u 
    INNER JOIN niveles n ON u.puntos >= n.puntos
    WHERE u.username = ?
    ORDER BY n.puntos DESC 
    LIMIT 1");
$sql->execute([$username]);
$fila = $sql->fetch(PDO::FETCH_ASSOC);


// Obtener datos del avatar y mundo
$sql2 = $con->prepare("SELECT a.foto AS afoto, a.Nom_avatar,
    m.Nom_mundo, m.Foto AS mfoto, m.Id_mundo
    FROM avatar a, mundo m
    WHERE a.Id_avatar = ? AND m.Id_mundo = ?");
$sql2->execute([$fila['Id_avatar'], $fila['Id_mundo']]);
$fila2 = $sql2->fetch(PDO::FETCH_ASSOC);
$nivel = $fila['nom_nivel'];
$puntos = $fila['puntos'];
$avatar = "../../img/avatares/".$fila2['afoto'];
$nom_avatar = $fila2['Nom_avatar'];
$nom_mundo = $fila2['Nom_mundo'];
$mundo = "../../img/mundos/".$fila2['mfoto'];
$_SESSION['Id_mundo'] = $fila2['Id_mundo']; 
?>



<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pantalla Principal</title>
    <link rel="stylesheet" href="../../css/index.css">
</head>
<body>

    <section class="perfil">
        <a href="estadisticas.php">
        <img src="<?php echo $avatar?>" alt="Avatar">
        </a>
        <div>
            <h2><?php echo $username; ?></h2>
            <p><span><?php echo $puntos; ?> PTS</span></p>
            <p> <?php echo $nivel; ?></p>       
        </div>
    </section>

    <section class="personaje">
        <img src="<?php echo $avatar?>" alt="Personaje">
    </section>

    <section class="opciones">
        <div class="contenedor-opciones">
            <div class="fila">
                <div class="opcion" id="seleccion_avatara">
                        <a class="subrayado" href="avatares.php">
                            <p>AVATAR</p>
                            <img src="<?php echo $avatar?>" id="avatar_actual" alt="Avatar">
                            <span><?php echo $nom_avatar?></span>
                        </a>
                </div>  
                <div class="linea-vertical"></div>
                <div class="opcion" id="seleccion_mundo">
                        <a class="subrayado" href="mundos.php">
                                <p>MUNDO</p>
                                <img src="<?php echo $mundo?>" id="mundo_actual" alt="Mapa">
                                <span><?php echo $nom_mundo?></span>
                        </a>

                </div>
            </div>
            <div class="linea-horizontal"></div>
            <button class="boton-jugar" onclick="window.location.href='salas.php'">JUGAR</button>
        </div>
    </section>

    <section class="salir">
        <div class="cerrar-sesion">
            <button class="boton-salir"><a href="../../includes/exit.php">Cerrar Sesion</a></button>
        </div>
    </section>

    
</body>
</html>