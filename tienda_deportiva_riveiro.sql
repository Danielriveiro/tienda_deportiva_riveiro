-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:33065
-- Tiempo de generación: 10-04-2026 a las 03:46:44
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tienda_deportiva_riveiro`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id_categoria` int(11) NOT NULL,
  `nombre_categoria` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `nombre_categoria`) VALUES
(7, 'Accesorios'),
(2, 'Balones'),
(5, 'Camisetas'),
(4, 'Guantes'),
(3, 'Raquetas'),
(6, 'Shorts'),
(1, 'Zapato');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `cedula` varchar(20) NOT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `nombre`, `apellido`, `cedula`, `correo`, `telefono`) VALUES
(1, 'Daniel', 'Riveiro', '', 'dandresoque@gmail.com', '0412-3508399'),
(2, 'Daniel', 'Riveiro', '', 'dandresocque@gmail.com', '04123508399'),
(4, 'Mariano', 'Garcia', '', 'marianogarcia@gmail.com', '0412345345'),
(5, 'Samuel', 'Rojas', '29943334', 'samuel.rojas@gmail.com', '0414843334'),
(6, 'Shirley', 'Ocque', '11380899', 'shirleybmata@gmail.com', '04166957496');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deportes`
--

CREATE TABLE `deportes` (
  `id_deporte` int(11) NOT NULL,
  `nombre_deporte` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `deportes`
--

INSERT INTO `deportes` (`id_deporte`, `nombre_deporte`) VALUES
(1, 'Futbol Campo'),
(2, 'Futbol Sala'),
(3, 'Tenis');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_ventas`
--

CREATE TABLE `detalle_ventas` (
  `id_detalle` int(11) NOT NULL,
  `id_venta` int(11) DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precio_unitario` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `id_inventario` int(11) NOT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `talla_modelo` varchar(20) NOT NULL,
  `cantidad_stock` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `inventario`
--

INSERT INTO `inventario` (`id_inventario`, `id_producto`, `talla_modelo`, `cantidad_stock`) VALUES
(1, 1, 'M', 99),
(2, 1, 'S', 100),
(3, 1, 'L', 95),
(4, 2, 'S', 99),
(5, 2, 'M', 99),
(6, 2, 'L', 99),
(7, 3, 'S', 100),
(8, 3, 'M', 97),
(9, 3, 'L', 98),
(10, 4, 'S', 100),
(11, 4, 'M', 100),
(12, 4, 'L', 100),
(13, 5, '9', 100),
(14, 5, '10', 99),
(15, 5, '11', 98),
(16, 6, '9', 100),
(17, 6, '10', 100),
(18, 6, '11', 100),
(19, 7, '9', 100),
(20, 7, '10', 100),
(21, 7, '11', 100),
(22, 8, '9', 100),
(23, 8, '10', 100),
(24, 8, '11', 100),
(25, 9, '9', 100),
(26, 9, '10', 100),
(27, 9, '11', 100),
(28, 10, '9', 100),
(29, 10, '10', 100),
(30, 10, '11', 100),
(31, 11, '9', 100),
(32, 11, '10', 100),
(33, 11, '11', 100),
(34, 12, '9', 100),
(35, 12, '10', 100),
(36, 12, '11', 100),
(37, 13, '9', 100),
(38, 13, '10', 100),
(39, 13, '11', 100),
(40, 14, '9', 100),
(41, 14, '10', 100),
(42, 14, '11', 100),
(43, 15, '9', 100),
(44, 15, '10', 100),
(45, 15, '11', 100),
(46, 16, '9', 100),
(47, 16, '10', 100),
(48, 16, '11', 100),
(49, 17, '9', 100),
(50, 17, '10', 100),
(51, 17, '11', 100),
(52, 18, '9', 100),
(53, 18, '10', 100),
(54, 18, '11', 100),
(55, 19, '9', 100),
(56, 19, '10', 100),
(57, 19, '11', 100),
(58, 20, '9', 100),
(59, 20, '10', 100),
(60, 20, '11', 100),
(61, 21, '9', 100),
(62, 21, '10', 100),
(63, 21, '11', 100),
(64, 22, '9', 100),
(65, 22, '10', 100),
(66, 22, '11', 100),
(67, 23, '9', 100),
(68, 23, '10', 100),
(69, 23, '11', 100),
(70, 24, '9', 100),
(71, 24, '10', 100),
(72, 24, '11', 100),
(73, 25, '9', 100),
(74, 25, '10', 100),
(75, 25, '11', 100),
(76, 26, '4 1/2', 100),
(77, 27, '4 1/4', 100),
(78, 28, '4 3/8', 100),
(79, 29, '4 1/2', 100),
(80, 30, '4 3/8', 100),
(81, 31, '4 1/4', 100),
(82, 32, '4 3/8', 100),
(83, 33, '4 1/2', 100),
(84, 34, '4 3/8', 100),
(85, 35, '4 1/4', 100),
(86, 36, '4 3/8', 100),
(87, 37, '4 1/2', 100),
(88, 38, 'Tubo x3', 100),
(89, 40, '5', 100),
(90, 6, '9', 100),
(91, 6, '10', 100),
(92, 6, '11', 99),
(93, 7, '9', 100),
(94, 7, '10', 100),
(95, 7, '11', 100),
(96, 8, '9', 100),
(97, 8, '10', 100),
(98, 8, '11', 100),
(99, 9, '9', 100),
(100, 9, '10', 100),
(101, 9, '11', 100),
(102, 10, '9', 100),
(103, 10, '10', 100),
(104, 10, '11', 100),
(105, 11, '9', 100),
(106, 11, '10', 100),
(107, 11, '11', 99),
(108, 12, '9', 100),
(109, 12, '10', 100),
(110, 12, '11', 100),
(111, 13, '9', 100),
(112, 13, '10', 100),
(113, 13, '11', 100),
(114, 14, '9', 100),
(115, 14, '10', 100),
(116, 14, '11', 100),
(117, 15, '9', 100),
(118, 15, '10', 100),
(119, 15, '11', 100),
(120, 16, '9', 100),
(121, 16, '10', 100),
(122, 16, '11', 100),
(123, 17, '9', 100),
(124, 17, '10', 100),
(125, 17, '11', 100),
(126, 18, '9', 100),
(127, 18, '10', 100),
(128, 18, '11', 100),
(129, 19, '9', 100),
(130, 19, '10', 100),
(131, 19, '11', 100),
(132, 20, '9', 100),
(133, 20, '10', 100),
(134, 20, '11', 100),
(135, 21, '9', 100),
(136, 21, '10', 100),
(137, 21, '11', 100),
(138, 22, '9', 100),
(139, 22, '10', 100),
(140, 22, '11', 100),
(141, 23, '9', 100),
(142, 23, '10', 100),
(143, 23, '11', 100),
(144, 24, '9', 100),
(145, 24, '10', 100),
(146, 24, '11', 100),
(147, 25, '9', 100),
(148, 25, '10', 100),
(149, 25, '11', 100),
(150, 26, '4 1/2', 100),
(151, 27, '4 1/4', 100),
(152, 28, '4 3/8', 100),
(153, 29, '4 1/2', 100),
(154, 30, '4 3/8', 100),
(155, 31, '4 1/4', 100),
(156, 32, '4 3/8', 100),
(157, 33, '4 1/2', 100),
(158, 34, '4 3/8', 100),
(159, 35, '4 1/4', 100),
(160, 36, '4 3/8', 100),
(161, 37, '4 1/2', 100),
(162, 38, 'Tubo x3', 100),
(163, 39, 'Turbo x4', 100),
(164, 40, '5', 100),
(165, 41, '4', 100),
(166, 42, '5', 100),
(167, 43, '4', 100),
(168, 44, '5', 100),
(169, 45, '4', 100),
(170, 46, 'S', 100),
(171, 46, 'M', 100),
(172, 46, 'L', 100),
(173, 47, 'S', 100),
(174, 47, 'M', 100),
(175, 47, 'L', 100),
(176, 48, 'S', 100),
(177, 48, 'M', 100),
(178, 48, 'L', 100),
(179, 49, 'S', 100),
(180, 49, 'M', 100),
(181, 49, 'L', 100),
(182, 50, 'S', 100),
(183, 50, 'M', 100),
(184, 50, 'L', 100),
(185, 51, 'S', 100),
(186, 51, 'M', 100),
(187, 51, 'L', 100),
(188, 52, 'S', 100),
(189, 52, 'M', 100),
(190, 52, 'L', 100),
(191, 53, 'Unica', 100),
(192, 54, 'Unica', 97);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marcas`
--

CREATE TABLE `marcas` (
  `id_marca` int(11) NOT NULL,
  `nombre_marca` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `marcas`
--

INSERT INTO `marcas` (`id_marca`, `nombre_marca`) VALUES
(2, 'Adidas'),
(4, 'Babolat'),
(1, 'Nike'),
(3, 'Wilson');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_producto` int(11) NOT NULL,
  `nombre_producto` varchar(100) NOT NULL,
  `precio_producto` decimal(10,2) NOT NULL,
  `id_marca` int(11) DEFAULT NULL,
  `id_deporte` int(11) DEFAULT NULL,
  `id_categoria` int(11) DEFAULT NULL,
  `imagen_url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_producto`, `nombre_producto`, `precio_producto`, `id_marca`, `id_deporte`, `id_categoria`, `imagen_url`) VALUES
(1, 'Camiseta Barcelona 2026', 80.00, 2, 1, 5, 'imagenes/camiseta_Barcelona_2026.avif'),
(2, 'Camiseta Real Madrid 2026', 80.00, 2, 1, 5, 'imagenes/real_madrid_2026.avif'),
(3, 'Camiseta Atletico Madrid 2026', 80.00, 1, 1, 5, 'imagenes/camiseta_atletico_madrid_2026.avif'),
(4, 'Camiseta Bayern Munich 2026', 80.00, 2, 1, 5, 'imagenes/camiseta_bayern_munich_2026.avif'),
(5, 'Guantes Predator Pro', 75.00, 2, 1, 4, 'imagenes/Guantes_Predator_Pro.avif'),
(6, 'Guantes Predator League', 70.00, 2, 1, 4, 'imagenes/Guantes_Predator_League.avif'),
(7, 'Guantes Nike Vapor Grip 3', 70.00, 1, 1, 4, 'imagenes/Guantes_Nike_Vapor_Grip_3.avif'),
(8, 'Guantes Nike Goalkeeper Match', 50.00, 1, 1, 4, 'imagenes/Guantes_Nike_Goalkeeper_Match.avif'),
(9, 'Guantes Nike Phantom', 130.00, 1, 1, 4, 'imagenes/Guantes_Nike_Phantom.avif'),
(10, 'Zapatos Adidas Predator Campo Pro', 180.00, 2, 1, 1, 'imagenes/Zapatos_Adidas_Predator_Campo_Pro.avif'),
(11, 'Zapatos Adidas Predator Sala', 150.00, 2, 2, 1, 'imagenes/Zapatos_Adidas_Predator_Sala.avif'),
(12, 'Zapatos Nike Mercurial Vapor Campo', 150.00, 1, 1, 1, 'imagenes/Zapatos_Nike_Mercurial_Vapor_Campo.avif'),
(13, 'Zapatos Nike Mercurial Vapor Sala', 110.00, 1, 2, 1, 'imagenes/Zapatos_Nike_Mercurial_Vapor_Sala.avif'),
(14, 'Zapatos Adidas F50', 170.00, 2, 1, 1, 'imagenes/Zapatos_Adidas_F50.avif'),
(15, 'Zapatos Adidas F50 Sala', 140.00, 2, 2, 1, 'imagenes/Zapatos_Adidas_F50_Sala.avif'),
(16, 'Zapatos Adidas Copa Campo', 140.00, 2, 1, 1, 'imagenes/Zapatos_Adidas_Copa_Campo.avif'),
(17, 'Zapatos Adidas Copa Sala', 90.00, 2, 2, 1, 'imagenes/Zapatos_Adidas_Copa_Sala.avif'),
(18, 'Zapatos Nike Mercurial Superfly Campo', 125.00, 1, 1, 1, 'imagenes/Zapatos_Nike_Mercurial_Superfly_Campo.avif'),
(19, 'Zapatos Nike Mercurial Superfly Sala', 100.00, 1, 2, 1, 'imagenes/Zapatos_Nike_Mercurial_Superfly_Sala.avif'),
(20, 'Zapatos Nike Phantom GX Campo', 110.00, 1, 1, 1, 'imagenes/Zapatos_Nike_Phantom_GX_Campo.avif'),
(21, 'Zapatos Nike Phantom GX Sala', 90.00, 1, 2, 1, 'imagenes/Zapatos_Nike_Phantom_GX_Sala.avif'),
(22, 'Zapatos Nike Phantom Luna  Campo', 100.00, 1, 1, 1, 'imagenes/Zapatos_Nike_Phantom_Luna_Campo.avif'),
(23, 'Zapatos Nike Phantom Luna Sala', 90.00, 1, 2, 1, 'imagenes/Zapatos_Nike_Phantom_Luna_Sala.avif'),
(24, 'Zapatos Nike Tiempo Campo', 140.00, 1, 1, 1, 'imagenes/Zapatos_Nike_Tiempo_Campo.avif'),
(25, 'Zapatos Nike Tiempo Sala', 100.00, 1, 2, 1, 'imagenes/Zapatos_Nike_Tiempo_Sala.avif'),
(26, 'Raqueta Pure Aero 2026', 260.00, 4, 3, 3, 'imagenes/Raqueta_Pure_Aero_2026.avif'),
(27, 'Raqueta Pure Aero Team 2026', 270.00, 4, 3, 3, 'imagenes/Raqueta_Pure_Aero_Team_2026.avif'),
(28, 'Raqueta Pure Aero Super Lite 2026', 195.00, 4, 3, 3, 'imagenes/Raqueta_Pure_Aero_Super_Lite_2026.avif'),
(29, 'Raqueta Pure Aero + NCV 3', 300.00, 4, 3, 3, 'imagenes/Raqueta_Pure_Aero_+_NCV_3.avif'),
(30, 'Raqueta Boost Strike', 195.00, 4, 3, 3, 'imagenes/Raqueta_Boost_Strike.avif'),
(31, 'Raqueta Boost Rafa', 240.00, 4, 3, 3, 'imagenes/Raqueta_Boost_Rafa.avif'),
(32, 'Raqueta Pro Staff', 210.00, 3, 3, 3, 'imagenes/Raqueta_Pro_Staff.avif'),
(33, 'Raqueta Blade Wilson', 285.00, 3, 3, 3, 'imagenes/Raqueta_Blade_Wilson.avif'),
(34, 'Raqueta Clash V2', 275.00, 3, 3, 3, 'imagenes/Raqueta_Clash_V2.avif'),
(35, 'Raqueta Clash V3', 240.00, 3, 3, 3, 'imagenes/Raqueta_Clash_V3.avif'),
(36, 'Raqueta Ultra V5', 250.00, 3, 3, 3, 'imagenes/Raqueta_Ultra_V5.avif'),
(37, 'Raqueta Burn', 160.00, 3, 3, 3, 'imagenes/Raqueta_Burn.avif'),
(38, 'Pelotas Tenis Tubo Wilson', 15.00, 3, 3, 2, 'imagenes/Pelotas_Tenis_Tubo_Wilson.avif'),
(39, 'Pelotas Tenis Tubo Babolat', 9.50, 4, 3, 2, 'imagenes/Pelotas_Tenis_Tubo_Babolat.avif'),
(40, 'Balon Champions League 2026 campo', 140.00, 2, 1, 2, 'imagenes/Balon_Champions_League_2026_Campo.avif'),
(41, 'Balon Champions League Sala 2026', 120.00, 2, 2, 2, 'imagenes/Balon_Champions_League_Sala_2026.avif'),
(42, 'Balon Futbol Campo Liga Santander 2026', 120.00, 1, 1, 2, 'imagenes/Balon_Futbol_Campo_Liga_Santander_2026.avif'),
(43, 'Balon Futbol Sala Liga Santander 2026', 100.99, 1, 2, 2, 'imagenes/Balon_Futbol_Sala_Liga_Santander_2026.avif'),
(44, 'Balon Futbol Campo Premier League 2026', 120.00, 1, 1, 2, 'imagenes/Balon_Futbol_Campo_Premier_League_2026.avif'),
(45, 'Balon Futbol Sala Premier League 2026', 100.99, 1, 2, 2, 'imagenes/Balon_Futbol_Sala_Premier_League_2026.avif'),
(46, 'Franela Nike Court Dry-Fit', 35.00, 1, 3, 5, 'imagenes/Franela_Nike_Court_Dry-Fit.avif'),
(47, 'Franela Adidas Ergo Tennis', 32.00, 2, 3, 5, 'imagenes/Franela_Adidas_Ergo_Tennis.avif'),
(48, 'Franela Wilson Series Tech', 28.00, 3, 3, 5, 'imagenes/Franela_Wilson_Series_Tech.avif'),
(49, 'Short Nike Park VII', 25.00, 1, 3, 6, 'imagenes/Short_Nike_Park_VII.avif'),
(50, 'Short Adidas Tastigo 19', 22.00, 2, 3, 6, 'imagenes/Short_Adidas_Tastigo_19.avif'),
(51, 'Short Adidas Raid', 24.00, 2, 3, 6, 'imagenes/Short_Adidas_Raid.avif'),
(52, 'Cinta para cabeza Nike Swoosh', 12.00, 1, 3, 7, 'imagenes/Cinta_para_cabeza_Nike_Swoosh.avif'),
(53, 'Muñequeras Adidas Tennis', 10.00, 2, 3, 7, 'imagenes/Muñequeras_Adidas_Tennis.avif'),
(54, 'Banda para frente Wilson Pro', 11.00, 3, 3, 7, 'imagenes/Banda_para_frente_Wilson_Pro.avif');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id_venta` int(11) NOT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `fecha_venta` datetime DEFAULT current_timestamp(),
  `total_venta` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id_venta`, `id_cliente`, `fecha_venta`, `total_venta`) VALUES
(1, 2, '2026-04-06 06:20:15', 80.00),
(3, 4, '2026-04-07 19:44:28', 160.00),
(4, 4, '2026-04-07 19:44:29', 70.00),
(17, 5, '2026-04-10 03:22:44', 80.00),
(18, 5, '2026-04-10 03:22:44', 80.00),
(19, 6, '2026-04-10 03:30:40', 80.00),
(20, 6, '2026-04-10 03:30:40', 75.00),
(21, 6, '2026-04-10 03:30:40', 150.00);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categoria`),
  ADD UNIQUE KEY `nombre_categoria` (`nombre_categoria`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`),
  ADD UNIQUE KEY `correo` (`correo`);

--
-- Indices de la tabla `deportes`
--
ALTER TABLE `deportes`
  ADD PRIMARY KEY (`id_deporte`),
  ADD UNIQUE KEY `nombre_deporte` (`nombre_deporte`);

--
-- Indices de la tabla `detalle_ventas`
--
ALTER TABLE `detalle_ventas`
  ADD PRIMARY KEY (`id_detalle`),
  ADD KEY `id_venta` (`id_venta`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`id_inventario`),
  ADD KEY `fk_producto_inventario` (`id_producto`);

--
-- Indices de la tabla `marcas`
--
ALTER TABLE `marcas`
  ADD PRIMARY KEY (`id_marca`),
  ADD UNIQUE KEY `nombre_marca` (`nombre_marca`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `fk_marca` (`id_marca`),
  ADD KEY `fk_deporte` (`id_deporte`),
  ADD KEY `fk_categoria` (`id_categoria`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id_venta`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `deportes`
--
ALTER TABLE `deportes`
  MODIFY `id_deporte` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `detalle_ventas`
--
ALTER TABLE `detalle_ventas`
  MODIFY `id_detalle` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `inventario`
--
ALTER TABLE `inventario`
  MODIFY `id_inventario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=193;

--
-- AUTO_INCREMENT de la tabla `marcas`
--
ALTER TABLE `marcas`
  MODIFY `id_marca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id_venta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_ventas`
--
ALTER TABLE `detalle_ventas`
  ADD CONSTRAINT `detalle_ventas_ibfk_1` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id_venta`),
  ADD CONSTRAINT `detalle_ventas_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`);

--
-- Filtros para la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD CONSTRAINT `fk_producto_inventario` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `fk_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`),
  ADD CONSTRAINT `fk_deporte` FOREIGN KEY (`id_deporte`) REFERENCES `deportes` (`id_deporte`),
  ADD CONSTRAINT `fk_marca` FOREIGN KEY (`id_marca`) REFERENCES `marcas` (`id_marca`);

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
