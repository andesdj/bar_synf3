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

-- Volcando estructura para tabla barandes.tapa
CREATE TABLE IF NOT EXISTS `tapa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `ingredientes` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fechaCreacion` datetime NOT NULL,
  `top` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla barandes.tapa: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `tapa` DISABLE KEYS */;
REPLACE INTO `tapa` (`id`, `nombre`, `descripcion`, `ingredientes`, `foto`, `fechaCreacion`, `top`) VALUES
	(1, 'Lomo  Asado', '<p><strong>Filete de Lomillo Asado</strong> Silvestre con Vino , papas &nbsp;al vapor y &nbsp;salsas de la casa</p>', '1 Carne de 300 gr  6 papas medianas, 1 vino tinto  -SAl, pimienta y especias', '8fc26a1f83cf3f3c19ec9b2eeee964a8.jpeg', '2018-05-25 15:45:30', 1),
	(2, 'Sandwich 3 carnes', '<p>Sandwich Gourmet de Pollo, carne, cerdo, huevo asado con pan ali&ntilde;ado<br />\r\n&nbsp;</p>', '1 pan aliñado mediano, carne 100 gr, pollo 100 gr, tocineta 50 gr, huevos', '78576d6de443553baea423b63192b8ef.jpeg', '2018-05-25 16:12:16', 0),
	(3, 'Trucha Al Horno', '<p>Trucha Al Horno &nbsp;sazonada con salsa sy especias de la casa, ali&ntilde;ada con vino blanco y cream de leche y ajo<br />\r\n&nbsp;</p>', '1 Trucha de 300 gr, pimenton, cebolla, mantequilla, aceite de oliva', 'dad820e97d5911d4b6c213693449c60f.jpeg', '2018-05-25 16:12:39', 1),
	(4, 'Robalo a la Marinera', '<p>Filete de robalo asado con anillos de calamar<br />\r\n&nbsp;</p>', '1 Filete de robalo de 350gr , 1 Lb de anillos de calamar, cebolla pimenton, vino blanco ajos sal', '0a0801a8d4059316fd7711ddd55a693d.jpeg', '2018-05-25 16:13:01', 1),
	(5, 'Cazuela montañera', '<p>Frijoles al estilo Antioque&ntilde;o con &nbsp;arroz aguacate y carne&nbsp;</p>', '1 Frijol rojo 300 gr arroz, aguacate, chicarron  1 lb de carne de cerdo', '0ce2b30706f4480459f56438321d1a98.jpeg', '2018-05-25 16:13:28', 0);
/*!40000 ALTER TABLE `tapa` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
