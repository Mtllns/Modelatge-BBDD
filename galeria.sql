-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-09-2019 a las 10:02:43
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
-- Base de datos: `galeria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `costumer`
--

CREATE TABLE `costumer` (
  `id_custumer` int(11) NOT NULL,
  `name` text NOT NULL,
  `dni` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `costumer`
--

INSERT INTO `costumer` (`id_custumer`, `name`, `dni`) VALUES
(1, 'Maria', '567895435t'),
(2, 'Marcos', '333240965p');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orders`
--

CREATE TABLE `orders` (
  `id_order` int(11) NOT NULL,
  `id_costumer` int(11) NOT NULL,
  `id_picture` int(11) NOT NULL,
  `total_items` int(11) NOT NULL,
  `total_price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `orders`
--

INSERT INTO `orders` (`id_order`, `id_costumer`, `id_picture`, `total_items`, `total_price`) VALUES
(1, 1, 2, 1, 145);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `picture`
--

CREATE TABLE `picture` (
  `id_picture` int(11) NOT NULL,
  `artist` varchar(100) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `picture`
--

INSERT INTO `picture` (`id_picture`, `artist`, `price`) VALUES
(1, 'Pablo', 300),
(2, 'Luis', 145),
(3, 'Pablo', 233);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `costumer`
--
ALTER TABLE `costumer`
  ADD PRIMARY KEY (`id_custumer`),
  ADD UNIQUE KEY `dni` (`dni`);

--
-- Indices de la tabla `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id_order`),
  ADD KEY `id_picture` (`id_picture`),
  ADD KEY `id_costumer` (`id_costumer`);

--
-- Indices de la tabla `picture`
--
ALTER TABLE `picture`
  ADD PRIMARY KEY (`id_picture`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `costumer`
--
ALTER TABLE `costumer`
  MODIFY `id_custumer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `orders`
--
ALTER TABLE `orders`
  MODIFY `id_order` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `picture`
--
ALTER TABLE `picture`
  MODIFY `id_picture` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`id_picture`) REFERENCES `picture` (`id_picture`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`id_costumer`) REFERENCES `costumer` (`id_custumer`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
