/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.11-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: prueba_2
-- ------------------------------------------------------
-- Server version	10.11.11-MariaDB-0ubuntu0.24.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `categoria_inventario_FK` FOREIGN KEY (`id`) REFERENCES `inventario` (`id`),
  CONSTRAINT `categoria_producto_FK` FOREIGN KEY (`id`) REFERENCES `producto` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrada_salida_historico`
--

DROP TABLE IF EXISTS `entrada_salida_historico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `entrada_salida_historico` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `producto_id` int(11) NOT NULL,
  `cantidad` bigint(20) DEFAULT NULL,
  `peso` int(11) DEFAULT NULL,
  `unidad_medida_id` int(11) DEFAULT NULL,
  `fecha_y_hora` datetime DEFAULT NULL,
  `creado_por` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `unidad_medida_entrada_salida_inventario_FK` (`unidad_medida_id`),
  KEY `producto_entrada_salida_historico_FK` (`producto_id`),
  CONSTRAINT `producto_entrada_salida_historico_FK` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`),
  CONSTRAINT `unidad_medida_entrada_salida_inventario_FK` FOREIGN KEY (`unidad_medida_id`) REFERENCES `unidad_medida` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrada_salida_historico`
--

LOCK TABLES `entrada_salida_historico` WRITE;
/*!40000 ALTER TABLE `entrada_salida_historico` DISABLE KEYS */;
/*!40000 ALTER TABLE `entrada_salida_historico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura_compra`
--

DROP TABLE IF EXISTS `factura_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `factura_compra` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero_factura` bigint(20) NOT NULL,
  `nit` bigint(20) DEFAULT NULL,
  `nombre_empresa` varchar(100) DEFAULT NULL,
  `direccion_empresa` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura_compra`
--

LOCK TABLES `factura_compra` WRITE;
/*!40000 ALTER TABLE `factura_compra` DISABLE KEYS */;
/*!40000 ALTER TABLE `factura_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura_compra_detalle`
--

DROP TABLE IF EXISTS `factura_compra_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `factura_compra_detalle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `encabezado_factura_compra_id` int(11) DEFAULT NULL,
  `proveedor_id` int(11) DEFAULT NULL,
  `producto_id` int(11) DEFAULT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `factura_compra_producto` (`producto_id`),
  KEY `factura_compra_encabezado_factura_compra_FK` (`encabezado_factura_compra_id`),
  CONSTRAINT `factura_compra_encabezado_factura_compra_FK` FOREIGN KEY (`encabezado_factura_compra_id`) REFERENCES `factura_compra` (`id`),
  CONSTRAINT `factura_compra_producto` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura_compra_detalle`
--

LOCK TABLES `factura_compra_detalle` WRITE;
/*!40000 ALTER TABLE `factura_compra_detalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `factura_compra_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura_venta`
--

DROP TABLE IF EXISTS `factura_venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `factura_venta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero_factura` bigint(20) NOT NULL,
  `nit` bigint(20) NOT NULL,
  `direccion_empresa` varchar(225) NOT NULL,
  `nombre_empresa` varchar(225) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura_venta`
--

LOCK TABLES `factura_venta` WRITE;
/*!40000 ALTER TABLE `factura_venta` DISABLE KEYS */;
/*!40000 ALTER TABLE `factura_venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura_venta_detalle`
--

DROP TABLE IF EXISTS `factura_venta_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `factura_venta_detalle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `factura_venta_detalle` int(11) DEFAULT NULL,
  `fecha_factura` datetime DEFAULT NULL,
  `cantidad` varchar(255) DEFAULT NULL,
  `producto_id` int(11) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `precio_unidad` bigint(20) NOT NULL,
  `descuento` varchar(50) DEFAULT NULL,
  `iva` varchar(100) DEFAULT NULL,
  `subtotal` bigint(20) NOT NULL,
  `total` bigint(20) NOT NULL,
  `metodo_pago_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `venta_producto_FK_1` (`producto_id`),
  KEY `encabezado_factura_venta_FK` (`factura_venta_detalle`),
  KEY `factura_venta_metodos_pago_FK` (`metodo_pago_id`),
  CONSTRAINT `encabezado_factura_venta_FK` FOREIGN KEY (`factura_venta_detalle`) REFERENCES `factura_venta` (`id`),
  CONSTRAINT `factura_venta_metodos_pago_FK` FOREIGN KEY (`metodo_pago_id`) REFERENCES `metodos_pago` (`id`),
  CONSTRAINT `venta_producto_FK_1` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura_venta_detalle`
--

LOCK TABLES `factura_venta_detalle` WRITE;
/*!40000 ALTER TABLE `factura_venta_detalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `factura_venta_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flujo_operacion`
--

DROP TABLE IF EXISTS `flujo_operacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `flujo_operacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flujo_operacion`
--

LOCK TABLES `flujo_operacion` WRITE;
/*!40000 ALTER TABLE `flujo_operacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `flujo_operacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `item` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `url` text NOT NULL,
  `icon` varchar(255) NOT NULL,
  `item_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_item_item_id_FK` (`item_id`),
  CONSTRAINT `idx_item_item_id_FK` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metodos_pago`
--

DROP TABLE IF EXISTS `metodos_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `metodos_pago` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metodos_pago`
--

LOCK TABLES `metodos_pago` WRITE;
/*!40000 ALTER TABLE `metodos_pago` DISABLE KEYS */;
INSERT INTO `metodos_pago` VALUES
(1,'Davivienda'),
(2,'Bancolombia'),
(3,'Nequi'),
(4,'Mercado Pago'),
(5,'Payvalida'),
(6,'Ahorro a la mano'),
(7,'Paypal'),
(8,'addi'),
(9,'Efectivo');
/*!40000 ALTER TABLE `metodos_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission`
--

DROP TABLE IF EXISTS `permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `permission` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission`
--

LOCK TABLES `permission` WRITE;
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission_item`
--

DROP TABLE IF EXISTS `permission_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `permission_item` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `permission_id` bigint(20) unsigned NOT NULL,
  `item_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_permission_item_permission_id_FK` (`permission_id`),
  KEY `idx_permission_item_item_id_FK` (`item_id`),
  CONSTRAINT `idx_permission_item_item_id_FK` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`),
  CONSTRAINT `idx_permission_item_permission_id_FK` FOREIGN KEY (`permission_id`) REFERENCES `permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission_item`
--

LOCK TABLES `permission_item` WRITE;
/*!40000 ALTER TABLE `permission_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `permission_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `presentacion`
--

DROP TABLE IF EXISTS `presentacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `presentacion` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `peso` varchar(205) NOT NULL,
  `unidad_medida_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `presentacion_unidad_medida_FK` (`unidad_medida_id`),
  CONSTRAINT `presentacion_unidad_medida_FK` FOREIGN KEY (`unidad_medida_id`) REFERENCES `unidad_medida` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `presentacion`
--

LOCK TABLES `presentacion` WRITE;
/*!40000 ALTER TABLE `presentacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `presentacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `categoria_id` int(11) DEFAULT NULL,
  `cantidad` int(11) NOT NULL,
  `presentacion_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `producto_categoria_FK` (`categoria_id`),
  KEY `producto_peso_FK` (`presentacion_id`),
  CONSTRAINT `producto_categoria_FK` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`id`),
  CONSTRAINT `producto_peso_FK` FOREIGN KEY (`presentacion_id`) REFERENCES `presentacion` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `nit` varchar(255) NOT NULL,
  `correo` varchar(255) NOT NULL,
  `telefono` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recepcion`
--

DROP TABLE IF EXISTS `recepcion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `recepcion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `producto_id` int(11) NOT NULL,
  `cantidad` varchar(225) DEFAULT NULL,
  `peso` int(11) DEFAULT NULL,
  `estado` varchar(100) DEFAULT NULL,
  `proveedor_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `recepcion_proveedor_FK` (`proveedor_id`),
  KEY `recepcion_producto_FK` (`producto_id`),
  CONSTRAINT `recepcion_producto_FK` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`),
  CONSTRAINT `recepcion_proveedor_FK` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recepcion`
--

LOCK TABLES `recepcion` WRITE;
/*!40000 ALTER TABLE `recepcion` DISABLE KEYS */;
/*!40000 ALTER TABLE `recepcion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_permission_item`
--

DROP TABLE IF EXISTS `role_permission_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_permission_item` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) unsigned NOT NULL,
  `permission_id` bigint(20) unsigned NOT NULL,
  `item_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_role_permission_item_role_id_FK` (`role_id`),
  KEY `idx_role_permission_item_permission_id_FK` (`permission_id`),
  KEY `idx_role_permission_item_item_id_FK` (`item_id`),
  CONSTRAINT `idx_role_permission_item_item_id_FK` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`),
  CONSTRAINT `idx_role_permission_item_permission_id_FK` FOREIGN KEY (`permission_id`) REFERENCES `permission` (`id`),
  CONSTRAINT `idx_role_permission_item_role_id_FK` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_permission_item`
--

LOCK TABLES `role_permission_item` WRITE;
/*!40000 ALTER TABLE `role_permission_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_permission_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_documento`
--

DROP TABLE IF EXISTS `tipo_documento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_documento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(250) NOT NULL,
  `abreviatura` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_documento`
--

LOCK TABLES `tipo_documento` WRITE;
/*!40000 ALTER TABLE `tipo_documento` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_documento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidad_medida`
--

DROP TABLE IF EXISTS `unidad_medida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `unidad_medida` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `abreviatura` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidad_medida`
--

LOCK TABLES `unidad_medida` WRITE;
/*!40000 ALTER TABLE `unidad_medida` DISABLE KEYS */;
/*!40000 ALTER TABLE `unidad_medida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `fecha_nacimineto` date NOT NULL,
  `tipo_documento_id` int(11) NOT NULL,
  `numero_documento` bigint(20) NOT NULL,
  `correo` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `registro_tipo_documento_FK` (`tipo_documento_id`),
  CONSTRAINT `registro_tipo_documento_FK` FOREIGN KEY (`tipo_documento_id`) REFERENCES `tipo_documento` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'prueba_2'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-18 16:55:34
