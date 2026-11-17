USE movie_rentals;

SELECT title, rental_price
FROM movies
WHERE rental_price > (
	SELECT AVG(rental_price)
    FROM movies
);

SELECT (SELECT COUNT(*) FROM movies) AS total_peliculas
FROM customers;

SELECT title, rental_price, 
(SELECT AVG(rental_price) FROM movies) AS precio_promedio
FROM movies;

SELECT title, rental_price
FROM movies
WHERE rental_price > (
	SELECT AVG(rental_price)
    FROM movies
);

SELECT title, rental_price, 
ROUND(rental_price - (SELECT AVG(rental_price) FROM movies),
	2
) AS diferencia_promedio
FROM movies;

SELECT 
UPPER((SELECT name FROM directors WHERE id = 1) 
) AS director_mayuscula; 

-- Mostrar el título de cada película y agregar una columna que indique cuál es el rating máximo de todo el catálogo.
SELECT title, rating , 
(SELECT MAX(rating) FROM movies) AS rating_maximo_catalogo
FROM movies;

-- Mostrar los clientes que realizaron al menos un alquiler y cuyo número de alquileres sea superior al promedio de alquileres por cliente.
SELECT c.id, CONCAT(c.first_name, ' ', c.last_name) AS full_name, COUNT(r.id) AS total_alquileres
FROM customers c
LEFT JOIN rentals r ON r.customer_id = c.id
GROUP BY c.id, c.first_name, c.last_name
HAVING COUNT(r.id) > (
	SELECT COUNT(*) / (
		SELECT COUNT(*)
        FROM customers
    )
    FROM rentals
);

-- Mostrar las películas cuyo rental_price sea superior al precio promedio de las películas de su mismo género.
SELECT m.title, m.genre, m.rental_price
FROM movies m
WHERE m.rental_price > (
	SELECT AVG(m2.rental_price)
    FROM movies m2
    WHERE m2.genre = m.genre
); 

SELECT d.name, d.country
FROM directors d
WHERE d.country NOT IN ('Canada', 'Argentina', 'South Korea')
