USE movie_rentals;

DROP TABLE IF EXISTS payments;
DROP TABLE IF EXISTS rentals;
DROP TABLE IF EXISTS movie_actors;
DROP TABLE IF EXISTS movies;
DROP TABLE IF EXISTS actors;
DROP TABLE IF EXISTS directors;
DROP TABLE IF EXISTS customers;

CREATE TABLE directors (
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    country VARCHAR(50),
    birth_year INT CHECK (birth_year >= 1850)
);

CREATE TABLE movies (
	id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR (100) NOT NULL,
    director_id INT NOT NULL,
    release_year INT CHECK (release_year >= 1888),
    length_minutes INT CHECK (length_minutes > 0),
    genre VARCHAR (50),
    rating DECIMAL(3,1) CHECK (rating BETWEEN 0 AND 10),
    rental_price DECIMAL(8, 2) NOT NULL CHECK (rental_price > 0),
    FOREIGN KEY (director_id) REFERENCES directors(id)
);

CREATE TABLE actors (
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    birth_year INT CHECK (birth_year >= 1850),
    nationality VARCHAR (50)
);

CREATE TABLE movie_actors (
	movie_id INT NOT NULL,
    actor_id INT NOT NULL,
    role_name VARCHAR(100),
    PRIMARY KEY (movie_id, actor_id),
    FOREIGN KEY (movie_id) REFERENCES movies(id),
    FOREIGN KEY (actor_id) REFERENCES actors(id)
);

CREATE TABLE customers (
	id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(20),
    city VARCHAR(50),
    registration_date DATE NOT NULL,
    is_active BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE rentals (
	id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    movie_id INT NOT NULL,
	rental_date DATE NOT NULL,
    due_date DATE NOT NULL,
    return_date DATE,
    CHECK (due_date >= rental_date),
    FOREIGN KEY (customer_id) REFERENCES customers(id),
    FOREIGN KEY (movie_id) REFERENCES movies(id)
);

CREATE TABLE payments (
	id INT AUTO_INCREMENT PRIMARY KEY,
    rental_id INT NOT NULL UNIQUE,
    amount DECIMAL(8, 2) NOT NULL CHECK (amount > 0),
    payment_method VARCHAR(20) NOT NULL,
    CHECK (payment_method IN ('card', 'cash', 'transfer')),
    payment_date DATE NOT NULL,
    FOREIGN KEY (rental_id) REFERENCES rentals(id)
);


