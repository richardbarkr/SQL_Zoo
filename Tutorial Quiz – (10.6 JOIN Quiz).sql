-- 10 Tutorial Quiz – (10.6 JOIN Quiz)

                      -- game--
-- id    | mdate          |  stadium                    | team1  | team2
-- 1001  | 8 June 2012    |  National Stadium, Warsaw   | POL    | GRE
-- 1002  | 8 June 2012    |  Stadion Miejski (Wroclaw)  | RUS    | CZE
-- 1003  | 12 June 2012   |  Stadion Miejski (Wroclaw)  | GRE    |  CZE
-- 1004  |  12 June 2012  |  National Stadium, Warsaw   | POL    | RUS


                    -- goal—
-- Matchid   | teamid   | player                |  gtime
-- 1001      |  POL     | Robert Lewandowski    | 17
-- 1001      |  GRE     | Dimitris Salpingidis  | 51
-- 1002      | RUS      | Alan Dzagoev          |  15
-- 1001      | RUS      |  Roman Pavlyuchenko   | 82


             -- eteam—
-- Id    | teamname        | Coach
-- POL   | Poland          |  Franciszek Smuda
-- RUS   | Russia          |  Dick Advocaat
-- CZE   |  Czech Republic |  Michal Bilek
-- GRE   | Greece          | Fernando Santos


-- 10.6.1
-- You want to find the stadium where player 'Dimitris Salpingidis' scored. Select the JOIN condition to use:

-- Answer:
-- game JOIN goal ON (id=matched)


-- 10.6.2
-- You JOIN the tables goal and eteam in an SQL statement. Indicate the list of column names that may be used in the SELECT line:

-- Answer:
-- matchid, teamid, player, gtime, id, teamname, coach


-- 10.6.3
-- Select the code which shows players, their team and the amount of goals they scored against Greece(GRE).

-- Answer:
-- SELECT player, teamid, COUNT(*) 
--      FROM game 
--           JOIN goal 
--                ON matchid = id 
--           WHERE (team1 = "GRE" OR team2 = "GRE") 
--           AND teamid != 'GRE' 
--      GROUP BY player, teamid 


-- 10.6.4
-- Select the result that would be obtained from this code:

-- SELECT DISTINCT teamid, mdate 
--      FROM goal 
--           JOIN game 
--                ON (matchid=id) 
--            WHERE mdate = '9 June 2012' 

-- Answer:
-- DEN  |  9 June 2012
-- GER  |  9 June 2012


-- 10.6.5
-- Select the code which would show the player and their team for those who have scored against Poland(POL) 
-- in National Stadium, Warsaw.

-- Answer:
-- SELECT DISTINCT player, teamid 
--      FROM game 
--           JOIN goal 
--                ON matchid = id 
--           WHERE stadium = 'National Stadium, Warsaw' 
--                AND (team1 = 'POL' OR team2 = 'POL') 
--                AND teamid != 'POL' 


-- 10.6.6
-- Select the code which shows the player, their team and the time they scored, for players who have played in 
-- Stadion Miejski (Wroclaw) but not against Italy(ITA).

-- Answer:
-- SELECT DISTINCT player, teamid, gtime 
--      FROM game 
--           JOIN goal 
--                ON matchid = id 
--           WHERE stadium = 'Stadion Miejski (Wroclaw)' 
--           AND (( teamid = team2 AND team1 != 'ITA') 
--           OR ( teamid = team1 AND team2 != 'ITA')) 


-- 10.6.7
-- Select the result that would be obtained from this code:

-- SELECT teamname, COUNT(*) 
--      FROM eteam 
--           JOIN goal 
--                ON teamid = id 
--      GROUP BY teamname 
--      HAVING COUNT(*) < 3 

-- Answer:
-- Netherlands          | 2
-- Poland               | 2
-- Republic of Ireland  | 1
-- Ukraine              | 2
