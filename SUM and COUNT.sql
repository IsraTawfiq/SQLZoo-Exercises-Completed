-- Task 1: Show the total population of the world.
SELECT SUM(population) FROM world

-- Task 2: List all the continents - just once each.
SELECT DISTINCT continent FROM world

-- Task 3: Give the total GDP of Africa.
SELECT SUM(gdp) FROM world WHERE continent='Africa'

-- Task 4: How many countries have an area of at least 1000000 square kilometers.
SELECT COUNT(name) FROM world WHERE area >= 1000000

-- Task 5: What is the total population of ('Estonia', 'Latvia', 'Lithuania').
SELECT SUM(population) FROM world WHERE name IN ('Estonia', 'Latvia', 'Lithuania')

-- Task 6: For each continent show the continent and number of countries.
SELECT continent, COUNT(name) FROM world GROUP BY continent

-- Task 7: For each continent show the continent and number of countries with populations of at least 10 million.
SELECT continent, COUNT(name) FROM world WHERE population >= 10000000 GROUP BY continent

-- Task 8: List the continents that have a total population of at least 100 million.
SELECT continent FROM world GROUP BY continent HAVING SUM(population) >= 100000000
