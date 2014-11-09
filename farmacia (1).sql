-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 31-10-2014 a las 20:58:49
-- Versión del servidor: 5.6.16
-- Versión de PHP: 5.5.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `farmacia`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallefactura`
--

CREATE TABLE IF NOT EXISTS `detallefactura` (
  `idFactura` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `precioVenta` decimal(10,2) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `iva` decimal(10,2) NOT NULL,
  PRIMARY KEY (`idFactura`,`idProducto`),
  KEY `idProducto_idx` (`idProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE IF NOT EXISTS `factura` (
  `idFactura` int(11) NOT NULL AUTO_INCREMENT,
  `idPersona` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `formaPago` varchar(45) NOT NULL,
  `idFarmaceutico` int(11) NOT NULL,
  PRIMARY KEY (`idFactura`),
  KEY `idPersona_fk_factura_idx` (`idPersona`),
  KEY `idFarmaceutico_fk_factura_idx` (`idFarmaceutico`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingresoproducto`
--

CREATE TABLE IF NOT EXISTS `ingresoproducto` (
  `idIngreso` int(11) NOT NULL AUTO_INCREMENT,
  `idProveedor` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `fecha` date NOT NULL,
  `fechaVencimiento` date NOT NULL,
  PRIMARY KEY (`idIngreso`),
  KEY `idProveedor_fk_ingreso_idx` (`idProveedor`),
  KEY `idProducto_fk_ingreso_idx` (`idProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE IF NOT EXISTS `persona` (
  `idPersona` int(11) NOT NULL AUTO_INCREMENT,
  `identificacion` varchar(20) NOT NULL,
  `tipoIdentificacion` varchar(45) NOT NULL,
  `nombres` varchar(60) NOT NULL,
  `pApellido` varchar(45) NOT NULL,
  `sApellido` varchar(45) DEFAULT NULL,
  `sexo` varchar(1) NOT NULL,
  `cumpleanios` date DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `direccion` varchar(70) NOT NULL,
  PRIMARY KEY (`idPersona`),
  UNIQUE KEY `identificacion_UNIQUE` (`identificacion`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`idPersona`, `identificacion`, `tipoIdentificacion`, `nombres`, `pApellido`, `sApellido`, `sexo`, `cumpleanios`, `telefono`, `direccion`) VALUES
(1, '000', 'CC', 'Administrador ', '1', NULL, 'M', '2014-08-06', '000', '...'),
(2, '111', 'CC', 'Generico', '0', '1', 'M', NULL, NULL, ''),
(4, '0', 'CC', 'USUARIO', 'GENERICO', 'UNO', 'M', '2014-12-31', '123', '123'),
(6, '49743167', 'CC', 'Maritza Cenith', 'Castillejo', 'Ruiz', 'F', '0000-00-00', '3108968617', 'CALLE 8 3A 02'),
(7, '36573581', 'CC', 'MAIRA XIMENA', 'LOPEZ', 'MIER', 'F', '1981-10-19', '3016571870', 'TRASV 9 N 9 18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `presentacionproducto`
--

CREATE TABLE IF NOT EXISTS `presentacionproducto` (
  `idPresentacion` int(11) NOT NULL AUTO_INCREMENT,
  `idProducto` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `cantidad` int(11) NOT NULL,
  PRIMARY KEY (`idPresentacion`),
  KEY `idProducto_fk_presentacion_idx` (`idProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE IF NOT EXISTS `producto` (
  `idProducto` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `iva` decimal(10,2) NOT NULL,
  `unidades` int(11) NOT NULL,
  `codigo` varchar(255) DEFAULT NULL,
  `unidadPrincipal` varchar(20) NOT NULL,
  `comision` decimal(10,2) NOT NULL,
  PRIMARY KEY (`idProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE IF NOT EXISTS `proveedor` (
  `idProveedor` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `nit` varchar(20) NOT NULL,
  `direccion` varchar(70) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  PRIMARY KEY (`idProveedor`),
  UNIQUE KEY `nit_UNIQUE` (`nit`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=60 ;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`idProveedor`, `nombre`, `descripcion`, `nit`, `direccion`, `telefono`) VALUES
(2, 'Bayer', 'hjkhkjh', '36573581', 'maria camiola norte', 'maria camiola n'),
(3, 'Jgb', 'huiou', '2554', 'bogot', 'bogot'),
(4, 'LA SANTE', 'UYUY', '12548766', 'GHG', 'GHG'),
(5, 'gerco', 'tjhyjy', '256', 'hnttjt', 'hnttjt'),
(6, 'MK', 'KLJHT', '4587', '267', '267'),
(7, 'sanofi aventis', 'suspensión frasco con 150ml', '6987453', '789445', '789445'),
(8, 'colgate palmolive', 'jkghfrdg', '67782', '2587', '2587'),
(9, 'gsk', 'rtreuoi', '69874', '69874532', '69874532'),
(10, 'supertex', 'dtfgyuhjk', '14597', '448569', '448569'),
(11, 'Grunenthal', 'dtfgyhjmkl', '758940', '32547', '32547'),
(12, 'boehringer ingelheim', 'dcfgvhjkl', '6857424', '74589613', '74589613'),
(13, 'P&G', 'EDRTFUYHJIK', '11000', '3456789', '3456789'),
(14, 'prebel ', '54553453', '4526896', '555333', '555333'),
(15, 'tecnoquimica', '266666', '001120', '66666666', '66666666'),
(16, 'garnier', '63868', '252278', '245245', '245245'),
(17, 'Schwarzkopf y Henkel', 'belleza', '15489200', 'calle 8', 'calle 8'),
(18, 'gerco s a', '553655122', '101215', '56154556', '56154556'),
(19, 'pfizer', '486453458', '44649', '1311', '1311'),
(20, 'novamed', '15564\n132', '4112123', '1', '1'),
(21, 'siegfried', '55111321', '15312', '60000000', '60000000'),
(22, 'zambon', '15', '496444552', '122', '122'),
(23, 'ECAR', 'jhgfsuibngu', '45251200', 'calle 10', 'calle 10'),
(24, 'LABINCO', 'jnorfnvn', '47896512', 'Bucaramanga', 'Bucaramanga'),
(25, 'Lomedicafarma', 'Pomada', '1457896', 'mjdjdk', 'mjdjdk'),
(26, 'Laproff', 'Genericos', '1478965', 'medellin', 'medellin'),
(27, 'BCN Medical', 'hdeyriot', '147852', 'Medellin', 'Medellin'),
(28, 'GENFAR', 'generico', '12360478', 'Bogota', 'Bogota'),
(29, 'Eterna', 'ahsyert', '12035446', 'Valledupar', 'Valledupar'),
(30, 'Chalver', 'conerial', '1024578', 'Bucaramanga', 'Bucaramanga'),
(31, 'Profamilia', 'salud', '0123644789', 'Bogota', 'Bogota'),
(32, 'Ethnor  Farmaceutica ', 'Comercial', '14785236410', 'colombia', 'colombia'),
(33, 'Colmed Internatonal', 'comercial', '147852369', 'colombia', 'colombia'),
(34, 'Lafrancol', 'Comercial', '09876543879', 'Bucaramanga', 'Bucaramanga'),
(35, 'bsn ', '46421221215', '466113311', '11312131313', '11312131313'),
(36, 'BIG MEDICAL ', '356443', '1113133', '4433', '4433'),
(37, 'farmionni', '431233123', '1123623', '000021134+', '000021134+'),
(38, 'coaspharma s a s', '515112331', '44533346', '22111222', '22111222'),
(39, 'medigen eu ', '15311333', '4111023', '1313', '1313'),
(40, 'sandoz', '5455222', '561311223', '45423113', '45423113'),
(41, 'farma de colombia', '1223343', '5474', '545555', '545555'),
(42, 'novamed ', '1', '212222.', '45', '45'),
(43, 'labquifar ltda', '44424', '11112133', '45433434', '45433434'),
(44, 'meck serono ', '131', '15512', '13131313', '13131313'),
(45, 'quibi sa', '1121122', '454443', '2233', '2233'),
(46, 'vogue s a', '133111111', '11111', '1333313', '1333313'),
(47, 'masglo', '12334', '222233', '3333', '3333'),
(48, 'bardot', '112333', '11222', '22343', '22343'),
(49, 'esmalte d`or ', '55555', '5555', '5555', '5555'),
(50, 'BF', '111111211', '12223', '11111', '11111'),
(51, 'belleza  exprees', '4444', '123', '44', '44'),
(52, 'belleza exprees', '4444', '234', '876', '876'),
(53, 'arruru', '1122222', '51122', '122333', '122333'),
(54, 'huggies', '111222', '4787', '122224', '122224'),
(55, 'infan-tec', '22', '112222', '222', '222'),
(56, 'thomas friends', '4554555', '854533', '75', '75'),
(57, 'walkid s', '45212', '455', '2222', '2222'),
(58, 'qutie', '4552', '212121123', '1011212', '1011212'),
(59, 'noor', '4224', '552424', '44144', '44144');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE IF NOT EXISTS `rol` (
  `idrol` varchar(5) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idrol`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`idrol`, `nombre`) VALUES
('A', 'Administrador'),
('C', 'Cliente'),
('F', 'Farmaceutico');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rolpersona`
--

CREATE TABLE IF NOT EXISTS `rolpersona` (
  `idPersona` int(11) NOT NULL,
  `idRol` varchar(5) NOT NULL,
  PRIMARY KEY (`idPersona`,`idRol`),
  KEY `idRol_fk_rolpersona_idx` (`idRol`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `rolpersona`
--

INSERT INTO `rolpersona` (`idPersona`, `idRol`) VALUES
(1, 'A'),
(2, 'A'),
(4, 'C'),
(6, 'F'),
(7, 'F');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `idPersona` int(11) NOT NULL,
  `usuario` varchar(45) NOT NULL,
  `clave` varchar(45) NOT NULL,
  PRIMARY KEY (`idPersona`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idPersona`, `usuario`, `clave`) VALUES
(1, 'admin', '5edb5e9ed01de3b6bf5d96f38650673412e0bef1'),
(2, 'factura', '3e03c4b1ae17e3f5847cc2ed6e90cdf1e82adf45');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detallefactura`
--
ALTER TABLE `detallefactura`
  ADD CONSTRAINT `idFactura_fk_detalle` FOREIGN KEY (`idFactura`) REFERENCES `factura` (`idFactura`) ON UPDATE CASCADE,
  ADD CONSTRAINT `idProducto` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `idFarmaceutico_fk_factura` FOREIGN KEY (`idFarmaceutico`) REFERENCES `persona` (`idPersona`) ON UPDATE CASCADE,
  ADD CONSTRAINT `idPersona_fk_factura` FOREIGN KEY (`idPersona`) REFERENCES `persona` (`idPersona`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `ingresoproducto`
--
ALTER TABLE `ingresoproducto`
  ADD CONSTRAINT `idProducto_fk_ingreso` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`) ON UPDATE CASCADE,
  ADD CONSTRAINT `idProveedor_fk_ingreso` FOREIGN KEY (`idProveedor`) REFERENCES `proveedor` (`idProveedor`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `presentacionproducto`
--
ALTER TABLE `presentacionproducto`
  ADD CONSTRAINT `idProducto_fk_presentacion` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `rolpersona`
--
ALTER TABLE `rolpersona`
  ADD CONSTRAINT `idPersona_fk_rolpersona` FOREIGN KEY (`idPersona`) REFERENCES `persona` (`idPersona`) ON UPDATE CASCADE,
  ADD CONSTRAINT `idRol_fk_rolpersona` FOREIGN KEY (`idRol`) REFERENCES `rol` (`idrol`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `idPersona_fk_usuario` FOREIGN KEY (`idPersona`) REFERENCES `persona` (`idPersona`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
