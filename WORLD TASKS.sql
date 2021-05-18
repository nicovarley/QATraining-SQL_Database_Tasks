SHOW DATABASES;
USE world;
SHOW TABLES;

SELECT * FROM city LIMIT 10000;
SELECT * FROM country;
SELECT * FROM countrylanguage;

##STEP 1
SELECT count(name) FROM city WHERE countrycode = "USA";

##STEP 2
SELECT population, lifeExpectancy FROM country WHERE name = "Argentina";

##STEP 3
SELECT name, lifeExpectancy FROM country 
WHERE lifeExpectancy=(
SELECT max(lifeExpectancy) FROM country) IS NOT NULL
ORDER BY lifeExpectancy DESC LIMIT 1;

##STEP 4
SELECT c.name FROM city c
JOIN country co ON c.ID = co.Capital
WHERE co.name = "Spain";

##STEP 5
SELECT cl.language FROM countrylanguage cl
JOIN country co ON cl.countrycode = co.code
WHERE co.region = "Southeast Asia";

##STEP 6 (Lots of trial and error on that one... I'm sad name = "F%" doesn't work.)
SELECT name FROM city WHERE name LIKE "F%" LIMIT 25;

##STEP 7
SELECT count(c.name) FROM city c
JOIN country co ON c.countrycode = co.code
WHERE c.countrycode = "CHN";

##STEP 8 (How do I stop it from showing populations of 0? My != 0 didn't do anything.)
SELECT name FROM country
WHERE (population=(SELECT min(population) FROM country) IS NOT NULL != 0)
ORDER BY population LIMIT 1;

##STEP 9
SELECT count(name) FROM country;

##STEP 10
SELECT name FROM country ORDER BY surfaceArea DESC LIMIT 10;

##STEP 11
SELECT c.name FROM city c
JOIN country co ON c.countrycode = co.code
WHERE co.code = "JPN"
ORDER BY c.population DESC LIMIT 5;

##STEP 12
SET SQL_SAFE_UPDATES = 0;
UPDATE country
SET headOfState = "Elizabeth II"
WHERE headOfState = "Elisabeth II";

SELECT name, code FROM country WHERE headOfState = "Elizabeth II";

##STEP 13
SELECT *
FROM(
	SELECT name, population, surfaceArea, (population/surfaceArea) AS ratio
    FROM country
    WHERE population IS NOT NULL
    AND population!=0)
AS populationToAreaRatio
ORDER BY ratio
LIMIT 10;

##STEP 14
SELECT DISTINCT language FROM countrylanguage ORDER BY language;
