-- 7 More Join Operations:

-- 1. List the films where the yr is 1962 [Show id, title]

SELECT id, title
     FROM movie
          WHERE yr=1962;


-- 2. Give year of 'Citizen Kane'.

SELECT yr
     FROM movie
          WHERE title ='citizen kane';


-- 3. List all of the Star Trek movies, include the id, title and yr (all of these movies include the words Star Trek in the title). 
--    Order results by year.

SELECT id, title, yr
     FROM movie
          WHERE title LIKE '%Star%Trek%'
     ORDER BY yr asc;


-- 4. What id number does the actor 'Glenn Close' have?

SELECT id
     FROM actor
          WHERE name='Glenn Close';


-- 5. What is the id of the film 'Casablanca'

SELECT id 
     FROM movie
          WHERE title ='Casablanca';


-- 6. Obtain the cast list for 'Casablanca'.

SELECT name
     FROM casting
          JOIN actor
               ON actor.id=casting.actorid
          WHERE casting.movieid=11768;


-- 7. Obtain the cast list for the film 'Alien'

SELECT name
     FROM actor a
          JOIN casting b
               ON a.id=actorid
          JOIN movie c
               ON c.id=movieid
     WHERE title ='Alien';


-- 8. List the films in which 'Harrison Ford' has appeared

SELECT title
     FROM movie a
          JOIN casting b
               ON a.id=movieid
          JOIN actor c
               ON c.id=actorid
     WHERE name ='Harrison Ford';


-- 9. List the films where 'Harrison Ford' has appeared - but not in the starring role.

SELECT title
     FROM movie a
          JOIN casting b 
               ON a.id=movieid
          JOIN actor c
               ON c.id=actorid
     WHERE name='Harrison Ford'
     AND ord != 1;


-- 10. List the films together with the leading star for all 1962 films.

SELECT title, name
     FROM movie a
          JOIN casting b
               ON a.id=movieid
          JOIN actor c
               ON c.id=actorid
     WHERE yr=1962
     AND ord =1;


-- 11. Which were the busiest years for 'Rock Hudson', show the year and the number of movies he made each year for 
--     any year in which he made more than 2 movies.

SELECT yr, COUNT(*) 
          FROM movie a
          JOIN casting b 
               ON a.id=movieid
          JOIN actor c 
               ON c.id = actorid
          WHERE name =  'Rock Hudson'
     GROUP BY yr
     HAVING count(*) >2;


-- 12. List the film title and the leading actor for all of the films 'Julie Andrews' played in.

SELECT DISTINCT b.title, a.name leading_star
     FROM (SELECT movie.title, actor.name, casting.movieid
     FROM movie
          JOIN casting
               ON movie.id = casting.movieid
          JOIN actor
               ON casting.actorid = actor.id
          WHERE casting.ord = 1)
          AS a
    JOIN
          (SELECT movie.title, casting.movieid
               FROM movie
                    JOIN casting 
                         ON movie.id = casting.movieid
                    JOIN actor 
                         ON casting.actorid = actor.id
          WHERE actor.name = 'Julie Andrews') 
          AS b
          ON a.movieid = b.movieid;


-- 13. Obtain a list, in alphabetical order, of actors who've had at least 15 starring roles.

SELECT a.name
     FROM
          (SELECT actor.name, COUNT(casting.movieid) star_count
          FROM actor
          JOIN casting 
               ON actor.id = casting.actorid
          WHERE casting.ord = 1
          GROUP BY actor.name)
     AS a
WHERE star_count >=15
ORDER BY 1;

--Note: ORDER BY 1 is short for ORDER BY (a.name)


-- 14. List the films released in the year 1978 ordered by the number of actors in the cast, then by title.

SELECT title, COUNT(actorid)
     FROM movie
          JOIN casting 
               ON movie.id = casting.movieid
          WHERE yr = 1978 
          GROUP BY title
          ORDER BY
          COUNT(actorid) Desc,
          title Asc


-- 15. List all the people who have worked with 'Art Garfunkel'.

SELECT DISTINCT actor.name
     FROM actor
          JOIN casting 
               ON actor.id = casting.actorid
          JOIN
               (SELECT casting.movieid
               FROM actor
               JOIN casting 
                    ON actor.id = casting.actorid
               WHERE actor.name = 'Art Garfunkel')
          AS a
     ON casting.movieid = a.movieid
     WHERE actor.name != 'Art Garfunkel';
