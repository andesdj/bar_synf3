-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.1.21-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win32
-- HeidiSQL Versión:             9.5.0.5273
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla barandes.tapa: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tapa` DISABLE KEYS */;
REPLACE INTO `tapa` (`id`, `nombre`, `descripcion`, `ingredientes`, `foto`, `fechaCreacion`, `top`) VALUES
	(1, 'Lomillo Asado', 'Lomillo Asado Silvestre con Vino ', '1 Carne de 300 gr', '', '2018-05-22 12:00:00', 0),
	(2, 'Sandwtich Gourmet', 'Sandwtich Gourmet de Pollo, carne, cerdo, huevo asado con pan aliñado', '1 pan aliñado, carne 100 gr, pollo 100 gr, tocineta 50 gr, huevos', '', '2018-05-22 12:00:00', 0);
/*!40000 ALTER TABLE `tapa` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
