-- Task 1: Show the name, continent, and population of all countries
SELECT name, continent, population FROM world

-- Task 2: Show the name for countries with a population of at least 200 million
SELECT name FROM world
WHERE population >= 200000000

-- Task 3: Show the name and per capita GDP for countries with a population of at least 200 million
SELECT name, GDP/population 
FROM world 
WHERE population >= 200000000

-- Task 4: Show the name and population in millions for countries in 'South America'
SELECT name,  population/1000000
FROM world
WHERE continent = 'South America'

-- Task 5: Show the name and population for France, Germany, and Italy
SELECT name, population
FROM world 
WHERE name IN ( 'France', 'Germany', 'Italy')

-- Task 6: Show the countries which have a name that includes the word 'United'
SELECT name FROM world 
WHERE name LIKE '%United%'

-- Task 7: Show the countries that are big by area or big by population. Show name, population, and area.
SELECT name, population, area
FROM world 
WHERE area >3000000 OR population >250000000

-- Task 8: Show the countries that are big by area or big by population but not both. Show name, population, and area.
SELECT name, population, area
FROM world 
WHERE (area>3000000 AND  population <250000000 ) OR 
 (area<3000000 AND  population >250000000 ) 

-- Task 9: Show the name, population in millions, and GDP in billions for countries in 'South America'. Use the ROUND function to show values to two decimal places.
SELECT name, ROUND(population/1000000.0,2), ROUND(GDP/1000000000.0,2)
FROM world 
WHERE continent='South America'

-- Task 10: Show the name and per-capita GDP for countries with a GDP of at least one trillion. Round per-capita GDP to the nearest $1000.
SELECT name, ROUND(GDP/population,-3)
FROM world 
WHERE GDP >=1000000000000

-- Task 11: Show the name and capital where the name and capital have the same number of characters.
SELECT name, capital
FROM world
WHERE LENGTH(name) = LENGTH(capital)

-- Task 12: Show the name and capital where the first letters match and the name and capital are different.
SELECT name,  capital
FROM world
WHERE LEFT(name,1)=LEFT(capital,1) AND name <>capital

-- Task 13: Find the country that has all the vowels and no spaces in its name.
SELECT name
FROM world
WHERE name LIKE '%A%'
AND name LIKE '%E%'
AND name LIKE '%I%'
AND name LIKE '%O%'
AND name LIKE '%U%'
AND name LIKE '%a%'
AND name LIKE '%e%'
AND name LIKE '%i%'
AND name LIKE '%o%'
AND name LIKE '%u%'
AND name NOT LIKE '% %'
