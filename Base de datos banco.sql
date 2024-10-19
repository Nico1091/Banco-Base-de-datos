CREATE DATABASE  IF NOT EXISTS `bancodb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bancodb`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: bancodb
-- ------------------------------------------------------
-- Server version	8.3.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cargo`
--

DROP TABLE IF EXISTS `cargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cargo` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(70) NOT NULL,
  `Descripcion` varchar(300) DEFAULT NULL,
  `Departamento_Id` int DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Cargo_UC` (`Nombre`),
  KEY `Empleado_Cargo_FK` (`Departamento_Id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargo`
--

LOCK TABLES `cargo` WRITE;
/*!40000 ALTER TABLE `cargo` DISABLE KEYS */;
INSERT INTO `cargo` VALUES (1,'oficial de credito','Asesora los clientes sobre productos crediticios',1),(2,'Gerente de credito','Supervisa el proceso de otrorgar credito y prestamos',1),(3,'Analista de credito','Evalua y analiza el proceso para otorgar creditos al cliente ademas de realizar informes',1),(4,'Gerente de cuentas','Supervisa operaciones relacionadas  con las cuentas  del cliente',2),(5,'Ejecutivo de cuentas','Asiste a los clientes en apertura y administracion de cuentas bancarias  ademas de explicar las opciones que ofrece el banco para el rano y uso de las mismas',2),(6,'Asesor de cuentas','Asesora personalmente a los clientes para escoger la cuenta adaptada a sus necesidades ademas de mostrar tasas de interes  y tarifas acorde al uso de las mismas',2),(7,'Tesoreria General','Supervisa la liquidez de las inversionnes Bancarias',3),(8,'Gerente de tesoreria','Gestionas las inversiones y transacciones en los mercados coordina operaciones diarias y se asegura de la liquidez bancaria',3),(9,'Trader de tesoreria','Ejecuta operaciones en el mercado financiero,compra y vende activos como bonos y divisas y otros instrumentos para gestionar riesgos  y mejorar rentabilidad',3),(10,'Gerente de servicio al cliente','Supervisa la calidad de atencion al cliente a partir del personal ademas de establecer politicas y procedimientos para mejorar la satisfacion al cliente',4),(11,'Representante de atencion al cliente','Punto de contacto con el cliente en fisico o de manera virtual,Atiende consultas  sobre productos y servicios,cuentas bancarias,tarjetas de credito y prestamos',4),(12,'Asesor de servicio al cliente','Ofrece asesoramiennto personalizado a los clientes para la comprension de sus propias inversiones ademas de ofrecer soluciones y recomendaciones adecuadas al usuario',4),(13,'Director de recursos Humanos','Responsable de la gestion global, define la estrategia de recursos humanos,se alinea con las necesidades de los empleados',5),(14,'Gerente de recursos Humanos','Supervisa las operaciones diarias del departamento de Recursos Humanos(RR.HH),se encarga de implementar politicas de contratacion formacion y compensacion, Gestionamiento de relaciones en el area empresarial',5),(15,'Especialista en reclutamiento y seleccion','Gestiona todo el proceso de contratacion desde la busqueda de candidatos hasta laentrevista y seleccion,Colabora  con los departamenntos del banco para verificar el personal que le es requerido',5);
/*!40000 ALTER TABLE `cargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(20) NOT NULL,
  `Apellido` varchar(20) NOT NULL,
  `Cedula` varchar(20) NOT NULL,
  `Direccion` varchar(30) DEFAULT NULL,
  `Telefono` varchar(10) DEFAULT NULL,
  `Correo` varchar(20) DEFAULT NULL,
  `Fecha_registro` date NOT NULL DEFAULT (curdate()),
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Cliente_UC` (`Cedula`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Carlos','Villagram','1234567890','Av 15 cll 23 casa 10-13','2475938042','eudue@gmail.com','2024-10-14'),(2,'Jorge','Guzman','2467758930','Av 3 cll 14 casa 28-30','2638493028','Jorge2@gmail.com','2024-10-14'),(3,'Andres','Valcarcel','2385940274','Av 5 cll 27  casa 29-42','2647834750','Andres@gmail.com','2024-10-14'),(4,'Luis','Casanares','2536789356','Av 10 cll 32 casa 34-50','3547382916','Luis@gmail.com','2024-10-14'),(5,'Mario','Quinatanilla','3347289301','Av 23 cll 37 casa 63-73','3427646728','Mario@gmail.com','2024-10-14');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuenta`
--

DROP TABLE IF EXISTS `cuenta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuenta` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Numero_Cuenta` varchar(20) NOT NULL,
  `Tipo_Cuenta` enum('Ahorros','Corriente') NOT NULL,
  `Saldo` int DEFAULT NULL,
  `Fecha_Apertura` date NOT NULL DEFAULT (curdate()),
  `Cliente_Id` int DEFAULT NULL,
  `Sucursal_Id` int DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Cuenta_UC` (`Numero_Cuenta`),
  KEY `Cuenta_Cliente_FK` (`Cliente_Id`),
  KEY `Cuenta_Sucursal_FK` (`Sucursal_Id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuenta`
--

LOCK TABLES `cuenta` WRITE;
/*!40000 ALTER TABLE `cuenta` DISABLE KEYS */;
INSERT INTO `cuenta` VALUES (1,'125','Ahorros',36000000,'2024-10-15',1,1),(2,'877','Corriente',78000000,'2024-10-15',2,2),(3,'925','Ahorros',800000000,'2024-10-15',3,3),(4,'720','Corriente',100000,'2024-10-15',4,4),(5,'160','Corriente',200000,'2024-10-15',5,5);
/*!40000 ALTER TABLE `cuenta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamento`
--

DROP TABLE IF EXISTS `departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamento` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(30) NOT NULL,
  `Descripcion` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Departamento_UC` (`Nombre`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamento`
--

LOCK TABLES `departamento` WRITE;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
INSERT INTO `departamento` VALUES (1,'Credito y prestamos','Solicitudes y aprobacion de prestamos Clientes individuales y empresas'),(2,'Cuentas y depositos','Administrar cuentas corriente,ahorro y depositos'),(3,'Tesoreria','Gestionar Flujo de efectivo e inversionnes'),(4,'Atencion al cliente','Gestionar relaciones con los clientes quejas consultas y reclamaciones'),(5,'Recursos Humanos','Gestionar personal y autorizar contratacion,formacion,desarrollo y bienestar de los empleados');
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(20) NOT NULL,
  `Apellido` varchar(20) NOT NULL,
  `Cedula` varchar(10) NOT NULL,
  `Puesto` varchar(100) DEFAULT NULL,
  `Salario` int DEFAULT NULL,
  `Fecha_Contratacion` date NOT NULL DEFAULT (curdate()),
  `Cargo_Id` int DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Empleado_UC` (`Cedula`),
  KEY `Empleado_Cargo_FK` (`Cargo_Id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (1,'Jose','Casanares','3425167283','Oficial de credito',5000000,'2024-10-14',1),(2,'Luis','Bedoya','3678902671','Gerente de credito',4000000,'2024-10-14',2),(3,'Angel','Villareal','3547725367','Analista de credito',2039999,'2024-10-14',3),(4,'Pedro','Cardenas','3648593784','Gerente de cuentas',6000000,'2024-10-14',4),(5,'Andres','Escobar','3546783922','Ejecutivo de cuentas',5000000,'2024-10-14',5),(6,'Jaime','Pedraza','3657848932','Asesor de cuentas',2000000,'2024-10-14',6),(7,'Jorge','Aleman','3546728931','Tesoreria general',2536000,'2024-10-14',7),(8,'Carlos','Brand','3789037380','Gerente de tesoreria',2333444,'2024-10-14',8),(9,'Juan','Conriquez','3546783679','Trader de tesoreria',3455431,'2024-10-14',9),(10,'Andrea','Guzman','3547378290','Gerente de servicio al cliente',34667890,'2024-10-14',10),(11,'Freimer','Escamilla','3456782923','Representante de atencion al cliente',4562343,'2024-10-15',11),(12,'Sebastian','Alarcon','3457890267','Asesor de servicio al cliente',4536678,'2024-10-15',12),(13,'Lina','Tejeiro','3567489567','Director de recursos humanos',2436893,'2024-10-15',13),(14,'Roller','Sierra','3567890456','Gerente de recursos Humanos',2349098,'2024-10-15',14),(15,'Carla','Camacaro','3456789098','Especialista en reclutamiento y seleccion',3600000,'2024-10-15',15);
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prestamo`
--

DROP TABLE IF EXISTS `prestamo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prestamo` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Monto` int DEFAULT NULL,
  `Tasa_Interes` int DEFAULT NULL,
  `Fecha_Inicio` date NOT NULL,
  `Fecha_Fin` date NOT NULL,
  `Cuenta_Id` int DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Prestamo_Cuenta_FK` (`Cuenta_Id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prestamo`
--

LOCK TABLES `prestamo` WRITE;
/*!40000 ALTER TABLE `prestamo` DISABLE KEYS */;
INSERT INTO `prestamo` VALUES (1,400000,10,'2024-10-17','2025-12-17',1),(2,30000,20,'2024-10-17','2024-11-10',2),(3,2000000000,15,'2024-10-17','2030-11-10',3),(4,200,0,'2024-10-17','2024-10-17',4),(5,300000,12,'2024-10-17','2024-11-17',5);
/*!40000 ALTER TABLE `prestamo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sucursal`
--

DROP TABLE IF EXISTS `sucursal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sucursal` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(30) NOT NULL,
  `Direccion` varchar(50) NOT NULL,
  `Ciudad` varchar(30) NOT NULL,
  `Codigo_postal` varchar(10) DEFAULT NULL,
  `Telefono` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Sucursal_UC` (`Nombre`,`Direccion`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sucursal`
--

LOCK TABLES `sucursal` WRITE;
/*!40000 ALTER TABLE `sucursal` DISABLE KEYS */;
INSERT INTO `sucursal` VALUES (1,'Bancolombia_1','Av 15 cll 20 10-14','Bogota','0101','3217493247'),(2,'Bancolombia_2','Av 17 cll 15 20-10','Medellin','0102','3246789076'),(3,'Bancolombia_3','Av 20 cll 17 08-15','Cali','0103','3457890983'),(4,'Bancolombia_4','Av 27 cll 30 15-09','Cucuta','0104','3759203048'),(5,'Bancolombia_5','Av 30 cll 27 18-20','Barranquilla','0105','3238495020');
/*!40000 ALTER TABLE `sucursal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sucursal_departamento`
--

DROP TABLE IF EXISTS `sucursal_departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sucursal_departamento` (
  `Sucursal_Id` int DEFAULT NULL,
  `Departamento_Id` int DEFAULT NULL,
  KEY `Sucursal_FK` (`Sucursal_Id`),
  KEY `Departamento_FK` (`Departamento_Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sucursal_departamento`
--

LOCK TABLES `sucursal_departamento` WRITE;
/*!40000 ALTER TABLE `sucursal_departamento` DISABLE KEYS */;
INSERT INTO `sucursal_departamento` VALUES (1,1),(2,2),(3,3),(4,4),(5,5);
/*!40000 ALTER TABLE `sucursal_departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarjeta_credito`
--

DROP TABLE IF EXISTS `tarjeta_credito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tarjeta_credito` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Numero_Tarjeta` varchar(20) NOT NULL,
  `Limite_Credito` int DEFAULT NULL,
  `Fecha_Emision` date NOT NULL,
  `Fecha_Expiracion` date NOT NULL,
  `Cuenta_Id` int DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Numero_Tarjeta` (`Numero_Tarjeta`),
  KEY `Tarjeta_Credito_Cuenta_FK` (`Cuenta_Id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarjeta_credito`
--

LOCK TABLES `tarjeta_credito` WRITE;
/*!40000 ALTER TABLE `tarjeta_credito` DISABLE KEYS */;
INSERT INTO `tarjeta_credito` VALUES (1,'000333111',400000,'2024-10-17','2030-11-10',1),(2,'000444222',5048494,'2024-10-17','2030-11-10',2),(3,'000555777',2147483647,'2024-10-17','2030-11-10',3),(4,'222000788',37485956,'2024-10-17','2030-11-10',4),(5,'444000000',38585,'2024-10-17','2030-11-10',5);
/*!40000 ALTER TABLE `tarjeta_credito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaccion`
--

DROP TABLE IF EXISTS `transaccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaccion` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Tipo_Transaccion` enum('Deposito','Retiro','Transferencia') NOT NULL,
  `Monto` int DEFAULT NULL,
  `Fecha_Transaccion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `Cuenta_Origen_Id` int DEFAULT NULL,
  `Cuenta_Destino_Id` int DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Transaccion_Cuenta__Origen_FK` (`Cuenta_Origen_Id`),
  KEY `Transaccion_Cuenta_Destino_FK` (`Cuenta_Destino_Id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaccion`
--

LOCK TABLES `transaccion` WRITE;
/*!40000 ALTER TABLE `transaccion` DISABLE KEYS */;
INSERT INTO `transaccion` VALUES (1,'Transferencia',24000000,'2024-10-18 05:00:00',1,2),(2,'Retiro',200000,'2024-10-18 05:00:00',2,2),(3,'Deposito',20000000,'2024-10-18 05:00:00',3,3),(4,'Transferencia',100000,'2024-10-18 05:00:00',4,2),(5,'Retiro',1000000,'2024-10-18 05:00:00',5,5);
/*!40000 ALTER TABLE `transaccion` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-18 22:06:17
