<?php
require_once('../../database/conexion.php');
$conex = new Database;
$con = $conex->conectar();
session_start();
header('Content-Type: application/json');

try {
    $id_sala = $_GET['id_sala'];
    
    // Verificar tiempo de batalla
    $sql_tiempo = $con->prepare("
        SELECT TIMESTAMPDIFF(SECOND, MIN(fecha_ini), NOW()) >= 300 as tiempo_acabado
        FROM estadistica 
        WHERE id_sala = ? 
        LIMIT 1
    ");
    $sql_tiempo->execute([$id_sala]);
    $tiempo_acabado = $sql_tiempo->fetchColumn();

    $sql_vivos = $con->prepare("
        SELECT username 
        FROM estadistica 
        WHERE id_sala = ? AND Id_estado = 7 
        GROUP BY username
    ");
    $sql_vivos->execute([$id_sala]);
    $jugadores_activos = $sql_vivos->fetchAll(PDO::FETCH_COLUMN);

    // Verificar si hubo ataques
    $sql_ataques = $con->prepare("
        SELECT COUNT(*) 
        FROM estadistica 
        WHERE id_sala = ? AND usu_victima IS NOT NULL
    ");
    $sql_ataques->execute([$id_sala]);
    $hay_ataques = $sql_ataques->fetchColumn() > 0;

    // La batalla termina solo si se acabó el tiempo o si solo queda un jugador activo
    $batalla_terminada = $tiempo_acabado || (COUNT($jugadores_activos) <= 1 && $hay_ataques);

    if ($batalla_terminada) {
        // Actualizar estado de la sala
        $sql_update_estado = $con->prepare("UPDATE sala SET Id_estado = 6 WHERE Id_sala = ?");
        $sql_update_estado->execute([$id_sala]);
        $ganador = null;
        
        $sqlUpdateGan = $con->prepare("
            UPDATE estadistica 
            SET ganador = 0 
            WHERE id_sala = ?
        ");
        $sqlUpdateGan->execute([$id_sala]);

        if (count($jugadores_activos) == 1) {
            $ganador = $jugadores_activos[0];
            $por_eliminacion = true;
            $por_tiempo = false;

            $sql_marcar_ganador = $con->prepare("
                UPDATE estadistica 
                SET ganador = 1 
                WHERE id_sala = ? AND username = ?
            ");
            $sql_marcar_ganador->execute([$id_sala, $ganador]);
        } else if ($tiempo_acabado && $hay_ataques) {
            $sql_ganador = $con->prepare("
                WITH DañoTotal AS (
                    SELECT username, SUM(daño) as total_daño
                    FROM estadistica 
                    WHERE id_sala = ? AND usu_victima IS NOT NULL
                    GROUP BY username
                    ORDER BY total_daño DESC 
                    LIMIT 1
                )
                SELECT username FROM DañoTotal
            ");
            $sql_ganador->execute([$id_sala]);
            $ganador = $sql_ganador->fetchColumn();

            if ($ganador) {
                $sql_marcar_ganador = $con->prepare("
                    UPDATE estadistica 
                    SET ganador = 1 
                    WHERE id_sala = ? AND username = ?
                ");
                $sql_marcar_ganador->execute([$id_sala, $ganador]);
                $por_tiempo = true;
                $por_eliminacion = false;
            }
        }
        
        echo json_encode([
            "batalla_terminada" => true,
            "ganador" => $ganador,
            "por_tiempo" => isset($por_tiempo) ? $por_tiempo : false,
            "por_eliminacion" => isset($por_eliminacion) ? $por_eliminacion : false,
            "jugadores_activos" => $jugadores_activos
        ]);
    } else {
        echo json_encode([
            "batalla_terminada" => false,
            "jugadores_activos" => $jugadores_activos
        ]);
    }
} catch (Exception $e) {
    echo json_encode([
        "error" => $e->getMessage()
    ]);
}
?>