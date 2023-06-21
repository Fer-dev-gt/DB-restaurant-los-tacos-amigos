-- CREACIÓN DE TABLAS RESTARUANTE 'LOS AMIGOS TACOS 🌮'

-- TABLA DE LOCALES DEL RESTARANTE
CREATE TABLE `locales` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ubicacion` varchar(40) NOT NULL,
  `capacidad` int DEFAULT NULL,
  `autoservicio` bit(1) NOT NULL,
  `parqueo` bit(1) NOT NULL,
  `a_domicilio` bit(1) NOT NULL,
  `id_restaurante` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `restaurante_locales_idx` (`id_restaurante`),
  CONSTRAINT `restaurante_locales` FOREIGN KEY (`id_restaurante`) REFERENCES `restaurante` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);

-- TABLA DE LOS PLATILLOS DEL RESTAURANTE
CREATE TABLE `platillos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) NOT NULL,
  `precio` int NOT NULL,
  `tipo_platillo` varchar(40) DEFAULT NULL,
  `porciones` int NOT NULL,
  `picante` bit(1) NOT NULL,
  `id_promocion` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `platillos_promociones_idx` (`id_promocion`),
  CONSTRAINT `platillos_promociones` FOREIGN KEY (`id_promocion`) REFERENCES `promociones` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);

-- TABLA TRANSITIVA DE TABLAS 'LOCALES' Y 'PLATILLOS'
CREATE TABLE `locales_platillos` (
  `id` int NOT NULL,
  `id_local` int NOT NULL,
  `id_platillo` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `localesplatillos_idx` (`id_local`),
  KEY `localesplatillos_platillo_idx` (`id_platillo`),
  CONSTRAINT `localesplatillos_local` FOREIGN KEY (`id_local`) REFERENCES `locales` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `localesplatillos_platillo` FOREIGN KEY (`id_platillo`) REFERENCES `platillos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);

-- TABLA DEL MOBILIARIO DE CADA LOCAL
CREATE TABLE `mobiliario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `seccion` varchar(40) NOT NULL,
  `costo` int NOT NULL,
  `en_servicio` bit(1) NOT NULL,
  `estado` char(18) DEFAULT 'buen estado',
  `id_local` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mobiliario_locales_idx` (`id_local`),
  CONSTRAINT `mobiliario_locales` FOREIGN KEY (`id_local`) REFERENCES `locales` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ;

-- TABLA DE PROMOCIONES VALIDAS DE CADA PLATILLO
CREATE TABLE `promociones` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) NOT NULL,
  `expira` date NOT NULL,
  PRIMARY KEY (`id`)
);

-- TABLA DE PUESTOS QUE EXISTEN EN LA EMPRESA
CREATE TABLE `puestos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `posicion` varchar(40) NOT NULL,
  `salario` int NOT NULL,
  `beneficios` varchar(40) DEFAULT NULL,
  `departamento` varchar(40) NOT NULL,
  `id_salario` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `puestos_salarios_idx` (`id_salario`),
  CONSTRAINT `puestos_salarios` FOREIGN KEY (`id_salario`) REFERENCES `salarios` (`id_salario`) ON DELETE CASCADE ON UPDATE CASCADE
);

-- TABLA DEL RESTAURANTE Y EMPRESA EN GENERAL
CREATE TABLE `restaurante` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fundacion` int DEFAULT NULL,
  `pais` varchar(40) NOT NULL,
  `gastronomia` varchar(40) NOT NULL,
  `inversores` varchar(40) DEFAULT NULL,
  `anios_operando` int DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- TABLA DE SALARIOS EXISTENTES
CREATE TABLE `salarios` (
  `id_salario` int NOT NULL AUTO_INCREMENT,
  `impuestos` int NOT NULL,
  `deducciones` int DEFAULT NULL,
  PRIMARY KEY (`id_salario`)
);

-- TABLA DE TRABAJADORES DE LA EMPRESA
CREATE TABLE `trabajadores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) NOT NULL,
  `apellido` varchar(40) NOT NULL,
  `fecha_contratacion` date DEFAULT NULL,
  `anios_trabajando` int DEFAULT NULL,
  `asegurado` bit(1) NOT NULL,
  `compensacion` int NOT NULL,
  `bono` bit(1) NOT NULL,
  `id_local` int NOT NULL,
  `id_puesto` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `locales_trabajadores_idx` (`id_local`),
  KEY `trabajadores_puestos_idx` (`id_puesto`),
  CONSTRAINT `trabajadores_locales` FOREIGN KEY (`id_local`) REFERENCES `locales` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `trabajadores_puestos` FOREIGN KEY (`id_puesto`) REFERENCES `puestos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);
