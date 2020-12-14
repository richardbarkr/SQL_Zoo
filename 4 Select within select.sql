-- 4 Select within select:

-- 1. List each country name where the population is larger than that of 'Russia'.

SELECT name
     FROM world
     WHERE population > 
          (select population 
           FROM world 
           WHERE name ='Russia');


-- 2. Show the countries in Europe with a per capita GDP greater than 'United Kingdom'.

SELECT name
     FROM world
     WHERE continent = 'Europe'
     AND 
          (SELECT CONCAT(gdp/population) > 39605.7231);


-- 3. List the name and continent of countries in the continents containing either Argentina or Australia. 
--    Order by name of the country.

SELECT name, continent
     FROM world
     WHERE continent 
          IN(select continent
          FROM world WHERE name IN('Argentina' , 'Australia'))
     ORDER BY name asc;


-- 4. Which country has a population that is more than Canada but less than Poland? Show the name and the population.

SELECT name
     FROM world
     WHERE population > (SELECT population FROM world WHERE name = 'Canada')
     AND population < (SELECT population FROM world WHERE name = 'Poland');


-- 5. Show the name and the population of each country in Europe. Show the population as a percentage of the 
--    population of Germany.

SELECT name,
          CONCAT(ROUND (population*100/(SELECT population
          FROM world
     WHERE name = 'Germany')),'%')
     FROM world
     WHERE continent = 'Europe';


-- 6. Which countries have a GDP greater than every country in Europe? [Give the name only.] 
--    (Some countries may have NULL gdp values)

SELECT name
     FROM world
     WHERE gdp > 
          (SELECT max (gdp)
          FROM world 
          WHERE continent ='Europe');


-- 7. Find the largest country (by area) in each continent, show the continent, the name and the area:

SELECT continent, name, area
     FROM world x
     WHERE area = (SELECT MAX (area) FROM world y
     WHERE x.continent=y.continent);

--------
--OR--
--------

SELECT continent, name, area
FROM world 
     WHERE area = (SELECT MAX(area) FROM world WHERE continent = 'Asia')
          OR
              area = (SELECT MAX(area) FROM world WHERE continent = 'Europe')
          OR
              area = (SELECT MAX(area) FROM world WHERE continent = 'Africa')
          OR
              area = (SELECT MAX(area) FROM world WHERE continent = 'Oceania')
          OR
              area = (SELECT MAX(area) FROM world WHERE continent = 'North America')
          OR
              area = (SELECT MAX(area) FROM world WHERE continent = 'South America')
          OR
              area = (SELECT MAX(area) FROM world WHERE continent = 'Eurasia')
          OR
              area = (SELECT MAX(area) FROM world WHERE continent = 'Caribbean');


-- 8. List each continent and the name of the country that comes first alphabetically.

SELECT continent, name
     FROM world x
     WHERE name <= ALL(SELECT name
     FROM world y
     WHERE x.continent=y.continent);

--------
--OR--
--------

SELECT continent, name
     FROM world 
     WHERE name = (SELECT MIN(name) FROM world WHERE continent = 'Asia')
          OR
               name = (SELECT MIN(name) FROM world WHERE continent = 'Europe')
          OR
               name = (SELECT MIN(name) FROM world WHERE continent = 'Caribbean')
          OR
              name = (SELECT MIN(name) FROM world WHERE continent = 'North America')
          OR
              name = (SELECT MIN(name) FROM world WHERE continent = 'South America')
          OR
              name = (SELECT MIN(name) FROM world WHERE continent = 'Oceania')
          OR
              name = (SELECT MIN(name) FROM world WHERE continent = 'Africa')
          OR
              name = (SELECT MIN(name) FROM world WHERE continent = 'Eurasia')
ORDER BY continent asc;


-- 9. Find the continents where all countries have a population <= 25000000. Then find the names of the countries associated 
--    with these continents. Show name, continent and population.

SELECT name, continent, population
FROM world x
WHERE continent IN(
     SELECT continent 
     FROM world x
     WHERE '25000000' >  ALL(
          SELECT population
          FROM world y
          WHERE x.continent= y.continent));


-- 10. Some countries have populations more than three times that of any of their neighbours (in the same continent). 
--     Give the countries and continents.

SELECT name, continent
FROM world x
WHERE population > ALL (
     SELECT population*3
     FROM world y
     WHERE x.continent=y.continent
     AND x.name <> y.name);
