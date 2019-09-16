-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-09-2019 a las 10:02:24
-- Versión del servidor: 10.4.6-MariaDB
-- Versión de PHP: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cul_ampolla`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `costumer`
--

CREATE TABLE `costumer` (
  `id_costumer` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `post_address` varchar(100) DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `cre_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `costumer`
--

INSERT INTO `costumer` (`id_costumer`, `name`, `post_address`, `phone`, `email`, `cre_date`) VALUES
(1, 'Alonso', 'Balmes 30', 666999333, 'alon34@homtail.com', '0000-00-00'),
(2, 'Paco', 'Muntaner 430', 659430000, 'franp@gmail.com', '2019-04-22'),
(3, 'Marta', 'Valencia 223', 655118493, 'martita33@gmail.com', '2019-03-02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glasses`
--

CREATE TABLE `glasses` (
  `id_glasses` int(11) NOT NULL,
  `prov_id` int(11) NOT NULL,
  `brand` varchar(100) DEFAULT NULL,
  `rank_l` varchar(11) DEFAULT NULL,
  `rank_r` varchar(11) DEFAULT NULL,
  `frame_float` varchar(20) DEFAULT NULL,
  `frame_plast` varchar(20) DEFAULT NULL,
  `frame_metal` varchar(20) DEFAULT NULL,
  `color_frame` varchar(20) DEFAULT NULL,
  `color_glass_l` varchar(20) DEFAULT NULL,
  `color_glass_r` varchar(20) DEFAULT NULL,
  `price_l` int(11) DEFAULT NULL,
  `price_r` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `glasses`
--

INSERT INTO `glasses` (`id_glasses`, `prov_id`, `brand`, `rank_l`, `rank_r`, `frame_float`, `frame_plast`, `frame_metal`, `color_frame`, `color_glass_l`, `color_glass_r`, `price_l`, `price_r`) VALUES
(1, 1, 'RayBan', '1.00', '1.00', 'No', 'Yes', 'Yes', 'Brown', 'Brown', 'Brown', 50, 50),
(7, 1, 'Oakley', '0', '0', 'No', 'Yes', 'No', 'Black', 'Blue', 'Blue', 45, 45),
(8, 1, 'Arnette', '0', '0', 'No', 'Yes', 'No', 'Grey', 'Green', 'Green', 35, 35);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provider`
--

CREATE TABLE `provider` (
  `id_prov` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `street` varchar(100) DEFAULT NULL,
  `num_st` int(11) DEFAULT NULL,
  `flat` int(11) DEFAULT NULL,
  `door` int(11) DEFAULT NULL,
  `city` tinytext DEFAULT NULL,
  `pc` varchar(11) DEFAULT NULL,
  `country` tinytext DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  `fax` int(11) DEFAULT NULL,
  `nif` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `provider`
--

INSERT INTO `provider` (`id_prov`, `name`, `street`, `num_st`, `flat`, `door`, `city`, `pc`, `country`, `phone`, `fax`, `nif`) VALUES
(1, 'Prosun', 'Calle Pallars', 73, 0, 1, 'Barcelona', '08018', 'Spain', 936314454, 936314454, '50498521E');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `purchase`
--

CREATE TABLE `purchase` (
  `id_purchase` int(11) NOT NULL,
  `seller_id` int(11) DEFAULT NULL,
  `costumer_id` int(11) DEFAULT NULL,
  `glasses_id` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `purchase_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seller`
--

CREATE TABLE `seller` (
  `id_seller` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `costumer`
--
ALTER TABLE `costumer`
  ADD PRIMARY KEY (`id_costumer`);

--
-- Indices de la tabla `glasses`
--
ALTER TABLE `glasses`
  ADD PRIMARY KEY (`id_glasses`),
  ADD KEY `prov_id` (`prov_id`);

--
-- Indices de la tabla `provider`
--
ALTER TABLE `provider`
  ADD PRIMARY KEY (`id_prov`);

--
-- Indices de la tabla `purchase`
--
ALTER TABLE `purchase`
  ADD PRIMARY KEY (`id_purchase`),
  ADD KEY `seller_id` (`seller_id`),
  ADD KEY `costumer_id` (`costumer_id`),
  ADD KEY `glasses_id` (`glasses_id`);

--
-- Indices de la tabla `seller`
--
ALTER TABLE `seller`
  ADD PRIMARY KEY (`id_seller`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `costumer`
--
ALTER TABLE `costumer`
  MODIFY `id_costumer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `glasses`
--
ALTER TABLE `glasses`
  MODIFY `id_glasses` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `provider`
--
ALTER TABLE `provider`
  MODIFY `id_prov` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `purchase`
--
ALTER TABLE `purchase`
  MODIFY `id_purchase` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `seller`
--
ALTER TABLE `seller`
  MODIFY `id_seller` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `glasses`
--
ALTER TABLE `glasses`
  ADD CONSTRAINT `glasses_ibfk_1` FOREIGN KEY (`prov_id`) REFERENCES `provider` (`id_prov`);

--
-- Filtros para la tabla `purchase`
--
ALTER TABLE `purchase`
  ADD CONSTRAINT `purchase_ibfk_1` FOREIGN KEY (`seller_id`) REFERENCES `seller` (`id_seller`),
  ADD CONSTRAINT `purchase_ibfk_2` FOREIGN KEY (`costumer_id`) REFERENCES `costumer` (`id_costumer`),
  ADD CONSTRAINT `purchase_ibfk_3` FOREIGN KEY (`glasses_id`) REFERENCES `glasses` (`id_glasses`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
