-- Are there any missing values in the group or team columns 
SELECT * 
FROM groups_db
WHERE GroupName IS NULL
OR TeamName IS NULL
;

-- Is the group column consistently formatted 
SELECT DISTINCT GroupName
FROM groups_db;

-- Are there any leading or trailing spaces in text fields that could cause issues with joins or filtering? How would you clean them?
SELECT
    TeamName
FROM
    groups_db
WHERE
   TeamName  LIKE ' %' OR TeamName LIKE '% ';

-- How would you check for and handle missing values in scores 
 SELECT * 
FROM international_matches_db
WHERE Home_Goals IS NULL 
OR Away_Goals IS NULL 
OR Home_Stadium IS NULL;

SELECT * 
FROM world_cup_matches_db
WHERE Home_Goals IS NULL 
OR Away_Goals IS NULL 
OR Win_Conditions IS NULL;


-- Are the dates in a consistent format? If not, how would you standardize them?
SELECT DISTINCT Match_Date
FROM 2022_matches_db;


SELECT
    Match_Date,
    STR_TO_DATE(Match_Date, '%Y-%m-%d') AS converted_date
FROM
    2022_matches_db
LIMIT 10;

SELECT DISTINCT Date
FROM world_cup_matches_db;

SELECT
    Date,
    STR_TO_DATE(Date, '%Y-%m-%d') AS converted_date
FROM
    world_cup_matches_db
LIMIT 10;

-- Are there any players with missing club or position information? How would you handle them
 SELECT Player
 FROM squads_db 
 WHERE club IS NULL 
 OR position IS NULL;
 
-- Are there any players listed multiple times due to data entry errors
SELECT player, COUNT(*) 
FROM squads_db 
GROUP BY player 
HAVING COUNT(*) > 1
;

-- How would you identify and resolve inconsistencies in team/country names between the historical datasets and the 2022 datasets? 
 -- Query to identify unique team/country names across all datasets
SELECT DISTINCT TeamName AS country_name FROM groups_db
UNION
SELECT DISTINCT Home_Team FROM 2022_matches_db
UNION
SELECT DISTINCT Away_Team FROM 2022_matches_db
UNION
SELECT DISTINCT Team FROM squads_db
UNION
SELECT DISTINCT Home_Team FROM international_matches_db
UNION
SELECT DISTINCT Away_Team FROM international_matches_db
UNION
SELECT DISTINCT Home_Team FROM world_cup_matches_db
UNION
SELECT DISTINCT Away_Team FROM world_cup_matches_db
UNION
SELECT DISTINCT Winner FROM winning_worldcups_db
UNION
SELECT DISTINCT Runners_Up FROM winning_worldcups_db
ORDER BY country_name;
 

 
 
 -- Are there any missing match results or World Cup winners in the historical data
SELECT Home_Team, Away_Team
FROM world_cup_matches_db
WHERE Home_Goals IS NULL 
OR Away_Goals IS NULL
;