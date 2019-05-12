-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.3.8-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             10.1.0.5464
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para taekwondo
CREATE DATABASE IF NOT EXISTS `taekwondo` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `taekwondo`;

-- Volcando estructura para tabla taekwondo.alumnos
CREATE TABLE IF NOT EXISTS `alumnos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_inscripcion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `genero` char(1) NOT NULL,
  `tipo` char(2) NOT NULL,
  `clase` tinyint(4) NOT NULL,
  `cinturon` tinyint(4) NOT NULL,
  `foto` varchar(50) NOT NULL,
  `referencia` tinyint(4) NOT NULL,
  `observacion` varchar(250) NOT NULL,
  `padre` tinyint(4) NOT NULL,
  `mayores` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_alumnos_padres` (`padre`),
  KEY `FK_alumnos_clases` (`clase`),
  KEY `FK_alumnos_cinturones` (`cinturon`),
  CONSTRAINT `FK_alumnos_cinturones` FOREIGN KEY (`cinturon`) REFERENCES `cinturones` (`id`),
  CONSTRAINT `FK_alumnos_clases` FOREIGN KEY (`clase`) REFERENCES `clases` (`id`),
  CONSTRAINT `FK_alumnos_padres` FOREIGN KEY (`padre`) REFERENCES `padres` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla taekwondo.alumnos: ~0 rows (aproximadamente)
DELETE FROM `alumnos`;
/*!40000 ALTER TABLE `alumnos` DISABLE KEYS */;
/*!40000 ALTER TABLE `alumnos` ENABLE KEYS */;

-- Volcando estructura para tabla taekwondo.alumnos_mayores
CREATE TABLE IF NOT EXISTS `alumnos_mayores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tel` varchar(15) DEFAULT NULL,
  `cedula` varchar(11) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla taekwondo.alumnos_mayores: ~0 rows (aproximadamente)
DELETE FROM `alumnos_mayores`;
/*!40000 ALTER TABLE `alumnos_mayores` DISABLE KEYS */;
/*!40000 ALTER TABLE `alumnos_mayores` ENABLE KEYS */;

-- Volcando estructura para tabla taekwondo.autorizados
CREATE TABLE IF NOT EXISTS `autorizados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `cedula` int(11) NOT NULL,
  `tel` int(15) NOT NULL,
  `foto` varchar(50) NOT NULL,
  `alumno` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_autorizados_autorizados` (`alumno`),
  CONSTRAINT `FK_autorizados_autorizados` FOREIGN KEY (`alumno`) REFERENCES `autorizados` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla taekwondo.autorizados: ~0 rows (aproximadamente)
DELETE FROM `autorizados`;
/*!40000 ALTER TABLE `autorizados` DISABLE KEYS */;
/*!40000 ALTER TABLE `autorizados` ENABLE KEYS */;

-- Volcando estructura para tabla taekwondo.cinturones
CREATE TABLE IF NOT EXISTS `cinturones` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `cinturon` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla taekwondo.cinturones: ~0 rows (aproximadamente)
DELETE FROM `cinturones`;
/*!40000 ALTER TABLE `cinturones` DISABLE KEYS */;
/*!40000 ALTER TABLE `cinturones` ENABLE KEYS */;

-- Volcando estructura para tabla taekwondo.clases
CREATE TABLE IF NOT EXISTS `clases` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `costo_inscripcion` double NOT NULL,
  `costo_mensual` double NOT NULL,
  `maestro` tinyint(4) NOT NULL,
  `lugar` varchar(50) NOT NULL,
  `dia` char(1) NOT NULL,
  `horario` time NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_clases_maestros` (`maestro`),
  CONSTRAINT `FK_clases_maestros` FOREIGN KEY (`maestro`) REFERENCES `maestros` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla taekwondo.clases: ~0 rows (aproximadamente)
DELETE FROM `clases`;
/*!40000 ALTER TABLE `clases` DISABLE KEYS */;
/*!40000 ALTER TABLE `clases` ENABLE KEYS */;

-- Volcando estructura para tabla taekwondo.estado_pago
CREATE TABLE IF NOT EXISTS `estado_pago` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `estado` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla taekwondo.estado_pago: ~0 rows (aproximadamente)
DELETE FROM `estado_pago`;
/*!40000 ALTER TABLE `estado_pago` DISABLE KEYS */;
/*!40000 ALTER TABLE `estado_pago` ENABLE KEYS */;

-- Volcando estructura para tabla taekwondo.maestros
CREATE TABLE IF NOT EXISTS `maestros` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `cedula` varchar(11) NOT NULL,
  `foto` varchar(50) NOT NULL,
  `tel` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla taekwondo.maestros: ~0 rows (aproximadamente)
DELETE FROM `maestros`;
/*!40000 ALTER TABLE `maestros` DISABLE KEYS */;
/*!40000 ALTER TABLE `maestros` ENABLE KEYS */;

-- Volcando estructura para tabla taekwondo.padres
CREATE TABLE IF NOT EXISTS `padres` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `cedula` varchar(11) NOT NULL,
  `foto` varchar(50) NOT NULL,
  `tel` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla taekwondo.padres: ~0 rows (aproximadamente)
DELETE FROM `padres`;
/*!40000 ALTER TABLE `padres` DISABLE KEYS */;
/*!40000 ALTER TABLE `padres` ENABLE KEYS */;

-- Volcando estructura para tabla taekwondo.pagos
CREATE TABLE IF NOT EXISTS `pagos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alumno` int(11) NOT NULL,
  `foto` varchar(50) DEFAULT NULL,
  `tipo` tinyint(4) NOT NULL,
  `fecha_pago` datetime NOT NULL,
  `monto` double NOT NULL,
  `estado` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_pagos_tipo_pago` (`tipo`),
  CONSTRAINT `FK_pagos_tipo_pago` FOREIGN KEY (`tipo`) REFERENCES `tipo_pago` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla taekwondo.pagos: ~0 rows (aproximadamente)
DELETE FROM `pagos`;
/*!40000 ALTER TABLE `pagos` DISABLE KEYS */;
/*!40000 ALTER TABLE `pagos` ENABLE KEYS */;

-- Volcando estructura para tabla taekwondo.tipo_pago
CREATE TABLE IF NOT EXISTS `tipo_pago` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla taekwondo.tipo_pago: ~0 rows (aproximadamente)
DELETE FROM `tipo_pago`;
/*!40000 ALTER TABLE `tipo_pago` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_pago` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
