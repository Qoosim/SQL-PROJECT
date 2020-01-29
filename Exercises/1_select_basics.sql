-- SELECT BASICS

--1 => Find the country that start with Y
SELECT name
FROM world
WHERE name LIKE 'Y%'

--2 => Find the countries that end with y
SELECT name
FROM world
WHERE name LIKE '%y'

--3 => Find the countries that contain the letter x
SELECT name
FROM world
WHERE name LIKE '%x%'