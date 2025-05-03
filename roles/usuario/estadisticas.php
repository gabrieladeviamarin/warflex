<?php

require_once('../../database/conexion.php');
$conex = new Database;
$con = $conex->conectar();
session_start();

if (!isset($_SESSION['username'])) {
    echo "Inicio de sesión inválida";
    exit();
}

$username = $_SESSION['username'];

// Consulta para obtener las estadísticas del usuario actual con el nombre del arma
$sql = $con->prepare("SELECT e.id_sala, e.usu_victima, e.daño, a.nom_arma, e.fecha_ini, e.fecha_fin, e.parte_cuerpo 
                      FROM estadistica e
                      INNER JOIN armas a ON e.Id_armas = a.Id_armas
                      WHERE e.username = :username");
$sql->bindParam(':username', $username, PDO::PARAM_STR);
$sql->execute();
$estadisticas = $sql->fetchAll(PDO::FETCH_ASSOC);

?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Estadísticas</title>
    <link rel="stylesheet" href="../../css/index.css">
    <!-- DataTables CSS -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css">
    <style>
        /* Estilo para la tabla */
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            font-size: 18px;
            text-align: left;
            background-color: rgba(0, 0, 0, 0.8);
            color: #fff;
            border-radius: 10px;
            overflow: hidden;
        }

        th, td {
            padding: 12px 15px;
            border: 1px solid #ddd;
        }

        th {
            background-color: #007bff;
            color: #fff;
        }

        tr:nth-child(even) {
            background-color: rgba(255, 255, 255, 0.1);
        }

        tr:hover {
            background-color: rgba(255, 255, 255, 0.2);
        }

        /* Botón para regresar */
        .btn-back {
            display: inline-block;
            margin: 20px 0;
            padding: 10px 20px;
            background-color:rgb(218, 218, 17);
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            text-align: center;
        }

        .btn-back:hover {
            background-color:rgb(180, 180, 27);
        }
    </style>
</head>
<body>
    <h1>Estadísticas de <?php echo htmlspecialchars($username); ?></h1>
    <table id="estadisticasTable">
        <thead>
            <tr>
                <th>ID Sala</th>
                <th>Usuario Víctima</th>
                <th>Daño</th>
                <th>Nombre del Arma</th>
                <th>Fecha Inicio</th>
                <th>Fecha Fin</th>
                <th>Parte del Cuerpo</th>
            </tr>
        </thead>
        <tbody>
            <?php if (!empty($estadisticas)): ?>
                <?php foreach ($estadisticas as $fila): ?>
                    <tr>
                        <td><?php echo htmlspecialchars($fila['id_sala']); ?></td>
                        <td><?php echo htmlspecialchars($fila['usu_victima']); ?></td>
                        <td><?php echo htmlspecialchars($fila['daño']); ?></td>
                        <td><?php echo htmlspecialchars($fila['nom_arma']); ?></td>
                        <td><?php echo htmlspecialchars($fila['fecha_ini']); ?></td>
                        <td><?php echo htmlspecialchars($fila['fecha_fin']); ?></td>
                        <td><?php echo htmlspecialchars($fila['parte_cuerpo']); ?></td>
                    </tr>
                <?php endforeach; ?>
            <?php else: ?>
                <tr>
                    <td colspan="7">No se encontraron estadísticas para este usuario.</td>
                </tr>
            <?php endif; ?>
        </tbody>
    </table>

    <!-- Botón para regresar al index -->
    <a href="index.php" class="btn-back">Regresar al Inicio</a>

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- DataTables JS -->
    <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
    <script>
        $(document).ready(function () {
            // Inicializar DataTables con paginación de 10 filas
            $('#estadisticasTable').DataTable({
                pageLength: 10,
                language: {
                    lengthMenu: "Mostrar _MENU_ registros por página",
                    zeroRecords: "No se encontraron resultados",
                    info: "Mostrando página _PAGE_ de _PAGES_",
                    infoEmpty: "No hay registros disponibles",
                    infoFiltered: "(filtrado de _MAX_ registros totales)",
                    search: "Buscar:",
                    paginate: {
                        first: "Primero",
                        last: "Último",
                        next: "Siguiente",
                        previous: "Anterior"
                    }
                }
            });
        });
    </script>
</body>
</html>