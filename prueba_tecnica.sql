-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 30-09-2022 a las 04:14:08
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
-- Base de datos: `prueba_tecnica`
--
CREATE DATABASE IF NOT EXISTS `prueba_tecnica` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `prueba_tecnica`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--
-- Creación: 29-09-2022 a las 21:53:09
-- Última actualización: 30-09-2022 a las 01:22:04
--

CREATE TABLE `productos` (
  `Id_fabricante` varchar(10) NOT NULL,
  `Id_producto` varchar(20) NOT NULL,
  `Descripcion` varchar(40) NOT NULL,
  `Precio` float NOT NULL,
  `Existencia` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`Id_fabricante`, `Id_producto`, `Descripcion`, `Precio`, `Existencia`) VALUES
('Aci', '41001', 'Aguja', 58, 227),
('Aci', '41002', 'Micropore Grande', 80, 150),
('Aci', '41003', 'Gasa', 112, 80),
('Aci', '41004', 'Equipo macrogoteo', 110, 50),
('Bic', '41003', 'Curas', 120, 20),
('Inc', '41089', 'Canaleta', 500, 30),
('Bic', 'Xk47', 'Compresa', 200, 200),
('Bic', '41003', 'Curas', 620, 500);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
