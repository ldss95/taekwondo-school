-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.3.15-MariaDB-1:10.3.15+maria~bionic - mariadb.org binary distribution
-- SO del servidor:              debian-linux-gnu
-- HeidiSQL Versión:             10.1.0.5464
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para taekwondo
DROP DATABASE IF EXISTS `taekwondo`;
CREATE DATABASE IF NOT EXISTS `taekwondo` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `taekwondo`;

-- Volcando estructura para tabla taekwondo.alumnos
DROP TABLE IF EXISTS `alumnos`;
CREATE TABLE IF NOT EXISTS `alumnos` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `genero` char(1) NOT NULL,
  `telefono` char(10) DEFAULT NULL,
  `cedula` char(11) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `independiente` tinyint(1) NOT NULL DEFAULT 0,
  `fecha_inscripcion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fecha_nacimiento` date NOT NULL,
  `tipo` char(2) NOT NULL,
  `cinturon` tinyint(4) NOT NULL,
  `foto` varchar(200) DEFAULT NULL,
  `referencia` tinyint(4) DEFAULT NULL,
  `padre` tinyint(4) DEFAULT NULL,
  `autorizado` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cedula` (`cedula`),
  KEY `FK_alumnos_padres` (`padre`),
  KEY `FK_alumnos_cinturones` (`cinturon`),
  KEY `FK_alumnos_autorizados` (`autorizado`),
  CONSTRAINT `FK_alumnos_autorizados` FOREIGN KEY (`autorizado`) REFERENCES `autorizados` (`id`),
  CONSTRAINT `FK_alumnos_cinturones` FOREIGN KEY (`cinturon`) REFERENCES `cinturones` (`id`),
  CONSTRAINT `FK_alumnos_padres` FOREIGN KEY (`padre`) REFERENCES `padres` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla taekwondo.articulos
DROP TABLE IF EXISTS `articulos`;
CREATE TABLE IF NOT EXISTS `articulos` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `texto` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla taekwondo.autorizados
DROP TABLE IF EXISTS `autorizados`;
CREATE TABLE IF NOT EXISTS `autorizados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `cedula` char(50) NOT NULL,
  `telefono` char(10) NOT NULL,
  `foto` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla taekwondo.cinturones
DROP TABLE IF EXISTS `cinturones`;
CREATE TABLE IF NOT EXISTS `cinturones` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `cinturon` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla taekwondo.clases
DROP TABLE IF EXISTS `clases`;
CREATE TABLE IF NOT EXISTS `clases` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `hora_entrada` time NOT NULL,
  `hora_salida` time NOT NULL,
  `costo_inscripcion` double NOT NULL,
  `costo_mensual` double NOT NULL,
  `maestro` int(11) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `location` varchar(300) NOT NULL,
  `dias` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_clases_maestros` (`maestro`),
  CONSTRAINT `FK_clases_maestros` FOREIGN KEY (`maestro`) REFERENCES `maestros` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla taekwondo.cursos
DROP TABLE IF EXISTS `cursos`;
CREATE TABLE IF NOT EXISTS `cursos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `imagen` varchar(600) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla taekwondo.estado_pago
DROP TABLE IF EXISTS `estado_pago`;
CREATE TABLE IF NOT EXISTS `estado_pago` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `estado` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla taekwondo.eventos
DROP TABLE IF EXISTS `eventos`;
CREATE TABLE IF NOT EXISTS `eventos` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `lugar` varchar(200) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla taekwondo.historial
DROP TABLE IF EXISTS `historial`;
CREATE TABLE IF NOT EXISTS `historial` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tipo` tinyint(4) NOT NULL,
  `usuario` bigint(20) NOT NULL,
  `detalles` varchar(500) NOT NULL,
  `fecha_hora` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `FK_historial_tipos` (`tipo`),
  CONSTRAINT `FK_historial_tipos` FOREIGN KEY (`tipo`) REFERENCES `tipos_historial` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla taekwondo.maestros
DROP TABLE IF EXISTS `maestros`;
CREATE TABLE IF NOT EXISTS `maestros` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `cedula` char(11) NOT NULL,
  `foto` varchar(200) NOT NULL,
  `tel` char(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla taekwondo.observaciones
DROP TABLE IF EXISTS `observaciones`;
CREATE TABLE IF NOT EXISTS `observaciones` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `observacion` text NOT NULL DEFAULT '0',
  `alumno` double NOT NULL DEFAULT 0,
  `maestro` text NOT NULL DEFAULT '0',
  `fecha_hora` text NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla taekwondo.padres
DROP TABLE IF EXISTS `padres`;
CREATE TABLE IF NOT EXISTS `padres` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `cedula` char(11) NOT NULL,
  `foto` varchar(200) DEFAULT NULL,
  `tel` char(10) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `direccion` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cedula` (`cedula`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla taekwondo.pagos
DROP TABLE IF EXISTS `pagos`;
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
  CONSTRAINT `FK_pagos_tipo_pago` FOREIGN KEY (`tipo`) REFERENCES `tipos_pago` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla taekwondo.permisos
DROP TABLE IF EXISTS `permisos`;
CREATE TABLE IF NOT EXISTS `permisos` (
  `permiso` tinyint(4) NOT NULL,
  `rol` tinyint(4) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1,
  KEY `FK_permiso_rol` (`rol`),
  KEY `FK_permiso_permiso` (`permiso`),
  CONSTRAINT `FK_permiso_permiso` FOREIGN KEY (`permiso`) REFERENCES `tipos_permiso` (`id`),
  CONSTRAINT `FK_permiso_rol` FOREIGN KEY (`rol`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla taekwondo.roles
DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla taekwondo.sessions
DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) unsigned NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla taekwondo.team
DROP TABLE IF EXISTS `team`;
CREATE TABLE IF NOT EXISTS `team` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `cargo` varchar(50) NOT NULL,
  `facebook` varchar(100) DEFAULT NULL,
  `instagram` varchar(100) DEFAULT NULL,
  `youtube` varchar(100) DEFAULT NULL,
  `twitter` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla taekwondo.tipos_historial
DROP TABLE IF EXISTS `tipos_historial`;
CREATE TABLE IF NOT EXISTS `tipos_historial` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla taekwondo.tipos_pago
DROP TABLE IF EXISTS `tipos_pago`;
CREATE TABLE IF NOT EXISTS `tipos_pago` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla taekwondo.tipos_permiso
DROP TABLE IF EXISTS `tipos_permiso`;
CREATE TABLE IF NOT EXISTS `tipos_permiso` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla taekwondo.usuarios
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(200) NOT NULL,
  `rol` tinyint(4) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `FK_suario_rol` (`rol`),
  CONSTRAINT `FK_suario_rol` FOREIGN KEY (`rol`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
