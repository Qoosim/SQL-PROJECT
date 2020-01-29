-- SELECT BASICS SQL

--1 => Modify it to show the population of Germany
SELECT population FROM world
  WHERE name = 'Germany'

--2 => Show the name and the population for 'Sweden', 'Norway' and 'Denmark'.
SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway', 'Denmark');
