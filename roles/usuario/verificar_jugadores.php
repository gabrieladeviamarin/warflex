<?php
require_once('../../database/conexion.php');
$conex = new Database;
$con = $conex->conectar();

$id_sala = $_GET['id_sala'];

// Obtener lista de jugadores y estado de la sala en una sola consulta
$sql = $con->prepare("
    SELECT d.username, s.inicio_contador, s.Id_estado,
           (SELECT COUNT(*) FROM detalle_sala WHERE id_sala = ?) as total
    FROM detalle_sala d
    JOIN sala s ON d.id_sala = s.id_sala
    WHERE d.id_sala = ?
");
$sql->execute([$id_sala, $id_sala]);
$jugadores = $sql->fetchAll(PDO::FETCH_ASSOC);

$totalJugadores = $jugadores[0]['total'] ?? 0;
$inicioContador = $jugadores[0]['inicio_contador'] ?? null;
$estado = $jugadores[0]['Id_estado'] ?? null;

if ($totalJugadores >= 2) {
    if (!$inicioContador) {
        $inicioContador = date("Y-m-d H:i:s");
        $sqlUpdate = $con->prepare("UPDATE sala SET inicio_contador = ? WHERE id_sala = ?");
        $sqlUpdate->execute([$inicioContador, $id_sala]);
    }
    
    $segundosTranscurridos = time() - strtotime($inicioContador);
    $segundosRestantes = max(20 - $segundosTranscurridos, 0);

    $redirigir = ($segundosRestantes == 0); // Redirigir si el tiempo se acabó

} else {
    $segundosRestantes = null;
    $redirigir = false;
}

echo json_encode([
    "jugadores" => array_column($jugadores, 'username'),
    "total" => $totalJugadores,
    "segundos_restantes" => $segundosRestantes,
    "redirigir" => $redirigir
]);
?>
