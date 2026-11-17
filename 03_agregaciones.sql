USE movie_rentals;

-- 01. Cantidad total de peliculas en el catalogo.
SELECT COUNT(title) AS total_peliculas
FROM movies;

-- 02. Precio de alquiler promedio, minimo y maximo de las peliculas.
SELECT ROUND(AVG(rental_price), 2) AS p_promedio, MIN(rental_price) AS p_min, MAX(rental_price) AS p_max
FROM movies; 

-- 03. En una sola consulta: cantidad total de clientes y cantidad de clientes con telefono cargado.
--     ¿Por que COUNT(*) y COUNT(phone) dan resultados distintos? 
--  Dan resultados distintos por que hay 3 clientes que no tienen el telefono cargado y el resultado es NULL. Total de 12 clientes
SELECT COUNT(id), COUNT(phone)
FROM customers
WHERE phone IS NULL;

-- 04. Monto total recaudado (suma de todos los pagos).
SELECT COALESCE(SUM(amount), 0) AS total_recaudado
FROM payments;

-- 05. Cantidad de peliculas por genero.
SELECT genre, COUNT(*) AS cant_pelis_genero
FROM movies
GROUP BY genre;

-- 06. Rating promedio por genero. ¿Que pasa con la pelicula que no tiene rating? -- CONSULTAR DUDA A CLAUDE SOBRE TITLE
SELECT genre, ROUND(AVG(rating), 2) AS promedio_rating
FROM movies
GROUP BY genre;

-- 07. Cantidad de peliculas por director. Mostrar el nombre del director. CONSULTAR DUDA A CLAUDE SOBRE LA CANTIDAD
SELECT d.name, COUNT(m.id) AS Pelis_por_Dire
FROM movies m
INNER JOIN directors d ON m.director_id = d.id
GROUP BY d.name;

-- 08. Total recaudado por metodo de pago.
SELECT  payment_method , SUM(amount) AS total_recaudado
FROM payments
GROUP BY payment_method;

-- 09. Cantidad de alquileres por cliente (nombre y apellido). Los clientes sin alquileres tienen que aparecer con 0.
SELECT CONCAT(first_name, ' ', last_name) AS full_name, COUNT(r.id) AS total_alquileres
FROM customers c
LEFT JOIN rentals r ON r.customer_id = c.id
GROUP BY c.id, first_name, last_name;

-- 10. Generos que tienen mas de 2 peliculas.
SELECT genre, COUNT(*) as cant_peliculas
FROM movies
WHERE release_year > 2000
GROUP BY genre
HAVING COUNT(*) > 2;

-- 11. Clientes que hicieron mas de 2 alquileres.
SELECT CONCAT(first_name, ' ', last_name) AS full_name, COUNT(r.id) AS total_alquileres
FROM customers c
INNER JOIN rentals r ON r.customer_id = c.id
GROUP BY c.id
HAVING COUNT(r.id) > 2;

-- 12. Directores cuyo rating promedio es mayor a 8.5.
SELECT d.name , ROUND(AVG(m.rating), 2) AS rating_promedio
FROM movies m
INNER JOIN directors d ON m.director_id = d.id
GROUP BY d.id, d.name
HAVING AVG(m.rating) > 8.5;

-- 13. Las 3 peliculas mas alquiladas (titulo y cantidad de alquileres).
SELECT m.title, COUNT(r.id) AS total_alquileres
FROM movies m
INNER JOIN rentals r ON r.movie_id = m.id
GROUP BY m.title, m.id
ORDER BY total_alquileres DESC, m.title ASC
LIMIT 4;

-- 14. Ingresos totales por pelicula (suma de pagos), de mayor a menor. Camino de tablas: payments -> rentals -> movies.
SELECT m.title, SUM(p.amount) AS total_pagos
FROM payments p
INNER JOIN rentals r ON p.rental_id = r.id
INNER JOIN movies m ON r.movie_id = m.id
GROUP BY m.id, m.title
ORDER BY total_pagos DESC;


-- 15. Para cada pelicula: cantidad de alquileres y cantidad de actores, en UNA sola consulta.
--     Primero hacelo con COUNT(*) y mira los numeros: ¿son correctos?
--     Despues corregilo. (Pista: es el problema de la consigna 13 del
--     bloque de JOIN.)

SELECT m.title, COUNT(DISTINCT r.id) AS cant_alquileres, COUNT(DISTINCT ma.actor_id) AS cant_actores
FROM movies m
LEFT JOIN rentals r ON r.movie_id = m.id
LEFT JOIN movie_actors ma ON ma.movie_id = m.id
GROUP BY m.id, m.title;


