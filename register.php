<?php
require_once('database/conexion.php');
$conex = new Database;
$con = $conex->conectar();
session_start();

// Obtener avatares desde la base de datos
$sql = $con->query("SELECT Id_avatar, Nom_avatar, Foto FROM avatar");
$avatares = $sql->fetchAll(PDO::FETCH_ASSOC);

if (isset($_POST['submit'])) {
    $username = $_POST['user'];
    $correo = $_POST['correo'];
    $contra = $_POST['contra'];
    $vida = 100;
    $puntos = 0;
    $rol = 1;
    $estado = 2;
    $id_avatar = $_POST['avatar']; // Avatar elegido por el usuario
    $Id_mundo = 1;
    $contra_en = password_hash($contra, PASSWORD_DEFAULT);

    // Verificar si el usuario o correo ya existen
    $sql = $con->prepare("SELECT * FROM usuario WHERE username = ? OR correo = ?");
    $sql->execute([$username, $correo]);
    $fila = $sql->fetch(PDO::FETCH_ASSOC);

    if ($fila) {
        echo "<script>alert('Ya existe un usuario con estas credenciales');</script>";
        echo "<script>window.location='index.php';</script>";
        exit();
    }

    // Insertar usuario con el avatar seleccionado
    $insert = $con->prepare("INSERT INTO usuario (username, correo, Contraseña, vida, puntos, Id_avatar, Id_estado, Id_rol, Id_mundo) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");
    $insert->execute([$username, $correo, $contra_en, $vida, $puntos, $id_avatar, $estado, $rol, $Id_mundo]);

    header("location: index.php");
    exit();
}
?>

<!-- CUERPO HTML PARA EL REGISTRO -->
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>¡Regístrate!</title>
    <!-- Select2 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
    <!-- Estilos personalizados -->
     <link rel="stylesheet" href="css/register.css">
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

    <style>
      
        .select2-container .select2-selection--single {
            height: 38px;
            border-radius: 5px;
            background: rgba(191, 18, 18, 0.1);
            border: none;
            color: #fff;
        }

        .select2-container--default .select2-selection--single .select2-selection__rendered {
            line-height: 38px;
            color: #fff;
        }

        .select2-container--default .select2-selection--single .select2-selection__arrow {
            height: 36px;
        }

        .select2-container--default .select2-results__option--highlighted {
            background-color: #007bff;
            color:green;
        }

        .select2-container--default .select2-results__option[aria-selected=true] {
            background-color: #0056b3;
            color:black;
        }

        .avatar-option {
            display: flex;
            align-items: center;
        }

        .avatar-option img {
            width: 30px;
            height: 30px;
            border-radius: 50%;
            margin-right: 10px;
        }

        .select2-container--default .select2-selection--single {
            height: 38px;
            border-radius: 5px;
            background: rgba(255, 255, 255, 0.1);
            border: none;
            color: black; /* Cambiar el color del texto a negro */
        }

        .select2-container--default .select2-selection--single .select2-selection__rendered {
            line-height: 38px;
            color: #fff ; /* Cambiar el color del texto a negro */
        }

        .select2-container--default .select2-results__option {
            color: black; /* Cambiar el color del texto en las opciones a negro */
        }

        .select2-container--default .select2-results__option--highlighted {
            background-color: #007bff;
            color: white; /* Color del texto cuando está resaltado */
        }
    </style>
    <script src="JS/validaciones.js"></script>
</head>
<body>
    <div class="login2">
        <h1>REGISTER</h1>
        <form action="" method="POST" autocomplete="off" onsubmit="return validateRegisterForm()">
            <label for="email">Correo Electrónico</label>
            <input type="email" id="email" name="correo" required>

            <label for="username">Username</label>
            <input type="text" id="username" name="user" required>

            <label for="password">Contraseña</label>
            <input type="password" id="password" name="contra" required>

            <label for="confirm_password">Confirmar Contraseña</label>
            <input type="password" id="confirm_password" name="confirm_password" required>

            <!-- Selección de avatar con Select2 -->
            <label for="avatar">Selecciona tu Avatar:</label>
            <select id="avatar" name="avatar" class="js-example-basic-single" style="width: 100%;" required>
                <option value="">*** Seleccione ***</option>
                <?php foreach ($avatares as $avatar): ?>
                    <option value="<?= $avatar['Id_avatar'] ?>" data-img="img/avatares/<?= $avatar['Foto'] ?>">
                        <?= $avatar['Nom_avatar'] ?>
                    </option>
                <?php endforeach; ?>
            </select>

            <input type="submit" id="submit" name="submit" class="btn-submit" value="Registrarse">
            <p>¿Ya tienes cuenta? <a class="p_a_login" href="index.php">Iniciar Sesión</a></p>
        </form>
    </div>
    <video autoplay loop muted>
        <source src="video/video2.mp4" type="video/mp4">
    </video>
    <div class="capa"></div>

    <!-- jQuery (requerido por Select2) -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- Select2 JS -->
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script>
        $(document).ready(function () {
            // Inicializar Select2 con imágenes
            function formatAvatar(avatar) {
                if (!avatar.id) return avatar.text;

                const imgUrl = $(avatar.element).data('img');
                const $avatar = $(
                    `<div class="avatar-option"><img src="${imgUrl}" /> ${avatar.text}</div>`
                );
                return $avatar;
            }

            $('#avatar').select2({
                templateResult: formatAvatar,
                templateSelection: formatAvatar,
                escapeMarkup: function (m) {
                    return m;
                },
            });
        });
    </script>
</body>
</html>