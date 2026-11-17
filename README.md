# Technova-Sales-SQL-MySQL

Movie Rentals — SQL / MySQL

Descripción
Proyecto práctico de SQL desarrollado sobre una base de datos relacional de alquiler de películas. El objetivo es administrar y analizar información relacionada con películas, directores, actores, clientes, alquileres y pagos, mediante consultas SQL de diferente complejidad.

Herramientas
- MySQL
- SQL
- MySQL Workbench

Estructura de la base de datos

La base de datos está compuesta por las siguientes tablas:
- movies: información de películas.
- directors: información de directores.
- actors: información de actores.
- movie_actors: relación entre películas y actores.
- customers: información de clientes.
- rentals: registro de alquileres.
- payments: registro de pagos asociados a los alquileres.

El modelo incorpora claves primarias (PK), claves foráneas (FK), relaciones uno a muchos y muchos a muchos, y restricciones de integridad referencial.

Desarrollo y consultas SQL
- Consultas básicas: SELECT, WHERE, ORDER BY, DISTINCT y LIMIT.
- Operadores y filtros: IN, NOT IN, BETWEEN, LIKE y condiciones lógicas.
- JOIN: INNER JOIN, LEFT JOIN y relaciones entre múltiples tablas.
- Funciones de agregación: COUNT, SUM, AVG, MIN y MAX.
- GROUP BY y HAVING.
- Subconsultas: consultas escalares, IN, NOT IN, EXISTS y NOT EXISTS.
- CTE (Common Table Expressions).
- Funciones de ventana (Window Functions).

Análisis realizados
- Consulta de películas y sus respectivos directores.
- Identificación de actores asociados a cada película.
- Análisis de alquileres realizados por clientes.
- Consulta de pagos vinculados a los alquileres.
- Agregación y análisis de información mediante agrupaciones.
- Resolución de consultas utilizando subconsultas y relaciones entre tablas.

Organización de archivos
- 01_basic_queries.sql: consultas básicas y filtros.
- 02_joins.sql: relaciones y combinación de tablas.
- 03_aggregations.sql: funciones de agregación y agrupaciones.
- 04_subqueries.sql: subconsultas.
- 05_ctes.sql: expresiones de tabla comunes.
- 06_window_functions.sql: funciones de ventana.

Objetivo
Fortalecer conocimientos de SQL y modelado relacional mediante la construcción de consultas progresivamente más complejas, aplicando técnicas de extracción, combinación, filtrado y análisis de datos para resolver problemas sobre una base de datos estructurada.
