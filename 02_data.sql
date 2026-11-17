USE movie_rentals;

INSERT INTO directors(name, country, birth_year)
VALUES
("John Lasseter", "USA", 1957),
("Pete Docter", "USA", 1968),
("Andrew Stanton", "USA", 1965),
("Christopher Nolan", "UK", 1970),
("Quentin Tarantino", "USA", 1963),
("Hayao Miyazaki", "Japan", 1941),
("Bong Joon-ho", "South Korea", 1969),
("Juan Jose Campanella", "Argentina", 1959),
("Denis Villeneuve", "Canada", 1967);

INSERT INTO movies(title, director_id, release_year, length_minutes, genre, rating, rental_price)
VALUES
("Toy Story", 1, 1995, 81, "Animation", 8.3, 300.00),
("Toy Story 2", 1, 1999, 92, "Animation", 7.9, 300.00),
("A Bug´s Life", 1, 1998, 95, "Animation", 7.2, 280.00),
("Up", 2, 2009, 96, "Animation", 8.3, 350.00),
("Inside Out", 2, 2015, 95, "Animation", 8.1, 400.00),
("Finding Nemo", 3, 2003, 100, "Animation", 8.2, 320.00),
("WALL-E", 3, 2008, 98, "Animation", 8.4, 350.00),
("Inception", 4, 2010, 148, "Sci-Fi", 8.8, 450.00),
("Interstellar", 4, 2014, 169, "Sci-Fi", 8.7, 450.00),
("The Dark Knight", 4, 2008, 152, "Action", 9.0, 450.00),
("Pulp Fiction", 5, 1994, 154, "Crime", 8.9, 380.00),
("Kill Bill: Vol.1", 5, 2003, 111, "Action", 8.1, 380.00),
("Spirited Away", 6, 2001, 125, "Animation", 8.6, 400.00),
("Parasite", 7, 2019, 132, "Thriller", 8.5, 480.00),
("The secret in Their Eyes", 8, 2009, 129, "Drama", 8.2, 350.00),
("Mickey 17", 7, 2025, 137, "Sci-Fi", NULL, 500.00);

INSERT INTO actors (name, birth_year, nationality)
VALUES
("Tom Hanks", 1956, "USA"),
("Tim Allen", 1953, "USA"),
("Ellen DeGeneres", 1958, "USA"),
("Ed Asner", 1929, "USA"),
("Amy Poehler", 1971, "USA"),
("Leonardo Di Caprio", 1974, "USA"),
("Joseph Gordon-Levitt", 1981, "USA"),
("Matthew McConaughey", 1969, "USA"),
("Anne Hathaway", 1982, "USA"),
("Christian Bale", 1974, "UK"),
("John Travolta", 1954, "USA"),
("Uma Thurman", 1970, "USA"),
("Song Kang-ho", 1967, "South Korea"),
("Ricardo Darin", 1957, "Argentina"),
("Albert Brooks", 1947, "USA"),
("Michael Caine", 1933, "UK"),
("Meryl Streep", 1949, "USA");

INSERT INTO movie_actors (movie_id, actor_id, role_name)
VALUES
(1, 2, "Buzz Lightyear"),
(2, 1, "Woody"),
(2, 2, "Buzz Lightyear"),
(4, 4, "Carl Fredricksen"),
(1, 1, "Woody"),
(5, 5, "Joy"),
(6, 3, "Dory"),
(6, 15, "Marlin"),
(8, 6, "Dom Coob"),
(8, 7, "Arthur"),
(8, 16, "Professor Miles"),
(9, 8, "Cooper"),
(9, 9, "Amelia Brand"),
(9, 16, "Professor Brand"),
(10, 10, "Bruce Wayne"),
(10, 16, "Alfred"),
(11, 11, "Vincent Vega"),
(11, 12, "Mia Wallace"),
(12, 12, "The Bride"),
(14, 13, "Kim Ki-taek"),
(15, 14, "Benjamin Esposito");

INSERT INTO customers (first_name, last_name, email, phone, city, registration_date, is_active)
VALUES
('Lucia',     'Fernandez', 'lucia.fernandez@mail.com',   '11-5555-0101',  'Buenos Aires', '2024-03-12', TRUE),   
('Martin',    'Gomez',     'martin.gomez@mail.com',      '11-5555-0102',  'Buenos Aires', '2024-05-20', TRUE),   
('Sofia',     'Rodriguez', 'sofia.rodriguez@mail.com',   NULL,            'Cordoba',      '2024-07-08', TRUE),   
('Diego',     'Perez',     'diego.perez@mail.com',       '351-555-0104',  'Cordoba',      '2024-09-15', TRUE),   
('Camila',    'Lopez',     'camila.lopez@mail.com',      '341-555-0105',  'Rosario',      '2025-01-10', TRUE),   
('Javier',    'Martinez',  'javier.martinez@mail.com',   NULL,            'Rosario',      '2025-02-18', FALSE),  
('Valentina', 'Diaz',      'valentina.diaz@mail.com',    '11-5555-0107',  'La Plata',     '2025-04-03', TRUE),   
('Nicolas',   'Sosa',      'nicolas.sosa@mail.com',      '261-555-0108',  'Mendoza',      '2025-06-25', TRUE),   
('Agustina',  'Romero',    'agustina.romero@mail.com',   '11-5555-0109',  'Buenos Aires', '2025-09-14', TRUE),   
('Tomas',     'Alvarez',   'tomas.alvarez@mail.com',     NULL,            'Mar del Plata','2026-01-30', TRUE),   
('Julieta',   'Torres',    'julieta.torres@mail.com',    '11-5555-0111',  'Buenos Aires', '2026-03-22', TRUE),   
('Facundo',   'Ruiz',      'facundo.ruiz@mail.com',      '351-555-0112',  'Cordoba',      '2026-05-09', TRUE);   

INSERT INTO rentals (customer_id, movie_id, rental_date, due_date, return_date)
VALUES
(1,  1,  '2026-01-05', '2026-01-12', '2026-01-10'), 
(1,  8,  '2026-01-20', '2026-01-27', '2026-01-26'), 
(2,  10, '2026-02-02', '2026-02-09', '2026-02-12'),  
(2,  11, '2026-02-15', '2026-02-22', '2026-02-20'),  
(3,  4,  '2026-02-18', '2026-02-25', '2026-02-25'),  
(4,  14, '2026-03-01', '2026-03-08', '2026-03-07'),  
(4,  9,  '2026-03-10', '2026-03-17', '2026-03-20'),  
(5,  6,  '2026-03-14', '2026-03-21', '2026-03-19'),  
(5,  5,  '2026-04-02', '2026-04-09', '2026-04-08'),  
(7,  13, '2026-04-05', '2026-04-12', '2026-04-11'),  
(7,  1,  '2026-04-20', '2026-04-27', '2026-05-02'),  
(8,  15, '2026-05-03', '2026-05-10', '2026-05-09'),  
(8,  8,  '2026-05-12', '2026-05-19', '2026-05-18'),  
(9,  2,  '2026-05-25', '2026-06-01', '2026-05-31'),  
(9,  12, '2026-06-02', '2026-06-09', '2026-06-08'),  
(1,  14, '2026-06-10', '2026-06-17', '2026-06-16'),  
(2,  10, '2026-06-18', '2026-06-25', '2026-06-24'),  
(3,  8,  '2026-07-01', '2026-07-08', '2026-07-06'),  
(10, 1,  '2026-07-14', '2026-07-21', '2026-07-20'),  
(11, 9,  '2026-08-03', '2026-08-10', '2026-08-09'), 
(11, 4,  '2026-08-17', '2026-08-24', '2026-08-28'),  
(5,  10, '2026-09-05', '2026-09-12', '2026-09-11'),  
(7,  14, '2026-09-20', '2026-09-27', NULL),          
(4,  8,  '2026-10-05', '2026-10-12', NULL),          
(9,  1,  '2026-10-15', '2026-10-22', NULL),          
(10, 6,  '2026-10-20', '2026-10-27', NULL),          
(1,  15, '2026-10-25', '2026-11-01', NULL);         


 INSERT INTO payments (rental_id, amount, payment_method, payment_date)
 VALUES
(1,  300.00, 'card',     '2026-01-05'),
(2,  450.00, 'transfer', '2026-01-20'),
(3,  450.00, 'card',     '2026-02-02'),
(4,  380.00, 'cash',     '2026-02-15'),
(5,  350.00, 'card',     '2026-02-18'),
(6,  480.00, 'transfer', '2026-03-01'),
(7,  450.00, 'card',     '2026-03-10'),
(8,  320.00, 'cash',     '2026-03-14'),
(9,  400.00, 'card',     '2026-04-02'),
(10, 400.00, 'transfer', '2026-04-05'),
(12, 350.00, 'cash',     '2026-05-03'),
(13, 450.00, 'card',     '2026-05-12'),
(14, 300.00, 'card',     '2026-05-25'),
(15, 380.00, 'transfer', '2026-06-02'),
(16, 480.00, 'card',     '2026-06-10'),
(17, 450.00, 'cash',     '2026-06-18'),
(18, 450.00, 'card',     '2026-07-01'),
(19, 300.00, 'transfer', '2026-07-14'),
(20, 450.00, 'card',     '2026-08-03'),
(21, 350.00, 'card',     '2026-08-17'),
(22, 450.00, 'cash',     '2026-09-05'),
(23, 480.00, 'card',     '2026-09-20'),
(24, 450.00, 'card',     '2026-10-05');

