-- 10 Tutorial Quiz – (10.4 Nested SELECT Quiz)

                               -- BBC--
-- name            |  region       |  area      |  Population   |  gdp
-- Afghanistan     |  South Asia   |  652225    |  26000000     |
-- Albania         |  Europe       |  28728     |  3200000      |  6656000000
-- Algeria         |  Middle East  |  2400000   |  32900000     |  75012000000
-- Andorra         |  Europe       |  468       |  64000        |
-- Bangladesh      |  South Asia   |  143998    |  152600000    |  67144000000
-- United Kingdom  |  Europe       |  242514    |  59600000     |  2022824000000


-- 10.4.1
-- Select the code that shows the name, region and population of the smallest country in each region

-- Answer:
-- SELECT region, name, population 
--      FROM bbc x 
--           WHERE population <= 
--           ALL (SELECT Population FROM bbc y WHERE y.region=x.region AND population>0)


-- 10.4.2
-- Select the code that shows the countries belonging to regions with all populations over 50000

-- Answer:
-- SELECT name, region, population 
--      FROM bbc x WHERE 50000 < 
--           ALL (SELECT population FROM bbc y WHERE x.region=y.region AND y.population>0)


-- 10.4.3
-- Select the code that shows the countries with a less than a third of the population of the countries around it

-- Answer:
-- SELECT name, region 
--     FROM bbc x
--           WHERE population < 
--                ALL (SELECT population/3 FROM bbc y WHERE y.region = x.region AND y.name != x.name)


-- 10.4.4
-- Select the result that would be obtained from the following code:

-- SELECT name 
--      FROM bbc
--           WHERE popularion >
--                (SELECT population
--      FROM bbc 
--           WHERE name = ‘United Kingdom’)
--           AND region IN
--                (SELECT region
--      FROM bbc
--           WHERE name = ‘United Kingdom’)

-- Answer:
-- Table D
-- France
-- Germany
-- Russia
-- Turkey


-- 10.4.5
-- Select the code that would show the countries with a greater GDP than any country in Africa (some countries may have NULL gdp values).

-- Answer:
-- SELECT name 
--      FROM bbc
--           WHERE gdp > (SELECT MAX (gdp) FROM bbc WHERE region = ‘Africa’)


-- 10.4.6
-- Select the code that shows the countries with population smaller than Russia but bigger than Denmark

-- Answer:
-- SELECT name 
--      FROM bbc
--           WHERE population < (SELECT population FROM bbc WHERE name = ‘Russia’)
--           AND population > (SELECT population FROM bbc WHERE name = ‘Denmark’)


-- 10.4.7
-- Select the result that would be obtained from the following code

-- SELECT name 
--      FROM bbc
--           WHERE population >ALL
--                (SELECT MAX(population)
--      FROM bbc
--           WHERE region = ‘Europe’)
--           AND region = ‘South Asia’

-- Answer:
-- Table B
-- Bangladesh
-- India
-- Pakistan
