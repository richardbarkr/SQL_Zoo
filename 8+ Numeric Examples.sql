-- 8+ Numeric Examples:

-- 1. Show the the percentage who STRONGLY AGREE

SELECT A_STRONGLY_AGREE 
     FROM nss
          WHERE question ='Q01'
          AND institution ='Edinburgh Napier University'
          AND subject = '(8) Computer Science';


-- 2. Show the institution and subject where the score is at least 100 for question 15.

SELECT institution, subject 
     FROM nss
          WHERE question ='Q15' AND score >= 100;


-- 3. Show the institution and score where the score for '(8) Computer Science' is less than 50 for question 'Q15'

SELECT institution, score 
     FROM nss
          WHERE subject = '(8) Computer Science'
          AND question='Q15'
          AND score < 50;


-- 4. Show the subject and total number of students who responded to question 22 for each of the subjects '(8) 
--     Computer Science' and '(H) Creative Arts and Design'.

SELECT subject, SUM(response) 
     FROM nss
          WHERE question ='Q22'
          AND subject IN ('(8) Computer Science', '(H) Creative Arts and Design')
     GROUP BY subject;


-- 5. Show the subject and total number of students who A_STRONGLY_AGREE to question 22 for each of the subjects '(8) 
--     Computer Science' and '(H) Creative Arts and Design'.

SELECT subject, SUM(response * A_STRONGLY_AGREE / 100) 
     FROM nss
          WHERE question ='Q22'
          AND subject IN ('(8) Computer Science', '(H) Creative Arts and Design')
     GROUP BY subject;


-- 6. Show the percentage of students who A_STRONGLY_AGREE to question 22 for the subject '(8) Computer Science' 
--     show the same figure for the subject '(H) Creative Arts and Design'.

SELECT subject, ROUND(SUM(response * A_STRONGLY_AGREE) / SUM(response)) 
     FROM nss
          WHERE question ='Q22'
          AND subject IN ('(8) Computer Science', '(H) Creative Arts and Design')
     GROUP BY subject;


-- 7. Show the average scores for question 'Q22' for each institution that include 'Manchester' in the name.

SELECT institution, ROUND(SUM(response * score) / SUM(response)) 
     FROM nss
          WHERE question = 'Q22'
          AND institution LIKE '%Manchester%'
     GROUP BY institution;


-- 8. Show the institution, the total sample size and the number of computing students for institutions in Manchester for 'Q01'.

SELECT institution, SUM(sample), SUM(CASE WHEN subject = '(8) Computer Science' THEN sample END) AS "computing students"
     FROM nss
          WHERE question = 'Q01'
          AND institution LIKE '%Manchester%'
     GROUP BY institution;



9- Window Function:

-- 1. Show the lastName, party and votes for the constituency 'S14000024' in 2017.

SELECT lastName, party, votes
     FROM ge
          WHERE constituency = 'S14000024' AND yr = 2017
     ORDER BY votes DESC;


-- 2. Show the party and RANK for constituency S14000024 in 2017. List the output by party

SELECT party, votes,
          RANK() OVER (ORDER BY votes DESC) as posn
     FROM ge
          WHERE constituency = 'S14000024' AND yr = 2017
     ORDER BY party;


-- 3. Use PARTITION to show the ranking of each party in S14000021 in each year. Include yr, party, votes and ranking 
--     (the party with the most votes is 1).

SELECT yr, party, votes,
          RANK() OVER (PARTITION BY yr ORDER BY votes DESC) as posn
     FROM ge
          WHERE constituency = 'S14000021'
     ORDER BY party, yr;


-- 4. Use PARTITION BY constituency to show the ranking of each party in Edinburgh in 2017. Order your results so the winners 
--     are shown first, then ordered by constituency.

SELECT constituency, party, votes,
          RANK() OVER (PARTITION BY constituency ORDER BY votes DESC) as posn
     FROM ge
          WHERE constituency BETWEEN 'S14000021' AND 'S14000026'
          AND yr  = 2017
     ORDER BY posn ASC, constituency ASC;


-- 5. Show the parties that won for each Edinburgh constituency in 2017.

SELECT t.constituency, t.party
     FROM
          (SELECT g.constituency, g.party, RANK() OVER (PARTITION BY g.constituency ORDER BY g.votes DESC) as     posn
     FROM ge g
          WHERE g.constituency BETWEEN 'S14000021' AND 'S14000026'
          AND g.yr  = 2017) as t
          WHERE t.posn = 1;


-- 6. how how many seats for each party in Scotland in 2017.

SELECT t.party, COUNT(t.constituency) as seats
     FROM
          (SELECT g.constituency, g.party, RANK() OVER (PARTITION BY g.constituency ORDER BY g.votes DESC) as posn
          FROM ge g
               WHERE g.constituency LIKE 'S%' AND g.yr  = 2017) as t
               WHERE t.posn = 1
          GROUP BY t.party;
