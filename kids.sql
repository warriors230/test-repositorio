-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-04-2020 a las 19:27:59
-- Versión del servidor: 10.1.32-MariaDB
-- Versión de PHP: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `kids`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acudiente_nino`
--

CREATE TABLE `acudiente_nino` (
  `id` int(4) NOT NULL,
  `id_acudiente` int(4) NOT NULL,
  `id_nino` int(4) NOT NULL,
  `parentesco` varchar(10) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `acudiente_nino`
--

INSERT INTO `acudiente_nino` (`id`, `id_acudiente`, `id_nino`, `parentesco`, `estado`) VALUES
(1, 3, 4, 'papa', 1),
(2, 3, 4, 'mama', 1),
(3, 3, 4, 'tio', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `id` int(4) NOT NULL,
  `tipo_persona` varchar(10) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `tipo_documento` varchar(4) NOT NULL,
  `documento` int(20) NOT NULL,
  `genero` char(1) NOT NULL,
  `estado_civil` varchar(10) NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `correo` varchar(30) NOT NULL,
  `telefono` int(7) DEFAULT NULL,
  `celular` int(11) DEFAULT NULL,
  `permiso` varchar(10) NOT NULL DEFAULT 'natural',
  `estado` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`id`, `tipo_persona`, `nombre`, `apellido`, `tipo_documento`, `documento`, `genero`, `estado_civil`, `fecha_nacimiento`, `correo`, `telefono`, `celular`, `permiso`, `estado`) VALUES
(1, 'voluntario', 'andres felipe', 'silva guzman', 'CC', 1144206906, 'm', 'soltero', '1998-07-15', 'felipe1998157@gmail.com', 4334593, 2147483647, 'jefe', 1),
(2, 'voluntario', 'paola andrea', 'silva guzman', 'CC', 1144206907, 'm', 'soltero', '1999-08-03', 'paola@gmail.com', 4334593, 2147483647, 'administra', 1),
(3, 'acudiente', 'diego', 'paz', 'CC', 2432, 'm', 'soltero', '2020-04-16', 'kasnvka', 12223, 124, 'natural', 1),
(4, 'nino', 'maria', 'paz', 'CC', 4, 'f', 'soltero', '2020-04-16', 'kasnvka', 12223, 124, 'natural', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reunion`
--

CREATE TABLE `reunion` (
  `id` int(4) NOT NULL,
  `tipo_reunion` varchar(10) NOT NULL,
  `fecha` date NOT NULL,
  `hora_entrada` time NOT NULL,
  `hora_salida` time DEFAULT NULL,
  `n_manilla` int(4) NOT NULL,
  `salon` varchar(4) NOT NULL,
  `id_nino` int(4) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `reunion`
--

INSERT INTO `reunion` (`id`, `tipo_reunion`, `fecha`, `hora_entrada`, `hora_salida`, `n_manilla`, `salon`, `id_nino`, `estado`) VALUES
(1, 'segunda', '2020-04-24', '10:30:00', NULL, 0, '2', 4, 1),
(3, 'especial', '2020-04-24', '07:45:00', NULL, 200, '6', 4, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `id` int(4) NOT NULL,
  `nombre` varchar(10) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id`, `nombre`, `estado`) VALUES
(1, 'jefe', 1),
(2, 'administra', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(4) NOT NULL,
  `id_rol` int(4) NOT NULL,
  `id_persona` int(4) NOT NULL,
  `correo` varchar(40) NOT NULL,
  `clave` varchar(30) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `id_rol`, `id_persona`, `correo`, `clave`, `estado`) VALUES
(2, 1, 1, 'felipe1998157@gmail.com', '7555', 1),
(3, 2, 1, 'paola@gmail.com', '7555', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `acudiente_nino`
--
ALTER TABLE `acudiente_nino`
  ADD PRIMARY KEY (`id`),
  ADD KEY `persona_acudiente` (`id_acudiente`),
  ADD KEY `persona_nino` (`id_nino`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `reunion`
--
ALTER TABLE `reunion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reunion_acudiente_nino` (`id_nino`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_persona` (`id_persona`),
  ADD KEY `usuario_rol` (`id_rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `acudiente_nino`
--
ALTER TABLE `acudiente_nino`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `reunion`
--
ALTER TABLE `reunion`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `acudiente_nino`
--
ALTER TABLE `acudiente_nino`
  ADD CONSTRAINT `persona_acudiente` FOREIGN KEY (`id_acudiente`) REFERENCES `persona` (`id`),
  ADD CONSTRAINT `persona_nino` FOREIGN KEY (`id_nino`) REFERENCES `persona` (`id`);

--
-- Filtros para la tabla `reunion`
--
ALTER TABLE `reunion`
  ADD CONSTRAINT `reunion_acudiente_nino` FOREIGN KEY (`id_nino`) REFERENCES `persona` (`id`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_persona` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id`),
  ADD CONSTRAINT `usuario_rol` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
