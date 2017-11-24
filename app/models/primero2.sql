-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.57-community


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema primero
--

CREATE DATABASE IF NOT EXISTS primero2;
USE primero2;

--
-- Definition of table `clases`
--

DROP TABLE IF EXISTS `clases`;
CREATE TABLE `clases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `semana` varchar(2) NOT NULL,
  `objetivo` text NOT NULL,
  `padre` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;









DROP TABLE IF EXISTS `arbols`;
CREATE TABLE `arbols` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` int(11) NOT NULL,
  `text` varchar(50) NOT NULL DEFAULT '',
  `vinculo` varchar(100) NOT NULL DEFAULT '',
  `padre_id` int(11),
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

INSERT INTO `arbols` (`id`,`tipo`,`text`,`vinculo`,`padre_id`) VALUES 
 (10,1,'Investigador','',0),
 (11,1,'Proyectos','',10),
 (12,1,'Proyecto No Subvencionado','',11),
 (13,1,'Registro de Proyectos','modal#regNoSub',12),
 (14,1,'Proyecto Subvencionado','',11),
 (15,1,'Registro de Proyectos','modal#regSub',14),
 (16,1,'Reformular Proyecto','modal#refor',12),
 (17,1,'Registrar Informe','modal#regInforme',12),
 (18,1,'Estado del Proyecto','control_seguimiento_proyecto',12),
 (19,1,'Historial del Proyecto','versiones_proyecto',12),
 (20,1,'Reformular Proyecto','modal#refor',14),
 (21,1,'Registrar Informe','modal#regInforme',14),
 (22,1,'Estado del Proyecto','control_seguimiento_proyecto',14),
 (23,1,'Historial del Proyecto','versiones_proyecto',14),
 (24,1,'Mi Perfil','ejemplo05',10);

 INSERT INTO `arbols` (`id`,`tipo`,`text`,`vinculo`,`padre_id`) VALUES 
 (25,2,'Evaluador','',0),
 (26,2,'Evaluar Proyectos','modal#Evaluar',25),
 (27,2,'Consultar Proyectos Evaluados','modal#Consultar',25),
 (28,2,'Tareas Pendientes','modal#regNoSub',25),
 (29,2,'Mi Perfil','modal#Perfil',25);

 INSERT INTO `arbols` (`id`,`tipo`,`text`,`vinculo`,`padre_id`) VALUES 
 (30,5,'Administrador','',0),
 (31,5,'Generar reporte de usuarios','modal#GenerarReporte',30),
 (32,5,'Gestionar Rol','modal#Consultar',30),
 (33,5,'Asignar opciones de menu','modal#regNoSub',30),
 (34,5,'Registrar tipo de proyecto','modal#Perfil',30),
 (35,5,'Registrar area de investigacion','modal#Perfil',30);

 INSERT INTO `arbols` (`id`,`tipo`,`text`,`vinculo`,`padre_id`) VALUES 
 (36,3,'Coordinador','',0),
 (37,3,'Proyecto por Asignar','modal#GenerarReporte',36),
 (38,3,'Asignar Evaluador','modal#Consultar',36),
 (39,3,'Seguimiento de Proyecto','modal#regNoSub',36),
 (40,3,'Programar Tareas Pendientes','modal#Perfil',36),
 (41,3,'Reportes','',36),
 (42,3,'Proyectos en Evaluacion','modal#Perfil',41),
 (43,3,'Proyectos Avalados','modal#Perfil',41),
 (44,3,'Proyectos Avalados Definitivos','modal#Perfil',41),
 (45,3,'Proyectos por Departementos','modal#Perfil',41),
 (46,3,'Proyectos por Area de Investigacion','modal#Perfil',41),
 (47,3,'Credenciales de Proyectos','modal#Perfil',36),
 (48,3,'Proyectos evaluados por Evaluadores','modal#Perfil',41),
 (49,3,'Mi Perfil','modal#Perfil',36);

 INSERT INTO `arbols` (`id`,`tipo`,`text`,`vinculo`,`padre_id`) VALUES 
 (50,4,'CDCHT','',0),
 (51,4,'Apertura de Inscripcion de Proyectos','modal#GenerarReporte',50),
 (52,4,'Gestionar Proroga de Proyectos','modal#Consultar',50),
 (53,4,'Gestionar Renovacion de Proyectos','modal#regNoSub',50),
 (54,4,'Culminar Proyecto','modal#Perfil',50),
 (55,4,'Avalar Proyecto','avalar_definitivo',50),
 (56,4,'Generar Credencial','modal#Perfil',50),
 (57,4,'Reportes','',50),
 (58,4,'Proyectos avalados','modal#Perfil',57),
 (59,4,'Proyectos por Area de Investigacion','modal#Perfil',57),
 (60,4,'Proyectos Subvencionado','modal#Perfil',57),
 (61,4,'Proyectos No Subvencionado','modal#Perfil',57),
 (62,4,'Mi Perfil','modal#Perfil',50);

 
 
 DROP TABLE IF EXISTS `estados`;
CREATE TABLE `estados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(25) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

INSERT INTO `estados` (`id`,`nombre`) VALUES 
 (1,'Amazonas'),
 (2,'Anzoategui'),
 (3,'Lara');
 
DROP TABLE IF EXISTS `ciudades`;
CREATE TABLE `ciudades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idestado` int(11) NOT NULL,
  `nombre` varchar(25) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

INSERT INTO `ciudades` (`id`,`idestado`,`nombre`) VALUES
 (1,1,'Alto Orinoco'),
 (2,1,'Maroa'), 
 (3,1,'Pto. Ayacucho'),
 (4,2,'Anaco'),
 (5,2,'Pto. La Cruz'),
 (6,3,'Barquisimeto'), 
 (7,3,'Cabudare'),
 (8,3,'Carora');

