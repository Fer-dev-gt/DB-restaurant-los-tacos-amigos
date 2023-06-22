-- Estructura básica de un Query

SELECT *
FROM trabajadores
WHERE YEAR(fecha_contratacion) > "2019";

SELECT *
FROM capitulos
WHERE YEAR(fecha_contratacion) < "2019";

-- SELECT, COUNT, AS
SELECT *
FROM platillos;

SELECT nombre, precio
FROM platillos;

SELECT nombre AS descripcion_comida, precio
FROM platillos;

SELECT COUNT(*) AS cantidad_platillos
FROM platillos;

-- JOINs

SELECT *
FROM locales
	LEFT JOIN trabajadores ON locales.id=trabajadores.id_local;
    
SELECT *
FROM locales
	RIGHT JOIN trabajadores ON locales.id=trabajadores.id_local;

SELECT *
FROM platillos
	INNER JOIN promociones ON promociones.id=platillos.id_promocion;
    
SELECT *
FROM platillos
	INNER JOIN promociones ON promociones.id=platillos.id_promocion
WHERE promociones.nombres IS 'Sin promoción';

SELECT *
FROM mobiliario
	INNER JOIN locales ON locales.id=mobiliario.id_local
WHERE mobiliario.estado IS NULL;

SELECT *
FROM mobiliario
	LEFT JOIN locales ON locales.id=mobiliario.id_local;
    
SELECT *
FROM mobiliario
	LEFT JOIN locales ON locales.id=mobiliario.id_local
UNION
SELECT *
FROM mobiliario
	RIGHT JOIN locales ON locales.id=mobiliario.id_local;

SELECT *
FROM mobiliario
	LEFT JOIN locales ON locales.id=mobiliario.id_local
WHERE mobiliario.estado IS NULL
UNION
SELECT *
FROM mobiliario
	RIGHT JOIN locales ON locales.id=mobiliario.id_local
WHERE mobiliario.estado IS NULL;

-- WHERE LIKE BETWEEN YEAR

SELECT *
FROM trabajadores
WHERE id > 3;

SELECT *
FROM platillos
WHERE id < 3;

SELECT *
FROM mobiliario
WHERE estado ="dañada";

SELECT *
FROM mobiliario
WHERE estado ="buen estado";

SELECT *
FROM mobiliario
WHERE estado !="buen estado";

SELECT *
FROM salarios
WHERE id_salario != 3;

SELECT *
FROM platillos
WHERE nombre LIKE "%Taco%";

SELECT *
FROM platillos
WHERE nombre LIKE "nachos%";

SELECT *
FROM trabajadores
WHERE fecha_contratacion > "2020-01-01";

SELECT *
FROM trabajadores
WHERE fecha_contratacion < "2020-01-01";

SELECT *
FROM trabajadores
WHERE fecha_contratacion BETWEEN "2018-01-10" AND "2023-01-23";

SELECT *
FROM puestos
WHERE id BETWEEN 2 AND 4;

SELECT *
FROM promociones
WHERE YEAR(expira) BETWEEN "2040" AND "2099";

SELECT *
FROM trabajadores
WHERE MONTH(fecha_contratacion) = "06";

-- WHERE nulo y no nulo

SELECT *
FROM mobiliario
WHERE id IS NULL;

SELECT *
FROM platillos
WHERE id_promocion IS NOT NULL
AND nombre != "pizza";

SELECT *
FROM platillos
WHERE id_promocion IS NOT NULL
AND nombre != "pizza"
AND id > 4;

-- GROUP BY
SELECT estado, COUNT(*) as cantidad_muebles
FROM mobiliario
GROUP BY estado;

SELECT precio, SUM(porciones) as porciones_totales
FROM platillos
GROUP BY precio;

SELECT MONTHNAME(fecha_contratacion) AS mes_contratacion, DAYNAME(fecha_contratacion) AS dia_contratacion, anios_trabajando, COUNT(*) AS trabajadores_contratados
FROM trabajadores
GROUP BY anios_trabajando, mes_contratacion, dia_contratacion;

-- ORDER BY HAVING LIMIT

SELECT *
FROM locales
ORDER BY capacidad;

SELECT *
FROM locales
ORDER BY capacidad DESC;

SELECT *
FROM trabajadores
ORDER BY anios_trabajando DESC
LIMIT 5;

SELECT MONTHNAME(fecha_contratacion) AS mes_contratacion, DAYNAME(fecha_contratacion) AS dia_contratacion, anios_trabajando, COUNT(*) AS trabajadores_contratados
FROM trabajadores
GROUP BY anios_trabajando, mes_contratacion, dia_contratacion 
ORDER BY anios_trabajando DESC;

SELECT MONTHNAME(fecha_contratacion) AS mes_contratacion, DAYNAME(fecha_contratacion) AS dia_contratacion, anios_trabajando, COUNT(*) AS trabajadores_contratados
FROM trabajadores
GROUP BY anios_trabajando, mes_contratacion, dia_contratacion 
HAVING anios_trabajando > 5
ORDER BY anios_trabajando DESC;

-- Nested queries
SELECT new_table_projection.date, COUNT(*) AS capitulo_count
FROM(
	SELECT DATE(MIN(fecha_contratacion)) AS date, MONTH(fecha_contratacion) AS month
    FROM trabajadores
    GROUP BY month) AS  new_table_projection
    GROUP BY new_table_projection.date
    ORDER BY new_table_projection.date;
    

SELECT *
FROM trabajadores
WHERE fecha_contratacion = (
	SELECT MAX(fecha_contratacion)
    FROM trabajadores);
  