SHOW DATABASES;
USE sakila;
SHOW TABLES;
SELECT * FROM film;

##STEP 1
SELECT first_name, last_name FROM actor;

##STEP 2
SELECT last_name FROM actor
WHERE first_name = "john";

##STEP 3
SELECT first_name, last_name FROM actor
WHERE last_name = "Neeson";

##STEP 4
SELECT first_name, last_name FROM actor WHERE actor_id LIKE "%0";

##STEP 5
SELECT description FROM film WHERE film_id = "100";

##STEP 6
SELECT title FROM film WHERE rating = "R";

##STEP 7
SELECT title FROM film WHERE rating != "R";

##STEP 8
SELECT title FROM film ORDER BY length LIMIT 10;

##STEP 9
SELECT title, length FROM film
WHERE length=(
SELECT max(length)
FROM film);

##STEP 10
SELECT title FROM film WHERE special_features LIKE "%Deleted Scenes%";

##STEP 11 (No clue what to do with HAVING here.)
SELECT DISTINCT last_name FROM actor ORDER BY last_name DESC;

##STEP 12
SELECT last_name, count(last_name) AS freq FROM actor GROUP BY last_name HAVING freq > 1 ORDER BY freq DESC;

##STEP 13
SELECT a.first_name, a.last_name, count(fa.actor_id) AS freq FROM film_actor fa
JOIN actor a ON fa.actor_id = a.actor_id
GROUP BY fa.actor_id
ORDER BY freq DESC LIMIT 1;

##STEP 14 (Need to redo, misinterpreted the task.)
SELECT * FROM rental;
SELECT * FROM inventory;
SELECT * FROM film;

SELECT DATE_ADD(day, f.rental_duration, r.rental_date) FROM rental r


SELECT f.title, r.rental_id, r.return_date FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_ID
WHERE f.title = "Academy Dinosaur"
ORDER BY return_date;

DATE ADD INTERVAL;

##STEP 15
SELECT avg(length) AS average_runtime FROM film;

##STEP 16
SELECT category, avg(length) AS avg_runtime FROM film_list GROUP BY category ORDER BY avg_runtime DESC;

##STEP 17
SELECT title FROM film WHERE description LIKE "%robot%";

##STEP 18
SELECT count(title) AS movies_from_2010 FROM film WHERE release_year = "2010";

##STEP 19
SELECT title FROM film_list WHERE category = "Horror";

##STEP 20 (Finally, I've been trying to figure out how to concatenate here for ages! I tried to do it to make other results present nicer.)
SELECT CONCAT(first_name, " ", last_name) AS name FROM staff WHERE staff_id = "2";

##STEP 21
SELECT f.title FROM film f
JOIN film_actor fa ON f.film_id = fa.film_id
JOIN actor a ON fa.actor_id = a.actor_id
WHERE a.actor_id = "16";

##STEP 22
SELECT DISTINCT count(country) AS countries FROM country;

##STEP 23 
SELECT name FROM language ORDER BY name DESC;

##STEP 24
SELECT CONCAT(first_name, " ", last_name) AS fullname FROM actor WHERE last_name LIKE "%son" ORDER BY first_name;

##STEP 25
SELECT category, count(title) AS no_of_films FROM film_list GROUP BY category ORDER BY no_of_films DESC LIMIT 1;
