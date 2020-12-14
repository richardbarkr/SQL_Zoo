-- 10 Tutorial Quiz – (10.8 USING Null Quiz)

            -- teacher—
-- Id    | dept  |  name        | phone
-- 101   | 1     |  Shrivel     |  2753
-- 102   | 1     |  Throd       |  2754
-- 103   |       |  Splint      |
-- 104   |       |  Spiregrain  |
-- 105   | 2     |  Cutflower   |  3212
-- 106   |       |  Deadyawn    |


   -- dept—
-- Id   |  name
-- 1    |  Computing
-- 2    |  Design
-- 3    |  Engineering


-- 10.8.1
-- Select the code which uses an outer join correctly.

-- Answer:
-- SELECT teacher.name, dept.name 
--      FROM teacher 
--           LEFT OUTER JOIN dept 
--                ON (teacher.dept = dept.id) 


-- 10.8.2
-- Select the correct statement that shows the name of department which employs Cutflower -

-- Answer:
-- SELECT dept.name 
--      FROM teacher 
--           JOIN dept 
--                ON (dept.id = teacher.dept) 
--           WHERE teacher.name = 'Cutflower' 


-- 10.8.3
-- Select out of following the code which uses a JOIN to show a list of all the departments and number of employed teachers

-- Answer:
-- SELECT dept.name, COUNT(teacher.name) 
--      FROM teacher 
--           RIGHT JOIN dept 
--                ON dept.id = teacher.dept 
--      GROUP BY dept.name 


-- 10.8.4
-- Using SELECT name, dept, Coalesce(dept,0) AS result FROM teacher on teacher table will:

--Answer:
-- Display 0 in result column for all teachers without department


-- 10.8.5
-- Query

-- SELECT name, 
--      CASE WHEN phone = 2752 THEN 'two' 
--                WHEN phone = 2753 THEN 'three' 
--                WHEN phone = 2754 THEN 'four' 
--                END AS digit 
--      FROM teacher 

-- Show following ‘digit’.

-- Answer:
-- ‘four’ for Throd


-- 10.8.6
-- Select the result that would be obtained from the following code:

-- SELECT name, 
--      CASE 
--           WHEN dept 
--                IN (1) 
--                THEN 'Computing' 
--           ELSE 'Other' 
--           END 
--      FROM teacher 

-- Answer:
-- Table A --
-- Shivell     | Computing
-- Throd       | Computing
-- Splint      | Computing
-- Spiregrain  | Other
-- Cutflower   | Other
-- Deadyawn    | Other
