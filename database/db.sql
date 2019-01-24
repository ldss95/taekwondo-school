-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.3.10-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             10.0.0.5460
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
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `imagen` varchar(255) DEFAULT NULL,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `fecha_ingreso` timestamp NOT NULL DEFAULT current_timestamp(),
  `nivel` tinyint(1) NOT NULL,
  `padre` bigint(20) NOT NULL,
  `estado` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `FK1_alumno_padre` (`padre`),
  CONSTRAINT `FK1_alumno_padre` FOREIGN KEY (`padre`) REFERENCES `padres` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla taekwondo.alumnos: ~0 rows (aproximadamente)
DELETE FROM `alumnos`;
/*!40000 ALTER TABLE `alumnos` DISABLE KEYS */;
/*!40000 ALTER TABLE `alumnos` ENABLE KEYS */;

-- Volcando estructura para tabla taekwondo.cursos
CREATE TABLE IF NOT EXISTS `cursos` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `horario` char(13) NOT NULL,
  `maestro` bigint(20) NOT NULL,
  `costo_inscripcion` double NOT NULL,
  `cuota_mensual` double NOT NULL,
  `lugar` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_curso_maestro` (`maestro`),
  CONSTRAINT `FK_curso_maestro` FOREIGN KEY (`maestro`) REFERENCES `maestros` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla taekwondo.cursos: ~0 rows (aproximadamente)
DELETE FROM `cursos`;
/*!40000 ALTER TABLE `cursos` DISABLE KEYS */;
/*!40000 ALTER TABLE `cursos` ENABLE KEYS */;

-- Volcando estructura para tabla taekwondo.empresas
CREATE TABLE IF NOT EXISTS `empresas` (
  `nombre` varchar(100) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `rnc` char(9) NOT NULL,
  `telefono` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla taekwondo.empresas: ~0 rows (aproximadamente)
DELETE FROM `empresas`;
/*!40000 ALTER TABLE `empresas` DISABLE KEYS */;
INSERT INTO `empresas` (`nombre`, `direccion`, `rnc`, `telefono`) VALUES
	('TAEKWONDO BSO', 'C/ Desconocida #00, en algun sitio', '000000000', '8090000000');
/*!40000 ALTER TABLE `empresas` ENABLE KEYS */;

-- Volcando estructura para tabla taekwondo.estados_pago
CREATE TABLE IF NOT EXISTS `estados_pago` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla taekwondo.estados_pago: ~2 rows (aproximadamente)
DELETE FROM `estados_pago`;
/*!40000 ALTER TABLE `estados_pago` DISABLE KEYS */;
INSERT INTO `estados_pago` (`id`, `nombre`, `descripcion`) VALUES
	(1, 'Confirmado', 'Indica que el pago ha sido recibido correctamente'),
	(2, 'Pendiente', 'Indica que el cliente ha realizado el pago pero este no ha sido verificado'),
	(3, 'Rechazado', 'Indica que el cliente intento hacer el pago pero este no se efectuo correctamente');
/*!40000 ALTER TABLE `estados_pago` ENABLE KEYS */;

-- Volcando estructura para tabla taekwondo.maestros
CREATE TABLE IF NOT EXISTS `maestros` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `imagen` varchar(255) DEFAULT NULL,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(200) NOT NULL DEFAULT '123456',
  `telefono_1` char(10) NOT NULL,
  `telefono_2` char(10) DEFAULT NULL,
  `cedula` char(11) NOT NULL,
  `direccion` varchar(200) NOT NULL,
  `fecha_ingreso` timestamp NOT NULL DEFAULT current_timestamp(),
  `estado` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla taekwondo.maestros: ~0 rows (aproximadamente)
DELETE FROM `maestros`;
/*!40000 ALTER TABLE `maestros` DISABLE KEYS */;
/*!40000 ALTER TABLE `maestros` ENABLE KEYS */;

-- Volcando estructura para tabla taekwondo.padres
CREATE TABLE IF NOT EXISTS `padres` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `imagen` varchar(255) DEFAULT NULL,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telefono_1` char(10) NOT NULL,
  `telefono_2` char(10) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `genero` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla taekwondo.padres: ~0 rows (aproximadamente)
DELETE FROM `padres`;
/*!40000 ALTER TABLE `padres` DISABLE KEYS */;
INSERT INTO `padres` (`id`, `imagen`, `nombres`, `apellidos`, `email`, `telefono_1`, `telefono_2`, `direccion`, `genero`) VALUES
	(1, NULL, 'Antonia', 'Guzman', 'antoniog_1@gmail.com', '8094787721', NULL, 'C/ Pedro Mir #12, Los Frailes', 'm');
/*!40000 ALTER TABLE `padres` ENABLE KEYS */;

-- Volcando estructura para tabla taekwondo.pagos
CREATE TABLE IF NOT EXISTS `pagos` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `imagen` varchar(255) NOT NULL,
  `padre` bigint(20) NOT NULL,
  `monto` double NOT NULL,
  `fecha` datetime NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 2,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla taekwondo.pagos: ~1 rows (aproximadamente)
DELETE FROM `pagos`;
/*!40000 ALTER TABLE `pagos` DISABLE KEYS */;
INSERT INTO `pagos` (`id`, `imagen`, `padre`, `monto`, `fecha`, `estado`) VALUES
	(1, '', 1, 4600, '2019-01-21 05:30:52', 2);
/*!40000 ALTER TABLE `pagos` ENABLE KEYS */;

-- Volcando estructura para tabla taekwondo.tipos_pago
CREATE TABLE IF NOT EXISTS `tipos_pago` (
  `id` tinyint(1) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(25) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla taekwondo.tipos_pago: ~2 rows (aproximadamente)
DELETE FROM `tipos_pago`;
/*!40000 ALTER TABLE `tipos_pago` DISABLE KEYS */;
INSERT INTO `tipos_pago` (`id`, `nombre`, `descripcion`) VALUES
	(1, 'Inscripcion', 'Pago por inicio de nuevo curso'),
	(2, 'Cuota', 'Pago mensual'),
	(3, 'Mora', 'Pago de intereses por cuota atrasada');
/*!40000 ALTER TABLE `tipos_pago` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
