-- --------------------------------------------------------
-- Host:                         localhost
-- Versión del servidor:         10.1.37-MariaDB-0+deb9u1 - Debian 9.6
-- SO del servidor:              debian-linux-gnu
-- HeidiSQL Versión:             9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para taekwondo
DROP DATABASE IF EXISTS `taekwondo`;
CREATE DATABASE IF NOT EXISTS `taekwondo` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
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
  `independiente` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Indica si el estudiante es mayor de edad y/o independiente de sus padres. Siendo 1 = true y 0 = false. En caso de ser independiente, la relacion con la tabla padres se omite.',
  `fecha_inscripcion` date NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `tipo` char(2) NOT NULL,
  `cinturon` tinyint(4) NOT NULL,
  `foto` varchar(200) DEFAULT NULL,
  `referencia` tinyint(4) DEFAULT NULL,
  `padre` tinyint(4) DEFAULT NULL,
  `creado_en` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Indica la fecha y la hora en la que se creo el registro',
  `actualizado_en` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Indica la fecha y la hora de la ultima actualizacion al registro',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cedula` (`cedula`),
  KEY `FK_alumnos_padres` (`padre`),
  KEY `FK_alumnos_cinturones` (`cinturon`),
  CONSTRAINT `FK_alumnos_cinturones` FOREIGN KEY (`cinturon`) REFERENCES `cinturones` (`id`),
  CONSTRAINT `FK_alumnos_padres` FOREIGN KEY (`padre`) REFERENCES `padres` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla taekwondo.alumnos: ~0 rows (aproximadamente)
DELETE FROM `alumnos`;
/*!40000 ALTER TABLE `alumnos` DISABLE KEYS */;
INSERT INTO `alumnos` (`id`, `nombres`, `apellidos`, `genero`, `telefono`, `cedula`, `direccion`, `independiente`, `fecha_inscripcion`, `fecha_nacimiento`, `tipo`, `cinturon`, `foto`, `referencia`, `padre`, `creado_en`, `actualizado_en`) VALUES
	(2, 'Nombre de Prueb', 'Apellidos de Prueba', 'm', NULL, NULL, NULL, 0, '2019-05-15', '1995-08-10', 'a', 1, 'asdkjfasdf', 1, 1, '2019-05-19 08:51:17', '2019-05-19 08:51:17');
/*!40000 ALTER TABLE `alumnos` ENABLE KEYS */;

-- Volcando estructura para tabla taekwondo.articulos
DROP TABLE IF EXISTS `articulos`;
CREATE TABLE IF NOT EXISTS `articulos` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `texto` text NOT NULL,
  `actualizado_en` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='Tabla donde se almacenaran los articulos (Texto) para luego ser mostrados en la pagina web.';

-- Volcando datos para la tabla taekwondo.articulos: ~5 rows (aproximadamente)
DELETE FROM `articulos`;
/*!40000 ALTER TABLE `articulos` DISABLE KEYS */;
INSERT INTO `articulos` (`id`, `nombre`, `texto`, `actualizado_en`) VALUES
	(1, 'Quienes Somos', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32. The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.', '2019-05-19 09:25:06'),
	(2, 'Mision', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32. The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.', '2019-05-19 09:25:06'),
	(3, 'Vision', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32. The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.', '2019-05-19 09:25:06'),
	(4, 'Valores', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32. The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.', '2019-05-19 09:25:06'),
	(5, 'Por que practicar taekwondo?', 'industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '2019-05-19 10:51:37');
/*!40000 ALTER TABLE `articulos` ENABLE KEYS */;

-- Volcando estructura para tabla taekwondo.autorizaciones
DROP TABLE IF EXISTS `autorizaciones`;
CREATE TABLE IF NOT EXISTS `autorizaciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `autorizado` int(11) NOT NULL,
  `alumno` bigint(20) NOT NULL,
  `creado_en` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `actualizado_en` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `persona_alumno` (`autorizado`,`alumno`),
  KEY `FK_autorizacion_alumno` (`alumno`),
  CONSTRAINT `FK_autorizacion_alumno` FOREIGN KEY (`alumno`) REFERENCES `alumnos` (`id`),
  CONSTRAINT `FK_autorizacion_autorizado` FOREIGN KEY (`autorizado`) REFERENCES `autorizados` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Tabla donde se almacenaran la relacion entre personas autorizadas a recoger estudiantes y los diferentes estudiantes que tiene autorizado';

-- Volcando datos para la tabla taekwondo.autorizaciones: ~0 rows (aproximadamente)
DELETE FROM `autorizaciones`;
/*!40000 ALTER TABLE `autorizaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `autorizaciones` ENABLE KEYS */;

-- Volcando estructura para tabla taekwondo.autorizados
DROP TABLE IF EXISTS `autorizados`;
CREATE TABLE IF NOT EXISTS `autorizados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `cedula` char(11) NOT NULL,
  `telefono` char(10) NOT NULL,
  `foto` varchar(200) NOT NULL,
  `creado_en` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `actualizado_en` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cedula` (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla donde se almacenaran los datos de las personas que pueden ser autorizadas a recoger un alumno.';

-- Volcando datos para la tabla taekwondo.autorizados: ~0 rows (aproximadamente)
DELETE FROM `autorizados`;
/*!40000 ALTER TABLE `autorizados` DISABLE KEYS */;
/*!40000 ALTER TABLE `autorizados` ENABLE KEYS */;

-- Volcando estructura para tabla taekwondo.cinturones
DROP TABLE IF EXISTS `cinturones`;
CREATE TABLE IF NOT EXISTS `cinturones` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `color` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla taekwondo.cinturones: ~0 rows (aproximadamente)
DELETE FROM `cinturones`;
/*!40000 ALTER TABLE `cinturones` DISABLE KEYS */;
INSERT INTO `cinturones` (`id`, `color`) VALUES
	(1, 'Blanco');
/*!40000 ALTER TABLE `cinturones` ENABLE KEYS */;

-- Volcando estructura para tabla taekwondo.clases
DROP TABLE IF EXISTS `clases`;
CREATE TABLE IF NOT EXISTS `clases` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `hora_entrada` time NOT NULL,
  `hora_salida` time NOT NULL,
  `maestro` int(11) NOT NULL,
  `lugar` varchar(100) NOT NULL,
  `location` varchar(300) DEFAULT NULL,
  `dias` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `curso` int(11) NOT NULL,
  `creado_en` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `actualizado_en` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_clases_maestros` (`maestro`),
  KEY `FK_clases_curso` (`curso`),
  CONSTRAINT `FK_clases_curso` FOREIGN KEY (`curso`) REFERENCES `cursos` (`id`),
  CONSTRAINT `FK_clases_maestros` FOREIGN KEY (`maestro`) REFERENCES `maestros` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla taekwondo.clases: ~2 rows (aproximadamente)
DELETE FROM `clases`;
/*!40000 ALTER TABLE `clases` DISABLE KEYS */;
INSERT INTO `clases` (`id`, `fecha_inicio`, `fecha_fin`, `hora_entrada`, `hora_salida`, `maestro`, `lugar`, `location`, `dias`, `curso`, `creado_en`, `actualizado_en`) VALUES
	(1, '2019-06-15', '2019-05-15', '09:00:00', '12:00:00', 1, '?', '', '["Lunes", "Miercoles", "Viernes"]', 1, '2019-05-19 09:31:14', '2019-05-27 22:17:24'),
	(2, '2019-06-17', '2019-05-15', '09:00:00', '12:00:00', 1, '?', NULL, '["Martes", "Jueves"]', 1, '2019-05-19 09:31:14', '2019-05-27 22:17:31');
/*!40000 ALTER TABLE `clases` ENABLE KEYS */;

-- Volcando estructura para tabla taekwondo.contacto
DROP TABLE IF EXISTS `contacto`;
CREATE TABLE IF NOT EXISTS `contacto` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `telefono` char(10) DEFAULT NULL,
  `asunto` varchar(100) DEFAULT NULL,
  `mensaje` text NOT NULL,
  `creado_en` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COMMENT='En esta tabla se almacenaran los detalles del formulario de contacto en la pagina principal, cada vez que este sea envuado';

-- Volcando datos para la tabla taekwondo.contacto: ~15 rows (aproximadamente)
DELETE FROM `contacto`;
/*!40000 ALTER TABLE `contacto` DISABLE KEYS */;
INSERT INTO `contacto` (`id`, `nombre`, `email`, `telefono`, `asunto`, `mensaje`, `creado_en`) VALUES
	(1, 'Luis', 'luis@luis.conm', '8294260265', 'Asunto', 'Hi!', '2019-05-19 13:49:02'),
	(2, 'Luis', 'luis@luis.conm', '8294260265', 'Asunto', 'Hi!', '2019-05-19 13:49:21'),
	(3, 'Luis', 'luis@luis.conm', '8294260265', 'Asunto', 'Hi!', '2019-05-19 13:51:21'),
	(4, 'Luis', 'luis@luis.conm', '8090000001', 'Asunto', 'Hi!', '2019-05-19 13:52:55'),
	(5, 'Luis', 'luis@luis.conm', '8090000001', 'Asunto', 'Hi!', '2019-05-19 13:54:50'),
	(6, 'Luis', 'luis@luis.conm', '8090000001', 'Asunto', 'Hi!', '2019-05-19 13:55:03'),
	(7, 'Luis', 'luis@luis.conm', '8090000001', 'Asunto', 'Hi!', '2019-05-19 14:05:17'),
	(8, 'Luis', 'luis@luis.conm', '8090000001', 'Asunto', 'Hi!', '2019-05-19 14:05:39'),
	(9, 'Luis', 'luis@luis.conm', '8090000001', 'Asunto', 'Hi!', '2019-05-19 14:06:04'),
	(10, 'Luis', 'email@email.com', '8090000001', 'Asunto', 'Hi!', '2019-05-19 14:38:57'),
	(11, 'Luis', 'email@email.com', '8090000001', 'Asunto', 'Hi!', '2019-05-19 14:45:02'),
	(12, 'Luis', 'email@email.com', '8090000001', 'Asunto', 'Hi!', '2019-05-19 14:46:27'),
	(13, 'Luis', 'email@email.com', '8098098098', NULL, 'Hi!', '2019-05-19 14:47:51'),
	(14, 'Luis', 'email@email.com', NULL, NULL, 'Hi!', '2019-05-19 14:49:38'),
	(15, 'Luis David Santiago Santana', 'luisdavidsantiagosantana@gmail.com', '8294260265', 'Solicitud de informacion', 'Hi!', '2019-05-26 14:49:44');
/*!40000 ALTER TABLE `contacto` ENABLE KEYS */;

-- Volcando estructura para tabla taekwondo.cursos
DROP TABLE IF EXISTS `cursos`;
CREATE TABLE IF NOT EXISTS `cursos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `imagen` varchar(600) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `precio_inscripcion` double NOT NULL,
  `precio_mensualidad` double NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1',
  `creado_en` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `actualizado_en` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Tabla donde se almacenara una lista de cursos que la institucion imparte, la lista sera mostrada en la pagina web y a partir de la misma se crearan los registros en la tabla *clases*';

-- Volcando datos para la tabla taekwondo.cursos: ~2 rows (aproximadamente)
DELETE FROM `cursos`;
/*!40000 ALTER TABLE `cursos` DISABLE KEYS */;
INSERT INTO `cursos` (`id`, `nombre`, `imagen`, `descripcion`, `precio_inscripcion`, `precio_mensualidad`, `estado`, `creado_en`, `actualizado_en`) VALUES
	(1, 'Karate', '/images/bg-video.jpeg', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rerum tenetur tempora iste doloremque excepturi eum, ipsa quia veritatis dicta?', 0, 0, 1, '2019-05-19 09:31:52', '2019-05-26 11:15:33'),
	(2, 'Taekwondo', '/images/bg-consultas.jpg', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rerum tenetur tempora iste doloremque excepturi eum, ipsa quia veritatis dicta?', 0, 0, 1, '2019-05-19 09:31:52', '2019-05-26 11:15:42');
/*!40000 ALTER TABLE `cursos` ENABLE KEYS */;

-- Volcando estructura para tabla taekwondo.datos
DROP TABLE IF EXISTS `datos`;
CREATE TABLE IF NOT EXISTS `datos` (
  `email` varchar(50) NOT NULL,
  `telefono` char(10) NOT NULL,
  `direccion` varchar(200) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `location` varchar(300) NOT NULL,
  `url` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Aqui se almacenaran los datos del colegio, como numero telefonico y correo.';

-- Volcando datos para la tabla taekwondo.datos: ~0 rows (aproximadamente)
DELETE FROM `datos`;
/*!40000 ALTER TABLE `datos` DISABLE KEYS */;
INSERT INTO `datos` (`email`, `telefono`, `direccion`, `nombre`, `location`, `url`) VALUES
	('luis@binardom.com', '8090000000', 'Alguna direccion en algun sitio ', 'TKD Renacimiento', 'https://goo.gl/maps/xUpU8M9JGZGS5P476', 'http://taekwondoschool.ddns.net/');
/*!40000 ALTER TABLE `datos` ENABLE KEYS */;

-- Volcando estructura para tabla taekwondo.estados_pago
DROP TABLE IF EXISTS `estados_pago`;
CREATE TABLE IF NOT EXISTS `estados_pago` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla taekwondo.estados_pago: ~4 rows (aproximadamente)
DELETE FROM `estados_pago`;
/*!40000 ALTER TABLE `estados_pago` DISABLE KEYS */;
INSERT INTO `estados_pago` (`id`, `nombre`) VALUES
	(1, 'Procesado'),
	(2, 'Pendiente de confirmacion'),
	(3, 'Rechazado'),
	(4, 'No pagado');
/*!40000 ALTER TABLE `estados_pago` ENABLE KEYS */;

-- Volcando estructura para tabla taekwondo.eventos
DROP TABLE IF EXISTS `eventos`;
CREATE TABLE IF NOT EXISTS `eventos` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `lugar` varchar(200) NOT NULL,
  `imagen` varchar(200) NOT NULL,
  `creado_en` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `actualizado_en` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla taekwondo.eventos: ~3 rows (aproximadamente)
DELETE FROM `eventos`;
/*!40000 ALTER TABLE `eventos` DISABLE KEYS */;
INSERT INTO `eventos` (`id`, `nombre`, `descripcion`, `fecha`, `hora`, `lugar`, `imagen`, `creado_en`, `actualizado_en`) VALUES
	(1, 'Extra Vaganza', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Iusto molestias ipsa quas aliquid? Odit nisi, corporis deserunt eveniet adipisci assumenda nobis? Iure soluta nostrum fugit, porro aut sunt! Et, maxime.', '2019-07-12', '10:24:07', 'Hotel Embasy', '/images/eventos/1.jpg', '2019-05-12 22:24:20', '2019-06-03 00:13:06'),
	(2, 'Evento 1A', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Iusto molestias ipsa quas aliquid? Odit nisi, corporis deserunt eveniet adipisci assumenda nobis? Iure soluta nostrum fugit, porro aut sunt! Et, maxime.', '2019-07-12', '14:51:01', 'Estadio Olimpico', '/images/eventos/2.jpg', '2019-05-12 22:51:31', '2019-06-03 00:13:08'),
	(3, 'Evento 2A', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Iusto molestias ipsa quas aliquid? Odit nisi, corporis deserunt eveniet adipisci assumenda nobis? Iure soluta nostrum fugit, porro aut sunt! Et, maxime.', '2019-07-12', '09:00:00', 'Estaca San Jeronimo', '/images/eventos/3.jpg', '2019-05-12 22:53:27', '2019-06-03 00:13:10');
/*!40000 ALTER TABLE `eventos` ENABLE KEYS */;

-- Volcando estructura para tabla taekwondo.historial
DROP TABLE IF EXISTS `historial`;
CREATE TABLE IF NOT EXISTS `historial` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(6) NOT NULL,
  `tabla` varchar(30) NOT NULL,
  `usuario` bigint(20) NOT NULL,
  `antes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'Captura el estado de la tabla o registro antes del cambio',
  `despues` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'Captura el estado de la tabla o registro despues del cambio',
  `creado_en` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Indica la fecha y la hora en la que se realizo la accion de cambio',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Aqui se almacenaran cambios en la base de datos (DELETE, UPDATE, ALTER)';

-- Volcando datos para la tabla taekwondo.historial: ~0 rows (aproximadamente)
DELETE FROM `historial`;
/*!40000 ALTER TABLE `historial` DISABLE KEYS */;
/*!40000 ALTER TABLE `historial` ENABLE KEYS */;

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
  `cinturon` tinyint(1) NOT NULL,
  `creado_en` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `actualizado_en` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_maestro_cinturon` (`cinturon`),
  CONSTRAINT `FK_maestro_cinturon` FOREIGN KEY (`cinturon`) REFERENCES `cinturones` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla taekwondo.maestros: ~0 rows (aproximadamente)
DELETE FROM `maestros`;
/*!40000 ALTER TABLE `maestros` DISABLE KEYS */;
INSERT INTO `maestros` (`id`, `nombres`, `apellidos`, `cedula`, `foto`, `tel`, `email`, `direccion`, `cinturon`, `creado_en`, `actualizado_en`) VALUES
	(1, 'Saul', 'Perez', '10428534678', 'https://asdfasdf', '8090000000', 'email@email.com', '?', 1, '2019-05-19 09:34:00', '2019-05-19 09:34:44');
/*!40000 ALTER TABLE `maestros` ENABLE KEYS */;

-- Volcando estructura para tabla taekwondo.newsletter
DROP TABLE IF EXISTS `newsletter`;
CREATE TABLE IF NOT EXISTS `newsletter` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(60) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1',
  `creado_en` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `actualizado_en` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='Almacena los correos de los clientes o potenciales clientes que quieren recibir por correo onformacion de ofertas.';

-- Volcando datos para la tabla taekwondo.newsletter: ~3 rows (aproximadamente)
DELETE FROM `newsletter`;
/*!40000 ALTER TABLE `newsletter` DISABLE KEYS */;
INSERT INTO `newsletter` (`id`, `email`, `estado`, `creado_en`, `actualizado_en`) VALUES
	(1, 'david@vaca.do', 1, '2019-05-26 15:52:37', '2019-06-02 23:07:40'),
	(3, 'david@vaca.dos', 1, '2019-05-26 15:53:22', '2019-05-26 15:53:22'),
	(4, 'david@vaca', 1, '2019-05-26 15:53:30', '2019-05-26 15:53:30');
/*!40000 ALTER TABLE `newsletter` ENABLE KEYS */;

-- Volcando estructura para tabla taekwondo.observaciones
DROP TABLE IF EXISTS `observaciones`;
CREATE TABLE IF NOT EXISTS `observaciones` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `observacion` text NOT NULL,
  `alumno` bigint(20) NOT NULL,
  `maestro` int(11) NOT NULL,
  `creado_en` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `actualizado_en` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_observacion_alumno` (`alumno`),
  KEY `FK_observacion_maestro` (`maestro`),
  CONSTRAINT `FK_observacion_alumno` FOREIGN KEY (`alumno`) REFERENCES `alumnos` (`id`),
  CONSTRAINT `FK_observacion_maestro` FOREIGN KEY (`maestro`) REFERENCES `maestros` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla taekwondo.observaciones: ~0 rows (aproximadamente)
DELETE FROM `observaciones`;
/*!40000 ALTER TABLE `observaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `observaciones` ENABLE KEYS */;

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
  `creado_en` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `actualizado_en` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cedula` (`cedula`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla taekwondo.padres: ~0 rows (aproximadamente)
DELETE FROM `padres`;
/*!40000 ALTER TABLE `padres` DISABLE KEYS */;
INSERT INTO `padres` (`id`, `nombres`, `apellidos`, `cedula`, `foto`, `tel`, `email`, `direccion`, `creado_en`, `actualizado_en`) VALUES
	(1, 'Juan', 'Lorenzo', '10223483921', 'https://abc.net', '8090000000', 'email@email.com', 'Algun lado', '2019-05-19 09:42:13', '2019-05-19 09:42:13');
/*!40000 ALTER TABLE `padres` ENABLE KEYS */;

-- Volcando estructura para tabla taekwondo.pagos
DROP TABLE IF EXISTS `pagos`;
CREATE TABLE IF NOT EXISTS `pagos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alumno` int(11) NOT NULL,
  `foto` varchar(50) DEFAULT NULL,
  `tipo` tinyint(1) NOT NULL,
  `fecha_pago` datetime NOT NULL,
  `monto` double NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `creado_en` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `actualizado_en` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_pagos_tipo_pago` (`tipo`),
  KEY `FK_pagos_estado` (`estado`),
  CONSTRAINT `FK_pagos_estado` FOREIGN KEY (`estado`) REFERENCES `estados_pago` (`id`),
  CONSTRAINT `FK_pagos_tipo_pago` FOREIGN KEY (`tipo`) REFERENCES `tipos_pago` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla taekwondo.pagos: ~0 rows (aproximadamente)
DELETE FROM `pagos`;
/*!40000 ALTER TABLE `pagos` DISABLE KEYS */;
/*!40000 ALTER TABLE `pagos` ENABLE KEYS */;

-- Volcando estructura para tabla taekwondo.permisos
DROP TABLE IF EXISTS `permisos`;
CREATE TABLE IF NOT EXISTS `permisos` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Lista de permisos y su respectiva descripcion';

-- Volcando datos para la tabla taekwondo.permisos: ~0 rows (aproximadamente)
DELETE FROM `permisos`;
/*!40000 ALTER TABLE `permisos` DISABLE KEYS */;
/*!40000 ALTER TABLE `permisos` ENABLE KEYS */;

-- Volcando estructura para tabla taekwondo.permisos_de_rol
DROP TABLE IF EXISTS `permisos_de_rol`;
CREATE TABLE IF NOT EXISTS `permisos_de_rol` (
  `permiso` tinyint(4) NOT NULL,
  `rol` tinyint(4) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1',
  UNIQUE KEY `permiso_rol` (`permiso`,`rol`),
  KEY `FK_permiso_rol` (`rol`),
  CONSTRAINT `FK_permiso_permiso` FOREIGN KEY (`permiso`) REFERENCES `permisos` (`id`),
  CONSTRAINT `FK_permiso_rol` FOREIGN KEY (`rol`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla taekwondo.permisos_de_rol: ~0 rows (aproximadamente)
DELETE FROM `permisos_de_rol`;
/*!40000 ALTER TABLE `permisos_de_rol` DISABLE KEYS */;
/*!40000 ALTER TABLE `permisos_de_rol` ENABLE KEYS */;

-- Volcando estructura para tabla taekwondo.roles
DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1',
  `creado_en` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `actualizado_en` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Los roles tendran permisos especificos sobre la aplicacion, es decir, un rol *Administrador* podra acceder a todas partes y hacer todos los cambios necesarios en la aplicacion, un rol *Cliente* solo podra acceder a la pagina web y a su respectivo perfil, y asi susecibamente, la tabla *permiso_de_rol* detalla cuales permisos tiene cada rol';

-- Volcando datos para la tabla taekwondo.roles: ~4 rows (aproximadamente)
DELETE FROM `roles`;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`id`, `nombre`, `estado`, `creado_en`, `actualizado_en`) VALUES
	(1, 'Cliente', 1, '2019-05-19 09:43:37', '2019-05-19 09:43:37'),
	(2, 'Administrador', 1, '2019-05-19 09:43:37', '2019-05-19 09:43:37'),
	(3, 'Contable', 1, '2019-05-19 09:43:37', '2019-05-19 09:43:37'),
	(4, 'Secretaria', 1, '2019-05-19 09:43:37', '2019-05-19 09:43:37');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

-- Volcando estructura para tabla taekwondo.sessions
DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) unsigned NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla taekwondo.sessions: ~5 rows (aproximadamente)
DELETE FROM `sessions`;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` (`session_id`, `expires`, `data`) VALUES
	('074EDHFErHnYoSbaSud6xuYwqWjl9C5s', 1562000181, '{"cookie":{"originalMaxAge":null,"expires":null,"httpOnly":true,"path":"/"}}'),
	('CjBr-U8RB_YbwttCWEzl3QnThPH5w6Fa', 1562272791, '{"cookie":{"originalMaxAge":null,"expires":null,"httpOnly":true,"path":"/"}}'),
	('I4FfOcsdol_o9wi0dRExS5RMOEYAs2rw', 1561389290, '{"cookie":{"originalMaxAge":null,"expires":null,"httpOnly":true,"path":"/"}}'),
	('gTogMNuarS8OThZyA73Ip1oVIowwKFYm', 1562000337, '{"cookie":{"originalMaxAge":null,"expires":null,"httpOnly":true,"path":"/"}}'),
	('hVvaY0cOmTSaBW5IQ5uT7VOInh3yLecK', 1562000214, '{"cookie":{"originalMaxAge":null,"expires":null,"httpOnly":true,"path":"/"}}');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;

-- Volcando estructura para tabla taekwondo.slides
DROP TABLE IF EXISTS `slides`;
CREATE TABLE IF NOT EXISTS `slides` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  `descripcion` varchar(300) NOT NULL,
  `imagen` varchar(400) NOT NULL,
  `texto_boton` varchar(50) DEFAULT NULL,
  `link_boton` varchar(200) DEFAULT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='El contenido de esta tabla sera usado para renderizar el slider principal en la pagina home';

-- Volcando datos para la tabla taekwondo.slides: ~3 rows (aproximadamente)
DELETE FROM `slides`;
/*!40000 ALTER TABLE `slides` DISABLE KEYS */;
INSERT INTO `slides` (`id`, `titulo`, `descripcion`, `imagen`, `texto_boton`, `link_boton`, `estado`) VALUES
	(1, 'TAEKWONDO', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rerum tenetur tempora iste doloremque excepturi eum, ipsa quia veritatis dicta? Perferendis quo temporibus libero laboriosam voluptas id nulla harum impedit voluptatum.', '/images/slider/1.jpg', 'Lorem', '#', 1),
	(2, 'asdfasdf', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rerum tenetur tempora iste doloremque excepturi eum, ipsa quia veritatis dicta? Perferendis quo temporibus libero laboriosam voluptas id nulla harum impedit voluptatum.', '/images/slider/2.jpg', 'Lorem', '#', 1),
	(3, 'asd asd asdf', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rerum tenetur tempora iste doloremque excepturi eum, ipsa quia veritatis dicta? Perferendis quo temporibus libero laboriosam voluptas id nulla harum impedit voluptatum.', '/images/slider/3.jpg', 'Lorem', '#', 1);
/*!40000 ALTER TABLE `slides` ENABLE KEYS */;

-- Volcando estructura para tabla taekwondo.team
DROP TABLE IF EXISTS `team`;
CREATE TABLE IF NOT EXISTS `team` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL COMMENT 'Nombre completo de la persona',
  `cargo` varchar(50) NOT NULL COMMENT 'Cargo dentro del colegio',
  `email` varchar(50) NOT NULL,
  `facebook` varchar(100) DEFAULT NULL,
  `instagram` varchar(100) DEFAULT NULL,
  `youtube` varchar(100) DEFAULT NULL,
  `twitter` varchar(100) DEFAULT NULL,
  `creado_en` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `actualizado_en` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Tabla con la lista de personas a mostrar en la seccion *Nuestro equipo* de la pagina web';

-- Volcando datos para la tabla taekwondo.team: ~2 rows (aproximadamente)
DELETE FROM `team`;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` (`id`, `nombre`, `cargo`, `email`, `facebook`, `instagram`, `youtube`, `twitter`, `creado_en`, `actualizado_en`) VALUES
	(1, 'Basilio Guzan', 'Director Ejecutivo', '', 'https://www.facebook.com/bg', NULL, NULL, NULL, '2019-05-19 09:13:23', '2019-05-19 09:13:23'),
	(2, 'Arianny Tavarez', 'Secretaria General', '', 'https://www.facebook.com/at', NULL, NULL, NULL, '2019-05-19 09:13:23', '2019-05-19 09:13:23');
/*!40000 ALTER TABLE `team` ENABLE KEYS */;

-- Volcando estructura para tabla taekwondo.tipos_pago
DROP TABLE IF EXISTS `tipos_pago`;
CREATE TABLE IF NOT EXISTS `tipos_pago` (
  `id` tinyint(1) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla taekwondo.tipos_pago: ~3 rows (aproximadamente)
DELETE FROM `tipos_pago`;
/*!40000 ALTER TABLE `tipos_pago` DISABLE KEYS */;
INSERT INTO `tipos_pago` (`id`, `nombre`) VALUES
	(1, 'Efectivo'),
	(2, 'Tarjeta'),
	(3, 'Deposito');
/*!40000 ALTER TABLE `tipos_pago` ENABLE KEYS */;

-- Volcando estructura para tabla taekwondo.usuarios
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(200) NOT NULL,
  `imagen` varchar(400) DEFAULT NULL,
  `rol` tinyint(4) NOT NULL COMMENT 'Es una forma de feterminar los permisos que tendra el usuario sobre la aplicacion.',
  `estado` tinyint(1) NOT NULL DEFAULT '1',
  `creado_en` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `actualizado_en` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `FK_suario_rol` (`rol`),
  CONSTRAINT `FK_suario_rol` FOREIGN KEY (`rol`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla taekwondo.usuarios: ~2 rows (aproximadamente)
DELETE FROM `usuarios`;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` (`id`, `nombre`, `email`, `password`, `imagen`, `rol`, `estado`, `creado_en`, `actualizado_en`) VALUES
	(1, 'Luis David Santiago Santana', 'luis@binardom.com', '$2a$10$iGVrPjgVwM1l1.CNdHw6.uO9YKu1B1XgcI5JVPlngElOzKzTStCIG', '/images/usuarios/IMG-20190401-WA0033.jpg', 1, 1, '2019-05-19 19:35:46', '2019-05-28 21:15:29'),
	(2, 'Administrador', 'admin@tks.com', '$2a$10$iGVrPjgVwM1l1.CNdHw6.uO9YKu1B1XgcI5JVPlngElOzKzTStCIG', NULL, 2, 1, '2019-05-26 13:49:03', '2019-05-26 13:49:10');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
