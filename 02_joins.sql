USE movie_rentals;

-- 01. Titulo de cada pelicula junto con el nombre de su director.
SELECT title, name
FROM movies
INNER JOIN directors
	ON movies.director_id = directors.id;
    
-- 02. Peliculas dirigidas por directores que NO son de USA. Mostrar titulo, nombre del director y pais.
SELECT title, name, country
FROM movies
INNER JOIN directors
	ON movies.director_id = directors.id
WHERE country NOT LIKE '%USA%';

-- 03. Para cada alquiler: nombre y apellido del cliente, titulo de la pelicula y fecha de alquiler (tres tablas).
SELECT c.first_name, c.last_name, m.title, r.rental_date
FROM rentals AS r
INNER JOIN customers AS c ON r.customer_id = c.id
INNER JOIN movies AS m ON r.movie_id = m.id;

-- 04. Reparto de cada pelicula: titulo, nombre del actor y personaje (pasa por la tabla puente movie_actors). 	CONSULTAR CON CLAUDE POR QUE NO PUEDO UNIR LAS TABLAS
SELECT title, name, role_name
FROM movies AS m
INNER JOIN movie_actors AS ma ON m.id = ma.movie_id
INNER JOIN actors AS a ON ma.actor_id = a.id;

-- 05. Todas las peliculas en las que actua Tom Hanks.
SELECT m.title, a.name
FROM movies m
INNER JOIN movie_actors ma	ON m.id = ma.movie_id
INNER JOIN actors a	ON ma.actor_id = a.id
WHERE a.name = 'Tom Hanks';

-- 06. Pagos con: nombre del cliente, titulo de la pelicula, monto y metodo de pago (cuatro tablas).
SELECT c.first_name, c.last_name, m.title, p.amount, p.payment_method
FROM payments AS p
INNER JOIN rentals AS r ON p.rental_id = r.id
INNER JOIN customers AS c ON r.customer_id = c.id
INNER JOIN movies AS m ON r.movie_id = m.id;

-- 07. Peliculas que nunca fueron alquiladas.
SELECT m.title, r.rental_date
FROM movies AS m
LEFT JOIN rentals AS r ON r.movie_id = m.id
WHERE r.id IS NULL;

-- 08. Clientes que nunca hicieron un alquiler.
SELECT c.first_name, c.last_name, r.rental_date
FROM customers AS c
LEFT JOIN rentals AS r ON r.customer_id = c.id
WHERE r.id IS NULL;

-- 09. Directores que no tienen peliculas cargadas.
SELECT d.name, m.title
FROM directors AS d
LEFT JOIN movies AS m ON m.director_id = d.id
WHERE m.id IS NULL;

-- 10. Alquileres que no tienen pago registrado. Mostrar cliente, pelicula y fecha de alquiler.
SELECT c.first_name, c.last_name, m.title, r.rental_date
FROM rentals AS r
INNER JOIN customers AS c ON r.customer_id = c.id
INNER JOIN movies AS m ON r.movie_id = m.id
LEFT JOIN payments AS p ON p.rental_id = r.id
WHERE p.id IS NULL;

-- 11. Peliculas que no tienen actores cargados.
SELECT m.title
FROM movies m
LEFT JOIN movie_actors ma ON ma.movie_id = m.id
WHERE ma.movie_id IS NULL;

-- 12. Actores que no figuran en ninguna pelicula.
SELECT a.name
FROM actors a
LEFT JOIN movie_actors ma ON ma.actor_id = a.id
WHERE ma.actor_id IS NULL;

-- 13. Cantidad de filas que devuelve un JOIN entre movies y movie_actors, comparada con la cantidad de filas de la tabla movies.
--     ¿Por que no coinciden? ¿Que pasaria si sumaras el rental_price sobre ese JOIN? -- CONSULTAR CLAUDE --
SELECT COUNT(*)
FROM movies m
LEFT JOIN movie_actors ma ON ma.movie_id = m.id;

-- 14. Alquileres devueltos tarde (return_date posterior a due_date). Mostrar cliente, pelicula, due_date y return_date.
SELECT c.first_name, c.last_name, m.title, r.due_date, r.return_date
FROM rentals r
INNER JOIN customers c ON r.customer_id = c.id
INNER JOIN movies m ON r.movie_id = m.id
WHERE r.return_date > r.due_date;

-- 15. Alquileres con pago donde el monto pagado NO coincide con el rental_price de la pelicula. Mostrar alquiler, pelicula, precio
--     y monto. (Si tus datos estan limpios, no deberia devolver filas.)
SELECT m.title, m.rental_price, r.rental_date, p.amount
FROM payments p
INNER JOIN rentals r ON p.rental_id = r.id
INNER JOIN movies m ON r.movie_id = m.id
WHERE m.rental_price <> p.amount


