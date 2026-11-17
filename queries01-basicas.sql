USE movie_rentals;

-- 01. Mostrar todos los datos de la tabla movies.
SELECT *
FROM movies;

-- 02. Mostrar solo el titulo y el año de estreno de todas las peliculas.
SELECT title, release_year
FROM movies;

-- 03. Peliculas con rating mayor a 8.5.
SELECT title, rating
FROM movies
WHERE rating > 8.5;

-- 04. Peliculas estrenadas entre 2000 y 2010 (usando BETWEEN).
SELECT title, release_year
FROM movies
WHERE release_year BETWEEN 2000 AND 2010;

-- 05. Peliculas que NO se estrenaron entre 2000 y 2010.
SELECT title, release_year
FROM movies
WHERE release_year NOT BETWEEN 2000 AND 2010;

-- 06. Todas las peliculas de la saga Toy Story (usando LIKE).
SELECT title, director_id, release_year
FROM movies
WHERE title LIKE '%Toy Story%';

-- 07. Peliculas del genero Animation o Sci-Fi (usando IN).
SELECT title, genre
FROM movies
WHERE genre IN ('Animation', 'Sci-Fi');

-- 08. Lista de los generos distintos que hay en el catalogo.
SELECT DISTINCT genre
FROM movies;

-- 09. Las 5 peliculas mas largas, de mayor a menor duracion.
SELECT id, title, length_minutes
FROM movies
ORDER BY length_minutes DESC
LIMIT 5;

-- 10. Todas las peliculas ordenadas por año de estreno (de la mas vieja a la mas nueva) y, dentro del mismo año, por titulo de la A a la Z.
SELECT title, release_year
FROM movies
ORDER BY release_year ASC, title ASC;

-- 11. Peliculas que todavia no tienen rating cargado.
SELECT title, rating
FROM movies
WHERE rating IS NULL;

-- 12. Clientes que no tienen telefono cargado.
SELECT first_name, last_name, phone
FROM customers
WHERE phone IS NULL;

-- 13. Clientes activos que vivan en Buenos Aires o en Cordoba. Ojo con el orden de AND y OR (conviene usar parentesis).
SELECT first_name, last_name, city, phone, is_active
FROM customers
WHERE is_active = TRUE AND (city = 'Buenos Aires' OR city = 'Cordoba');

-- 14. Peliculas estrenadas en un año par.
SELECT title, release_year
FROM movies
WHERE release_year % 2 = 0;

-- 15. Titulo y precio de alquiler de cada pelicula, mas una columna con el precio con 10% de descuento (usar alias).
SELECT title, rental_price, ROUND(rental_price * 0.9, 2) AS discount_price
FROM movies;

-- 16. Titulo, duracion y una columna "category" que diga: 'Corta' si dura menos de 90 minutos, 'Media' si dura entre 90 y 130, 'Larga' si dura mas de 130 (usar CASE).
SELECT title, length_minutes,
CASE
    WHEN length_minutes < 90 THEN 'Corta'
    WHEN length_minutes BETWEEN 90 AND 130 THEN 'Media'
    WHEN length_minutes > 130 THEN 'Larga'
END AS category
FROM movies
ORDER BY length_minutes ASC;

-- 17. Alquileres que todavia no fueron devueltos.
SELECT customer_id, rental_date, return_date
FROM rentals
WHERE return_date IS NULL;

-- 18. Clientes que se registraron durante 2025.
SELECT first_name, last_name, registration_date
FROM customers
WHERE registration_date BETWEEN '2025-01-01' AND '2025-12-31';
