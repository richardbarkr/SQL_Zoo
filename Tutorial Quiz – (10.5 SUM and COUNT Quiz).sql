-- 10 Tutorial Quiz – (10.5 SUM and COUNT Quiz)

                                 -- BBC--
-- name         |  region       |  area     |  Population  |  gdp
-- Afghanistan  |  South Asia   |  652225   |  26000000    |
-- Albania      |  Europe       |  28728    |  3200000     |  6656000000
-- Algeria      |  Middle East  |  2400000  |  32900000    |  75012000000
-- Andorra      |  Europe       |  468      |  64000       |


-- 10.5.1
-- Select the statement that shows the sum of population of all countries in 'Europe'

-- Answer:
-- SELECT SUM(population) 
--      FROM bbc 
--           WHERE region = ‘Europe’


-- 10.5.2
-- Select the statement that shows the number of countries with population smaller than 150000

-- Answer:
-- SELECT COUNT(name) 
--      FROM bbc 
--           WHERE population < 150000


-- 10.5.3
-- Select the list of core SQL aggregate functions

-- Answer:
-- AVG(), COUNT(), MAX(), MIN(), SUM()


-- 10.5.4
-- Select the result that would be obtained from the following code:

-- SELECT region, SUM(area)
--      FROM bbc
--           WHERE SUM(area) > 15000000
--      GROUP BY region

-- Answer:
-- No result due to invalid use of the WHERE function


-- 10.5.5
-- Select the statement that shows the average population of 'Poland', 'Germany' and 'Denmark'

-- Answer:
-- SELECT AVG(population) 
--      FROM bbc 
--           WHERE name IN(‘Poland’, ‘Germany’, ‘Denmark’)


-- 10.5.6
-- Select the statement that shows the medium population density of each region

-- Answer:
-- SELECT region, SUM(population)/SUM(area) AS density 
--      FROM bbc 
--      GROUP BY region


-- 10.5.7
-- Select the statement that shows the name and population density of the country with the largest population

-- Answer:
-- SELECT name, population/area AS density 
--      FROM vvc 
--           WHERE population = (SELECT MAX(population) FROM bbc)


-- 10.5.8
-- Pick the result that would be obtained from the following code:

-- SELECT region, SUM(area)
--     FROM bbc
--          GROUP BY region
--          HAVING SUM (area) <= 20000000

-- Answer:
-- Americas       |  732240
-- Middle East    |  13403102
-- South America  |  17740392
-- South Asia     |  9437710
