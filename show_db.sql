SELECT * FROM groups_db;
SELECT * FROM 2022_matches_db;
SELECT * FROM squads_db;
SELECT * FROM winning_worldcups_db;
SELECT * FROM world_cup_matches_db;
select * from international_matches_db;

-- Rename columns -- 
ALTER TABLE world_cup_matches_db
RENAME COLUMN `Home Team` TO Home_Team;

ALTER TABLE world_cup_matches_db
RENAME COLUMN `Home Goals` TO Home_Goals,
RENAME COLUMN `Away Goals` TO Away_Goals,
RENAME COLUMN `Away Team` TO Away_Team,
RENAME COLUMN `Win Conditions` TO Win_Conditions,
RENAME COLUMN `Host Team` TO Host_Team
;