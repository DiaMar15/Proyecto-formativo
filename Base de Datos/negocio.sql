CREATE TABLE `accesibilidad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

CREATE TABLE `cargo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_cargo` varchar(225) NOT NULL,
  `salario` bigint(20) NOT NULL,
  `empleado_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `empleado_cargo` (`empleado_id`),
  CONSTRAINT `empleado_cargo` FOREIGN KEY (`empleado_id`) REFERENCES `empleado` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO `cargo` VALUES
(1,'Gerente',80000,1),
(2,'Chef',50000,2),
(3,'Sous Chef',40000,3),
(4,'Ayudante de Cocina',25000,4),
(5,'Cocinero',30000,5),
(6,'Pastelero',35000,6),
(7,'Gerente de Restaurante',75000,7),
(8,'Barista',22000,8),
(9,'Bartender',30000,9),
(10,'Hostess',22000,10),
(11,'Cajero',24000,11),
(12,'Gerente de Alimentos y Bebidas',85000,12),
(13,'Asistente de Cocina',23000,13),
(14,'Planificador de Menú',48000,14),
(15,'Encargado de Compras',50000,15),
(16,'Lavaplatos',20000,16),
(17,'Gerente de Catering',80000,17),
(18,'Especialista en Servicio al Cliente',30000,18),
(19,'Supervisor de Cocina',60000,19),
(20,'Gerente de Bar',70000,20),
(21,'Cocinero de Línea',32000,21),
(22,'Recepcionista',22000,22),
(23,'Gerente de Eventos',72000,23),
(24,'Cocinero de Desayunos',28000,24),
(25,'Cocinero de Almuerzos',29000,25),
(26,'Cocinero de Cenas',29000,26),
(27,'Encargado de Limpieza',21000,27),
(28,'Chef de Partida',45000,28),
(29,'Encargado de Stock',27000,29),
(30,'Cocinero de Buffet',30000,30);

CREATE TABLE `cliente` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `mesa_id` int(11) NOT NULL,
  `persona_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `clientes_mesa_FK` (`mesa_id`),
  KEY `cliente_persona` (`persona_id`),
  CONSTRAINT `cliente_persona` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`id`),
  CONSTRAINT `clientes_mesa_FK` FOREIGN KEY (`mesa_id`) REFERENCES `mesa` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO `cliente` VALUES
(1,1,1),
(2,2,2),
(3,3,3),
(4,4,4),
(5,5,5),
(6,6,6),
(7,7,7),
(8,8,8),
(9,9,9),
(10,10,10),
(11,11,11),
(12,12,12),
(13,13,13),
(14,14,14),
(15,15,15),
(16,16,16),
(17,17,17),
(18,18,18),
(19,19,19),
(20,20,20),
(21,21,21),
(22,22,22),
(23,23,23),
(24,24,24),
(25,25,25),
(26,26,26),
(27,27,27),
(28,28,28),
(29,29,29),
(30,30,30);

CREATE TABLE `descuento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_descuento` varchar(100) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `descuento_porcentaje` decimal(5,2) DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `activo` tinyint(1) DEFAULT 1,
  `ordenVenta_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `orden_venta_descuento` (`ordenVenta_id`),
  CONSTRAINT `orden_venta_descuento` FOREIGN KEY (`ordenVenta_id`) REFERENCES `orden_venta` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO `descuento` VALUES
(1,'Descuento de Bienvenida','Descuento aplicado a la primera compra del cliente.',10.00,'2024-10-01','2024-10-31',1,1),
(2,'Descuento por Pago en Efectivo','Descuento para compras pagadas en efectivo.',5.00,'2024-10-05','2024-12-31',1,2),
(3,'Descuento de Temporada','Descuento aplicado en productos seleccionados durante la temporada.',15.00,'2024-10-10','2024-11-10',0,3),
(4,'Descuento por Compra Mayor','Descuento aplicado al comprar más de 5 unidades.',20.00,'2024-10-15','2024-12-15',1,4),
(5,'Descuento de Fidelidad','Descuento para clientes frecuentes.',7.50,'2024-10-20','2025-01-20',0,5),
(6,'Descuento por Recomendación','Descuento para clientes que recomiendan nuevos clientes.',12.00,'2024-10-01','2024-12-01',1,6),
(7,'Descuento de Fin de Año','Descuento en compras realizadas en diciembre.',25.00,'2024-12-01','2024-12-31',1,7),
(8,'Descuento por Tarjeta de Crédito','Descuento en compras pagadas con tarjeta de crédito.',8.00,'2024-10-01','2024-11-30',0,8),
(9,'Descuento por Aniversario','Descuento en el mes del aniversario de la tienda.',18.00,'2024-10-10','2024-10-31',1,9),
(10,'Descuento por Compra Anticipada','Descuento en compras realizadas con anticipación.',14.00,'2024-10-15','2024-11-15',0,10),
(11,'Descuento por Estudiantes','Descuento aplicado a estudiantes con identificación.',10.00,'2024-10-01','2025-01-01',1,11),
(12,'Descuento de Amigo','Descuento por compra conjunta de amigos.',5.00,'2024-10-05','2024-12-05',1,12),
(13,'Descuento de Temporada de Vacaciones','Descuento en productos seleccionados durante las vacaciones.',15.00,'2024-11-01','2024-11-30',0,13),
(14,'Descuento por Cumpleaños','Descuento para clientes en su mes de cumpleaños.',20.00,'2024-10-01','2024-10-31',1,14),
(15,'Descuento por Compras Recurrentes','Descuento para clientes que compran mensualmente.',10.00,'2024-10-15','2025-01-15',1,15),
(16,'Descuento por Black Friday','Descuento especial para el Black Friday.',30.00,'2024-11-20','2024-11-30',1,16),
(17,'Descuento de Retorno','Descuento para clientes que regresan a comprar.',12.50,'2024-10-01','2024-11-01',0,17),
(18,'Descuento de Membresía','Descuento para miembros del programa de fidelidad.',15.00,'2024-10-10','2025-01-10',1,18),
(19,'Descuento por Compras en Línea','Descuento en compras realizadas a través de la web.',8.00,'2024-10-01','2024-10-31',0,19),
(20,'Descuento por Múltiples Compras','Descuento al comprar más de un producto.',18.00,'2024-10-01','2025-01-01',1,20),
(21,'Descuento de San Valentín','Descuento especial para compras el 14 de febrero.',25.00,'2024-02-01','2024-02-14',1,21),
(22,'Descuento de Halloween','Descuento en compras realizadas en octubre.',15.00,'2024-10-01','2024-10-31',0,22),
(23,'Descuento de Primavera','Descuento para la temporada de primavera.',10.00,'2024-03-01','2024-03-31',1,23),
(24,'Descuento por Día de la Madre','Descuento para compras realizadas el primer domingo de mayo.',20.00,'2024-05-01','2024-05-31',1,24),
(25,'Descuento por Día del Padre','Descuento para compras realizadas el tercer domingo de junio.',20.00,'2024-06-01','2024-06-30',1,25);


CREATE TABLE `empleado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_contratacion` date DEFAULT NULL,
  `salario` decimal(10,2) DEFAULT NULL,
  `persona_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `empleado_persona` (`persona_id`),
  CONSTRAINT `empleado_persona` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO `empleado` VALUES
(1,'2023-01-15',1500.00,1),
(2,'2023-02-20',1600.00,2),
(3,'2023-03-10',1700.00,3),
(4,'2023-04-05',1800.00,4),
(5,'2023-05-15',1750.00,5),
(6,'2023-06-25',1650.00,6),
(7,'2023-07-30',1550.00,7),
(8,'2023-08-18',1900.00,8),
(9,'2023-09-12',2000.00,9),
(10,'2023-10-01',2200.00,10),
(11,'2023-01-25',1500.00,11),
(12,'2023-02-28',1650.00,12),
(13,'2023-03-15',1800.00,13),
(14,'2023-04-20',1750.00,14),
(15,'2023-05-30',1600.00,15),
(16,'2023-06-10',1900.00,16),
(17,'2023-07-15',2000.00,17),
(18,'2023-08-25',2200.00,18),
(19,'2023-09-10',1500.00,19),
(20,'2023-10-05',1600.00,20),
(21,'2023-01-18',1750.00,21),
(22,'2023-02-12',1800.00,22),
(23,'2023-03-28',1650.00,23),
(24,'2023-04-15',1500.00,24),
(25,'2023-05-20',1900.00,25),
(26,'2023-06-30',2000.00,26),
(27,'2023-07-10',2200.00,27),
(28,'2023-08-20',1500.00,28),
(29,'2023-09-25',1650.00,29),
(30,'2023-10-10',1800.00,30);


CREATE TABLE `factura_compra` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `producto_id` int(11) DEFAULT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `factura_compra_producto` (`producto_id`),
  CONSTRAINT `factura_compra_producto` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;


INSERT INTO `factura_compra` VALUES
(1,1,2,5.99,11.98),
(2,2,1,7.49,7.49),
(3,3,3,6.99,20.97),
(4,4,5,4.99,24.95),
(5,5,10,12.99,129.90),
(6,6,4,9.99,39.96),
(7,7,1,8.99,8.99),
(8,8,5,2.49,12.45),
(9,9,2,1.99,3.98),
(10,10,3,3.49,10.47),
(11,11,6,2.99,17.94),
(12,12,4,1.29,5.16),
(13,13,5,0.99,4.95),
(14,14,2,2.79,5.58),
(15,15,1,7.99,7.99),
(16,16,2,10.99,21.98),
(17,17,3,3.99,11.97),
(18,18,6,2.49,14.94),
(19,19,5,2.99,14.95),
(20,20,1,1.79,1.79),
(21,21,1,1.59,1.59),
(22,22,2,3.19,6.38),
(23,23,4,1.49,5.96),
(24,24,1,8.99,8.99),
(25,25,2,4.99,9.98),
(26,26,1,11.99,11.99),
(27,27,5,2.29,11.45),
(28,28,3,1.99,5.97),
(29,29,4,1.49,5.96),
(30,30,2,3.99,7.98),
(31,31,3,1.99,5.97),
(32,32,2,1.29,2.58),
(33,33,1,3.99,3.99),
(34,34,2,10.49,20.98),
(35,35,1,9.99,9.99);


CREATE TABLE `inventario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `producto_id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `empleado_id` int(11) NOT NULL,
  `peso` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `inventario_productos_FK` (`producto_id`),
  KEY `inventario_empleado` (`empleado_id`),
  CONSTRAINT `inventario_empleado` FOREIGN KEY (`empleado_id`) REFERENCES `empleado` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;


INSERT INTO `inventario` VALUES
INSERT INTO `inventario` VALUES
(1,1,20,1,'1 kg'),
(2,2,15,2,'500 g'),
(3,3,10,3,'700 g'),
(4,4,25,4,'1 kg'),
(5,5,5,5,'250 g'),
(6,6,8,6,'300 g'),
(7,7,4,7,'2 kg'),
(8,8,30,8,'500 g'),
(9,9,40,9,'1 kg'),
(10,10,22,10,'300 g'),
(11,11,50,11,'1 kg'),
(12,12,35,12,'500 g'),
(13,13,27,13,'500 g'),
(14,14,18,14,'500 g'),
(15,15,23,15,'1 kg'),
(16,16,11,16,'300 g'),
(17,17,16,17,'500 g'),
(18,18,12,18,'300 g'),
(19,19,14,19,'1 kg'),
(20,20,6,20,'400 g'),
(21,21,20,21,'500 g'),
(22,22,7,22,'1 kg'),
(23,23,13,23,'600 g'),
(24,24,9,24,'1 kg'),
(25,25,15,25,'300 g'),
(26,26,8,26,'1 kg'),
(27,27,19,27,'400 g'),
(28,28,2,28,'300 g'),
(29,29,1,29,'2 kg'),
(30,30,5,30,'500 g');


CREATE TABLE `item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO `item` VALUES
(1,'accesibilidad'),
(2,'cargo'),
(3,'cliente'),
(4,'descuento'),
(5,'empleado'),
(6,'factura_compra'),
(7,'inventario'),
(8,'item'),
(9,'mesa'),
(10,'metodos_pago'),
(11,'orden_compra'),
(12,'orden_venta'),
(13,'permiso'),
(14,'persona'),
(15,'producto'),
(16,'producto_descuento'),
(17,'proveedor'),
(18,'recibo'),
(19,'rol'),
(20,'usuario'),
(21,'venta_pos'),
(22,'zona_quiosco');


CREATE TABLE `mesa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero_mesa` varchar(50) NOT NULL,
  `zona_quiosco_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mesa_unique` (`numero_mesa`),
  KEY `mesa_zona_quiosco_FK` (`zona_quiosco_id`),
  CONSTRAINT `mesa_zona_quiosco_FK` FOREIGN KEY (`zona_quiosco_id`) REFERENCES `zona_quiosco` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;


INSERT INTO `mesa` VALUES
(2,'2',2),
(3,'3',3),
(4,'4',4),
(5,'5',5),
(6,'6',6),
(7,'7',7),
(8,'8',8),
(9,'9',9),
(10,'10',10),
(11,'11',11),
(12,'12',12),
(13,'13',13),
(14,'14',14),
(15,'15',15),
(16,'16',16),
(17,'17',17),
(18,'18',18),
(19,'19',19),
(20,'20',20),
(21,'21',21),
(22,'22',22),
(23,'23',23),
(24,'24',24),
(25,'25',25),
(26,'26',26),
(27,'27',27),
(28,'28',28),
(29,'29',29),
(30,'30',30);


CREATE TABLE `metodos_pago` (
  `id_metodo_pago` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_metodo_pago` varchar(50) NOT NULL,
  `ventaPos_id` int(11) NOT NULL,
  PRIMARY KEY (`id_metodo_pago`),
  KEY `metodosPago_ventaPos` (`ventaPos_id`),
  CONSTRAINT `metodosPago_ventaPos` FOREIGN KEY (`ventaPos_id`) REFERENCES `venta_pos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;


INSERT INTO `metodos_pago` VALUES
(1,'Davivienda',1),
(2,'Bancolombia',2),
(3,'Nequi',3),
(4,'Mercado Pago',4),
(5,'Payvalida',5),
(6,'Ahorro a la mano',6),
(7,'Paypal',7),
(8,'addi',8);


CREATE TABLE `orden_compra` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `empleado_id` int(11) NOT NULL,
  `fecha_orden` datetime DEFAULT current_timestamp(),
  `total` decimal(10,2) NOT NULL,
  `proveedor_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `empleado_orden_compra` (`empleado_id`),
  KEY `orden_compra_proveedor` (`proveedor_id`),
  CONSTRAINT `empleado_orden_compra` FOREIGN KEY (`empleado_id`) REFERENCES `empleado` (`id`),
  CONSTRAINT `orden_compra_proveedor` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;


INSERT INTO `orden_compra` VALUES
(1,1,'2023-01-15 10:30:00',150.00,1),
(2,2,'2023-02-20 11:00:00',250.50,2),
(3,3,'2023-03-10 09:45:00',180.75,3),
(4,4,'2023-04-05 14:15:00',220.00,4),
(5,5,'2023-05-15 08:30:00',300.00,5),
(6,6,'2023-06-25 13:00:00',175.25,6),
(7,7,'2023-07-30 16:20:00',120.50,7),
(8,8,'2023-08-18 10:00:00',250.75,8),
(9,9,'2023-09-12 14:45:00',190.30,9),
(10,10,'2023-10-01 09:15:00',280.90,10),
(11,11,'2023-01-25 11:15:00',150.00,11),
(12,12,'2023-02-28 12:00:00',200.20,12),
(13,13,'2023-03-15 10:30:00',220.90,13),
(14,14,'2023-04-20 09:00:00',170.50,14),
(15,15,'2023-05-30 14:10:00',195.00,15),
(16,16,'2023-06-10 11:50:00',230.40,16),
(17,17,'2023-07-15 15:30:00',300.00,17),
(18,18,'2023-08-25 10:00:00',125.80,18),
(19,19,'2023-09-10 14:00:00',220.25,19),
(20,20,'2023-10-05 12:45:00',180.00,20);


CREATE TABLE `orden_venta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_venta` timestamp NULL DEFAULT current_timestamp(),
  `cliente_id` int(11) DEFAULT NULL,
  `total` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `orden_venta_cliente` (`cliente_id`),
  CONSTRAINT `orden_venta_cliente` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;


INSERT INTO `orden_venta` VALUES
(1,'2024-10-01 05:00:00',1,155000.00),
(2,'2024-10-01 05:00:00',2,82000.00),
(3,'2024-10-01 05:00:00',3,20000.00),
(4,'2024-10-02 05:00:00',4,187000.00),
(5,'2024-10-02 05:00:00',5,98000.00),
(6,'2024-10-02 05:00:00',6,50000.00),
(7,'2024-10-03 05:00:00',7,150000.00),
(8,'2024-10-03 05:00:00',8,65000.00),
(9,'2024-10-03 05:00:00',9,120000.00),
(10,'2024-10-03 05:00:00',10,135000.00),
(11,'2024-10-04 05:00:00',11,90000.00),
(12,'2024-10-04 05:00:00',12,30000.00),
(13,'2024-10-04 05:00:00',13,180000.00),
(14,'2024-10-04 05:00:00',14,57000.00),
(15,'2024-10-05 05:00:00',15,112000.00),
(16,'2024-10-05 05:00:00',16,194000.00),
(17,'2024-10-05 05:00:00',17,72000.00),
(18,'2024-10-05 05:00:00',18,42000.00),
(19,'2024-10-06 05:00:00',19,175000.00),
(20,'2024-10-06 05:00:00',20,5000.00),
(21,'2024-10-06 05:00:00',21,124000.00),
(22,'2024-10-07 05:00:00',22,45000.00),
(23,'2024-10-07 05:00:00',23,58000.00),
(24,'2024-10-07 05:00:00',24,162000.00),
(25,'2024-10-07 05:00:00',25,65000.00),
(26,'2024-10-08 05:00:00',26,149000.00),
(27,'2024-10-08 05:00:00',27,93000.00),
(28,'2024-10-08 05:00:00',28,195000.00),
(29,'2024-10-08 05:00:00',29,38000.00),
(30,'2024-10-08 05:00:00',30,116000.00);


CREATE TABLE `permiso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO `permiso` VALUES
(1,'Agregar'),
(2,'Leer'),
(3,'Modificar'),
(4,'Eliminar'),
(5,'Imprimir');


CREATE TABLE `persona` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `direccion` varchar(225) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `documento_identidad` varchar(20) NOT NULL,
  `email` varchar(225) DEFAULT NULL,
  `estado` enum('Activo','Inactivo') DEFAULT 'Activo',
  `rol_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `documento_identidad` (`documento_identidad`),
  KEY `rol_id` (`rol_id`),
  CONSTRAINT `persona_ibfk_1` FOREIGN KEY (`rol_id`) REFERENCES `rol` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO `persona` VALUES
(1,'Calle 123','3012345678','Juan','Pérez','1012345678','juanp@gmail.com','Activo',3),
(2,'Carrera 456','3023456789','María','García','2023456789','mgarcia@gmail.com','Activo',1),
(3,'Avenida 789','3034567890','Carlos','Rodríguez','3034567890','crodri@gmail.com','Inactivo',2),
(4,'Calle 321','3045678901','Ana','Torres','4045678901','atorres@gmail.com','Activo',2),
(5,'Avenida 654','3056789012','Luis','Fernández','5056789012','lfernandez@gmail.com','Inactivo',2),
(6,'Carrera 987','3067890123','Laura','Martínez','6067890123','lauram@gmail.com','Activo',2),
(7,'Calle 654','3078901234','Jorge','López','7078901234','jlopez@gmail.com','Inactivo',2),
(8,'Avenida 321','3089012345','Sofía','Morales','8089012345','smorales@gmail.com','Activo',2),
(9,'Calle 987','3090123456','Fernando','Jiménez','9090123456','fjimenez@gmail.com','Activo',2),
(10,'Avenida 654','3101234567','Valeria','Sánchez','1012345679','vsanchez@gmail.com','Inactivo',2),
(11,'Carrera 456','3112345678','Diego','Castro','1212345670','dcastro@gmail.com','Activo',2),
(12,'Calle 789','3123456789','Gabriela','Ramírez','1312345671','gramirez@gmail.com','Inactivo',2),
(13,'Avenida 123','3134567890','Pedro','Díaz','1412345672','pdiaz@gmail.com','Activo',2),
(14,'Calle 456','3145678901','Claudia','Herrera','1512345673','cherrera@gmail.com','Inactivo',2),
(15,'Carrera 789','3156789012','Andrés','Vargas','1612345674','avargas@gmail.com','Activo',2),
(16,'Avenida 123','3167890123','Isabel','Romero','1712345675','iromero@gmail.com','Inactivo',2),
(17,'Calle 456','3178901234','Fernando','Salazar','1812345676','fsalazar@gmail.com','Activo',2),
(18,'Carrera 789','3189012345','Lucía','Cabrera','1912345677','lcabrera@gmail.com','Activo',2),
(19,'Calle 123','3190123456','Mario','Rojas','2023456788','mrojas@gmail.com','Inactivo',2),
(20,'Avenida 456','3201234567','Sara','Castillo','2123456789','scastillo@gmail.com','Activo',2);


CREATE TABLE `producto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_producto` varchar(100) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `cantidad` int(11) NOT NULL,
  `peso_producto` varchar(225) DEFAULT NULL,
  `inventario_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `producto_inventario` (`inventario_id`),
  CONSTRAINT `producto_inventario` FOREIGN KEY (`inventario_id`) REFERENCES `inventario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;


INSERT INTO `producto` VALUES
(1,'Pechuga de Pollo',5.99,'Pechuga de pollo fresca y magra',100,'1 kg',1),
(2,'Carne Molida de Res',7.49,'Carne molida de res, ideal para hamburguesas',80,'500 g',1),
(3,'Chuleta de Cerdo',6.99,'Chuleta de cerdo de primera calidad',50,'700 g',1),
(4,'Salchichas',4.99,'Salchichas ahumadas, perfectas para asar',150,'1 kg',1),
(5,'Filete de Salmón',12.99,'Salmón fresco, rico en omega-3',30,'250 g',1),
(6,'Bistec de Res',9.99,'Bistec de res tierno y jugoso',40,'300 g',1),
(7,'Pollo Entero',8.99,'Pollo entero, ideal para asar',20,'2 kg',1),
(8,'Pimientos Rojos',2.49,'Pimientos rojos frescos',200,'500 g',2),
(9,'Zanahorias',1.99,'Zanahorias crujientes y frescas',300,'1 kg',2),
(10,'Brócoli',3.49,'Brócoli fresco, rico en vitaminas',150,'500 g',2),
(11,'Espinacas',2.99,'Espinacas frescas, perfectas para ensaladas',100,'300 g',2),
(12,'Cebolla',1.29,'Cebolla blanca, ideal para cocinar',250,'1 kg',2),
(13,'Ajo',0.99,'Cabezas de ajo fresco',400,'500 g',2),
(14,'Calabacín',2.79,'Calabacín fresco, ideal para salteados',200,'500 g',2),
(15,'Pechuga de Pavo',7.99,'Pechuga de pavo, baja en grasas',70,'1 kg',1),
(16,'Costillas de Cerdo',10.99,'Costillas de cerdo adobadas',60,'1 kg',1),
(17,'Tofu',3.99,'Tofu firme, ideal para vegetarianos',90,'300 g',3),
(18,'Atún en Lata',2.49,'Atún en agua, rico en proteínas',200,'200 g',3),
(19,'Verduras Mixtas Congeladas',2.99,'Mezcla de verduras congeladas',120,'1 kg',3),
(20,'Chícharos',1.79,'Chícharos frescos y nutritivos',250,'500 g',2),
(21,'Lechuga',1.59,'Lechuga fresca, ideal para ensaladas',150,'300 g',2),
(22,'Berenjena',3.19,'Berenjena fresca, ideal para asar',130,'500 g',2),
(23,'Patatas',1.49,'Patatas frescas, ideales para guisar',300,'2 kg',2),
(24,'Guiso de Carne',8.99,'Guiso de carne listo para calentar',40,'500 g',1),
(25,'Sopa de Pollo',4.99,'Sopa de pollo casera, lista para servir',60,'400 g',3),
(26,'Carne de Cerdo Asada',11.99,'Carne de cerdo asada, jugosa y sabrosa',30,'600 g',1),
(27,'Tortilla de Maíz',2.29,'Tortillas de maíz, frescas y suaves',200,'1 kg',3),
(28,'Chiles Jalapeños',1.99,'Chiles jalapeños frescos',150,'300 g',2),
(29,'Pasta de Tomate',1.49,'Pasta de tomate, ideal para salsas',220,'400 g',3),
(30,'Espárragos',3.99,'Espárragos frescos, ideales para asar',80,'300 g',2),
(31,'Pasta Integral',1.99,'Pasta integral, rica en fibra',120,'500 g',3),
(32,'Lentejas',1.29,'Lentejas secas, ideales para guisos',180,'1 kg',3),
(33,'Quinoa',3.99,'Quinoa orgánica, rica en proteínas',90,'500 g',3),
(34,'Carne de Res Estofada',10.49,'Carne de res estofada, lista para servir',50,'400 g',1),
(35,'Pescado Blanco',9.99,'Pescado blanco fresco',20,'300 g',1);


CREATE TABLE `producto_descuento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descuento_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `descuento_id` (`descuento_id`),
  CONSTRAINT `descuento_id` FOREIGN KEY (`descuento_id`) REFERENCES `descuento` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;


INSERT INTO `producto_descuento` VALUES
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7),
(8,8),
(9,9),
(10,10),
(11,11),
(12,12),
(13,13),
(14,14),
(15,15),
(16,16),
(17,17),
(18,18),
(19,19),
(20,20),
(21,21),
(22,22),
(23,23),
(24,24),
(25,25);


CREATE TABLE `proveedor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contacto` varchar(100) DEFAULT NULL,
  `persona_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `proveedor_persona` (`persona_id`),
  CONSTRAINT `proveedor_persona` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;


INSERT INTO `proveedor` VALUES
(1,'3001234567',1),
(2,'3012345678',2),
(3,'3023456789',3),
(4,'3034567890',4),
(5,'3045678901',5),
(6,'3056789012',6),
(7,'3067890123',7),
(8,'3078901234',8),
(9,'3089012345',9),
(10,'3090123456',10),
(11,'3101234567',11),
(12,'3112345678',12),
(13,'3123456789',13),
(14,'3134567890',14),
(15,'3145678901',15),
(16,'3156789012',16),
(17,'3167890123',17),
(18,'3178901234',18),
(19,'3189012345',19),
(20,'3190123456',20);


CREATE TABLE `recibo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `producto_id` varchar(225) DEFAULT NULL,
  `peso` varchar(225) DEFAULT NULL,
  `devolucion` varchar(225) DEFAULT NULL,
  `iva` varchar(225) DEFAULT NULL,
  `proveedor_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `recibo_proveedor` (`proveedor_id`),
  CONSTRAINT `recibo_proveedor` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;


INSERT INTO `recibo` VALUES
(1,'1','1 kg','No','19.00',1),
(2,'2','500 g','No','19.00',2),
(3,'3','700 g','No','19.00',3),
(4,'4','1 kg','No','19.00',4),
(5,'5','250 g','No','19.00',5),
(6,'6','300 g','No','19.00',6),
(7,'7','2 kg','No','19.00',7),
(8,'8','500 g','No','19.00',8),
(9,'9','1 kg','No','19.00',9),
(10,'10','500 g','No','19.00',10),
(11,'11','300 g','No','19.00',11),
(12,'12','1 kg','No','19.00',12),
(13,'13','500 g','No','19.00',13),
(14,'14','500 g','No','19.00',14),
(15,'15','1 kg','No','19.00',15),
(16,'16','1 kg','No','19.00',16),
(17,'17','300 g','No','19.00',17),
(18,'18','200 g','No','19.00',18),
(19,'19','1 kg','No','19.00',19),
(20,'20','500 g','No','19.00',20),
(21,'21','300 g','No','19.00',1),
(22,'22','500 g','No','19.00',2),
(23,'23','2 kg','No','19.00',3),
(24,'24','500 g','No','19.00',4),
(25,'25','400 g','No','19.00',5),
(26,'26','600 g','No','19.00',6),
(27,'27','1 kg','No','19.00',7),
(28,'28','300 g','No','19.00',8),
(29,'29','400 g','No','19.00',9),
(30,'30','300 g','No','19.00',10),
(31,'31','500 g','No','19.00',11),
(32,'32','1 kg','No','19.00',12),
(33,'33','500 g','No','19.00',13),
(34,'34','400 g','No','19.00',14),
(35,'35','300 g','No','19.00',15);


CREATE TABLE `rol` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `usuario_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rol_usuario_FK` (`usuario_id`),
  CONSTRAINT `rol_usuario_FK` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;


INSERT INTO `rol` VALUES
(1,'gerente',1),
(2,'empleado',2),
(3,'administrador',3),
(4,'cliente',4);


CREATE TABLE `rol_permiso_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permiso_id` int(11) DEFAULT NULL,
  `rol_id` int(11) DEFAULT NULL,
  `item_id` int(11) NOT NULL,
  `accesibilidad_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `permiso_id` (`permiso_id`),
  KEY `rol_id` (`rol_id`),
  KEY `item_id` (`item_id`),
  KEY `accesibilidad_id` (`accesibilidad_id`),
  CONSTRAINT `accesibilidad_id` FOREIGN KEY (`accesibilidad_id`) REFERENCES `accesibilidad` (`id`),
  CONSTRAINT `item_id` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`),
  CONSTRAINT `rol_id` FOREIGN KEY (`rol_id`) REFERENCES `rol` (`id`),
  CONSTRAINT `rol_permiso_item_ibfk_1` FOREIGN KEY (`permiso_id`) REFERENCES `permiso` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;


INSERT INTO `rol_permiso_item` VALUES
(1,1,1,1,1),
(2,1,1,2,1),
(3,1,2,3,2),
(4,2,1,1,1),
(5,2,2,2,1),
(6,2,3,4,3),
(7,3,1,5,2),
(8,3,2,1,1),
(9,3,3,3,1),
(10,4,1,2,3),
(11,4,2,4,2),
(12,4,3,5,1),
(13,5,1,6,1),
(14,5,2,7,2),
(15,5,3,8,3),
(16,6,2,9,1),
(17,6,3,10,2),
(18,6,1,11,3),
(19,7,1,12,1),
(20,7,2,13,2),
(21,7,3,14,1);



CREATE TABLE `roles` (
  `id_rol` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_rol` varchar(50) NOT NULL,
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO `roles` VALUES
(1,'Administrador'),
(2,'Gerente'),
(3,'Chef'),
(4,'Mesero'),
(5,'Bartender'),
(6,'Contador'),
(7,'Mantenimiento'),
(8,'Seguridad'),
(9,'Pastelero'),
(10,'Marketing');


CREATE TABLE `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_usuario` varchar(100) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fecha_registro` timestamp NULL DEFAULT current_timestamp(),
  `empleado_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuario` (`usuario`),
  KEY `usuario_empleado_FK` (`empleado_id`),
  CONSTRAINT `usuario_empleado_FK` FOREIGN KEY (`empleado_id`) REFERENCES `empleado` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;


INSERT INTO `usuario` VALUES
(1,'Juan Pérez','juanp','pass1234','2024-01-01 05:00:00',1),
(2,'María García','mgarcia','abc98765','2024-01-02 05:00:00',2),
(3,'Carlos Rodríguez','crodri','secure1','2024-01-03 05:00:00',3),
(4,'Ana Torres','atorres','myp@ss','2024-01-04 05:00:00',4),
(5,'Luis Fernández','lfernandez','1234567890','2024-01-05 05:00:00',5),
(6,'Laura Martínez','lauram','qwerty123','2024-01-06 05:00:00',6),
(7,'Jorge López','jlopez','letmein1','2024-01-07 05:00:00',7),
(8,'Sofía Morales','smorales','passw0rd','2024-01-08 05:00:00',8),
(9,'Fernando Jiménez','fjimenez','12345abcde','2024-01-09 05:00:00',9),
(10,'Valeria Sánchez','vsanchez','pwd!2345','2024-01-10 05:00:00',10),
(11,'Diego Castro','dcastro','abc!@#123','2024-01-11 05:00:00',11),
(12,'Gabriela Ramírez','gramirez','test1234','2024-01-12 05:00:00',12),
(13,'Pedro Díaz','pdiaz','qwert@123','2024-01-13 05:00:00',13),
(14,'Claudia Herrera','cherrera','hello123','2024-01-14 05:00:00',14),
(15,'Andrés Vargas','avargas','secret1','2024-01-15 05:00:00',15),
(16,'Isabel Romero','iromero','abc123xyz','2024-01-16 05:00:00',16),
(17,'Fernando Salazar','fsalazar','pass123!','2024-01-17 05:00:00',17),
(18,'Lucía Cabrera','lcabrera','1234abcd','2024-01-18 05:00:00',18),
(19,'Mario Rojas','mrojas','xyz123!@#','2024-01-19 05:00:00',19),
(20,'Sara Castillo','scastillo','p@ssword','2024-01-20 05:00:00',20),
(21,'Cristian Silva','csilva','mysecre1','2024-01-21 05:00:00',21),
(22,'Andrea Benitez','abenitez','abcd!@#$','2024-01-22 05:00:00',22),
(23,'Hugo Morales','hmorales','123!abcd','2024-01-23 05:00:00',23),
(24,'Diana Martínez','dmartinez','7890pass','2024-01-24 05:00:00',24),
(25,'Ernesto López','elopes','ilovep@ss','2024-01-25 05:00:00',25),
(26,'Clara Ortega','cortega','asdfgh123','2024-01-26 05:00:00',26),
(27,'Pablo Cifuentes','pcifuentes','12345!@#','2024-01-27 05:00:00',27),
(28,'Marta Gómez','mgomez','g0odmorning','2024-01-28 05:00:00',28),
(29,'Rafael Álvarez','ralvarez','simple1','2024-01-29 05:00:00',29),
(30,'Patricia Medina','pmedina','y@z7890','2024-01-30 05:00:00',30);



CREATE TABLE `venta_pos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero_factura` varchar(50) NOT NULL,
  `fecha_emision` timestamp NULL DEFAULT current_timestamp(),
  `total_factura` decimal(10,2) DEFAULT NULL,
  `ordenVenta_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `numero_factura` (`numero_factura`),
  KEY `ventaPos_ordenVenta` (`ordenVenta_id`),
  CONSTRAINT `ventaPos_ordenVenta` FOREIGN KEY (`ordenVenta_id`) REFERENCES `orden_venta` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;


INSERT INTO `venta_pos` VALUES
(1,'FAC-001','2024-10-01 05:00:00',155000.00,1),
(2,'FAC-002','2024-10-01 05:00:00',82000.00,2),
(3,'FAC-003','2024-10-01 05:00:00',20000.00,3),
(4,'FAC-004','2024-10-02 05:00:00',187000.00,4),
(5,'FAC-005','2024-10-02 05:00:00',98000.00,5),
(6,'FAC-006','2024-10-02 05:00:00',50000.00,6),
(7,'FAC-007','2024-10-03 05:00:00',150000.00,7),
(8,'FAC-008','2024-10-03 05:00:00',65000.00,8),
(9,'FAC-009','2024-10-03 05:00:00',120000.00,9),
(10,'FAC-010','2024-10-03 05:00:00',135000.00,10),
(11,'FAC-011','2024-10-04 05:00:00',90000.00,11),
(12,'FAC-012','2024-10-04 05:00:00',30000.00,12),
(13,'FAC-013','2024-10-04 05:00:00',180000.00,13),
(14,'FAC-014','2024-10-04 05:00:00',57000.00,14),
(15,'FAC-015','2024-10-05 05:00:00',112000.00,15),
(16,'FAC-016','2024-10-05 05:00:00',194000.00,16),
(17,'FAC-017','2024-10-05 05:00:00',72000.00,17),
(18,'FAC-018','2024-10-05 05:00:00',42000.00,18),
(19,'FAC-019','2024-10-06 05:00:00',175000.00,19),
(20,'FAC-020','2024-10-06 05:00:00',5000.00,20),
(21,'FAC-021','2024-10-06 05:00:00',124000.00,21),
(22,'FAC-022','2024-10-07 05:00:00',45000.00,22),
(23,'FAC-023','2024-10-07 05:00:00',58000.00,23),
(24,'FAC-024','2024-10-07 05:00:00',162000.00,24),
(25,'FAC-025','2024-10-07 05:00:00',65000.00,25),
(26,'FAC-026','2024-10-08 05:00:00',149000.00,26),
(27,'FAC-027','2024-10-08 05:00:00',93000.00,27),
(28,'FAC-028','2024-10-08 05:00:00',195000.00,28),
(29,'FAC-029','2024-10-08 05:00:00',38000.00,29),
(30,'FAC-030','2024-10-08 05:00:00',116000.00,30);


CREATE TABLE `zona_quiosco` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero_zona` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;


INSERT INTO `zona_quiosco` VALUES
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7),
(8,8),
(9,9),
(10,10),
(11,11),
(12,12),
(13,13),
(14,14),
(15,15),
(16,16),
(17,17),
(18,18),
(19,19),
(20,20),
(21,21),
(22,22),
(23,23),
(24,24),
(25,25),
(26,26),
(27,27),
(28,28),
(29,29),
(30,30);
