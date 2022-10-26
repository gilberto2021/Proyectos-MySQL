-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-10-2022 a las 06:19:21
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `controlhorario`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `Categ_ID` smallint(4) UNSIGNED NOT NULL,
  `Categ_Nombre` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `controhorario_nov`
--

CREATE TABLE `controhorario_nov` (
  `CHN_ID` int(10) UNSIGNED NOT NULL,
  `CHN_Fecha` date NOT NULL,
  `CHN_InfraccionID` smallint(3) UNSIGNED NOT NULL,
  `CHN_EmpleadoID` int(10) UNSIGNED NOT NULL,
  `CHN_Horas` tinyint(2) UNSIGNED NOT NULL,
  `CHN_Minutos` tinyint(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `controlhorario_excepciones`
--

CREATE TABLE `controlhorario_excepciones` (
  `CHE_ID` int(10) UNSIGNED NOT NULL,
  `CHE_EmpleadoID` int(10) UNSIGNED NOT NULL,
  `CHE_FechaD` date NOT NULL,
  `CHE_FechaH` date NOT NULL,
  `CHE_NovedadID` smallint(4) UNSIGNED NOT NULL,
  `CHE_Horas` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `controlhorario_mov`
--

CREATE TABLE `controlhorario_mov` (
  `CHM_ID` bigint(10) UNSIGNED NOT NULL,
  `CHM_Fecha` date NOT NULL,
  `CHM_Hora` time NOT NULL,
  `CHM_EmpID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `controlhorario_res`
--

CREATE TABLE `controlhorario_res` (
  `CHR_ID` bigint(10) UNSIGNED NOT NULL,
  `CHR_Fecha` date NOT NULL,
  `CHR_Horas` tinyint(2) UNSIGNED NOT NULL,
  `CHR_EmpleadoID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `Emp_ID` int(10) UNSIGNED NOT NULL,
  `Emp_Apellido` varchar(60) NOT NULL,
  `Emp_Nombre` varchar(100) NOT NULL,
  `Emp_FechaNacimiento` date NOT NULL,
  `Emp_FechadeAlta` date NOT NULL,
  `Emp_FechadeBaja` date NOT NULL,
  `Emp_EstadoID` tinyint(2) UNSIGNED NOT NULL DEFAULT 1,
  `Emp_LocalidadID` int(10) UNSIGNED NOT NULL,
  `Emp_CategoríaID` smallint(4) UNSIGNED NOT NULL,
  `Emp_SectorID` smallint(3) UNSIGNED NOT NULL,
  `Emp_SalarioID` decimal(10,0) UNSIGNED NOT NULL DEFAULT 0,
  `Emp_PoliticaHorariaID` smallint(5) UNSIGNED NOT NULL,
  `Emp_Domicilio` varchar(150) NOT NULL,
  `Emp_Email` varchar(80) NOT NULL,
  `Emp_Telefono` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

CREATE TABLE `estados` (
  `Estado_ID` tinyint(2) UNSIGNED NOT NULL,
  `Estado_Descripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `infracciones`
--

CREATE TABLE `infracciones` (
  `Infrac_ID` smallint(3) UNSIGNED NOT NULL,
  `Infrac_Nombre` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `localidades`
--

CREATE TABLE `localidades` (
  `Local_ID` int(10) UNSIGNED NOT NULL,
  `Local_ProvinID` mediumint(8) UNSIGNED NOT NULL,
  `Local_Nombre` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `novedades`
--

CREATE TABLE `novedades` (
  `Noved_ID` smallint(4) UNSIGNED NOT NULL,
  `Noved_Descripcion` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paises`
--

CREATE TABLE `paises` (
  `Pais_ID` tinyint(3) UNSIGNED NOT NULL,
  `Pais_Nombre` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `politicahoraria`
--

CREATE TABLE `politicahoraria` (
  `PH_ID` smallint(5) UNSIGNED NOT NULL,
  `PH_HorarioFlexible` bit(1) NOT NULL,
  `PH_Nombre` varchar(45) NOT NULL,
  `PH_Estado` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `politicahoraria_detalle`
--

CREATE TABLE `politicahoraria_detalle` (
  `PHD_ID` mediumint(6) UNSIGNED NOT NULL,
  `PHD_PHID` smallint(5) UNSIGNED NOT NULL,
  `PHD_DiaSemana` tinyint(1) UNSIGNED NOT NULL,
  `PHD_HoraD` time NOT NULL,
  `PHD_HoraH` time NOT NULL,
  `PHD_Horas` tinyint(2) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provincia`
--

CREATE TABLE `provincia` (
  `Provin_ID` mediumint(8) UNSIGNED NOT NULL,
  `Provin_PaisID` tinyint(3) UNSIGNED NOT NULL,
  `Provin_Nombre` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sectores`
--

CREATE TABLE `sectores` (
  `Sector_ID` smallint(3) UNSIGNED NOT NULL,
  `Sector_Nombre` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`Categ_ID`);

--
-- Indices de la tabla `controhorario_nov`
--
ALTER TABLE `controhorario_nov`
  ADD PRIMARY KEY (`CHN_ID`),
  ADD UNIQUE KEY `CHN_InfraccionID` (`CHN_InfraccionID`),
  ADD UNIQUE KEY `CHN_EmpleadoID_2` (`CHN_EmpleadoID`),
  ADD KEY `CHN_Fecha` (`CHN_Fecha`),
  ADD KEY `CHN_EmpleadoID` (`CHN_EmpleadoID`);

--
-- Indices de la tabla `controlhorario_excepciones`
--
ALTER TABLE `controlhorario_excepciones`
  ADD PRIMARY KEY (`CHE_ID`),
  ADD KEY `CHE_EmpleadoID` (`CHE_EmpleadoID`),
  ADD KEY `CHE_NovedadID` (`CHE_NovedadID`);

--
-- Indices de la tabla `controlhorario_mov`
--
ALTER TABLE `controlhorario_mov`
  ADD PRIMARY KEY (`CHM_ID`),
  ADD KEY `CHM_Fecha` (`CHM_Fecha`),
  ADD KEY `CHM_EmpID` (`CHM_EmpID`);

--
-- Indices de la tabla `controlhorario_res`
--
ALTER TABLE `controlhorario_res`
  ADD PRIMARY KEY (`CHR_ID`),
  ADD KEY `CHR_EmpleadoID` (`CHR_EmpleadoID`),
  ADD KEY `CHR_Fecha` (`CHR_Fecha`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`Emp_ID`),
  ADD KEY `Emp_EstadoID` (`Emp_EstadoID`),
  ADD KEY `Emp_LocalidadID` (`Emp_LocalidadID`,`Emp_CategoríaID`,`Emp_SectorID`,`Emp_SalarioID`,`Emp_PoliticaHorariaID`),
  ADD KEY `FK_EMP_PH` (`Emp_PoliticaHorariaID`),
  ADD KEY `FK_EMP_Categorias` (`Emp_CategoríaID`),
  ADD KEY `FK_EMP_Sectores` (`Emp_SectorID`);

--
-- Indices de la tabla `estados`
--
ALTER TABLE `estados`
  ADD PRIMARY KEY (`Estado_ID`);

--
-- Indices de la tabla `infracciones`
--
ALTER TABLE `infracciones`
  ADD PRIMARY KEY (`Infrac_ID`);

--
-- Indices de la tabla `localidades`
--
ALTER TABLE `localidades`
  ADD PRIMARY KEY (`Local_ID`),
  ADD KEY `Local_ProvinID` (`Local_ProvinID`);

--
-- Indices de la tabla `novedades`
--
ALTER TABLE `novedades`
  ADD PRIMARY KEY (`Noved_ID`);

--
-- Indices de la tabla `paises`
--
ALTER TABLE `paises`
  ADD PRIMARY KEY (`Pais_ID`);

--
-- Indices de la tabla `politicahoraria`
--
ALTER TABLE `politicahoraria`
  ADD PRIMARY KEY (`PH_ID`);

--
-- Indices de la tabla `politicahoraria_detalle`
--
ALTER TABLE `politicahoraria_detalle`
  ADD PRIMARY KEY (`PHD_ID`),
  ADD KEY `PHD_PHID` (`PHD_PHID`);

--
-- Indices de la tabla `provincia`
--
ALTER TABLE `provincia`
  ADD PRIMARY KEY (`Provin_ID`),
  ADD KEY `Provin_PaisID` (`Provin_PaisID`);

--
-- Indices de la tabla `sectores`
--
ALTER TABLE `sectores`
  ADD PRIMARY KEY (`Sector_ID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `Categ_ID` smallint(4) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `controhorario_nov`
--
ALTER TABLE `controhorario_nov`
  MODIFY `CHN_ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `controlhorario_excepciones`
--
ALTER TABLE `controlhorario_excepciones`
  MODIFY `CHE_ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `controlhorario_mov`
--
ALTER TABLE `controlhorario_mov`
  MODIFY `CHM_ID` bigint(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `controlhorario_res`
--
ALTER TABLE `controlhorario_res`
  MODIFY `CHR_ID` bigint(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `Emp_ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estados`
--
ALTER TABLE `estados`
  MODIFY `Estado_ID` tinyint(2) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `infracciones`
--
ALTER TABLE `infracciones`
  MODIFY `Infrac_ID` smallint(3) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `localidades`
--
ALTER TABLE `localidades`
  MODIFY `Local_ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `novedades`
--
ALTER TABLE `novedades`
  MODIFY `Noved_ID` smallint(4) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `paises`
--
ALTER TABLE `paises`
  MODIFY `Pais_ID` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `politicahoraria`
--
ALTER TABLE `politicahoraria`
  MODIFY `PH_ID` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `politicahoraria_detalle`
--
ALTER TABLE `politicahoraria_detalle`
  MODIFY `PHD_ID` mediumint(6) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `provincia`
--
ALTER TABLE `provincia`
  MODIFY `Provin_ID` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sectores`
--
ALTER TABLE `sectores`
  MODIFY `Sector_ID` smallint(3) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `controhorario_nov`
--
ALTER TABLE `controhorario_nov`
  ADD CONSTRAINT `FK_CHN_Empleados` FOREIGN KEY (`CHN_EmpleadoID`) REFERENCES `empleados` (`Emp_ID`),
  ADD CONSTRAINT `FK_CHN_Infracciones` FOREIGN KEY (`CHN_InfraccionID`) REFERENCES `infracciones` (`Infrac_ID`);

--
-- Filtros para la tabla `controlhorario_excepciones`
--
ALTER TABLE `controlhorario_excepciones`
  ADD CONSTRAINT `FK_CHE_Empleados` FOREIGN KEY (`CHE_EmpleadoID`) REFERENCES `empleados` (`Emp_ID`),
  ADD CONSTRAINT `FK_CHE_Novedades` FOREIGN KEY (`CHE_NovedadID`) REFERENCES `novedades` (`Noved_ID`);

--
-- Filtros para la tabla `controlhorario_mov`
--
ALTER TABLE `controlhorario_mov`
  ADD CONSTRAINT `FK_CHM_Empleados` FOREIGN KEY (`CHM_EmpID`) REFERENCES `empleados` (`Emp_ID`);

--
-- Filtros para la tabla `controlhorario_res`
--
ALTER TABLE `controlhorario_res`
  ADD CONSTRAINT `FK_CHR_Empleados` FOREIGN KEY (`CHR_EmpleadoID`) REFERENCES `empleados` (`Emp_ID`);

--
-- Filtros para la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `FK_EMP-Localidad` FOREIGN KEY (`Emp_LocalidadID`) REFERENCES `localidades` (`Local_ID`),
  ADD CONSTRAINT `FK_EMP_Categorias` FOREIGN KEY (`Emp_CategoríaID`) REFERENCES `categorias` (`Categ_ID`),
  ADD CONSTRAINT `FK_EMP_Estado` FOREIGN KEY (`Emp_EstadoID`) REFERENCES `estados` (`Estado_ID`),
  ADD CONSTRAINT `FK_EMP_PH` FOREIGN KEY (`Emp_PoliticaHorariaID`) REFERENCES `politicahoraria` (`PH_ID`),
  ADD CONSTRAINT `FK_EMP_Sectores` FOREIGN KEY (`Emp_SectorID`) REFERENCES `sectores` (`Sector_ID`);

--
-- Filtros para la tabla `localidades`
--
ALTER TABLE `localidades`
  ADD CONSTRAINT `FK_Local_Provin` FOREIGN KEY (`Local_ProvinID`) REFERENCES `provincia` (`Provin_ID`);

--
-- Filtros para la tabla `politicahoraria_detalle`
--
ALTER TABLE `politicahoraria_detalle`
  ADD CONSTRAINT `FK_PHD_PH` FOREIGN KEY (`PHD_PHID`) REFERENCES `politicahoraria` (`PH_ID`);

--
-- Filtros para la tabla `provincia`
--
ALTER TABLE `provincia`
  ADD CONSTRAINT `FK_Provin_Pais` FOREIGN KEY (`Provin_PaisID`) REFERENCES `paises` (`Pais_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
