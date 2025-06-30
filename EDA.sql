-- How many teams are in each group
SELECT GroupName,  COUNT(TeamName) 
FROM groups_db
GROUP BY GroupName;

-- List all the teams participating in the 2022 World Cup
SELECT distinct(TeamName), FIFA_Ranking
FROM groups_db
order by FIFA_Ranking asc
;

SELECT count(distinct(TeamName))
FROM groups_db
;

-- What was the total number of goals scored in the tournament throuout all the years
select (sum(Home_Goals) + sum(Away_Goals)) as Total_Goals
from world_cup_matches_db;

--  How many matches wil be played in each stage
select Stage, count(*)as Number_match
from  2022_matches_db
group by Stage
 ;
 
-- Top 10 Teams by World Cup Titles
SELECT
    winner AS Team,
    COUNT(*) AS World_Cup_Titles
FROM
    winning_worldcups_db
GROUP BY
    winner
ORDER BY
    World_Cup_Titles DESC
LIMIT 10;

-- Top 10 Teams by Total Goals Scored in World Cup Matches 
SELECT
    Team,
    SUM(Goals) AS Total_Goals_Scored
FROM
    (
        SELECT home_team AS Team, home_goals AS Goals
        FROM world_cup_matches_db
        UNION ALL
        SELECT away_team AS Team, away_goals AS Goals
        FROM world_cup_matches_db
    ) AS AllTeamGoals
GROUP BY
    Team
ORDER BY
    Total_Goals_Scored DESC
LIMIT 10;


-- What was the average number of worldcup goals throughout all the years 
select 
round(sum(Goals_Scored)/count(Year)) as AVG_WorldCup_Goals
from winning_worldcups_db
;

SELECT 
    COUNT(Year) AS Total_tournaments,
    sum(Goals_Scored) as Total_WorldCup_Goals,
    AVG(Goals_Scored) AS AVG_WorldCup_Goals
FROM winning_worldcups_db
WHERE Winner IS NOT NULL AND Winner != '';

-- Which country had the most players in the tournament squads?
SELECT team, COUNT(player)
FROM squads_db 
GROUP BY team 
ORDER BY COUNT(player) DESC 
LIMIT 1;

-- What is the distribution of player positions across all squads
 SELECT position, COUNT(Player) as  Total_Player
 FROM squads_db 
 GROUP BY position
;
 
 -- What was the average age of players in the tournament in each positions
 select  position, round(AVG(Age)) as AVG_age
 FROM squads_db 
 group by position
 order by AVG_age 
 desc;
 
 -- What was the average age of players in the tournament in each country
select  Team, round(AVG(Age)) as AVG_age
 FROM squads_db 
 group by Team
 order by AVG_age 
 desc; 
 
 
-- Which country has participated in the most World Cups Finals
SELECT
    Participant,
    COUNT(*) AS Finals_Participations
FROM
    (
        SELECT winner AS Participant
        FROM winning_worldcups_db
        UNION ALL
        SELECT runners_up AS Participant
        FROM winning_worldcups_db
    ) AS AllFinalParticipants
GROUP BY
    Participant
ORDER BY
    Finals_Participations DESC
LIMIT 1;

-- Which country has Won in the most World Cups
SELECT
    winner AS Country,
    COUNT(*) AS World_Cup_Titles
FROM
    winning_worldcups_db
GROUP BY
    winner
ORDER BY
    World_Cup_Titles DESC
LIMIT 1;


-- What is the historical trend of goals scored per World Cup tournament?
SELECT w.year, SUM(wm.Home_Goals + wm.Away_Goals) AS total_goals_in_wc 
FROM winning_worldcups_db w 
JOIN world_cup_matches_db wm ON w.year = wm.year 
GROUP BY w.year 
ORDER BY w.year;


-- Which teams have the best historical win rates in World Cup matches
WITH TeamResults AS 
				   ( SELECT Home_Team AS team, 
				    CASE WHEN Home_Goals > Away_Goals THEN 1 ELSE 0 
					END AS is_win 
					FROM world_cup_matches_db 
			UNION ALL 
					SELECT Away_Team AS team, 
					CASE WHEN Away_Goals > Home_Goals THEN 1 ELSE 0 
					END AS is_win 
					FROM world_cup_matches_db ) 
SELECT team, SUM(is_win) AS wins, COUNT(*) AS total_matches, 
	   CAST(SUM(is_win) AS REAL) / COUNT(*) AS win_rate 
FROM TeamResults 
GROUP BY team
ORDER BY win_rate 
DESC;


