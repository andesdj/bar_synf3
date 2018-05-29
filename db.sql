-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.1.21-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win32
-- HeidiSQL Versión:             9.5.0.5278
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para barandes
CREATE DATABASE IF NOT EXISTS `barandes` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `barandes`;

-- Volcando estructura para tabla barandes.categoria
CREATE TABLE IF NOT EXISTS `categoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla barandes.categoria: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
REPLACE INTO `categoria` (`id`, `nombre`, `descripcion`, `foto`) VALUES
	(1, 'Pescados', '<p>Platos de Pescados y mariscos, pescados de mar, de Rio, comida mediterranea</p>', '54e75ea0345ba808ae8f3de9c1a415b1.jpeg'),
	(2, 'Carnes', '<p>Exquisitos platos de&nbsp;Carnes &nbsp;rojas , adados, parrillas, horneados, Res, cerdo, cordero</p>', '1fb03d5c07c988a70f39bf6a6533792d.jpeg'),
	(3, 'Colombiana', '<p>Platos&nbsp;Tipicos Colombia</p>', 'bdddf647a6506327fc2cfe51a6173028.jpeg');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;

-- Volcando estructura para tabla barandes.ingrediente
CREATE TABLE IF NOT EXISTS `ingrediente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla barandes.ingrediente: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `ingrediente` DISABLE KEYS */;
REPLACE INTO `ingrediente` (`id`, `nombre`) VALUES
	(1, 'Lomo  de res 300 gr'),
	(2, 'Trucha de 300 gr'),
	(3, 'Tomates rojos'),
	(4, 'Filete de Róbalo 250 gr'),
	(5, '1 Cebolla cabezona blanca y roja');
/*!40000 ALTER TABLE `ingrediente` ENABLE KEYS */;

-- Volcando estructura para tabla barandes.ingredientes_tapas
CREATE TABLE IF NOT EXISTS `ingredientes_tapas` (
  `id` int(11) NOT NULL,
  `ingredientes` int(11) NOT NULL,
  PRIMARY KEY (`id`,`ingredientes`),
  KEY `IDX_C6DD2FC0BF396750` (`id`),
  KEY `IDX_C6DD2FC0E1BE46CC` (`ingredientes`),
  CONSTRAINT `FK_C6DD2FC0BF396750` FOREIGN KEY (`id`) REFERENCES `tapa` (`id`),
  CONSTRAINT `FK_C6DD2FC0E1BE46CC` FOREIGN KEY (`ingredientes`) REFERENCES `ingrediente` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla barandes.ingredientes_tapas: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `ingredientes_tapas` DISABLE KEYS */;
REPLACE INTO `ingredientes_tapas` (`id`, `ingredientes`) VALUES
	(7, 2),
	(7, 3);
/*!40000 ALTER TABLE `ingredientes_tapas` ENABLE KEYS */;

-- Volcando estructura para tabla barandes.tapa
CREATE TABLE IF NOT EXISTS `tapa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fechaCreacion` datetime NOT NULL,
  `top` tinyint(1) NOT NULL,
  `categoria_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_998661F83397707A` (`categoria_id`),
  CONSTRAINT `FK_998661F83397707A` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla barandes.tapa: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `tapa` DISABLE KEYS */;
REPLACE INTO `tapa` (`id`, `nombre`, `descripcion`, `foto`, `fechaCreacion`, `top`, `categoria_id`) VALUES
	(1, 'Lomo  Asado', '<p><strong>Filete de Lomillo Asado</strong> Silvestre con Vino , papas &nbsp;al vapor y &nbsp;salsas de la casa</p>', '8fc26a1f83cf3f3c19ec9b2eeee964a8.jpeg', '2018-05-25 15:45:30', 1, 2),
	(2, 'Sandwich trifasico', '<p>Sandwich Gourmet de Pollo, carne, cerdo, huevo asado con pan ali&ntilde;ado<br />\r\n&nbsp;</p>', '78576d6de443553baea423b63192b8ef.jpeg', '2018-05-25 16:12:16', 1, 3),
	(3, 'Trucha Al Horno', '<p>Trucha Al Horno &nbsp;sazonada con salsa sy especias de la casa, ali&ntilde;ada con vino blanco y cream de leche y ajo<br />\r\n&nbsp;</p>', 'dad820e97d5911d4b6c213693449c60f.jpeg', '2018-05-25 16:12:39', 1, 1),
	(4, 'Robalo a la Marinera', '<p>Filete de robalo asado con anillos de calamar<br />\r\n&nbsp;</p>', '0a0801a8d4059316fd7711ddd55a693d.jpeg', '2018-05-25 16:13:01', 1, 1),
	(5, 'Cazuela montañera', '<p>Frijoles al estilo Antioque&ntilde;o con &nbsp;arroz aguacate y carne&nbsp;</p>', '0ce2b30706f4480459f56438321d1a98.jpeg', '2018-05-25 16:13:28', 1, 3),
	(6, 'Pollo asado en hierbas', '<p>Pollo asado en hierbas con papas</p>', 'f7a1358947dd79527ebb6ae71aff3ed3.jpeg', '2018-05-28 10:19:48', 1, 2),
	(7, 'Trucha con tomates', '<p>De todo</p>', 'e94a1a8dac53696ec40c1722ea001eb6.jpeg', '2018-05-28 13:51:55', 1, 1);
/*!40000 ALTER TABLE `tapa` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
