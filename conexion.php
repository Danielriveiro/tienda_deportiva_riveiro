<?php
$host = "127.0.0.1:33065";
$user = "root";
$pass = "";
$db = "tienda_deportiva_riveiro";

mysqli_report(MYSQLI_REPORT_OFF);

$conexion = mysqli_connect($host, $user, $pass, $db);

if (!$conexion) {
    die ("Error de conexión: ". mysqli_connect_error());
} else {
    echo "";
}
?>