-- MySQL dump 10.13  Distrib 5.7.44, for Linux (x86_64)
--
-- Host: localhost    Database: dbconvocatoria
-- ------------------------------------------------------
-- Server version	5.7.44

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `convocatorias`
--

DROP TABLE IF EXISTS `convocatorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `convocatorias` (
  `id_convocatoria` bigint(20) NOT NULL AUTO_INCREMENT,
  `fecha_apertura` datetime(6) NOT NULL,
  `fecha_cierre` datetime(6) NOT NULL,
  `fecha_publicacion` datetime(6) NOT NULL,
  PRIMARY KEY (`id_convocatoria`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `convocatorias`
--

LOCK TABLES `convocatorias` WRITE;
/*!40000 ALTER TABLE `convocatorias` DISABLE KEYS */;
/*!40000 ALTER TABLE `convocatorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `convocatorias_dependencia`
--

DROP TABLE IF EXISTS `convocatorias_dependencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `convocatorias_dependencia` (
  `id_convocatorias_dependencia` bigint(20) NOT NULL AUTO_INCREMENT,
  `anno_resolucion_convocatoria` bigint(20) NOT NULL,
  `numero_resolucion_convocatoria` bigint(20) NOT NULL,
  `id_convocatoria` bigint(20) NOT NULL,
  `id_dependencia` bigint(20) DEFAULT NULL,
  `id_convocatoria_dependencia_superior` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_convocatorias_dependencia`),
  KEY `CONVDEP_FK_IDCONV` (`id_convocatoria`),
  KEY `CONVDEP_FK_IDDEP` (`id_dependencia`),
  KEY `CONVDEP_FK_IDCONV_SUPERIOR` (`id_convocatoria_dependencia_superior`),
  CONSTRAINT `CONVDEP_FK_IDCONV` FOREIGN KEY (`id_convocatoria`) REFERENCES `convocatorias` (`id_convocatoria`),
  CONSTRAINT `CONVDEP_FK_IDCONV_SUPERIOR` FOREIGN KEY (`id_convocatoria_dependencia_superior`) REFERENCES `convocatorias_dependencia` (`id_convocatorias_dependencia`),
  CONSTRAINT `CONVDEP_FK_IDDEP` FOREIGN KEY (`id_dependencia`) REFERENCES `dependencias` (`id_dependencia`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `convocatorias_dependencia`
--

LOCK TABLES `convocatorias_dependencia` WRITE;
/*!40000 ALTER TABLE `convocatorias_dependencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `convocatorias_dependencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dependencias`
--

DROP TABLE IF EXISTS `dependencias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dependencias` (
  `id_dependencia` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre_dependencia` varchar(255) NOT NULL,
  `tipo_dependencia` char(1) NOT NULL,
  `id_dependencia_superior` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_dependencia`),
  KEY `DEP_FK_IDDEPSUP` (`id_dependencia_superior`),
  CONSTRAINT `DEP_FK_IDDEPSUP` FOREIGN KEY (`id_dependencia_superior`) REFERENCES `dependencias` (`id_dependencia`)
) ENGINE=InnoDB AUTO_INCREMENT=158 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dependencias`
--

LOCK TABLES `dependencias` WRITE;
/*!40000 ALTER TABLE `dependencias` DISABLE KEYS */;
INSERT INTO `dependencias` VALUES (1,'Facultad Estudios Tecnológicos y a Distancia','F',NULL),(2,'Facultad de Ingeniería','F',NULL),(3,'Facultad de Derecho y Ciencias Sociales','F',NULL),(4,'Facultad de Ciencias Económicas y Administrativas','F',NULL),(5,'Facultad de Ciencias de la Salud','F',NULL),(6,'Facultad de Ciencias de la Educación','F',NULL),(7,'Facultad de Ciencias Agropecuarias','F',NULL),(8,'Facultad de Ciencias','F',NULL),(9,'Facultad Seccional Chiquinquirá','F',NULL),(10,'Facultad Seccional Duitama','F',NULL),(11,'Facultad Seccional Sogamoso','F',NULL),(16,'Escuela de Posgrados Facultad de Estudios Tecnológicos y a Distancia','E',1),(17,'Escuela de Ciencias Tecnológicas','E',1),(18,'Escuela de Ciencias Humanísticas y de Educación','E',1),(19,'Escuela de Ciencias Agropecuarias y Ambientales','E',1),(20,'Escuela de Ciencias Administrativas y Económicas','E',1),(21,'Escuela de Posgrados Facultad de Ingeniería','E',2),(22,'Escuela de Ingeniería Metalúrgica','E',2),(23,'Escuela de Ingeniería Electrónica','E',2),(24,'Escuela de Ingeniería de Transporte y Vías','E',2),(25,'Escuela de Ingeniería de Sistemas y Computación','E',2),(26,'Escuela de Ingeniería Civil','E',2),(27,'Escuela de Ingeniería Ambiental','E',2),(28,'Escuela de Arquitectura','E',2),(29,'Escuela de Posgrados Facultad de Derecho y Ciencias Sociales','E',3),(31,'Escuela de Derecho','E',3),(33,'Escuela de Posgrados Facultad de Ciencias Económicas y Administrativas','E',4),(34,'Escuela de Economía','E',4),(35,'Escuela de Contaduría Pública','E',4),(36,'Escuela de Administración de Empresas (Nocturna)','E',4),(37,'Escuela de Administración de Empresas','E',4),(38,'Escuela de Psicología','E',5),(39,'Escuela de Posgrados Facultad de Ciencias de la Salud','E',5),(40,'Escuela de Medicina','E',5),(41,'Escuela de Enfermería','E',5),(42,'Licenciatura en Psicopedagogía','E',6),(43,'Licenciatura en Educación Infantil','E',6),(44,'Idiomas y Lenguas Extranjeras','E',6),(45,'Escuela de Posgrados Ciencias de La Educación','E',6),(46,'Escuela de Licenciatura en Psicopedagogía con Énfasis Asesoría Educativa','E',6),(47,'Escuela de Licenciatura en Música','E',6),(48,'Escuela de Licenciatura en Matemáticas y Física','E',6),(49,'Escuela de Licenciatura en Matemáticas','E',6),(50,'Escuela de Licenciatura en Lenguas Extranjeras','E',6),(51,'Escuela de Licenciatura en Informática Educativa','E',6),(52,'Escuela de Licenciatura en Idiomas Modernos Español-Ingles','E',6),(53,'Escuela de Licenciatura en Filosofía','E',6),(54,'Escuela de Licenciatura en Educación Pre-Escolar','E',6),(55,'Escuela de Licenciatura en Educación Física Recreación y Deportes','E',6),(56,'Escuela de Licenciatura en Ciencias Sociales','E',6),(57,'Escuela de Licenciatura en Ciencias Naturales y Educación Ambiental','E',6),(58,'Escuela de Licenciatura en Artes Plásticas','E',6),(59,'Escuela de Ciencias Sociales','E',6),(60,'Escuela de Posgrados Facultad de Ciencias Agropecuarias','E',7),(61,'Escuela de Medicina Veterinaria y Zootecnia','E',7),(62,'Escuela de Ingeniería Agronómica','E',7),(63,'Escuela de Química','E',8),(64,'Escuela de Posgrados en Ciencias','E',8),(65,'Escuela de Matemáticas','E',8),(66,'Escuela de Ciencias Químicas','E',8),(67,'Escuela de Ciencias Físicas','E',8),(68,'Escuela de Biología','E',8),(69,'Escuela de Tecnología en Gemología','E',9),(70,'Escuela de Posgrados Facultad Seccional Chiquinquirá','E',9),(71,'Escuela de Licenciatura en Educación Física Recreación y Deportes','E',9),(72,'Escuela de Contaduría Pública','E',9),(73,'Escuela de Administración de Empresas','E',9),(74,'Licenciatura en Tecnología','E',10),(75,'Licenciatura en Matemáticas y Estadística - Yopal','E',10),(76,'Escuela de Posgrados Facultad Seccional Duitama','E',10),(77,'Escuela de Licenciatura en Matemáticas y Estadística','E',10),(78,'Escuela de Licenciatura en Educación Industrial','E',10),(79,'Escuela de Ingeniería Electromecánica','E',10),(80,'Escuela de Diseño Industrial','E',10),(81,'Escuela de Administración Turística y Hotelera','E',10),(82,'Escuela de Administración Industrial','E',10),(83,'Escuela de Administración de Empresas Agropecuarias','E',10),(84,'Escuela de Posgrados Facultad Seccional Sogamoso','E',11),(85,'Escuela de Ingeniería Industrial','E',11),(86,'Escuela de Ingeniería Geológica','E',11),(87,'Escuela de Ingeniería Electrónica','E',11),(88,'Escuela de Ingeniería de Sistemas y Computación','E',11),(89,'Escuela de Ingeniería de Minas','E',11),(90,'Escuela de Finanzas y Comercio Internacional','E',11),(91,'Escuela de Contaduría Pública - Yopal','E',11),(92,'Escuela de Contaduría Pública','E',11),(93,'Escuela de Administración de Empresas','E',11),(94,'Escuela de Derecho - Aguazul','E',3);
/*!40000 ALTER TABLE `dependencias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inscripciones`
--

DROP TABLE IF EXISTS `inscripciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inscripciones` (
  `id_inscripcion` bigint(20) NOT NULL AUTO_INCREMENT,
  `fecha_inscripcion` datetime(6) NOT NULL,
  `numero_folios` bigint(20) NOT NULL,
  `observaciones` varchar(255) DEFAULT NULL,
  `id_convocatoria` bigint(20) NOT NULL,
  `id_perfil` bigint(20) NOT NULL,
  `id_persona` bigint(20) NOT NULL,
  PRIMARY KEY (`id_inscripcion`),
  UNIQUE KEY `uq_conv_persona` (`id_convocatoria`,`id_persona`),
  KEY `INS_FK_IDPERF` (`id_perfil`),
  KEY `INS_FK_IDPERS` (`id_persona`),
  CONSTRAINT `INS_FK_IDCONV` FOREIGN KEY (`id_convocatoria`) REFERENCES `convocatorias` (`id_convocatoria`),
  CONSTRAINT `INS_FK_IDPERF` FOREIGN KEY (`id_perfil`) REFERENCES `perfiles` (`id_perfil`),
  CONSTRAINT `INS_FK_IDPERS` FOREIGN KEY (`id_persona`) REFERENCES `personas` (`id_persona`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inscripciones`
--

LOCK TABLES `inscripciones` WRITE;
/*!40000 ALTER TABLE `inscripciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `inscripciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfiles`
--

DROP TABLE IF EXISTS `perfiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perfiles` (
  `id_perfil` bigint(20) NOT NULL AUTO_INCREMENT,
  `experiencia_docente` bigint(20) NOT NULL,
  `experiencia_profesional` bigint(20) NOT NULL,
  `requiere_posgrado` bigint(20) NOT NULL,
  `texto_perfil` varchar(500) DEFAULT NULL,
  `id_convicatorias_dependencia` bigint(20) NOT NULL,
  PRIMARY KEY (`id_perfil`),
  KEY `PERF_FK_IDCONVDEP` (`id_convicatorias_dependencia`),
  CONSTRAINT `PERF_FK_IDCONVDEP` FOREIGN KEY (`id_convicatorias_dependencia`) REFERENCES `convocatorias_dependencia` (`id_convocatorias_dependencia`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfiles`
--

LOCK TABLES `perfiles` WRITE;
/*!40000 ALTER TABLE `perfiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `perfiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personas`
--

DROP TABLE IF EXISTS `personas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personas` (
  `id_persona` bigint(20) NOT NULL AUTO_INCREMENT,
  `apellido_persona` varchar(60) NOT NULL,
  `correo_electronico` varchar(60) NOT NULL,
  `nombre_persona` varchar(60) NOT NULL,
  `numero_documento` char(10) NOT NULL,
  `telefono_persona` varchar(10) NOT NULL,
  `tipo_documento` char(2) NOT NULL,
  PRIMARY KEY (`id_persona`),
  UNIQUE KEY `uq_tipo_numero_documento` (`tipo_documento`,`numero_documento`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personas`
--

LOCK TABLES `personas` WRITE;
/*!40000 ALTER TABLE `personas` DISABLE KEYS */;
/*!40000 ALTER TABLE `personas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profesiones`
--

DROP TABLE IF EXISTS `profesiones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profesiones` (
  `id_profesion` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre_profesion` varchar(255) NOT NULL,
  PRIMARY KEY (`id_profesion`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesiones`
--

LOCK TABLES `profesiones` WRITE;
/*!40000 ALTER TABLE `profesiones` DISABLE KEYS */;
/*!40000 ALTER TABLE `profesiones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profesiones_perfil`
--

DROP TABLE IF EXISTS `profesiones_perfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profesiones_perfil` (
  `id_profesion_perfil` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_perfile` bigint(20) NOT NULL,
  `id_profesion` bigint(20) NOT NULL,
  PRIMARY KEY (`id_profesion_perfil`),
  KEY `PROFPER_FK_IDPER` (`id_perfile`),
  KEY `PROFPER_FK_IDPROF` (`id_profesion`),
  CONSTRAINT `PROFPER_FK_IDPER` FOREIGN KEY (`id_perfile`) REFERENCES `perfiles` (`id_perfil`),
  CONSTRAINT `PROFPER_FK_IDPROF` FOREIGN KEY (`id_profesion`) REFERENCES `profesiones` (`id_profesion`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesiones_perfil`
--

LOCK TABLES `profesiones_perfil` WRITE;
/*!40000 ALTER TABLE `profesiones_perfil` DISABLE KEYS */;
/*!40000 ALTER TABLE `profesiones_perfil` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-17  0:57:14
