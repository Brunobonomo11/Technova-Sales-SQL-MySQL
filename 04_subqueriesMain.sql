USE movie_rentals;

-- 01. Para cada película, mostrar title, rating y el rating máximo de todo el catálogo.
-- Requisito: la subconsulta debe aparecer en el SELECT y devolver un único valor.
SELECT title, rating , (SELECT MAX(rating) FROM movies) AS rating_maximo
FROM movies;

-- 02. Mostrar title y rental_price de las películas cuyo precio sea superior al precio promedio general.
-- Requisito: utilizar una subconsulta escalar en WHERE.
SELECT title, rental_price
FROM movies
WHERE rental_price > (
	SELECT AVG(rental_price)
    FROM movies
);

-- 03. Para cada película, mostrar title, rental_price y la diferencia entre su precio
--     y el precio promedio general. Redondear la diferencia a 2 decimales.
-- Requisito: utilizar la subconsulta como parte de una expresión en el SELECT.
SELECT title, rental_price,
ROUND (
	rental_price - 
    (SELECT AVG(rental_price) 
    FROM movies), 
    2
) AS dif_rating
FROM movies;

-- 04. Mostrar title e id de las películas que hayan sido alquiladas al menos una vez.
-- Requisito: resolverlo con IN y una subconsulta sobre rentals.
SELECT m.id, m.title
FROM movies m
WHERE m.id IN (
	SELECT r.movie_id
    FROM rentals r
);

-- 05. Mostrar title e id de las películas que nunca fueron alquiladas.
-- Requisito: resolverlo con NOT IN. Después, explicar qué problema puede aparecer
--     con NOT IN si la subconsulta devuelve NULL y por qué movie_id en rentals
--     actualmente evita ese caso en este esquema. CONSULTAR CHAT GPT
SELECT m.id, m.title
FROM movies m
WHERE m.id NOT IN (
	SELECT r.movie_id
    FROM rentals r
     WHERE r.movie_id IS NOT NULL
);

-- 06. Mostrar name y nationality de los actores que participaron en alguna película
--     estrenada después de 2010.
-- Requisito: utilizar IN con subconsultas anidadas para recorrer movies y movie_actors.
SELECT a.name, a.nationality
FROM actors a
WHERE a.id IN (
	SELECT ma.actor_id
    FROM movie_actors ma
    WHERE ma.movie_id IN (
		SELECT m.id
        FROM movies m
        WHERE m.release_year > 2010
    )
);



