-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 30-09-2022 a las 04:11:14
-- Versión del servidor: 5.7.33
-- Versión de PHP: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `datos_paciente`
--
CREATE DATABASE IF NOT EXISTS `datos_paciente` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `datos_paciente`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamentos`
--
-- Creación: 30-09-2022 a las 03:26:05
-- Última actualización: 30-09-2022 a las 03:29:49
--

CREATE TABLE `departamentos` (
  `idDepartamento` int(11) NOT NULL,
  `Nom_departamento` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `departamentos`
--

INSERT INTO `departamentos` (`idDepartamento`, `Nom_departamento`) VALUES
(1, 'Tolima'),
(2, 'Cundinamarca'),
(3, 'Antioquia'),
(4, 'Nariño'),
(5, 'Boyaca');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genero`
--
-- Creación: 30-09-2022 a las 03:26:04
--

CREATE TABLE `genero` (
  `Id_genero` int(11) NOT NULL,
  `Nom_genero` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `municipios`
--
-- Creación: 30-09-2022 a las 03:26:05
-- Última actualización: 30-09-2022 a las 03:38:33
--

CREATE TABLE `municipios` (
  `idMunicipio` int(11) NOT NULL,
  `Nom_municipio` varchar(45) NOT NULL,
  `Departamentos_idDepartamento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `municipios`
--

INSERT INTO `municipios` (`idMunicipio`, `Nom_municipio`, `Departamentos_idDepartamento`) VALUES
(1, 'Ibague', 1),
(2, 'Guamo', 1),
(3, 'Turbo', 3),
(4, 'Medellin', 3),
(5, 'bogota', 2),
(6, 'zipaquira', 2),
(7, 'pasto', 4),
(8, 'ipiales', 4),
(9, 'tunja', 5),
(10, 'duitama', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pacientes`
--
-- Creación: 30-09-2022 a las 03:26:06
--

CREATE TABLE `pacientes` (
  `idPacientes` int(11) NOT NULL,
  `Nom1_paciente` varchar(45) NOT NULL,
  `Nom2_paciente` varchar(45) NOT NULL,
  `Apel1_paciente` varchar(45) NOT NULL,
  `Apel2_paciente` varchar(45) NOT NULL,
  `Municipios_idMunicipio` int(11) NOT NULL,
  `Municipios_Departamentos_idDepartamento` int(11) NOT NULL,
  `Genero_Id_genero` int(11) NOT NULL,
  `Tipo_documento_idTipo_documento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_documento`
--
-- Creación: 30-09-2022 a las 03:26:05
-- Última actualización: 30-09-2022 a las 03:40:50
--

CREATE TABLE `tipo_documento` (
  `idTipo_documento` int(11) NOT NULL,
  `Nom_documento` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipo_documento`
--

INSERT INTO `tipo_documento` (`idTipo_documento`, `Nom_documento`) VALUES
(1, 'Targeta de identidad'),
(2, 'Cedula de ciudadania');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  ADD PRIMARY KEY (`idDepartamento`);

--
-- Indices de la tabla `genero`
--
ALTER TABLE `genero`
  ADD PRIMARY KEY (`Id_genero`);

--
-- Indices de la tabla `municipios`
--
ALTER TABLE `municipios`
  ADD PRIMARY KEY (`idMunicipio`,`Departamentos_idDepartamento`),
  ADD KEY `fk_Municipios_Departamentos_idx` (`Departamentos_idDepartamento`);

--
-- Indices de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD PRIMARY KEY (`idPacientes`,`Municipios_idMunicipio`,`Municipios_Departamentos_idDepartamento`,`Genero_Id_genero`,`Tipo_documento_idTipo_documento`),
  ADD KEY `fk_Pacientes_Municipios1_idx` (`Municipios_idMunicipio`,`Municipios_Departamentos_idDepartamento`),
  ADD KEY `fk_Pacientes_Genero1_idx` (`Genero_Id_genero`),
  ADD KEY `fk_Pacientes_Tipo_documento1_idx` (`Tipo_documento_idTipo_documento`);

--
-- Indices de la tabla `tipo_documento`
--
ALTER TABLE `tipo_documento`
  ADD PRIMARY KEY (`idTipo_documento`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  MODIFY `idDepartamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `genero`
--
ALTER TABLE `genero`
  MODIFY `Id_genero` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `municipios`
--
ALTER TABLE `municipios`
  MODIFY `idMunicipio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  MODIFY `idPacientes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tipo_documento`
--
ALTER TABLE `tipo_documento`
  MODIFY `idTipo_documento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `municipios`
--
ALTER TABLE `municipios`
  ADD CONSTRAINT `fk_Municipios_Departamentos` FOREIGN KEY (`Departamentos_idDepartamento`) REFERENCES `departamentos` (`idDepartamento`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD CONSTRAINT `fk_Pacientes_Genero1` FOREIGN KEY (`Genero_Id_genero`) REFERENCES `genero` (`Id_genero`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Pacientes_Municipios1` FOREIGN KEY (`Municipios_idMunicipio`,`Municipios_Departamentos_idDepartamento`) REFERENCES `municipios` (`idMunicipio`, `Departamentos_idDepartamento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Pacientes_Tipo_documento1` FOREIGN KEY (`Tipo_documento_idTipo_documento`) REFERENCES `tipo_documento` (`idTipo_documento`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
