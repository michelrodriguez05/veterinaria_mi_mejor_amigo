-- 1. Lista de mascotas con nombre del dueño (JOIN)
SELECT m.nombre AS mascota, d.nombre AS dueno
FROM Mascota m
JOIN Dueno d ON m.id_dueno = d.id_dueno;

-- 2. Número total de mascotas registradas
SELECT COUNT(*) AS total_mascotas FROM Mascota;

-- 3. Promedio de edad de mascotas
SELECT AVG(edad) AS promedio_edad FROM Mascota;

-- 4. Dueños con más de una mascota
SELECT d.nombre, d.apellido, COUNT(m.id_mascota) AS cantidad
FROM Dueno d
JOIN Mascota m ON d.id_dueno = m.id_dueno
GROUP BY d.id_dueno
HAVING COUNT(m.id_mascota) > 1;

-- 5. Servicios cuyo precio supera 20000
SELECT nombre, precio FROM Servicio WHERE precio > 20000;

-- 6. Nombre de servicios en mayúsculas
SELECT UPPER(nombre) AS servicio_mayus FROM Servicio;

-- 7. Tratamientos con nombre y primeras 10 letras de observaciones
SELECT nombre, SUBSTRING(observaciones, 1, 10) AS resumen FROM Tratamiento;

-- 8. Longitud del nombre de cada mascota
SELECT nombre, LENGTH(nombre) AS longitud FROM Mascota;

-- 9. Lista de mascotas vacunadas con 'Sí' o 'No'
SELECT nombre, IF(vacunada = 1, 'Sí', 'No') AS vacunada FROM Mascota;

-- 10. Historial de visitas por mascota
SELECT m.nombre AS mascota, v.fecha, s.nombre AS servicio
FROM Visita v
JOIN Mascota m ON v.id_mascota = m.id_mascota
JOIN Servicio s ON v.id_servicio = s.id_servicio;

-- 11. Precio promedio de los servicios
SELECT ROUND(AVG(precio), 2) AS promedio_precio FROM Servicio;

-- 12. Servicios ordenados por precio descendente
SELECT nombre, precio FROM Servicio ORDER BY precio DESC;

-- 13. Mascotas cuyo nombre contiene la letra 'a'
SELECT nombre FROM Mascota WHERE nombre LIKE '%a%';

-- 14. Total de visitas por servicio
SELECT s.nombre AS servicio, COUNT(v.id_visita) AS total
FROM Visita v
JOIN Servicio s ON v.id_servicio = s.id_servicio
GROUP BY s.nombre;

-- 15. Nombre completo de los dueños concatenado
SELECT CONCAT(nombre, ' ', apellido) AS nombre_completo FROM Dueno;
