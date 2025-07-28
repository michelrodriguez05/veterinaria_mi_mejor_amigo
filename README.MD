# 🐾 Veterinaria "Mi Mejor Amigo"

Sistema de base de datos diseñado para gestionar la información de una veterinaria, incluyendo dueños, mascotas, consultas, tratamientos y personal veterinario. Este proyecto fue realizado como ejercicio académico, aplicando conceptos de modelado de datos, normalización y consultas en SQL.

---

## 📌 Contenido del Repositorio

Este repositorio contiene los siguientes archivos:

- `ddl.sql`: Script para crear la base de datos y sus tablas.
- `dml.sql`: Script con datos de prueba insertados en las tablas.
- `dql.sql`: Consultas SQL solicitadas para extraer información relevante del sistema.


---


## 🔧 Proceso de Desarrollo

1. **Análisis de requerimientos**  
   Se identificaron las entidades necesarias, atributos y relaciones entre ellas con base en un escenario realista de una veterinaria.

2. **Diseño del modelo ER y relacional**  
   Se elaboraron los diagramas en Draw.io asegurando cumplir con la normalización hasta 3FN.

3. **Creación de tablas**  
   En `estructura.sql` se definieron las tablas, tipos de datos, claves primarias y foráneas.

4. **Población de datos**  
   Se insertaron datos ficticios en `datos.sql` para probar la integridad y funcionamiento del sistema.

5. **Consultas SQL**  
   Se elaboraron consultas en `consultas.sql` para responder preguntas clave como:
   - Dueños con más de una mascota
   - Consultas recientes
   - Mascotas con múltiples tratamientos
   - Veterinarios con mayor número de atenciones

---

## ▶️ Instrucciones de Uso

1. Abre MySQL Workbench o tu entorno SQL preferido.
2. Ejecuta `ddl.sql` para crear las tablas.
3. Luego ejecuta `dml.sql` para insertar datos de prueba.
4. Finalmente, ejecuta `dql.sql` para ver los resultados solicitados.

---

## 👤 Autor

- **Michel Rodrigue**  
  Estudiante de desarrollo de software  
  GitHub: [@michelrodriguez05](https://github.com/michelrodriguez05/veterinaria_mi_mejor_amigo)

---

## 📚 Nota Final

Este proyecto demuestra el uso de técnicas de modelado, diseño de bases de datos y consultas SQL aplicadas a un caso realista. El objetivo es garantizar una estructura clara, normalizada y funcional para manejar información de una veterinaria.



