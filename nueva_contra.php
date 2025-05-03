<?php
require_once('database/conexion.php');
$conex = new Database;
$con = $conex->conectar();

if (!isset($_GET['user'])) {
    header("Location: index.php");
    exit;
}
$username = base64_decode($_GET['user']);
if (isset($_POST['submit'])) {
    $contra= $_POST['password'];
    $contraEnc = password_hash($contra, PASSWORD_DEFAULT);
    $sql = $con->prepare("UPDATE usuario SET contraseña = ? WHERE username = ?");
    
    if ($sql->execute([$contraEnc, $username])) {
        echo "<script>alert('Contraseña actualizada correctamente'); window.location='index.php';</script>";
        exit;
    } else {
        echo "<script>alert('Error al actualizar la contraseña');</script>";
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/index.css">
    <title>Recuperar</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="JS/validaciones.js"></script>
</head>
<body>
  
        <div class="login">
            <h1>CAMBIAR CONTRASEÑA</h1>
                <form action="" method="POST" autocomplete="off" >
                <label for="user">Ingresa La Nueva Contraseña</label>
                <input type="password" id="password" name="password">
                <label for="user">Confirmar Contraseña</label>
                <input type="password" id="confirm_password" name="confirm_password">
                <input type="submit" id="submit" name="submit" class="btn-submit" value="Cambiar Contraseña">
            </form>
        </div>

    <video autoplay loop muted>
        <source src="video/video2.mp4" type="video/mp4">
    </video>
    <div class="capa"></div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</body>
</html>