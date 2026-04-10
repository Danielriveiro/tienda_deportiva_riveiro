<?php 
session_start();
include("conexion.php");

if (!isset($_SESSION['carrito'])){
    $_SESSION['carrito'] = [];
}

// --- AJUSTE: ACTUALIZAR CANTIDAD MANUALMENTE ---
if (isset($_POST['actualizar_cant'])) {
    $id_inv = $_POST['id_actualizar'];
    $nueva_cant = intval($_POST['nueva_cantidad']);
    if ($nueva_cant > 0) {
        $_SESSION['carrito'][$id_inv]['cantidad'] = $nueva_cant;
    } else {
        unset($_SESSION['carrito'][$id_inv]);
    }
    header("Location: index.php");
    exit;
}

// --- AJUSTE: ELIMINAR PRODUCTO INDIVIDUAL ---
if (isset($_GET['eliminar_item'])) {
    $id_eliminar = $_GET['eliminar_item'];
    if (isset($_SESSION['carrito'][$id_eliminar])) {
        unset($_SESSION['carrito'][$id_eliminar]);
    }
    header("Location: index.php");
    exit;
}

// 1. LÓGICA PARA AGREGAR AL CARRITO
if (isset($_POST['btn_agregar'])){
    if(!empty($_POST['id_inventario_seleccionado'])) {
        $id_inv = mysqli_real_escape_string($conexion, $_POST['id_inventario_seleccionado']);
        $nom_prod = mysqli_real_escape_string($conexion, $_POST['agregar_nombre']);
        $precio_prod = $_POST['agregar_precio'];
        
        $sql_talla = "SELECT talla_modelo FROM inventario WHERE id_inventario = '$id_inv'";
        $res_talla = mysqli_query($conexion, $sql_talla);
        
        if($res_talla && mysqli_num_rows($res_talla) > 0) {
            $fila_talla = mysqli_fetch_assoc($res_talla);
            $nombre_final = $nom_prod . " (Talla: " . $fila_talla['talla_modelo'] . ")";

            if(isset($_SESSION['carrito'][$id_inv])){
                $_SESSION['carrito'][$id_inv]['cantidad']++;
            } else {
                $_SESSION['carrito'][$id_inv] = [
                    'nombre' => $nombre_final,
                    'precio' => $precio_prod,
                    'cantidad' => 1
                ];
            }
        }
    }
}

// 2. LÓGICA PARA VACIAR CARRITO
if (isset($_POST['limpiar'])) {
    $_SESSION['carrito'] = [];
    header("Location: index.php");
    exit;
}

// --- AJUSTE: LÓGICA DEL BUSCADOR ---
$busqueda = "";
if (isset($_GET['buscar'])) {
    $busqueda = mysqli_real_escape_string($conexion, $_GET['buscar']);
    $resultado_productos = mysqli_query($conexion, "SELECT * FROM productos WHERE nombre_producto LIKE '%$busqueda%'");
} else {
    $resultado_productos = mysqli_query($conexion, "SELECT * FROM productos");
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Tienda Deportiva Riveiro</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    
    <style>
        :root { --primary: #00ff00; --secondary: #00ffff; --dark: #121212; --card-bg: #1e1e1e; --text: #ffffff; }
        body { background-color: var(--dark); color: var(--text); font-family: 'Poppins', sans-serif; margin: 0; }
        header { background: #000; padding: 30px; text-align: center; border-bottom: 2px solid var(--primary); }
        header h1 { margin: 0; color: var(--primary); text-transform: uppercase; letter-spacing: 2px; }
        
        /* Estilo para el buscador */
        .contenedor-busqueda { text-align: center; padding: 20px; }
        .input-busqueda { padding: 10px; width: 300px; border-radius: 8px; border: 1px solid var(--primary); background: #222; color: white; }

        .contenedor-productos { display: grid; grid-template-columns: repeat(auto-fill, minmax(300px, 1fr)); gap: 30px; padding: 40px; max-width: 1200px; margin: 0 auto; }
        .producto-card { background: var(--card-bg); border-radius: 15px; overflow: hidden; border: 1px solid #333; transition: 0.3s; display: flex; flex-direction: column; }
        .producto-card:hover { border-color: var(--primary); box-shadow: 0 0 15px var(--primary); transform: translateY(-5px); }
        .producto-imagen { width: 100%; height: 250px; object-fit: cover; }
        .card-body { padding: 20px; text-align: center; flex-grow: 1; }
        .precio { font-size: 1.5rem; color: var(--primary); font-weight: 600; margin-bottom: 15px; }
        .selector-talla { width: 100%; padding: 10px; background: #2a2a2a; color: white; border: 1px solid #444; border-radius: 8px; margin-bottom: 15px; cursor: pointer; }
        .btn-comprar { background: var(--primary); color: black; border: none; padding: 12px; width: 100%; border-radius: 8px; font-weight: bold; cursor: pointer; text-transform: uppercase; }
        
        .seccion-carrito { background: #1a1a1a; margin: 40px auto; max-width: 900px; padding: 30px; border-radius: 15px; border: 1px dashed var(--primary); }
        table { width: 100%; border-collapse: collapse; }
        th { text-align: left; color: var(--primary); border-bottom: 1px solid #333; padding: 10px; }
        td { padding: 10px; border-bottom: 1px solid #222; }
        .btn-pagar { background: var(--primary); color: black; padding: 12px 25px; text-decoration: none; font-weight: bold; border-radius: 8px; display: inline-block; transition: 0.3s; }
        .btn-pagar:hover { box-shadow: 0 0 15px var(--secondary); background: var(--secondary); }

        .footer-final { background-color: #080808; border-top: 2px solid var(--primary); padding: 40px 20px; margin-top: 80px; width: 100%; }
        .footer-flex { display: flex; justify-content: center; align-items: center; gap: 60px; flex-wrap: wrap; max-width: 1000px; margin: 0 auto; }
        .footer-logo img { width: 100px; height: auto; filter: drop-shadow(0 0 8px var(--primary)); }
        .texto-neon-verde { color: var(--primary); font-size: 0.8rem; text-transform: uppercase; letter-spacing: 3px; margin: 0; text-shadow: 0 0 5px var(--primary); }
        .nombre-destacado { color: white; font-size: 1.6rem; font-weight: bold; margin: 5px 0 20px 0; }
        .redes-sociales { display: flex; gap: 12px; }
        .btn-footer { display: flex; align-items: center; gap: 8px; padding: 10px 18px; border-radius: 6px; text-decoration: none; color: white; font-weight: bold; font-size: 0.85rem; transition: 0.3s; }
        .btn-footer i { font-size: 1.1rem; }
        .whatsapp { background-color: #25d366; }
        .instagram { background-color: #e1306c; }
        .llamar { background-color: #007bff; }
        .btn-footer:hover { transform: translateY(-5px); background-color: transparent; border: 1px solid var(--primary); color: var(--primary); box-shadow: 0 0 15px var(--primary); }
    </style>
</head>
<body>

<header><h1>Tienda Deportiva Riveiro</h1></header>

<div class="contenedor-busqueda">
    <form method="GET" action="index.php">
        <input type="text" name="buscar" class="input-busqueda" placeholder="Buscar producto..." value="<?php echo htmlspecialchars($busqueda); ?>">
        <button type="submit" class="btn-comprar" style="width: auto; padding: 10px 20px;">Buscar</button>
    </form>
</div>

<div class="contenedor-productos">
    <?php while($prod = mysqli_fetch_assoc($resultado_productos)): 
        $id_p = $prod['id_producto'];
        $sql_tallas_agrupadas = "SELECT MAX(id_inventario) as id_inventario, talla_modelo FROM inventario WHERE id_producto = '$id_p' AND cantidad_stock > 0 GROUP BY talla_modelo";
        $res_tallas = mysqli_query($conexion, $sql_tallas_agrupadas);
    ?>
    <div class="producto-card">
        <img src="<?php echo $prod['imagen_url']; ?>" class="producto-imagen" onerror="this.src='https://via.placeholder.com/250'">
        <div class="card-body">
            <h3><?php echo htmlspecialchars($prod['nombre_producto']); ?></h3>
            <p class="precio">$<?php echo number_format($prod['precio_producto'], 2); ?></p>
            
            <form method="POST">
                <select name="id_inventario_seleccionado" class="selector-talla" required>
                    <option value="" disabled selected>Elegir Talla</option>
                    <?php while($t = mysqli_fetch_assoc($res_tallas)): ?>
                        <option value="<?php echo $t['id_inventario']; ?>"><?php echo $t['talla_modelo']; ?></option>
                    <?php endwhile; ?>
                </select>

                <input type="hidden" name="agregar_nombre" value="<?php echo $prod['nombre_producto']; ?>">
                <input type="hidden" name="agregar_precio" value="<?php echo $prod['precio_producto']; ?>">
                <button type="submit" name="btn_agregar" class="btn-comprar">Agregar al Carrito</button>
            </form>
        </div>
    </div>
    <?php endwhile; ?>
</div>

<section class="seccion-carrito">
    <h2 style="color: var(--primary);">🛒 Mi Carrito</h2>
    <?php if (!empty($_SESSION['carrito'])): ?>
        <table>
            <thead><tr><th>Producto</th><th>Cant.</th><th>Subtotal</th><th>Acción</th></tr></thead>
            <tbody>
                <?php $total = 0; foreach ($_SESSION['carrito'] as $id_inv_key => $item): $sub = $item['precio'] * $item['cantidad']; $total += $sub; ?>
                <tr>
                    <td><?php echo $item['nombre']; ?></td>
                    <td>
                        <form method="POST" style="display:inline;">
                            <input type="hidden" name="id_actualizar" value="<?php echo $id_inv_key; ?>">
                            <input type="number" name="nueva_cantidad" value="<?php echo $item['cantidad']; ?>" min="1" onchange="this.form.submit()" style="width: 50px; background: #222; color: white; border: 1px solid var(--primary); border-radius: 5px;">
                            <input type="hidden" name="actualizar_cant" value="1">
                        </form>
                    </td>
                    <td>$<?php echo number_format($sub, 2); ?></td>
                    <td>
                        <a href="index.php?eliminar_item=<?php echo $id_inv_key; ?>" style="color: #ff4444;"><i class="fas fa-trash"></i></a>
                    </td>
                </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
        <h3 style="text-align: right; color: var(--primary); font-size: 1.8rem;">Total: $<?php echo number_format($total, 2); ?></h3>
        
        <div style="display: flex; justify-content: space-between; align-items: center; margin-top: 20px;">
            <form method="POST">
                <button type="submit" name="limpiar" style="color:red; background:none; border:1px solid red; padding:10px; cursor:pointer; border-radius:5px;">Vaciar Carrito</button>
            </form>
            <a href="finalizar_compra.php" class="btn-pagar">IR A PAGAR →</a>
        </div>
    <?php else: ?>
        <p style="text-align: center; color: #666;">Selecciona productos para comprar.</p>
    <?php endif; ?>
</section>

<footer class="footer-final">
    <div class="footer-flex">
        <div class="footer-logo"><img src="logo.png" alt="Logo Riveiro"></div>
        <div class="footer-autor">
            <h3 class="texto-neon-verde">Desarrollador & Dueño</h3>
            <p class="nombre-destacado">Daniel Riveiro</p>
            <div class="redes-sociales">
                <a href="https://wa.me/584123508399" target="_blank" class="btn-footer whatsapp"><i class="fab fa-whatsapp"></i> WhatsApp</a>
                <a href="https://instagram.com/riveiro_29" target="_blank" class="btn-footer instagram"><i class="fab fa-instagram"></i> Instagram</a>
                <a href="tel:+584123508399" class="btn-footer llamar"><i class="fas fa-phone-alt"></i> Llamar</a>
            </div>
        </div>
    </div>
</footer>

</body>
</html>