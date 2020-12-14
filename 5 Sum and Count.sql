-- 5 Sum and Count:

-- 1. Show the total population of the world.

SELECT SUM(population)
     FROM world;


-- 2. List all the continents - just once each.

SELECT DISTINCT continent
     FROM world;


-- 3. Give the total GDP of Africa

SELECT SUM(gdp)
     FROM world
     WHERE continent = 'Africa';


-- 4. How many countries have an area of at least 1000000

SELECT COUNT(area) 
     FROM world
     WHERE area >=1000000;


-- 5. What is the total population of ('Estonia', 'Latvia', 'Lithuania')

SELECT SUM(population)
     FROM world
     where name IN('Estonia', 'Latvia', 'Lithuania');


-- 6. For each continent show the continent and number of countries.

SELECT continent, COUNT(name)
     FROM world
     GROUP BY continent;


-- 7. For each continent show the continent and number of countries with populations of at least 10 million.

SELECT continent, COUNT(name)
     FROM world
     WHERE population >= 10000000
     GROUP BY continent;


-- 8. List the continents that have a total population of at least 100 million.

SELECT continent
     FROM world
     GROUP BY continent 
     HAVING SUM(population) >= 100000000;



6 Join:

-- 1. show the matchid and player name for all goals scored by Germany.

SELECT matchid, player name
     FROM goal 
     WHERE teamid='GER';


-- 2. Show id, stadium, team1, team2 for just game 1012

SELECT id,stadium,team1,team2
     FROM game
     WHERE id like '1012';


-- 3. Show the player, teamid, stadium and mdate for every German goal.

SELECT player,teamid, stadium, mdate
     FROM game 
          JOIN goal 
               ON (game.id=goal.matchid)
          WHERE teamid LIKE 'GER';


-- 4. Show the team1, team2 and player for every goal scored by a player called Mario

SELECT team1, team2, player
     FROM game 
          JOIN goal 
               ON (game.id=goal.matchid)
          WHERE player LIKE 'Mario%';


-- 5. Show player, teamid, coach, gtime for all goals scored in the first 10 minutes

SELECT player, teamid, coach, gtime
     FROM eteam
          JOIN goal 
               ON (goal.teamid=eteam.id)
          WHERE gtime<=10;


-- 6. List the dates of the matches and the name of the team in which 'Fernando Santos' was the team1 coach.

select mdate, teamname
     from game
          JOIN eteam
               ON (team1=eteam.id)
          WHERE coach LIKE 'Fernando Santos';


-- 7. List the player for every goal scored in a game where the stadium was 'National Stadium, Warsaw'

SELECT player
     FROM game
          JOIN goal
               ON (game.id=goal.matchid)
          WHERE stadium LIKE 'National Stadium, Warsaw';


-- 8. Show the name of all players who scored a goal against Germany.

SELECT Distinct player
     FROM game 
          JOIN goal 
          ON matchid = id 
               WHERE (team1=teamid AND team2='GER')
          OR (Team2=teamid AND team1= 'GER');


-- 9. Show teamname and the total number of goals scored.

SELECT teamname, COUNT(*)
     FROM goal 
          JOIN eteam  
          ON goal.teamid = eteam.id
     GROUP BY teamname;

--------
--OR--
--------

SELECT teamname, COUNT(*)
     FROM goal x
          JOIN eteam y 
          ON x.teamid = y.id
     GROUP BY teamname;


-- 10. Show the stadium and the number of goals scored in each stadium.

SELECT stadium, count(*)
     FROM game x
          JOIN goal y
               ON x.id=y.matchid
     GROUP BY stadium;


-- 11. For every match involving 'POL', show the matchid, date and the number of goals scored.

SELECT matchid, mdate, count(*)
     FROM game x
          JOIN goal y
               ON y.matchid=x.id 
          WHERE team1 ='POL' 
               OR team2 ='POL'
     GROUP BY matchid, mdate;


-- 12. For every match where 'GER' scored, show matchid, match date and the number of goals scored by 'GER'

SELECT matchid, mdate, COUNT(*)
     FROM goal y
          JOIN game x
          ON y.matchid=x.id 
               WHERE teamid='GER'
     GROUP BY matchid, mdate;


-- 13. List every match with the goals scored by each team as shown. Sort your result by mdate, matchid, team1 and team2.

SELECT mdate, team1, 
                    SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) score1, team2, 
                    SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) score2
     FROM game 
          LEFT JOIN goal 
          ON matchid = id
     GROUP BY mdate, matchid, team1, team2;
