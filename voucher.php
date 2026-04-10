<?php
session_start();
include("conexion.php");

// Verificamos que tengamos un ID de cliente válido y datos del ticket
if (!isset($_GET['id_c']) || empty($_SESSION['ticket_compra'])) {
    header("Location: index.php");
    exit;
}

$id_c = mysqli_real_escape_string($conexion, $_GET['id_c']);

// Buscamos los datos del cliente
$res = mysqli_query($conexion, "SELECT * FROM clientes WHERE id_cliente = '$id_c'");

if($res && mysqli_num_rows($res) > 0){
    $cli = mysqli_fetch_assoc($res);
} else {
    // Valores por defecto si la consulta falla para evitar errores visuales
    $cli = [
        'nombre' => 'Cliente',
        'apellido' => 'Genérico',
        'cedula' => 'N/A'
    ];
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Voucher de Compra - Tienda Riveiro</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <style>
        body { background: #121212; color: white; font-family: 'Poppins', sans-serif; text-align: center; padding: 50px; }
        .voucher { background: white; color: black; padding: 30px; border-radius: 10px; display: inline-block; text-align: left; max-width: 400px; box-shadow: 0 0 20px #00ff00; }
        h1 { color: #00ff00; background: black; padding: 10px; text-align: center; font-size: 1.2rem; margin-top: 0; }
        .btn-print { background: #00ff00; border: none; padding: 12px 20px; font-weight: bold; cursor: pointer; margin-top: 20px; width: 100%; border-radius: 5px; text-transform: uppercase; }
        hr { border: 0; border-top: 1px dashed #ccc; margin: 15px 0; }
        @media print { .no-print { display: none; } }
    </style>
</head>
<body>
    <div class="voucher">
        <h1>TIENDA DEPORTIVA RIVEIRO</h1>
        <p><strong>Cliente:</strong> <?php echo htmlspecialchars($cli['nombre'] . " " . $cli['apellido']); ?></p>
        <p><strong>Cédula:</strong> <?php echo htmlspecialchars($cli['cedula']); ?></p>
        <p><strong>Fecha:</strong> <?php echo date("d/m/Y H:i"); ?></p>
        <hr>
        <table style="width: 100%;">
            <?php 
                $total = 0; 
                foreach($_SESSION['ticket_compra'] as $item): 
                    $sub = $item['precio'] * $item['cantidad']; 
                    $total += $sub; 
            ?>
            <tr>
                <td><?php echo $item['nombre']; ?> (x<?php echo $item['cantidad']; ?>)</td>
                <td style="text-align: right;">$<?php echo number_format($sub, 2); ?></td>
            </tr>
            <?php endforeach; ?>
        </table>
        <hr>
        <h3 style="text-align: right; margin-bottom: 0;">TOTAL PAGADO: $<?php echo number_format($total, 2); ?></h3>
        
        <button class="btn-print no-print" onclick="window.print()">🖨️ IMPRIMIR BAUCHER</button>
        <a href="index.php" class="no-print" style="display:block; text-align:center; margin-top:15px; color:blue; text-decoration:none; font-weight:bold;">Volver a la tienda</a>
    </div>
</body>
</html>