<?php
session_start();
include("conexion.php");

if (empty($_SESSION['carrito'])) {
    header("Location: index.php");
    exit;
}

if (isset($_POST['confirmar'])) {
    $val_nombre   = mysqli_real_escape_string($conexion, $_POST['f_nombre']);
    $val_apellido = mysqli_real_escape_string($conexion, $_POST['f_apellido']);
    $val_cedula   = mysqli_real_escape_string($conexion, $_POST['f_cedula']);
    $val_correo   = mysqli_real_escape_string($conexion, $_POST['f_correo']);
    $val_telefono = mysqli_real_escape_string($conexion, $_POST['f_telefono']);

    // 1. REGISTRAMOS AL CLIENTE
    $query_cli = "INSERT INTO clientes (nombre, apellido, cedula, correo, telefono) 
                  VALUES ('$val_nombre', '$val_apellido', '$val_cedula', '$val_correo', '$val_telefono')";
    
    if(mysqli_query($conexion, $query_cli)){
        $id_cliente_nuevo = mysqli_insert_id($conexion); 
    } else {
        die("Error en la base de datos al registrar cliente: " . mysqli_error($conexion));
    }

    // 2. PROCESAMOS VENTAS Y RESTAMOS INVENTARIO
    foreach ($_SESSION['carrito'] as $id_inv => $detalle) {
        $id_inv_seguro = mysqli_real_escape_string($conexion, $id_inv);
        $cantidad = (int)$detalle['cantidad'];
        $precio   = $detalle['precio'];
        $total_v  = $precio * $cantidad;
        $fecha    = date("Y-m-d H:i:s");

        // Insertar registro de la venta
        $query_venta = "INSERT INTO ventas (id_cliente, total_venta, fecha_venta) 
                        VALUES ('$id_cliente_nuevo', '$total_v', '$fecha')";
        mysqli_query($conexion, $query_venta);

        // RESTAR STOCK: Actualiza la tabla inventario restando lo comprado
        $query_stock = "UPDATE inventario SET cantidad_stock = cantidad_stock - $cantidad 
                        WHERE id_inventario = '$id_inv_seguro'";
        mysqli_query($conexion, $query_stock);
    }

    // Guardamos los datos en una sesión temporal para el voucher
    $_SESSION['ticket_compra'] = $_SESSION['carrito'];
    
    // Vaciamos el carrito
    unset($_SESSION['carrito']);

    // Redirección al voucher con el ID real
    header("Location: voucher.php?id_c=$id_cliente_nuevo");
    exit;
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Finalizar Venta - Tienda Riveiro</title>
    <style>
        body { background-color: #121212; color: white; font-family: 'Segoe UI', sans-serif; display: flex; justify-content: center; align-items: center; min-height: 100vh; margin: 0; padding: 20px; }
        .formulario-pago { background: #1a1a1a; padding: 35px; border-radius: 15px; border: 2px solid #00ff00; width: 100%; max-width: 450px; box-shadow: 0 0 20px rgba(0,255,0,0.2); }
        h2 { color: #00ff00; text-align: center; text-transform: uppercase; margin-bottom: 25px; }
        label { display: block; margin-bottom: 5px; font-size: 0.9rem; color: #888; }
        input { width: 100%; padding: 12px; margin-bottom: 15px; border-radius: 8px; border: 1px solid #333; background: #222; color: white; box-sizing: border-box; outline: none; }
        input:focus { border-color: #00ff00; }
        .total-container { background: #000; padding: 15px; border-radius: 10px; text-align: center; border: 1px solid #333; margin-bottom: 25px; }
        .btn-confirmar { background: #00ff00; color: black; border: none; padding: 16px; width: 100%; font-weight: bold; border-radius: 8px; cursor: pointer; transition: 0.3s; text-transform: uppercase; font-size: 1rem; }
        .btn-confirmar:hover { background: #00cc00; box-shadow: 0 0 15px #00ff00; }
        .volver { display: block; text-align: center; margin-top: 15px; color: #ff4444; text-decoration: none; font-size: 0.8rem; }
    </style>
</head>
<body>
    <div class="formulario-pago">
        <h2>Datos de Facturación</h2>
        <form method="POST">
            <label>Nombre:</label>
            <input type="text" name="f_nombre" placeholder="Tu nombre" required>
            <label>Apellido:</label>
            <input type="text" name="f_apellido" placeholder="Tu apellido" required>
            <label>Cédula:</label>
            <input type="text" name="f_cedula" placeholder="Ej: 25.123.456" required>
            <label>Correo Electrónico:</label>
            <input type="email" name="f_correo" placeholder="correo@ejemplo.com" required>
            <label>Teléfono:</label>
            <input type="text" name="f_telefono" placeholder="Ej: 04121234567" required>
            
            <div class="total-container">
                <span style="color: #666; font-size: 0.8rem;">MONTO TOTAL</span><br>
                <strong style="font-size: 2rem; color: #00ff00;">
                $<?php 
                    $total_final = 0;
                    foreach($_SESSION['carrito'] as $item) { $total_final += $item['precio'] * $item['cantidad']; }
                    echo number_format($total_final, 2);
                ?>
                </strong>
            </div>
            
            <button type="submit" name="confirmar" class="btn-confirmar">CONFIRMAR COMPRA</button>
            <a href="index.php" class="volver">← Cancelar y volver al catálogo</a>
        </form>
    </div>
</body>
</html>