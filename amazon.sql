-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-09-2019 a las 10:02:06
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
-- Base de datos: `amazon`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autor`
--

CREATE TABLE `autor` (
  `id_autor` int(4) NOT NULL,
  `name` text NOT NULL,
  `address` varchar(100) NOT NULL,
  `total_books` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `autor`
--

INSERT INTO `autor` (`id_autor`, `name`, `address`, `total_books`) VALUES
(1, 'Juan Palomo', 'Muntaner 5', 1),
(2, 'Pedro Piedra', 'Balmes 98', 1),
(3, 'Carmen Clas', 'Valencia 345', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `book`
--

CREATE TABLE `book` (
  `id_book` int(4) NOT NULL,
  `autor_id` int(4) NOT NULL,
  `title` varchar(50) NOT NULL,
  `stock` int(3) NOT NULL,
  `price` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `book`
--

INSERT INTO `book` (`id_book`, `autor_id`, `title`, `stock`, `price`) VALUES
(1, 1, 'SIDI', 10, 20),
(2, 2, 'EL LATIDO DE LA TIERRA ', 5, 25),
(3, 3, 'EL PINTOR DE ALMAS', 11, 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `items_order`
--

CREATE TABLE `items_order` (
  `id_item_order` int(8) NOT NULL,
  `book_id` int(4) NOT NULL,
  `order_id` int(8) NOT NULL,
  `total_items` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `items_order`
--

INSERT INTO `items_order` (`id_item_order`, `book_id`, `order_id`, `total_items`) VALUES
(1, 2, 1, 0),
(2, 1, 1, 0),
(4, 2, 2, 1),
(5, 1, 2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orders`
--

CREATE TABLE `orders` (
  `id_order` int(4) NOT NULL,
  `user_id` int(4) NOT NULL,
  `total_price` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `orders`
--

INSERT INTO `orders` (`id_order`, `user_id`, `total_price`) VALUES
(1, 1, 0),
(2, 2, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id_user` int(4) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `pass` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id_user`, `name`, `email`, `pass`) VALUES
(1, 'John', 'johnmyemail@email.com', '123456'),
(2, 'Teresa', 'tere34@gmail.com', '654321a');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `autor`
--
ALTER TABLE `autor`
  ADD PRIMARY KEY (`id_autor`);

--
-- Indices de la tabla `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`id_book`),
  ADD KEY `autor_id` (`autor_id`);

--
-- Indices de la tabla `items_order`
--
ALTER TABLE `items_order`
  ADD PRIMARY KEY (`id_item_order`),
  ADD KEY `book_id` (`book_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indices de la tabla `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id_order`),
  ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `autor`
--
ALTER TABLE `autor`
  MODIFY `id_autor` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `book`
--
ALTER TABLE `book`
  MODIFY `id_book` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `items_order`
--
ALTER TABLE `items_order`
  MODIFY `id_item_order` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `orders`
--
ALTER TABLE `orders`
  MODIFY `id_order` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `book_ibfk_1` FOREIGN KEY (`autor_id`) REFERENCES `autor` (`id_autor`);

--
-- Filtros para la tabla `items_order`
--
ALTER TABLE `items_order`
  ADD CONSTRAINT `items_order_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `book` (`id_book`),
  ADD CONSTRAINT `items_order_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id_order`);

--
-- Filtros para la tabla `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id_user`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
