-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3307
-- Tiempo de generación: 21-03-2025 a las 11:53:19
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
-- Base de datos: `warflex_2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `armas`
--

CREATE TABLE `armas` (
  `Id_armas` bigint(20) NOT NULL,
  `nom_arma` char(30) NOT NULL,
  `cant_balas` int(11) NOT NULL,
  `foto` varchar(50) NOT NULL,
  `Id_tipo_arma` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `armas`
--

INSERT INTO `armas` (`Id_armas`, `nom_arma`, `cant_balas`, `foto`, `Id_tipo_arma`) VALUES
(1, 'Puño', 0, 'mano.png', 1),
(2, 'Pistola Pesada', 13, 'pistola_pesada.png', 2),
(3, 'Pistola Doble', 15, 'pistola_doble.png', 2),
(4, 'Pistola Mecha', 14, 'pistola_mecha.png', 2),
(5, 'Francotirador Pesado', 15, 'franco_pesado.png', 3),
(6, 'Francotirador Storm Scout', 25, 'franco_storm_scout', 3),
(7, 'Francotirador Dragons Breath', 35, 'franco_dragons_breath', 3),
(8, 'Ametralladora Ligera', 33, 'ametralladora_ligera.png', 4),
(9, 'Ametralladora Minigun', 40, 'ametralladora_minigun', 4),
(10, 'Ametralladora Sideways', 50, 'ametralladora_sideways.png', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `avatar`
--

CREATE TABLE `avatar` (
  `Id_avatar` bigint(20) NOT NULL,
  `Nom_avatar` char(30) DEFAULT NULL,
  `Foto` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `avatar`
--

INSERT INTO `avatar` (`Id_avatar`, `Nom_avatar`, `Foto`) VALUES
(1, 'Peely', '../../img/avatares/peely.png'),
(2, 'Laguna', '../../img/avatares/laguna.png'),
(3, 'Raven', '../../img/avatares/raven.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_sala`
--

CREATE TABLE `detalle_sala` (
  `Id_detalle` bigint(20) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `id_sala` bigint(20) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadistica`
--

CREATE TABLE `estadistica` (
  `id_estadistica` int(11) NOT NULL,
  `id_sala` bigint(20) NOT NULL,
  `username` varchar(50) NOT NULL,
  `usu_victima` varchar(50) DEFAULT NULL,
  `daño` int(11) DEFAULT NULL,
  `Id_armas` bigint(20) DEFAULT NULL,
  `fecha_ini` datetime NOT NULL,
  `fecha_fin` datetime DEFAULT NULL,
  `parte_cuerpo` varchar(50) NOT NULL,
  `Id_estado` bigint(20) NOT NULL,
  `ganador` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estadistica`
--

INSERT INTO `estadistica` (`id_estadistica`, `id_sala`, `username`, `usu_victima`, `daño`, `Id_armas`, `fecha_ini`, `fecha_fin`, `parte_cuerpo`, `Id_estado`, `ganador`) VALUES
(76, 48, 'Hola', NULL, NULL, NULL, '2025-03-10 05:49:50', NULL, '', 8, 0),
(77, 48, 'Dani', NULL, NULL, NULL, '2025-03-10 05:49:50', NULL, '', 8, 0),
(78, 48, 'gaby', NULL, NULL, NULL, '2025-03-10 05:49:55', NULL, '', 8, 0),
(79, 49, 'Hola', NULL, NULL, NULL, '2025-03-10 06:00:56', NULL, '', 8, 0),
(80, 49, 'Dani', NULL, NULL, NULL, '2025-03-10 06:00:56', NULL, '', 8, 0),
(81, 49, 'gaby', NULL, NULL, NULL, '2025-03-10 06:01:00', NULL, '', 8, 0),
(82, 50, 'Dani', NULL, NULL, NULL, '2025-03-10 06:34:59', NULL, '', 8, 0),
(83, 51, 'Hola', NULL, NULL, NULL, '2025-03-10 06:36:00', NULL, '', 8, 0),
(84, 51, 'Dani', NULL, NULL, NULL, '2025-03-10 06:36:00', NULL, '', 8, 0),
(85, 52, 'Dani', NULL, NULL, NULL, '2025-03-10 06:37:02', NULL, '', 8, 0),
(86, 52, 'Hola', NULL, NULL, NULL, '2025-03-10 06:37:02', NULL, '', 8, 0),
(87, 53, 'Dani', NULL, NULL, NULL, '2025-03-10 06:42:18', NULL, '', 8, 0),
(88, 53, 'Hola', NULL, NULL, NULL, '2025-03-10 06:42:19', NULL, '', 8, 0),
(89, 54, 'Dani', NULL, NULL, NULL, '2025-03-10 06:48:13', NULL, '', 8, 0),
(90, 54, 'gaby', NULL, NULL, NULL, '2025-03-10 06:48:13', NULL, '', 8, 0),
(91, 55, 'Dani', NULL, NULL, NULL, '2025-03-10 06:53:05', NULL, '', 8, 0),
(92, 55, 'Hola', NULL, NULL, NULL, '2025-03-10 06:53:05', NULL, '', 8, 0),
(93, 55, 'gaby', NULL, NULL, NULL, '2025-03-10 06:53:05', NULL, '', 8, 0),
(94, 56, 'gaby', NULL, NULL, NULL, '2025-03-10 07:07:05', NULL, '', 8, 0),
(95, 56, 'Hola', NULL, NULL, NULL, '2025-03-10 07:07:05', NULL, '', 8, 0),
(96, 56, 'Dani', NULL, NULL, NULL, '2025-03-10 07:07:05', NULL, '', 8, 0),
(97, 57, 'Hola', NULL, NULL, NULL, '2025-03-10 07:30:51', NULL, '', 8, 0),
(98, 57, 'Dani', NULL, NULL, NULL, '2025-03-10 07:30:51', NULL, '', 8, 0),
(99, 57, 'gaby', NULL, NULL, NULL, '2025-03-10 07:30:51', NULL, '', 8, 0),
(100, 58, 'Hola', NULL, NULL, NULL, '2025-03-10 07:37:00', NULL, '', 8, 0),
(101, 58, 'gaby', NULL, NULL, NULL, '2025-03-10 07:37:00', NULL, '', 8, 0),
(102, 58, 'Dani', NULL, NULL, NULL, '2025-03-10 07:37:00', NULL, '', 8, 0),
(103, 58, 'Hola', 'gaby', 75, 2, '0000-00-00 00:00:00', NULL, 'cabeza', 8, 0),
(104, 59, 'Hola', NULL, NULL, NULL, '2025-03-10 07:49:32', NULL, '', 8, 0),
(105, 59, 'Dani', NULL, NULL, NULL, '2025-03-10 07:49:32', NULL, '', 8, 0),
(106, 59, 'gaby', NULL, NULL, NULL, '2025-03-10 07:49:32', NULL, '', 8, 0),
(107, 59, 'Hola', 'Dani', 2, 3, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(108, 60, 'Dani', NULL, NULL, NULL, '2025-03-10 08:03:52', NULL, '', 8, 0),
(109, 60, 'Hola', NULL, NULL, NULL, '2025-03-10 08:03:52', NULL, '', 8, 0),
(110, 60, 'gaby', NULL, NULL, NULL, '2025-03-10 08:03:52', NULL, '', 8, 0),
(111, 60, 'gaby', 'Hola', 75, 2, '0000-00-00 00:00:00', NULL, 'cabeza', 8, 0),
(112, 60, 'Dani', 'Hola', 2, 4, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(113, 60, 'Dani', 'Hola', 2, 4, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(114, 60, 'Dani', 'Hola', 2, 4, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(115, 60, 'Dani', 'Hola', 2, 4, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(116, 60, 'Dani', 'Hola', 2, 4, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(117, 60, 'Dani', 'Hola', 2, 4, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(118, 60, 'Dani', 'Hola', 2, 4, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(119, 60, 'Dani', 'Hola', 2, 4, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(120, 60, 'Dani', 'Hola', 2, 4, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(121, 60, 'Dani', 'Hola', 2, 4, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(122, 60, 'Dani', 'Hola', 2, 4, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(123, 60, 'Dani', 'Hola', 2, 4, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(124, 60, 'Dani', 'Hola', 2, 4, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(125, 60, 'Dani', 'Hola', 2, 4, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(126, 60, 'Dani', 'Hola', 2, 4, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(127, 60, 'Dani', 'Hola', 2, 4, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(128, 60, 'Dani', 'Hola', 2, 4, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(129, 60, 'Dani', 'Hola', 2, 4, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(130, 60, 'Dani', 'Hola', 2, 4, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(131, 60, 'Dani', 'Hola', 2, 4, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(132, 60, 'Dani', 'Hola', 2, 4, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(133, 60, 'Dani', 'Hola', 2, 4, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(134, 60, 'Dani', 'Hola', 2, 4, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(135, 60, 'Dani', 'Hola', 2, 4, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(136, 60, 'Dani', 'Hola', 2, 4, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(137, 60, 'Dani', 'Hola', 2, 4, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(138, 60, 'Dani', 'Hola', 2, 4, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(139, 60, 'Dani', 'Hola', 2, 4, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(140, 60, 'Dani', 'Hola', 2, 4, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(141, 60, 'Dani', 'Hola', 2, 4, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(142, 60, 'Dani', 'Hola', 2, 4, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(143, 60, 'Dani', 'Hola', 2, 4, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(144, 60, 'Dani', 'Hola', 2, 4, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(145, 60, 'Dani', 'Hola', 2, 4, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(146, 60, 'Dani', 'Hola', 2, 4, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(147, 60, 'Dani', 'Hola', 2, 4, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(148, 60, 'Dani', 'Hola', 2, 4, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(149, 60, 'Dani', 'Hola', 2, 4, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(150, 60, 'Dani', 'Hola', 2, 4, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(151, 60, 'Dani', 'Hola', 2, 4, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(152, 60, 'Dani', 'Hola', 2, 4, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(153, 60, 'Dani', 'Hola', 2, 4, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(154, 60, 'Dani', 'Hola', 2, 4, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(155, 60, 'Dani', 'Hola', 2, 4, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(156, 60, 'Dani', 'Hola', 2, 4, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(157, 60, 'Dani', 'Hola', 2, 4, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(158, 60, 'Dani', 'Hola', 2, 4, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(159, 60, 'gaby', 'Hola', 75, 2, '0000-00-00 00:00:00', NULL, 'cabeza', 8, 0),
(160, 60, 'Dani', 'Hola', 2, 4, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(161, 60, 'Dani', 'Hola', 2, 4, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(162, 60, 'Dani', 'Hola', 2, 4, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(163, 60, 'Dani', 'Hola', 2, 4, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(164, 60, 'Dani', 'Hola', 2, 4, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(165, 60, 'Dani', 'Hola', 2, 4, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(166, 60, 'gaby', 'Hola', 75, 2, '0000-00-00 00:00:00', NULL, 'cabeza', 8, 0),
(167, 60, 'Dani', 'Hola', 2, 4, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(168, 60, 'Dani', 'Hola', 2, 4, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(169, 60, 'Dani', 'Hola', 2, 4, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(170, 60, 'Dani', 'Hola', 2, 4, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(171, 60, 'gaby', 'Hola', 75, 2, '0000-00-00 00:00:00', NULL, 'cabeza', 8, 0),
(172, 60, 'Dani', 'Hola', 2, 4, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(173, 60, 'Dani', 'Hola', 2, 4, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(174, 60, 'Dani', 'Hola', 2, 4, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(175, 60, 'Dani', 'Hola', 2, 4, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(176, 60, 'Dani', 'Hola', 2, 4, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(177, 60, 'Dani', 'Hola', 2, 4, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(178, 60, 'Dani', 'Hola', 2, 4, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(179, 60, 'Dani', 'Hola', 2, 4, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(180, 60, 'Dani', 'Hola', 2, 4, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(181, 60, 'Dani', 'Hola', 2, 4, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(182, 60, 'Dani', 'Hola', 2, 4, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(183, 60, 'Dani', 'Hola', 2, 4, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(184, 60, 'Dani', 'Hola', 2, 4, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(185, 60, 'Dani', 'Hola', 2, 4, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(186, 60, 'Dani', 'Hola', 2, 4, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(187, 61, 'Hola', NULL, NULL, NULL, '2025-03-10 08:09:22', NULL, '', 8, 0),
(188, 61, 'Dani', NULL, NULL, NULL, '2025-03-10 08:09:22', NULL, '', 8, 0),
(189, 61, 'gaby', NULL, NULL, NULL, '2025-03-10 08:09:23', NULL, '', 8, 0),
(190, 61, 'Dani', 'gaby', 75, 3, '0000-00-00 00:00:00', NULL, 'cabeza', 8, 0),
(191, 61, 'Hola', 'gaby', 2, 2, '0000-00-00 00:00:00', NULL, 'piernas', 8, 0),
(192, 61, 'Hola', 'gaby', 2, 2, '0000-00-00 00:00:00', NULL, 'piernas', 8, 0),
(193, 61, 'Hola', 'gaby', 2, 2, '0000-00-00 00:00:00', NULL, 'piernas', 8, 0),
(194, 61, 'Hola', 'gaby', 2, 2, '0000-00-00 00:00:00', NULL, 'piernas', 8, 0),
(195, 61, 'Hola', 'gaby', 2, 2, '0000-00-00 00:00:00', NULL, 'piernas', 8, 0),
(196, 61, 'Dani', 'gaby', 75, 3, '0000-00-00 00:00:00', NULL, 'cabeza', 8, 0),
(197, 61, 'Hola', 'gaby', 2, 2, '0000-00-00 00:00:00', NULL, 'piernas', 8, 0),
(198, 61, 'Dani', 'gaby', 75, 3, '0000-00-00 00:00:00', NULL, 'cabeza', 8, 0),
(199, 61, 'Dani', 'gaby', 75, 3, '0000-00-00 00:00:00', NULL, 'cabeza', 8, 0),
(200, 62, 'gaby', NULL, NULL, NULL, '2025-03-10 08:28:53', NULL, '', 8, 0),
(201, 62, 'Dani', NULL, NULL, NULL, '2025-03-10 08:28:53', NULL, '', 8, 0),
(202, 62, 'gaby', 'Hola', 75, 3, '0000-00-00 00:00:00', NULL, 'cabeza', 8, 0),
(203, 62, 'gaby', 'Hola', 75, 3, '0000-00-00 00:00:00', NULL, 'cabeza', 8, 0),
(204, 62, 'gaby', 'Dani', 75, 3, '0000-00-00 00:00:00', NULL, 'cabeza', 8, 0),
(205, 62, 'gaby', 'Dani', 75, 3, '0000-00-00 00:00:00', NULL, 'cabeza', 8, 0),
(206, 62, 'gaby', 'Dani', 75, 3, '0000-00-00 00:00:00', NULL, 'cabeza', 8, 0),
(207, 62, 'gaby', 'Hola', 75, 3, '0000-00-00 00:00:00', NULL, 'cabeza', 8, 0),
(208, 63, 'Dani', NULL, NULL, NULL, '2025-03-10 08:38:30', NULL, '', 8, 0),
(209, 63, 'Hola', NULL, NULL, NULL, '2025-03-10 08:38:30', NULL, '', 8, 0),
(210, 63, 'gaby', NULL, NULL, NULL, '2025-03-10 08:38:30', NULL, '', 8, 0),
(211, 64, 'gaby', NULL, NULL, NULL, '2025-03-10 08:40:21', NULL, '', 8, 0),
(212, 64, 'gaby', 'Hola', 75, 3, '0000-00-00 00:00:00', NULL, 'cabeza', 8, 0),
(213, 64, 'gaby', 'Hola', 75, 3, '0000-00-00 00:00:00', NULL, 'cabeza', 8, 0),
(214, 64, 'gaby', 'Hola', 75, 3, '0000-00-00 00:00:00', NULL, 'cabeza', 8, 0),
(215, 64, 'gaby', 'Hola', 75, 3, '0000-00-00 00:00:00', NULL, 'cabeza', 8, 0),
(216, 65, 'gaby', NULL, NULL, NULL, '2025-03-10 08:41:35', NULL, '', 8, 0),
(217, 65, 'Hola', NULL, NULL, NULL, '2025-03-10 08:41:35', NULL, '', 8, 0),
(218, 65, 'Dani', NULL, NULL, NULL, '2025-03-10 08:41:35', NULL, '', 8, 0),
(219, 65, 'gaby', 'Dani', 75, 6, '0000-00-00 00:00:00', NULL, 'cabeza', 8, 0),
(220, 65, 'gaby', 'Dani', 75, 6, '0000-00-00 00:00:00', NULL, 'cabeza', 8, 0),
(221, 66, 'Hola', NULL, NULL, NULL, '2025-03-10 08:53:52', NULL, '', 8, 0),
(222, 66, 'Dani', NULL, NULL, NULL, '2025-03-10 08:53:52', NULL, '', 8, 0),
(223, 66, 'gaby', NULL, NULL, NULL, '2025-03-10 08:53:52', NULL, '', 8, 0),
(224, 66, 'Hola', 'gaby', 75, 4, '0000-00-00 00:00:00', NULL, 'cabeza', 8, 0),
(225, 66, 'Hola', 'gaby', 75, 4, '0000-00-00 00:00:00', NULL, 'cabeza', 8, 0),
(226, 66, 'Hola', 'gaby', 75, 4, '0000-00-00 00:00:00', NULL, 'cabeza', 8, 0),
(227, 66, 'Hola', 'gaby', 75, 4, '0000-00-00 00:00:00', NULL, 'cabeza', 8, 0),
(228, 66, 'Hola', 'gaby', 75, 1, '0000-00-00 00:00:00', NULL, 'cabeza', 8, 0),
(229, 67, 'gaby123', NULL, NULL, NULL, '2025-03-10 10:08:31', NULL, '', 8, 0),
(230, 67, 'Hola', NULL, NULL, NULL, '2025-03-10 10:08:31', NULL, '', 8, 0),
(231, 71, 'Dani', NULL, NULL, NULL, '2025-03-10 10:11:15', NULL, '', 8, 0),
(232, 71, 'gaby123', NULL, NULL, NULL, '2025-03-10 10:11:15', NULL, '', 8, 0),
(233, 71, 'Dani', 'gaby123', 75, 2, '0000-00-00 00:00:00', NULL, 'cabeza', 8, 0),
(234, 71, 'Dani', 'gaby123', 75, 2, '0000-00-00 00:00:00', NULL, 'cabeza', 8, 0),
(235, 71, 'Dani', 'gaby123', 75, 2, '0000-00-00 00:00:00', NULL, 'cabeza', 8, 0),
(236, 71, 'Dani', 'gaby123', 75, 2, '0000-00-00 00:00:00', NULL, 'cabeza', 8, 0),
(237, 71, 'Dani', 'Hola', 75, 2, '0000-00-00 00:00:00', NULL, 'cabeza', 8, 0),
(238, 71, 'Dani', 'Hola', 2, 2, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(239, 71, 'Dani', 'Hola', 2, 2, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(240, 71, 'Dani', 'Hola', 2, 2, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(241, 71, 'Dani', 'Hola', 2, 2, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(242, 71, 'Dani', 'Hola', 2, 2, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(243, 71, 'Dani', 'Hola', 2, 2, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(244, 71, 'Dani', 'Hola', 2, 2, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(245, 71, 'Dani', 'Hola', 2, 2, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(246, 71, 'Dani', 'Hola', 2, 2, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(247, 71, 'Dani', 'Hola', 2, 2, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(248, 71, 'Dani', 'Hola', 2, 2, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(249, 71, 'Dani', 'Hola', 2, 2, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(250, 71, 'Dani', 'Hola', 2, 2, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(251, 72, 'Hola', NULL, NULL, NULL, '2025-03-10 10:26:28', NULL, '', 8, 0),
(252, 72, 'Dani', NULL, NULL, NULL, '2025-03-10 10:26:28', NULL, '', 8, 0),
(253, 73, 'Hola', NULL, NULL, NULL, '2025-03-10 10:36:08', NULL, '', 8, 0),
(254, 73, 'gaby123', NULL, NULL, NULL, '2025-03-10 10:36:08', NULL, '', 8, 0),
(255, 68, 'Dani', NULL, NULL, NULL, '2025-03-10 10:47:16', NULL, '', 8, 0),
(256, 68, 'gaby123', NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, '', 8, 0),
(257, 68, 'Hola', NULL, NULL, NULL, '2025-03-10 10:47:16', NULL, '', 8, 0),
(258, 68, 'Hola', 'Dani', 2, 2, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(259, 68, 'Hola', 'Dani', 2, 2, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(260, 68, 'Hola', 'Dani', 2, 2, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(261, 68, 'Dani', 'Hola', 75, 9, '0000-00-00 00:00:00', NULL, 'cabeza', 8, 0),
(262, 68, 'gaby123', 'Dani', 75, 3, '0000-00-00 00:00:00', NULL, 'cabeza', 8, 0),
(263, 68, 'Hola', 'Dani', 2, 2, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(264, 68, 'Hola', 'Dani', 2, 2, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(265, 68, 'Hola', 'Dani', 2, 2, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(266, 68, 'Hola', 'Dani', 2, 2, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(267, 68, 'Hola', 'Dani', 2, 2, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(268, 68, 'Hola', 'Dani', 2, 2, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(269, 68, 'Hola', 'Dani', 2, 2, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(270, 68, 'Hola', 'Dani', 2, 2, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(271, 68, 'Hola', 'Dani', 2, 2, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(272, 68, 'Hola', 'Dani', 2, 2, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(273, 68, 'Hola', 'Dani', 2, 2, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(274, 68, 'Hola', 'gaby123', 2, 2, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(275, 68, 'Hola', 'gaby123', 2, 2, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(276, 68, 'Hola', 'gaby123', 2, 2, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(277, 68, 'Hola', 'gaby123', 2, 2, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(278, 68, 'Hola', 'gaby123', 2, 2, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(279, 68, 'Hola', 'gaby123', 2, 2, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(280, 68, 'Hola', 'gaby123', 2, 2, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(281, 68, 'Hola', 'gaby123', 2, 2, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(282, 68, 'Hola', 'gaby123', 2, 2, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(283, 68, 'Hola', 'gaby123', 2, 2, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(284, 68, 'Hola', 'gaby123', 2, 2, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(285, 68, 'Hola', 'gaby123', 2, 2, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(286, 68, 'Hola', 'gaby123', 2, 2, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(287, 68, 'Hola', 'gaby123', 2, 2, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(288, 68, 'Hola', 'gaby123', 2, 2, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(289, 68, 'Hola', 'gaby123', 2, 2, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(290, 68, 'Hola', 'gaby123', 2, 2, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(291, 68, 'Hola', 'gaby123', 2, 2, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(292, 68, 'Hola', 'gaby123', 2, 2, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(293, 68, 'Hola', 'gaby123', 2, 2, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(294, 68, 'Hola', 'gaby123', 2, 2, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(295, 68, 'Hola', 'gaby123', 2, 2, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(296, 68, 'Hola', 'gaby123', 2, 2, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(297, 68, 'Hola', 'gaby123', 2, 2, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(298, 68, 'Hola', 'gaby123', 2, 2, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(299, 68, 'Hola', 'gaby123', 2, 2, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(300, 68, 'Hola', 'gaby123', 2, 2, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(301, 68, 'Hola', 'gaby123', 2, 2, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(302, 68, 'Hola', 'gaby123', 2, 2, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(303, 68, 'Hola', 'gaby123', 2, 2, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(304, 68, 'Hola', 'gaby123', 2, 2, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(305, 68, 'Hola', 'gaby123', 2, 2, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(306, 68, 'Hola', 'gaby123', 2, 2, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(307, 68, 'Hola', 'gaby123', 2, 2, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(308, 68, 'Hola', 'gaby123', 2, 2, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(309, 68, 'Hola', 'gaby123', 2, 2, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(310, 68, 'Hola', 'gaby123', 2, 2, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(311, 68, 'Hola', 'gaby123', 2, 2, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(312, 68, 'Hola', 'gaby123', 2, 2, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(313, 68, 'Hola', 'gaby123', 2, 2, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(314, 68, 'Hola', 'gaby123', 2, 2, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(315, 68, 'Hola', 'gaby123', 2, 2, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(316, 68, 'Hola', 'gaby123', 2, 2, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(317, 68, 'Hola', 'gaby123', 2, 2, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(318, 68, 'Hola', 'gaby123', 2, 2, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(319, 68, 'Hola', 'gaby123', 2, 2, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(320, 68, 'Hola', 'gaby123', 2, 2, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(321, 68, 'Hola', 'gaby123', 2, 2, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(322, 68, 'Hola', 'gaby123', 2, 2, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(323, 68, 'Hola', 'gaby123', 2, 2, '0000-00-00 00:00:00', NULL, 'brazos', 8, 0),
(324, 74, 'Dani', NULL, NULL, NULL, '2025-03-10 11:01:23', NULL, '', 8, 0),
(325, 74, 'Hola', NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, '', 8, 0),
(326, 74, 'Dani', 'Hola', 2, 3, '0000-00-00 00:00:00', NULL, 'piernas', 8, 0),
(327, 74, 'Dani', 'Hola', 2, 3, '0000-00-00 00:00:00', NULL, 'piernas', 8, 0),
(328, 74, 'Dani', 'Hola', 2, 3, '0000-00-00 00:00:00', NULL, 'piernas', 8, 0),
(329, 74, 'Dani', 'Hola', 2, 3, '0000-00-00 00:00:00', NULL, 'piernas', 8, 0),
(330, 74, 'Dani', 'Hola', 2, 3, '0000-00-00 00:00:00', NULL, 'piernas', 8, 0),
(331, 74, 'Dani', 'Hola', 2, 3, '0000-00-00 00:00:00', NULL, 'piernas', 8, 0),
(332, 74, 'Dani', 'Hola', 2, 3, '0000-00-00 00:00:00', NULL, 'piernas', 8, 0),
(333, 74, 'Dani', 'Hola', 2, 3, '0000-00-00 00:00:00', NULL, 'piernas', 8, 0),
(334, 74, 'Dani', 'Hola', 2, 3, '0000-00-00 00:00:00', NULL, 'piernas', 8, 0),
(335, 74, 'Dani', 'Hola', 2, 3, '0000-00-00 00:00:00', NULL, 'piernas', 8, 0),
(336, 74, 'Dani', 'Hola', 2, 3, '0000-00-00 00:00:00', NULL, 'piernas', 8, 0),
(337, 74, 'Dani', 'Hola', 2, 3, '0000-00-00 00:00:00', NULL, 'piernas', 8, 0),
(338, 74, 'Dani', 'Hola', 2, 3, '0000-00-00 00:00:00', NULL, 'piernas', 8, 0),
(339, 74, 'Dani', 'Hola', 2, 3, '0000-00-00 00:00:00', NULL, 'piernas', 8, 0),
(340, 74, 'Dani', 'Hola', 2, 3, '0000-00-00 00:00:00', NULL, 'piernas', 8, 0),
(341, 74, 'Dani', 'Hola', 2, 3, '0000-00-00 00:00:00', NULL, 'piernas', 8, 0),
(342, 74, 'Dani', 'Hola', 2, 3, '0000-00-00 00:00:00', NULL, 'piernas', 8, 0),
(343, 74, 'Dani', 'Hola', 2, 3, '0000-00-00 00:00:00', NULL, 'piernas', 8, 0),
(344, 74, 'Dani', 'Hola', 2, 3, '0000-00-00 00:00:00', NULL, 'piernas', 8, 0),
(345, 74, 'Dani', 'Hola', 2, 3, '0000-00-00 00:00:00', NULL, 'piernas', 8, 0),
(346, 74, 'Dani', 'Hola', 2, 3, '0000-00-00 00:00:00', NULL, 'piernas', 8, 0),
(347, 74, 'Dani', 'Hola', 2, 3, '0000-00-00 00:00:00', NULL, 'piernas', 8, 0),
(348, 74, 'Dani', 'Hola', 2, 3, '0000-00-00 00:00:00', NULL, 'piernas', 8, 0),
(349, 74, 'Dani', 'Hola', 2, 3, '0000-00-00 00:00:00', NULL, 'piernas', 8, 0),
(350, 74, 'Dani', 'Hola', 2, 3, '0000-00-00 00:00:00', NULL, 'piernas', 8, 0),
(351, 74, 'Dani', 'Hola', 2, 3, '0000-00-00 00:00:00', NULL, 'piernas', 8, 0),
(352, 74, 'Dani', 'Hola', 2, 3, '0000-00-00 00:00:00', NULL, 'piernas', 8, 0),
(353, 74, 'Dani', 'Hola', 2, 3, '0000-00-00 00:00:00', NULL, 'piernas', 8, 0),
(354, 74, 'Dani', 'Hola', 2, 3, '0000-00-00 00:00:00', NULL, 'piernas', 8, 0),
(355, 74, 'Dani', 'Hola', 2, 3, '0000-00-00 00:00:00', NULL, 'piernas', 8, 0),
(356, 74, 'Dani', 'Hola', 2, 3, '0000-00-00 00:00:00', NULL, 'piernas', 8, 0),
(357, 74, 'Dani', 'Hola', 2, 3, '0000-00-00 00:00:00', NULL, 'piernas', 8, 0),
(358, 74, 'Dani', 'Hola', 2, 3, '0000-00-00 00:00:00', NULL, 'piernas', 8, 0),
(359, 74, 'Dani', 'Hola', 2, 3, '0000-00-00 00:00:00', NULL, 'piernas', 8, 0),
(360, 74, 'Dani', 'Hola', 2, 3, '0000-00-00 00:00:00', NULL, 'piernas', 8, 0),
(361, 74, 'Dani', 'Hola', 2, 3, '0000-00-00 00:00:00', NULL, 'piernas', 8, 0),
(362, 74, 'Dani', 'Hola', 2, 3, '0000-00-00 00:00:00', NULL, 'piernas', 8, 0),
(363, 74, 'Dani', 'Hola', 2, 3, '0000-00-00 00:00:00', NULL, 'piernas', 8, 0),
(364, 74, 'Dani', 'Hola', 2, 3, '0000-00-00 00:00:00', NULL, 'piernas', 8, 0),
(365, 74, 'Dani', 'Hola', 2, 3, '0000-00-00 00:00:00', NULL, 'piernas', 8, 0),
(366, 74, 'Dani', 'Hola', 2, 3, '0000-00-00 00:00:00', NULL, 'piernas', 8, 0),
(367, 74, 'Dani', 'Hola', 2, 3, '0000-00-00 00:00:00', NULL, 'piernas', 8, 0),
(368, 74, 'Dani', 'Hola', 2, 3, '0000-00-00 00:00:00', NULL, 'piernas', 8, 0),
(369, 74, 'Dani', 'Hola', 2, 3, '0000-00-00 00:00:00', NULL, 'piernas', 8, 0),
(370, 74, 'Dani', 'Hola', 2, 3, '0000-00-00 00:00:00', NULL, 'piernas', 8, 0),
(371, 74, 'Dani', 'Hola', 2, 3, '0000-00-00 00:00:00', NULL, 'piernas', 8, 0),
(372, 74, 'Dani', 'Hola', 2, 3, '0000-00-00 00:00:00', NULL, 'piernas', 8, 0),
(373, 74, 'Dani', 'Hola', 2, 3, '0000-00-00 00:00:00', NULL, 'piernas', 8, 0),
(374, 74, 'Dani', 'Hola', 2, 3, '0000-00-00 00:00:00', NULL, 'piernas', 8, 0),
(375, 74, 'Dani', 'Hola', 2, 3, '0000-00-00 00:00:00', NULL, 'piernas', 8, 0),
(376, 69, 'gaby', NULL, NULL, NULL, '2025-03-20 14:22:58', NULL, '', 8, 0),
(377, 46, 'gaby123', NULL, NULL, NULL, '2025-03-21 00:40:59', NULL, '', 8, 0),
(378, 46, 'gaby', NULL, NULL, NULL, '2025-03-21 00:40:59', NULL, '', 8, 0),
(380, 47, 'gaby', NULL, NULL, NULL, '2025-03-21 00:42:46', NULL, '', 8, 0),
(388, 70, 'gaby123', NULL, NULL, NULL, '2025-03-21 03:27:36', NULL, '', 8, 0),
(389, 70, 'gaby', NULL, NULL, NULL, '2025-03-21 03:27:36', NULL, '', 8, 0),
(391, 77, 'gaby123', NULL, NULL, NULL, '2025-03-21 04:59:59', NULL, '', 8, 0),
(392, 77, 'gaby', NULL, NULL, NULL, '2025-03-21 04:59:59', NULL, '', 8, 0),
(395, 84, 'gaby', NULL, NULL, NULL, '2025-03-21 05:39:45', NULL, '', 8, 0),
(396, 84, 'gaby123', NULL, NULL, NULL, '2025-03-21 05:39:45', NULL, '', 8, 0),
(398, 84, 'gaby', 'gaby123', 20, 6, '0000-00-00 00:00:00', NULL, 'torso', 8, 0),
(399, 84, 'gaby', 'gaby123', 20, 6, '0000-00-00 00:00:00', NULL, 'torso', 8, 0),
(400, 84, 'gaby', 'gaby123', 20, 6, '0000-00-00 00:00:00', NULL, 'torso', 8, 0),
(401, 84, 'gaby123', 'gaby', 20, 6, '0000-00-00 00:00:00', NULL, 'piernas', 8, 0),
(402, 84, 'gaby123', 'gaby', 20, 6, '0000-00-00 00:00:00', NULL, 'piernas', 8, 0),
(403, 84, 'gaby123', 'gaby', 20, 6, '0000-00-00 00:00:00', NULL, 'piernas', 8, 0),
(404, 84, 'gaby123', 'gaby', 20, 6, '0000-00-00 00:00:00', NULL, 'piernas', 8, 0),
(405, 84, 'gaby123', 'gaby', 20, 6, '0000-00-00 00:00:00', NULL, 'piernas', 8, 0),
(406, 84, 'gaby123', 'gaby', 20, 6, '0000-00-00 00:00:00', NULL, 'piernas', 8, 0),
(407, 89, 'gaby123', NULL, NULL, NULL, '2025-03-21 08:13:33', NULL, '', 8, NULL),
(408, 89, 'gaby', NULL, NULL, NULL, '2025-03-21 08:13:33', NULL, '', 8, NULL),
(410, 89, 'gaby', 'gaby123', 20, 6, '2025-03-21 08:13:51', '2025-03-21 08:13:51', 'torso', 8, NULL),
(411, 89, 'gaby', 'gaby123', 20, 6, '2025-03-21 08:13:53', '2025-03-21 08:13:53', 'torso', 8, NULL),
(412, 89, 'gaby', 'gaby123', 20, 6, '2025-03-21 08:13:55', '2025-03-21 08:13:55', 'torso', 8, NULL),
(413, 89, 'gaby', 'gaby123', 20, 6, '2025-03-21 08:13:57', '2025-03-21 08:13:57', 'torso', 8, NULL),
(414, 89, 'gaby', 'gaby123', 20, 6, '2025-03-21 08:13:59', '2025-03-21 08:13:59', 'torso', 8, NULL),
(415, 89, 'gaby123', 'gaby', 20, 6, '2025-03-21 08:15:40', '2025-03-21 08:15:40', 'piernas', 8, NULL),
(416, 90, 'gaby123', NULL, NULL, NULL, '2025-03-21 08:28:43', NULL, '', 8, NULL),
(417, 90, 'gaby', NULL, NULL, NULL, '2025-03-21 08:28:43', NULL, '', 8, NULL),
(419, 90, 'gaby123', 'gaby', 75, 6, '2025-03-21 08:29:05', '2025-03-21 08:29:05', 'cabeza', 8, NULL),
(420, 90, 'gaby123', 'gaby', 75, 6, '2025-03-21 08:29:07', '2025-03-21 08:29:07', 'cabeza', 8, NULL),
(421, 91, 'gaby', NULL, NULL, NULL, '2025-03-21 08:37:36', NULL, '', 8, NULL),
(422, 91, 'gaby123', NULL, NULL, NULL, '2025-03-21 08:37:36', NULL, '', 8, NULL),
(430, 92, 'gaby123', NULL, NULL, NULL, '2025-03-21 09:06:14', NULL, '', 8, NULL),
(431, 92, 'gaby', NULL, NULL, NULL, '2025-03-21 09:06:14', NULL, '', 8, NULL),
(435, 93, 'gaby123', NULL, NULL, NULL, '2025-03-21 09:19:34', NULL, '', 8, NULL),
(436, 93, 'gaby', NULL, NULL, NULL, '2025-03-21 09:19:34', NULL, '', 8, NULL),
(438, 95, 'gaby123', NULL, NULL, NULL, '2025-03-21 11:45:20', NULL, '', 8, NULL),
(439, 95, 'gaby', NULL, NULL, NULL, '2025-03-21 11:45:20', NULL, '', 8, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `Id_estado` bigint(20) NOT NULL,
  `Nom_estado` char(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`Id_estado`, `Nom_estado`) VALUES
(1, 'Activo'),
(2, 'Inactivo'),
(3, 'Ocupada'),
(4, 'Libre'),
(5, 'Bloqueado'),
(6, 'Finalizada'),
(7, 'Vivo'),
(8, 'Muerto');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_sesion`
--

CREATE TABLE `historial_sesion` (
  `Id_historial` bigint(20) NOT NULL,
  `fech_sesion` datetime DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `id_estado` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mundo`
--

CREATE TABLE `mundo` (
  `Id_mundo` bigint(20) NOT NULL,
  `Nom_mundo` char(30) DEFAULT NULL,
  `Foto` varchar(50) DEFAULT NULL,
  `nivel` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `mundo`
--

INSERT INTO `mundo` (`Id_mundo`, `Nom_mundo`, `Foto`, `nivel`) VALUES
(1, 'Athenea', 'athenea.png', 1),
(2, 'Helios', 'helios.png', 2),
(3, 'Artemis', 'artemis.png', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `niveles`
--

CREATE TABLE `niveles` (
  `Id_nivel` bigint(20) NOT NULL,
  `nom_nivel` char(30) DEFAULT NULL,
  `Puntos` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `niveles`
--

INSERT INTO `niveles` (`Id_nivel`, `nom_nivel`, `Puntos`) VALUES
(1, 'Nivel 1', 0),
(2, 'Nivel 2', 500);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `Id_rol` bigint(20) NOT NULL,
  `Nom_rol` char(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`Id_rol`, `Nom_rol`) VALUES
(1, 'Usuario'),
(2, 'Administrador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sala`
--

CREATE TABLE `sala` (
  `Id_sala` bigint(20) NOT NULL,
  `Id_mundo` bigint(20) DEFAULT NULL,
  `Id_estado` bigint(20) NOT NULL,
  `inicio_contador` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `sala`
--

INSERT INTO `sala` (`Id_sala`, `Id_mundo`, `Id_estado`, `inicio_contador`) VALUES
(46, 3, 6, '2025-03-21 00:28:46'),
(47, 3, 6, '2025-03-21 00:41:44'),
(48, 1, 6, '2025-03-10 05:49:39'),
(49, 1, 6, '2025-03-10 06:00:45'),
(50, 1, 6, '2025-03-10 06:34:30'),
(51, 1, 6, '2025-03-10 06:35:49'),
(52, 1, 6, '2025-03-10 06:36:51'),
(53, 1, 6, '2025-03-10 06:42:07'),
(54, 1, 6, '2025-03-10 06:47:53'),
(55, 1, 6, '2025-03-10 06:52:45'),
(56, 1, 6, '2025-03-10 07:06:45'),
(57, 1, 6, '2025-03-10 07:30:31'),
(58, 1, 6, '2025-03-10 07:36:40'),
(59, 1, 6, '2025-03-10 07:49:12'),
(60, 1, 6, '2025-03-10 08:03:32'),
(61, 1, 6, '2025-03-10 08:09:02'),
(62, 1, 6, '2025-03-10 08:28:33'),
(63, 1, 6, '2025-03-10 08:38:10'),
(64, 1, 6, '2025-03-10 08:39:51'),
(65, 1, 6, '2025-03-10 08:41:15'),
(66, 1, 6, '2025-03-10 08:53:32'),
(67, 1, 6, '2025-03-10 10:08:11'),
(68, 1, 6, '2025-03-10 10:46:56'),
(69, 2, 6, '2025-03-20 14:22:38'),
(70, 2, 6, '2025-03-21 03:18:51'),
(71, 1, 6, '2025-03-10 10:10:55'),
(72, 1, 6, '2025-03-10 10:26:08'),
(73, 1, 6, '2025-03-10 10:35:48'),
(74, 1, 6, '2025-03-10 11:01:03'),
(75, 1, 6, NULL),
(76, 3, 6, '2025-03-21 00:52:41'),
(77, 2, 6, '2025-03-21 04:58:27'),
(78, 2, 6, '2025-03-21 05:18:48'),
(79, 3, 6, '2025-03-21 05:23:04'),
(80, 3, 6, '2025-03-21 05:31:33'),
(81, 3, 6, '2025-03-21 05:33:16'),
(82, 2, 6, '2025-03-21 05:35:59'),
(83, 2, 6, '2025-03-21 05:37:14'),
(84, 2, 6, '2025-03-21 05:39:25'),
(85, 2, 6, '2025-03-21 06:49:41'),
(86, 2, 6, '2025-03-21 06:59:40'),
(87, 2, 6, '2025-03-21 07:14:17'),
(88, 2, 6, '2025-03-21 07:20:09'),
(89, 3, 6, '2025-03-21 07:22:00'),
(90, 3, 6, '2025-03-21 07:23:35'),
(91, 3, 6, '2025-03-21 08:37:16'),
(92, 3, 6, '2025-03-21 09:04:10'),
(93, 2, 6, '2025-03-21 09:19:14'),
(94, 2, 6, '2025-03-21 09:28:11'),
(95, 2, 5, '2025-03-21 11:45:00'),
(96, 2, 4, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_arma`
--

CREATE TABLE `tipo_arma` (
  `Id_tipo_arma` bigint(20) NOT NULL,
  `nom_tipo_arma` char(30) DEFAULT NULL,
  `daño` int(11) DEFAULT NULL,
  `nivel` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo_arma`
--

INSERT INTO `tipo_arma` (`Id_tipo_arma`, `nom_tipo_arma`, `daño`, `nivel`) VALUES
(1, 'mano', 1, 1),
(2, 'pistola', 2, 1),
(3, 'francotirador', 20, 2),
(4, 'ametralladora', 10, 2),
(5, 'mano', 1, 2),
(6, 'pistola', 2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `username` varchar(50) NOT NULL,
  `correo` varchar(50) DEFAULT NULL,
  `Contraseña` varchar(100) DEFAULT NULL,
  `vida` int(11) DEFAULT NULL,
  `puntos` int(11) DEFAULT NULL,
  `Id_avatar` bigint(20) DEFAULT NULL,
  `Id_Estado` bigint(20) DEFAULT NULL,
  `Id_rol` bigint(20) DEFAULT NULL,
  `Id_mundo` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`username`, `correo`, `Contraseña`, `vida`, `puntos`, `Id_avatar`, `Id_Estado`, `Id_rol`, `Id_mundo`) VALUES
('Dani', 'dani@gmail.com', '$2y$10$RvUkNOjSpW9VgE6V736FOOPJOkulU8zormhorF7Tyi1el/drEkeLa', 100, 425, 3, 1, 1, 1),
('Gabi', 'gab@gmail.com', '$2y$10$0FqlSuoxlB.9GTKcPao.vOofy.gyguBwcy5LkgKwo3nBXoO4P.ulO', 100, 0, 1, 1, 1, 1),
('gaby', 'gabidmarin06@gmail.com', '$2y$10$GAVzEYB6foYF6beMSHvT0uIr.ezk8TvZSUooYLxbyI8tJJbCTm.nS', 100, 510, 3, 1, 1, 2),
('gaby123', 'gabrieladeviamarin@gmail.com', '$2y$10$Cb1R.lfQHWThNLFPl4dg.u4u5C2lU.BBGnFAWVCSsG1ucYXNt/cHa', 100, 1195, 2, 1, 1, 2),
('Hola', 'gabi@gmail.com', '$2y$10$Bl6tN5eikulpYvTsfZY3uu7KujsJsiDmW6CQvF9yCyQSPgQMtxqy2', 100, 350, 2, 1, 1, 1),
('Jai', 'hola@gmail.com', '$2y$10$RnNirLxoDyf51IroqvokmOaG3ElH5As98ywrvlm3hN8Ta2uSJyI5y', 100, 0, 1, 1, 2, 1),
('noviodgaby', 'miguelparraduran926@gmail.com', '$2y$10$HzkV/JQZyXbQNNnaxH4xz.kj.0egEFz5OXm.5.dPT.NeSGoQtutVu', 100, 0, 1, 1, 1, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `armas`
--
ALTER TABLE `armas`
  ADD PRIMARY KEY (`Id_armas`),
  ADD KEY `tipo_arma` (`Id_tipo_arma`);

--
-- Indices de la tabla `avatar`
--
ALTER TABLE `avatar`
  ADD PRIMARY KEY (`Id_avatar`);

--
-- Indices de la tabla `detalle_sala`
--
ALTER TABLE `detalle_sala`
  ADD PRIMARY KEY (`Id_detalle`),
  ADD KEY `username` (`username`),
  ADD KEY `sala` (`id_sala`);

--
-- Indices de la tabla `estadistica`
--
ALTER TABLE `estadistica`
  ADD PRIMARY KEY (`id_estadistica`),
  ADD KEY `usu_victima` (`usu_victima`),
  ADD KEY `armas` (`Id_armas`),
  ADD KEY `fk_estadistica_username` (`username`),
  ADD KEY `fk_estadistica_id_sala` (`id_sala`);

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`Id_estado`);

--
-- Indices de la tabla `historial_sesion`
--
ALTER TABLE `historial_sesion`
  ADD PRIMARY KEY (`Id_historial`);

--
-- Indices de la tabla `mundo`
--
ALTER TABLE `mundo`
  ADD PRIMARY KEY (`Id_mundo`);

--
-- Indices de la tabla `niveles`
--
ALTER TABLE `niveles`
  ADD PRIMARY KEY (`Id_nivel`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`Id_rol`);

--
-- Indices de la tabla `sala`
--
ALTER TABLE `sala`
  ADD PRIMARY KEY (`Id_sala`),
  ADD KEY `mundo` (`Id_mundo`),
  ADD KEY `Id_estado` (`Id_estado`);

--
-- Indices de la tabla `tipo_arma`
--
ALTER TABLE `tipo_arma`
  ADD PRIMARY KEY (`Id_tipo_arma`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`username`),
  ADD KEY `Rol` (`Id_rol`),
  ADD KEY `Avatar` (`Id_avatar`),
  ADD KEY `Estado` (`Id_Estado`),
  ADD KEY `Id_mundo` (`Id_mundo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `armas`
--
ALTER TABLE `armas`
  MODIFY `Id_armas` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `avatar`
--
ALTER TABLE `avatar`
  MODIFY `Id_avatar` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `detalle_sala`
--
ALTER TABLE `detalle_sala`
  MODIFY `Id_detalle` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1524;

--
-- AUTO_INCREMENT de la tabla `estadistica`
--
ALTER TABLE `estadistica`
  MODIFY `id_estadistica` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=441;

--
-- AUTO_INCREMENT de la tabla `estado`
--
ALTER TABLE `estado`
  MODIFY `Id_estado` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `historial_sesion`
--
ALTER TABLE `historial_sesion`
  MODIFY `Id_historial` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mundo`
--
ALTER TABLE `mundo`
  MODIFY `Id_mundo` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `niveles`
--
ALTER TABLE `niveles`
  MODIFY `Id_nivel` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `Id_rol` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `sala`
--
ALTER TABLE `sala`
  MODIFY `Id_sala` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT de la tabla `tipo_arma`
--
ALTER TABLE `tipo_arma`
  MODIFY `Id_tipo_arma` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `armas`
--
ALTER TABLE `armas`
  ADD CONSTRAINT `tipo_arma` FOREIGN KEY (`Id_tipo_arma`) REFERENCES `tipo_arma` (`Id_tipo_arma`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `detalle_sala`
--
ALTER TABLE `detalle_sala`
  ADD CONSTRAINT `sala` FOREIGN KEY (`id_sala`) REFERENCES `sala` (`Id_sala`) ON UPDATE CASCADE,
  ADD CONSTRAINT `username` FOREIGN KEY (`username`) REFERENCES `usuario` (`username`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `estadistica`
--
ALTER TABLE `estadistica`
  ADD CONSTRAINT `armas` FOREIGN KEY (`Id_armas`) REFERENCES `armas` (`Id_armas`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_estadistica_id_sala` FOREIGN KEY (`id_sala`) REFERENCES `sala` (`Id_sala`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_estadistica_username` FOREIGN KEY (`username`) REFERENCES `usuario` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usu_victima` FOREIGN KEY (`usu_victima`) REFERENCES `usuario` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `sala`
--
ALTER TABLE `sala`
  ADD CONSTRAINT `Id_estado` FOREIGN KEY (`Id_estado`) REFERENCES `estado` (`Id_estado`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `mundo` FOREIGN KEY (`Id_mundo`) REFERENCES `mundo` (`Id_mundo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `Avatar` FOREIGN KEY (`Id_avatar`) REFERENCES `avatar` (`Id_avatar`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Estado` FOREIGN KEY (`Id_Estado`) REFERENCES `estado` (`Id_estado`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Id_mundo` FOREIGN KEY (`Id_mundo`) REFERENCES `mundo` (`Id_mundo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Rol` FOREIGN KEY (`Id_rol`) REFERENCES `rol` (`Id_rol`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
