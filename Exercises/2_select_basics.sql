-- SELECT BASICS

--1 => SQL command to show the name, continent and population of all countries.
SELECT name, continent, population
FROM world

--2 => Show the name for the countries that have a population of at least 200 million.
SELECT name 
FROM world
WHERE population >= 200000000

--3 => Give the name and the per capita GDP for those countries with a population of at least 200 million
SELECT name, gdp/population
FROM world
WHERE population >= 200000000