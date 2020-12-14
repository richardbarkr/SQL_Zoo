-- 10 Tutorial Quiz – (10.2 BBC Quiz)

-- 10.2.1
-- Select the code which gives the name of the countries beginning with U

-- Answer:
-- SELECT name
--     FROM world
--          WHERE name
--          LIKE ‘U%’


-- 10.2.2
-- Select the code which shows just the population of United Kingdom?

-- Answer:
-- SELECT population
--     FROM world
--          WHERE name = ‘United Kingdom’


-- 10.2.3
-- Select the answer which shows the problem with this SQL code – the intended result should be the continent of France.

-- SELECT continent 
--      FROM world
--           WHERE ‘name’ = ‘France’

-- Answer:
-- ‘name’ should be name


-- 10.2.4
-- Select the result that would be obtained from the following code:

-- SELECT name, population / 10
--     FROM world
--          WHERE population < 10000

-- Answer:
-- Nauru | 990


-- 10.2.5
-- Select the code which would reveal the name and population of countries in Europe and Asia

-- Answer:
-- SELECT name, population
--     FROM world
--          WHERE continent IN (‘Europe’, ‘Asia’)


-- 10.2.6
-- Select the code which would give two rows

-- Answer:
-- SELECT name
--     FROM world
--          WHERE name IN (‘Cuba’, ‘Togo’)


-- 10.2.7
-- Select the result that would be obtained from this code:

-- SELECT name 
--     FROM world
--          WHERE continent = ‘South America’
--          AND population > 40000000 

-- Answer:
-- Brazil
-- Colombia
