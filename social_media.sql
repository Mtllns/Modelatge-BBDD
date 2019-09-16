-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-09-2019 a las 10:02:57
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
-- Base de datos: `social_media`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `friendship`
--

CREATE TABLE `friendship` (
  `id_fs` int(8) NOT NULL,
  `user_id` int(8) NOT NULL,
  `user1` int(11) NOT NULL,
  `user2` int(11) NOT NULL,
  `how` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `img`
--

CREATE TABLE `img` (
  `id_img` int(8) NOT NULL,
  `name` varchar(50) NOT NULL,
  `loc` varchar(50) NOT NULL,
  `url` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id_user` int(8) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(20) NOT NULL,
  `img_id` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id_user`, `name`, `email`, `password`, `img_id`) VALUES
(1, 'Luis', 'luis23@gmail.com', '123456', 1),
(2, 'Pablo', 'pablo43@gmail.com', '54329', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `friendship`
--
ALTER TABLE `friendship`
  ADD PRIMARY KEY (`id_fs`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `user1` (`user1`),
  ADD KEY `user2` (`user2`);

--
-- Indices de la tabla `img`
--
ALTER TABLE `img`
  ADD PRIMARY KEY (`id_img`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `img_id` (`img_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `friendship`
--
ALTER TABLE `friendship`
  MODIFY `id_fs` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `img`
--
ALTER TABLE `img`
  MODIFY `id_img` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `friendship`
--
ALTER TABLE `friendship`
  ADD CONSTRAINT `friendship_ibfk_1` FOREIGN KEY (`user1`) REFERENCES `user` (`id_user`),
  ADD CONSTRAINT `friendship_ibfk_2` FOREIGN KEY (`user2`) REFERENCES `user` (`id_user`);

--
-- Filtros para la tabla `img`
--
ALTER TABLE `img`
  ADD CONSTRAINT `img_ibfk_1` FOREIGN KEY (`id_img`) REFERENCES `user` (`img_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
