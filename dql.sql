-- consultas.sql

-- 1. Crear una tabla temporal a partir de una consulta: Dueños con más de una mascota
CREATE TEMPORARY TABLE DuenosConVariasMascotas AS
SELECT
    D.cedula,
    D.nombre_completo AS NombreDueno,
    COUNT(M.id_mascota) AS CantidadMascotas
FROM
    Dueno D
JOIN
    Mascota M ON D.cedula = M.cedula_dueno
GROUP BY
    D.cedula, D.nombre_completo
HAVING
    COUNT(M.id_mascota) > 1;

-- Consultar la tabla temporal
SELECT * FROM DuenosConVariasMascotas;

-- 2. Alias en campos: Seleccionar el nombre completo del dueño y la mascota
SELECT
    D.nombre_completo AS "Nombre del Dueño",
    M.nombre AS "Nombre de la Mascota"
FROM
    Dueno D
JOIN
    Mascota M ON D.cedula = M.cedula_dueno;

-- 3. Alias en subconsultas: Obtener el nombre de las mascotas que han tenido un tratamiento
SELECT
    M.nombre AS "Mascota con Tratamiento"
FROM
    Mascota M
WHERE
    M.id_mascota IN (SELECT V.id_mascota FROM Visita V JOIN Tratamiento T ON V.id_visita = T.id_visita) AS VisitasConTratamiento;

-- 4. Funciones de agregación (COUNT): Contar el total de mascotas
SELECT COUNT(*) AS TotalMascotas FROM Mascota;

-- 5. Funciones de agregación (AVG): Calcular el precio promedio de los servicios
SELECT AVG(precio_base) AS PrecioPromedioServicios FROM Servicio;

-- 6. Funciones de agregación (MAX/MIN): Obtener el servicio más caro y el más barato
SELECT MAX(precio_base) AS ServicioMasCaro, MIN(precio_base) AS ServicioMasBarato FROM Servicio;

-- 7. Alias en funciones de agregación: Contar mascotas por especie
SELECT
    especie,
    COUNT(id_mascota) AS CantidadPorEspecie
FROM
    Mascota
GROUP BY
    especie;

-- 8. CONCAT: Mostrar nombre completo del dueño y su teléfono en un solo campo
SELECT CONCAT(nombre_completo, ' (Teléfono: ', telefono, ')') AS "Datos de Contacto del Dueño"
FROM Dueno;

-- 9. UPPER, LOWER: Mostrar nombres de servicios en mayúsculas y descripciones en minúsculas
SELECT
    UPPER(nombre_servicio) AS ServicioEnMayusculas,
    LOWER(descripcion) AS DescripcionEnMinusculas
FROM
    Servicio;

-- 10. LENGTH, SUBSTRING, TRIM: Mostrar los primeros 5 caracteres del nombre de la mascota y su longitud
SELECT
    nombre AS NombreMascota,
    SUBSTRING(nombre, 1, 5) AS PrimerosCincoCaracteres,
    LENGTH(nombre) AS LongitudNombre
FROM
    Mascota
WHERE LENGTH(nombre) > 5; -- Solo para nombres con más de 5 caracteres para ver el efecto

-- Ejemplo de TRIM (si los datos tuvieran espacios extra)
-- SELECT TRIM('   Espacio Extra   ') AS TextoSinEspacios;

-- 11. ROUND: Redondear el precio base de los servicios a un decimal
SELECT
    nombre_servicio,
    ROUND(precio_base, 1) AS PrecioRedondeado
FROM
    Servicio;

-- 12. IF en campos (CASE WHEN para compatibilidad SQL estándar): Mostrar si una mascota está vacunada o no
SELECT
    nombre AS NombreMascota,
    CASE
        WHEN vacunada = TRUE THEN 'Sí'
        ELSE 'No'
    END AS EstaVacunada
FROM
    Mascota;

-- 13. JOIN y ORDER BY: Historial de visitas de una mascota específica (ej. Max)
SELECT
    M.nombre AS NombreMascota,
    V.fecha_visita,
    S.nombre_servicio AS ServicioRealizado,
    S.precio_base
FROM
    Visita V
JOIN
    Mascota M ON V.id_mascota = M.id_mascota
JOIN
    Servicio S ON V.id_servicio = S.id_servicio
WHERE
    M.nombre = 'Max'
ORDER BY
    V.fecha_visita DESC;

-- 14. GROUP BY y HAVING: Dueños que han gastado más de $100 en servicios (considerando todas sus mascotas)
SELECT
    D.nombre_completo AS NombreDueno,
    SUM(S.precio_base) AS GastoTotal
FROM
    Dueno D
JOIN
    Mascota M ON D.cedula = M.cedula_dueno
JOIN
    Visita V ON M.id_mascota = V.id_mascota
JOIN
    Servicio S ON V.id_servicio = S.id_servicio
GROUP BY
    D.cedula, D.nombre_completo
HAVING
    SUM(S.precio_base) > 100
ORDER BY
    GastoTotal DESC;

-- 15. Consulta compleja: Mascotas que han tenido un tratamiento y el nombre del tratamiento y el servicio de la visita
SELECT
    M.nombre AS NombreMascota,
    S.nombre_servicio AS ServicioDeVisita,
    T.nombre_tratamiento AS NombreTratamiento,
    T.observaciones AS ObservacionesTratamiento,
    V.fecha_visita
FROM
    Mascota M
JOIN
    Visita V ON M.id_mascota = V.id_mascota
JOIN
    Servicio S ON V.id_servicio = S.id_servicio
JOIN
    Tratamiento T ON V.id_visita = T.id_visita
ORDER BY
    V.fecha_visita DESC, M.nombre;

-- 16. Subconsulta: Obtener el nombre de los dueños que tienen al menos una mascota no vacunada
SELECT
    nombre_completo
FROM
    Dueno
WHERE
    cedula IN (
        SELECT
            cedula_dueno
        FROM
            Mascota
        WHERE
            vacunada = FALSE
    );

-- 17. LEFT JOIN: Listar todos los servicios y cuántas veces han sido utilizados (incluyendo los que no se han usado)
SELECT
    S.nombre_servicio,
    COUNT(V.id_servicio) AS VecesUtilizado
FROM
    Servicio S
LEFT JOIN
    Visita V ON S.id_servicio = V.id_servicio
GROUP BY
    S.nombre_servicio
ORDER BY
    VecesUtilizado DESC;