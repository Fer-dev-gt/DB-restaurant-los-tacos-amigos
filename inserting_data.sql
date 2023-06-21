-- INGRESANDO DATA DE LA EMPRESA
INSERT INTO `restaurante` (`id`,`fundacion`,`pais`,`gastronomia`,`inversores`,`anios_operando`)
VALUES
(1,1987,'Guatemala','mexicana','Julio Salazar, Mariana Fuente',36);


-- INGRESANDO DATA DE LOCALES
INSERT INTO `locales` (`id`,`ubicacion`,`capacidad`,`autoservicio`,`parqueo`,`a_domicilio`,`id_restaurante`)
VALUES
(1,'14 Calle 22-07 Zona 9',200,1,1,1,1),
(2,'5 Calle 12-07 Zona 4',130,0,1,1,1),
(3,'2 Avenida 32-07 Zona 11',180,1,1,1,1),
(4,'7 Avenida 4-07 Zona 6',50,0,0,1,1),
(5,'32 Calle 7-07 Zona 10',250,1,1,1,1),
(6,'5 Avenida 18-07 Zona 16',399,1,1,0,1);


-- INGRESANDO DATA DE LOS PLATILLOS
INSERT INTO `platillos` (`id`,`nombre`,`precio`,`tipo_platillo`,`porciones`,`picante`,`id_promocion`)
VALUES
(1,'Tacos al pastor',15,'principal',2,0,1),
(2,'Torta Oaxaqueña',20,'principal',1,0,6),
(3,'Nachos Familiares',25,'entrada',5,0,2),
(4,'Nachos Picantes',15,'entrada',1,1,0),
(5,'Carnitas Grandes',25,'principal',2,0,3),
(6,'TacoPizza',30,'principal',4,0,4),
(7,'Tacos con Jalapeño',15,'principal',1,1,5),
(8,'Torta con Aguacate',20,'principal',1,0,6),
(9,'Tacos de pollo',15,'principal',1,0,6);


-- INGRESANDO DATA DE LOCALES_PLATILLOS
INSERT INTO `locales_platillos`(`id`,`id_local`,`id_platillo`)
VALUES
(1,2,4),
(2,1,2),
(3,1,3),
(4,1,1),
(5,1,5),
(6,1,4),
(7,2,1),
(8,2,9),
(9,2,8),
(10,2,7),
(11,3,1),
(12,3,8),
(13,3,9),
(14,3,6),
(15,3,5),
(16,4,1),
(17,4,3),
(18,4,5),
(19,4,7),
(20,5,8),
(21,5,7),
(22,5,6),
(23,5,2),
(24,5,3),
(25,5,1);


-- INGRESANDO DATA DEL MOBILIARIO
INSERT INTO `mobiliario`(`id`,`nombre`,`seccion`,`costo`,`en_servicio`,`estado`,`id_local`)
VALUES
(1,'estufa','cocina',1500,1,null,1),
(2,'lavaplatos','limpieza',2000,0,'dañada',1),
(3,'triturador','limpieza',550,1,'buen estado',1),
(4,'parrilla','cocina',2500,0,'dañada',2),
(5,'estufa','cocina',1500,0,'dañada',2),
(6,'lavaplatos','limpieza',2000,0,'dañada',2),
(7,'mesas','comedor',400,1,'buen estado',3),
(8,'sillas','comedor',200,1,'buen estado',3),
(9,'triturador','limpieza',550,0,'dañada',3),
(10,'lavamanos','limpieza',1700,1,'buen estado',4),
(11,'secadores','limpieza',2500,0,'dañada',4),
(12,'estufa','cocina',1500,0,'dañada',4),
(13,'parrilla','cocina',2500,0,'dañada',5),
(14,'lavaplatos','limpieza',2000,1,'buen estado',5),
(15,'sillas','comedor',200,1,'buen estado',5);


-- INGRESANDO DATA DE LAS PROMOCIONES
INSERT INTO `promociones`(`id`,`nombre`,`expira`)
VALUES
(1,'Tacos para papá', '2023-06-19'),
(2,'Nachos para muchos', '2023-12-31'),
(3,'Carnitas de independencia', '2023-09-15'),
(4,'Navidad a la mexicana', '2023-12-26'),
(5,'Verano con tacos', '2023-07-31')
(6,'Sin promoción', '2099-12-31');


-- INGRESANDO DATA DE LOS PUESTOS
INSERT INTO `puestos`(`id`,`posicion`,`beneficios`,`departamento`,`id_salario`)
VALUES
(1,'cocinero','almuerzo gratis','cocina',1),
(2,'mesero','almuerzo gratis, transporte gratis','cocina',2),
(3,'contador','almuerzo gratis','administrativo',3),
(4,'programador','almuerzo gratis, descanso fin de semana','administrativo',4),
(5,'gerente','almuerzo gratis, bono de productividad','administrativo',5),
(6,'conserje','almuerzo gratis, transporte gratis','limpieza',6);


-- INGRESANDO DATA DE LOS SALARIOS
INSERT INTO `salarios`(`id_salario`,`salario`,`impuestos`,`deducciones`)
VALUES
(1,5000,200,100),
(2,4000,100,0),
(3,5500,250,350),
(4,7000,500,200),
(5,9000,600,500),
(6,3500,100,0);


-- INGRESANDO DATA DE LOS TRABAJADORES
INSERT INTO `trabajadores`(`id`,`nombre`,`apellido`,`fecha_contratacion`,`anios_trabajando`,`asegurado`,`compensacion`,`bono`,`id_local`,`id_puesto`)
VALUES
(1,'Carlos','Rivera','2018-02-15',5,1,10000,1,1,3),
(2,'Mariana','García','2015-06-21',8,1,25000,1,1,4),
(3,'Julian','Alvarado','2022-11-01',1,0,900,0,2,6),
(4,'Dulce','Ordoñez','2010-10-23',13,1,45000,1,2,5),
(5,'Carlos','Torres','2011-02-15',12,1,15000,1,3,3),
(6,'Stefany','Morales','2023-11-11',1,0,5000,1,3,1),
(7,'Lidia','Vásquez','2017-06-05',6,1,120000,1,4,2),
(8,'Daniel','Castillo','2023-12-15',1,0,1000,1,4,3),
(9,'Raúl','Correa','2018-12-05',5,1,15000,1,5,2),
(10,'Hugo','Toledo','2023-11-15',1,0,1000,1,5,3),
(11,'Alejandra','Gómez','2016-04-17',7,1,13000,1,6,4),
(12,'Luis','Paíz','2023-12-23',1,0,1000,1,6,5),
(13,'Victor','Estrada','2009-02-15',14,1,104000,1,1,2),
(14,'Jennifer','Pinda','2023-12-01',1,0,1000,1,2,1),
(15,'Karla','Ruiz','2018-12-13',5,1,10000,1,4,5);
