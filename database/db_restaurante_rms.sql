-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 24-06-2024 a las 19:50:58
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
-- Base de datos: `db_restaurante_rms`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `area_mesa`
--

CREATE TABLE `area_mesa` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `area_mesa`
--

INSERT INTO `area_mesa` (`id`, `nombre`, `created_at`, `updated_at`) VALUES
(1, 'Piso 1', '2023-09-26 22:43:09', '2023-09-26 22:49:03'),
(2, 'Piso 2', '2023-09-26 22:43:18', '2023-09-26 22:43:18'),
(4, 'piso3', '2023-09-27 22:35:00', '2023-09-27 22:35:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias_menu`
--

CREATE TABLE `categorias_menu` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias_menu`
--

INSERT INTO `categorias_menu` (`id`, `nombre`, `created_at`, `updated_at`) VALUES
(1, 'Entradas', '2023-09-25 01:57:37', '2023-09-25 02:27:05'),
(3, 'Plato principal', NULL, NULL),
(5, 'Pescados y Mariscos', '2023-09-25 02:27:42', '2023-09-25 02:27:42'),
(6, 'Acompañamientos', '2023-09-25 02:27:56', '2023-09-25 02:27:56'),
(7, 'Postres', '2023-09-25 02:28:06', '2023-09-25 02:28:06'),
(8, 'Bebidas', '2023-09-25 02:28:19', '2023-09-25 02:28:19'),
(15, 'otros', '2024-06-20 17:05:55', '2024-06-20 17:05:55');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `correo` varchar(255) DEFAULT NULL,
  `documento` int(12) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `nombre`, `telefono`, `correo`, `documento`, `created_at`, `updated_at`) VALUES
(1, 'Anónimo/Genérico ', NULL, NULL, NULL, '2023-09-27 04:13:44', '2023-09-28 23:59:17'),
(2, 'ángel Fernández', '981213132', 'angel@gmail.com', 73265223, '2023-09-27 04:13:55', '2023-09-28 23:59:41'),
(3, 'andy', '9423232', 'sovene@mailinator.com', 3234534, '2024-06-17 17:59:05', '2024-06-17 17:59:05'),
(4, 'Perferendis nihil qu', '9423232', 'sovene@mailinator.com', 2122222, '2024-06-20 16:08:58', '2024-06-20 16:08:58'),
(8, 'Rerum aut porro non', '945534324', 'qelywykow@mailinator.com', 3534535, '2024-06-20 17:19:34', '2024-06-20 17:19:34');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `descuentos_promociones`
--

CREATE TABLE `descuentos_promociones` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `valor` decimal(10,2) DEFAULT NULL,
  `tipo` enum('descuento','promocion') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturas`
--

CREATE TABLE `facturas` (
  `id` int(11) NOT NULL,
  `pedido_id` int(11) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `impuestos` decimal(10,2) DEFAULT NULL,
  `fecha_factura` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_actividades`
--

CREATE TABLE `historial_actividades` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `fecha_actividad` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_transacciones`
--

CREATE TABLE `historial_transacciones` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `fecha_transaccion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingredientes`
--

CREATE TABLE `ingredientes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `cantidad` decimal(10,2) DEFAULT NULL,
  `unidad_medida` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menus`
--

CREATE TABLE `menus` (
  `id` int(11) NOT NULL,
  `id_categ` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `precio` float NOT NULL,
  `img` text DEFAULT NULL,
  `estado` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `menus`
--

INSERT INTO `menus` (`id`, `id_categ`, `nombre`, `descripcion`, `precio`, `img`, `estado`, `created_at`, `updated_at`) VALUES
(1, 1, 'Ceviche', 'Pescado crudo marinado en jugo de limón y ají, servido con cebolla roja, maíz y camote.', 5, 'http://127.0.0.1:8000/img_menu/menu_3IZ8hw4Q8z.png', 1, '2023-09-25 10:26:53', '2023-09-25 19:41:15'),
(3, 1, 'Tiradito', 'Pescado crudo en láminas finas con salsa de limón, ají y ajo.', 6, 'http://127.0.0.1:8000/img_menu/menu_eh6PIYujGZ.png', 1, '2023-09-25 19:23:36', '2023-09-25 19:42:15'),
(4, 1, 'Anticuchos', 'Brochetas de carne de res con marinado de ají panca, asadas a la parrilla.', 7, 'http://127.0.0.1:8000/img_menu/menu_DCAZPffOr6.png', 1, '2023-09-25 19:32:40', '2023-09-25 19:43:02'),
(5, 1, 'Papa a la Huancaína', 'Papas en rodajas con salsa cremosa de ají amarillo y queso fresco.', 5, 'http://127.0.0.1:8000/img_menu/menu_ZgysJrMjL4.png', 1, '2023-09-25 19:33:13', '2023-09-25 19:43:36'),
(6, 1, 'Choros a la Chalaca', 'Mejillones con salsa fresca de cebolla, tomate, maíz y ají picante.', 3, 'http://127.0.0.1:8000/img_menu/menu_Z4oPBo7ojS.png', 1, '2023-09-25 19:33:37', '2023-09-25 19:44:28'),
(7, 3, 'Arroz con Mariscos', 'Arroz preparado con una mezcla de mariscos como camarones, calamares y mejillones, cocidos en un sabroso caldo de pescado y sazonado con ají amarillo.', 12, 'http://127.0.0.1:8000/img_menu/menu_kMKAx5qWPd.png', 1, '2023-09-25 19:35:01', '2023-09-25 19:45:33'),
(8, 3, 'Lomo Saltado', 'Trozos de carne de res salteados con cebolla, tomate y ají, servidos con papas fritas y arroz.', 10, 'http://127.0.0.1:8000/img_menu/menu_JijsZaZg3F.png', 1, '2023-09-25 19:35:59', '2023-09-25 19:46:15'),
(9, 3, 'Pollo a la Brasa', 'Pollo asado a la parrilla con una marinada especial de hierbas y especias, acompañado de papas fritas y ensalada.', 14, 'http://127.0.0.1:8000/img_menu/menu_0JaM8AIksk.png', 1, '2023-09-25 19:36:27', '2023-09-25 19:47:08'),
(10, 3, 'Adobo de Chancho', 'Trozos de cerdo adobados en una mezcla de ají panca, chicha de jora y vinagre, cocidos hasta que queden tiernos, acompañados de arroz y yuca.', 12, 'http://127.0.0.1:8000/img_menu/menu_9u1y0xsip0.png', 1, '2023-09-25 19:36:56', '2023-09-25 19:47:41'),
(11, 8, 'Chicha Morada', 'Bebida no alcohólica hecha a base de maíz morado, endulzada con azúcar y sazonada con especias. Es refrescante y tiene un sabor dulce y frutal.', 8, 'http://127.0.0.1:8000/img_menu/menu_lhRf1efIqn.png', 1, '2023-09-25 19:38:48', '2023-09-25 19:48:18'),
(12, 8, 'Inca Kola 1 Litro', 'Soda amarilla muy popular en Perú, conocida por su sabor dulce y único que recuerda al chicle de frutas. Es una bebida refrescante y emblemática del país.', 5, 'http://127.0.0.1:8000/img_menu/menu_b3vQBFNEYb.png', 1, '2023-09-25 19:39:19', '2023-09-25 22:21:33'),
(13, 8, 'Pisco Sour', 'Cóctel peruano elaborado con pisco (aguardiente de uva), jugo de limón, jarabe simple, clara de huevo y amargo de angostura.', 6, 'http://127.0.0.1:8000/img_menu/menu_N3gohwPyWI.png', 1, '2023-09-25 19:39:54', '2023-09-25 19:49:44'),
(14, 8, 'Cerveza Peruana', 'Perú cuenta con una variedad de cervezas locales que ofrecen diversos estilos, desde lagers refrescantes hasta cervezas artesanales con sabores únicos.', 8, 'http://127.0.0.1:8000/img_menu/menu_cqkvPAX0Pg.png', 1, '2023-09-25 19:40:21', '2023-09-25 19:51:43'),
(18, 15, 'Perferendis nihil qu', 'descripción', 8, 'http://127.0.0.1:8000/img_menu/menu_wMLy2z65kW.png', 1, '2024-06-20 17:06:47', '2024-06-20 17:06:47');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mesas`
--

CREATE TABLE `mesas` (
  `id` int(11) NOT NULL,
  `id_parent` int(11) NOT NULL DEFAULT 0,
  `id_area` int(11) NOT NULL,
  `numero_mesa` varchar(50) DEFAULT NULL,
  `capacidad` int(11) DEFAULT 0,
  `estado` int(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `mesas`
--

INSERT INTO `mesas` (`id`, `id_parent`, `id_area`, `numero_mesa`, `capacidad`, `estado`, `created_at`, `updated_at`) VALUES
(1, 0, 1, 'Fila 1', 4, 1, '2023-09-26 03:10:05', '2023-09-27 00:12:27'),
(2, 4, 1, '1', 4, 1, NULL, '2024-06-19 16:07:20'),
(3, 1, 1, '2', 4, 1, '2023-09-26 08:48:07', '2024-06-20 16:36:39'),
(4, 0, 1, 'fila 2', 0, 1, '2023-09-26 08:49:30', '2023-09-26 08:49:30'),
(5, 0, 1, 'fila 3', 0, 1, '2023-09-26 08:52:41', '2023-09-26 08:52:41'),
(6, 5, 1, '3', 3, 1, '2023-09-26 09:07:19', '2024-06-17 16:48:42'),
(8, 5, 1, '4', 4, 1, '2023-09-26 09:50:01', '2023-09-27 22:40:33'),
(10, 1, 1, '5', 6, 1, '2023-09-26 11:05:08', '2024-06-17 18:23:23'),
(11, 4, 1, '6', 4, 1, '2023-09-26 11:10:39', '2024-06-20 17:23:04'),
(12, 4, 1, '7', 3, 1, '2023-09-26 11:10:49', '2023-09-28 19:59:36'),
(13, 0, 2, 'Fila 1', 0, 1, '2023-09-26 22:59:35', '2024-06-20 16:21:10'),
(16, 1, 1, '8', 4, 1, '2023-09-26 23:28:29', '2024-06-20 17:11:34'),
(17, 5, 1, '9', 4, 1, '2023-09-26 23:28:36', '2023-09-29 20:33:30'),
(18, 4, 1, '10', 4, 1, '2023-09-26 23:30:50', '2024-06-17 16:49:09'),
(26, 0, 2, 'Fila 2', 0, 1, '2023-09-27 22:33:05', '2023-09-27 22:33:05'),
(27, 26, 2, '2222', 6, 1, '2023-09-27 22:33:22', '2023-09-27 22:37:07'),
(28, 13, 2, '3', 3, 1, '2023-09-27 22:33:48', '2024-06-20 16:55:54'),
(31, 26, 2, '4', 4, 1, '2024-06-20 16:18:43', '2024-06-20 17:20:52'),
(32, 0, 4, 'Fila 1', 0, 1, '2024-06-20 16:54:28', '2024-06-20 16:54:28'),
(33, 32, 4, '122', 6, 1, '2024-06-20 16:54:47', '2024-06-20 16:55:08'),
(34, 0, 4, 'FILA 2', 0, 1, '2024-06-20 16:55:34', '2024-06-20 16:55:34'),
(35, 32, 4, '123', 4, 1, '2024-06-20 17:10:31', '2024-06-20 17:11:15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_09_01_174421_create_sessions_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id` int(11) NOT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `id_mesa` int(11) DEFAULT NULL,
  `tipo_pago` varchar(100) DEFAULT NULL,
  `pago` decimal(18,2) DEFAULT NULL,
  `vuelto` decimal(18,2) DEFAULT NULL,
  `tipo_comprobante` varchar(100) DEFAULT NULL,
  `detalle` text DEFAULT NULL,
  `subtotal` decimal(18,2) NOT NULL DEFAULT 0.00,
  `igv` varchar(20) NOT NULL DEFAULT '0',
  `descuento` decimal(18,2) NOT NULL DEFAULT 0.00,
  `total` decimal(18,2) NOT NULL DEFAULT 0.00,
  `estado` varchar(50) NOT NULL DEFAULT 'Pendiente',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id`, `id_cliente`, `id_mesa`, `tipo_pago`, `pago`, `vuelto`, `tipo_comprobante`, `detalle`, `subtotal`, `igv`, `descuento`, `total`, `estado`, `created_at`, `updated_at`) VALUES
(1, NULL, 3, NULL, NULL, NULL, NULL, '[{\"id\":3,\"nombre\":\"Tiradito\",\"precio\":6,\"cantidad\":1,\"total\":6,\"comentario\":\"\"},{\"id\":4,\"nombre\":\"Anticuchos\",\"precio\":7,\"cantidad\":1,\"total\":7,\"comentario\":\"\"}]', 0.00, '0', 0.00, 0.00, 'finalizado', '2024-06-18 16:09:13', '2024-06-18 16:09:13'),
(2, 1, 2, 'Efectivo', 20.00, 4.00, 'Tiket', '[{\"id\":1,\"nombre\":\"Ceviche\",\"precio\":5,\"cantidad\":1,\"total\":5,\"comentario\":\"\"},{\"id\":3,\"nombre\":\"Tiradito\",\"precio\":6,\"cantidad\":1,\"total\":6,\"comentario\":\"\"},{\"id\":12,\"nombre\":\"Inca Kola 1 Litro\",\"precio\":5,\"cantidad\":1,\"total\":5,\"comentario\":\"\"}]', 16.00, '18', 0.00, 16.00, 'finalizado', '2024-06-18 16:11:36', '2024-06-18 19:38:30'),
(3, 1, 2, 'Efectivo', 50.00, 20.00, 'Tiket', '[{\"id\":4,\"nombre\":\"Anticuchos\",\"precio\":7,\"cantidad\":1,\"total\":7,\"comentario\":\"\"},{\"id\":6,\"nombre\":\"Choros a la Chalaca\",\"precio\":3,\"cantidad\":1,\"total\":3,\"comentario\":\"\"},{\"id\":7,\"nombre\":\"Arroz con Mariscos\",\"precio\":12,\"cantidad\":1,\"total\":12,\"comentario\":\"\"},{\"id\":14,\"nombre\":\"Cerveza Peruana\",\"precio\":8,\"cantidad\":1,\"total\":8,\"comentario\":\"\"}]', 30.00, '18', 0.00, 30.00, 'finalizado', '2024-06-18 20:48:25', '2024-06-19 16:07:20'),
(4, 1, 3, 'Efectivo', 21.00, 0.00, 'Tiket', '[{\"id\":3,\"nombre\":\"Tiradito\",\"precio\":6,\"cantidad\":1,\"total\":6,\"comentario\":\"\"},{\"id\":4,\"nombre\":\"Anticuchos\",\"precio\":7,\"cantidad\":1,\"total\":7,\"comentario\":\"dfgdg\"},{\"id\":11,\"nombre\":\"Chicha Morada\",\"precio\":8,\"cantidad\":1,\"total\":8,\"comentario\":\"\"}]', 21.00, '18', 0.00, 21.00, 'finalizado', '2024-06-18 20:49:11', '2024-06-18 21:03:39'),
(5, 1, 11, 'Efectivo', 50.00, 16.00, 'Tiket', '[{\"id\":3,\"nombre\":\"Tiradito\",\"precio\":6,\"cantidad\":\"2\",\"total\":12,\"comentario\":\"\"},{\"id\":4,\"nombre\":\"Anticuchos\",\"precio\":7,\"cantidad\":1,\"total\":7,\"comentario\":\"testese\"},{\"id\":5,\"nombre\":\"Papa a la Huancaína\",\"precio\":5,\"cantidad\":\"2\",\"total\":10,\"comentario\":\"\"},{\"id\":12,\"nombre\":\"Inca Kola 1 Litro\",\"precio\":5,\"cantidad\":1,\"total\":5,\"comentario\":\"\"}]', 34.00, '18', 0.00, 34.00, 'finalizado', '2024-06-19 20:05:22', '2024-06-19 20:05:46'),
(7, 1, 11, 'Efectivo', 34.00, 0.00, 'Tiket', '[{\"id\":1,\"nombre\":\"Ceviche\",\"precio\":5,\"cantidad\":\"2\",\"total\":10,\"comentario\":\"con poco picante\"},{\"id\":7,\"nombre\":\"Arroz con Mariscos\",\"precio\":12,\"cantidad\":1,\"total\":12,\"comentario\":\"\"},{\"id\":10,\"nombre\":\"Adobo de Chancho\",\"precio\":12,\"cantidad\":1,\"total\":12,\"comentario\":\"\"}]', 34.00, '18', 0.00, 34.00, 'finalizado', '2024-06-20 16:31:07', '2024-06-20 16:39:51'),
(8, 2, 31, 'Efectivo', 20.00, 3.00, 'Tiket', '[{\"id\":8,\"nombre\":\"Lomo Saltado\",\"precio\":10,\"cantidad\":1,\"total\":10,\"comentario\":\"descripción \"},{\"id\":11,\"nombre\":\"Chicha Morada\",\"precio\":8,\"cantidad\":1,\"total\":8,\"comentario\":\"\"}]', 18.00, '18', 1.00, 17.00, 'finalizado', '2024-06-20 17:15:01', '2024-06-20 17:20:52'),
(9, 1, 11, 'Tarjeta Visa', 58.00, 0.00, 'Tiket', '[{\"id\":3,\"nombre\":\"Tiradito\",\"precio\":6,\"cantidad\":\"2\",\"total\":12,\"comentario\":\"\"},{\"id\":4,\"nombre\":\"Anticuchos\",\"precio\":7,\"cantidad\":1,\"total\":7,\"comentario\":\"\"},{\"id\":8,\"nombre\":\"Lomo Saltado\",\"precio\":10,\"cantidad\":\"2\",\"total\":20,\"comentario\":\"\"},{\"id\":9,\"nombre\":\"Pollo a la Brasa\",\"precio\":14,\"cantidad\":1,\"total\":14,\"comentario\":\"\"},{\"id\":12,\"nombre\":\"Inca Kola 1 Litro\",\"precio\":5,\"cantidad\":1,\"total\":5,\"comentario\":\"agregar hielo....\"}]', 58.00, '18', 0.00, 58.00, 'finalizado', '2024-06-20 17:17:14', '2024-06-20 17:23:04');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservas`
--

CREATE TABLE `reservas` (
  `id` int(11) NOT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  `fecha_reserva` datetime DEFAULT NULL,
  `numero_personas` int(11) DEFAULT NULL,
  `mesa_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('2sSwnNklKxlTH060W8GDpdrwj7Dd3kybppoW3BAt', 2, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoidGlteXRPR01EMVltTm1BQUFNZUZtVWI5TTFLQUFQV1pPSnk5RGNwbCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9nZW5lcmFyb3JkZW4/Y29kZT1NdyUzRCUzRCI7fXM6MzoidXJsIjthOjA6e31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToyO30=', 1718923382);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(20) NOT NULL,
  `rol` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `two_factor_secret` text DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(2048) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `rol`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`) VALUES
(2, 'Admin', 'admin', 'admin@gmail.com', NULL, '$2y$10$sE/Li1Jv3yjPbOy1PSi7g.jRfTeedrkPtpBzXZsMmXNyATDQCxsdG', NULL, NULL, NULL, NULL, NULL, NULL, '2023-09-20 19:38:40', '2024-06-19 19:26:11'),
(3, 'Usuario', 'angela mendez', 'angela@gmail.com', NULL, '$2y$10$8XstnELhGxWT87sh.9YZb.Ri/ahLZwRuuO10dDZfrZCD18UmHNkQq', NULL, NULL, NULL, NULL, NULL, NULL, '2024-06-20 16:06:48', '2024-06-20 16:07:16');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `area_mesa`
--
ALTER TABLE `area_mesa`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categorias_menu`
--
ALTER TABLE `categorias_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `descuentos_promociones`
--
ALTER TABLE `descuentos_promociones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `facturas_ibfk_1` (`pedido_id`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `historial_actividades`
--
ALTER TABLE `historial_actividades`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indices de la tabla `historial_transacciones`
--
ALTER TABLE `historial_transacciones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ingredientes`
--
ALTER TABLE `ingredientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menus_ibfk_1` (`id_categ`);

--
-- Indices de la tabla `mesas`
--
ALTER TABLE `mesas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_area` (`id_area`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pedidos_ibfk_1` (`id_cliente`),
  ADD KEY `pedidos_ibfk_3` (`id_mesa`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cliente_id` (`cliente_id`),
  ADD KEY `mesa_id` (`mesa_id`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `area_mesa`
--
ALTER TABLE `area_mesa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `categorias_menu`
--
ALTER TABLE `categorias_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `descuentos_promociones`
--
ALTER TABLE `descuentos_promociones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `facturas`
--
ALTER TABLE `facturas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `historial_actividades`
--
ALTER TABLE `historial_actividades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `historial_transacciones`
--
ALTER TABLE `historial_transacciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ingredientes`
--
ALTER TABLE `ingredientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `mesas`
--
ALTER TABLE `mesas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `reservas`
--
ALTER TABLE `reservas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `historial_actividades`
--
ALTER TABLE `historial_actividades`
  ADD CONSTRAINT `historial_actividades_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `menus`
--
ALTER TABLE `menus`
  ADD CONSTRAINT `menus_ibfk_1` FOREIGN KEY (`id_categ`) REFERENCES `categorias_menu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `mesas`
--
ALTER TABLE `mesas`
  ADD CONSTRAINT `mesas_ibfk_1` FOREIGN KEY (`id_area`) REFERENCES `area_mesa` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pedidos_ibfk_3` FOREIGN KEY (`id_mesa`) REFERENCES `mesas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD CONSTRAINT `reservas_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  ADD CONSTRAINT `reservas_ibfk_2` FOREIGN KEY (`mesa_id`) REFERENCES `mesas` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
