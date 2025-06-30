-- Tournament Goal Scorer Ranking by Year 
WITH TeamGoalsPerTournament AS (
    SELECT
        WC.year,
        CASE
            WHEN WM.home_team = Team.Team_Name THEN WM.home_team
            ELSE WM.away_team
        END AS Team_Name,
        SUM(CASE
            WHEN WM.home_team = Team.Team_Name THEN WM.Home_Goals
            ELSE WM.Away_Goals
        END) AS Total_Goals_Scored
    FROM
        world_cup_matches_db WM
    JOIN
        winning_worldcups_db WC ON WM.year = WC.year
    JOIN (
        SELECT DISTINCT Home_Team AS Team_Name FROM world_cup_matches_db
        UNION ALL
        SELECT DISTINCT Away_Team AS Team_Name FROM world_cup_matches_db
    ) AS Team ON Team.Team_Name = WM.Home_Team OR Team.Team_Name = WM.Away_Team
    GROUP BY
        WC.year,
        CASE
            WHEN WM.home_team = Team.Team_Name THEN WM.home_team
            ELSE WM.away_team
        END
)
SELECT
    Year,
    Team_Name,
    Total_Goals_Scored,
    RANK() OVER (PARTITION BY Year ORDER BY Total_Goals_Scored DESC) AS Goals_Rank
FROM
    TeamGoalsPerTournament
ORDER BY
    Year ASC,
    Goals_Rank ASC;




-- Top Teams by Historical World Cup Goal Difference & Win Percentage--
WITH Team_Match_Stats AS (
    SELECT
        WC.year,
        WM.ID,
        CASE WHEN WM.home_team = T.Team_Name THEN WM.home_team ELSE WM.away_team END AS Team_Name,
        CASE WHEN WM.home_team = T.Team_Name THEN WM.Home_Goals ELSE WM.Away_Goals END AS Goals_Scored,
        CASE WHEN WM.home_team = T.Team_Name THEN WM.Away_Goals ELSE WM.Home_Goals END AS Goals_Conceded,
        CASE
            WHEN (WM.home_team = T.Team_Name AND WM.Home_Goals > WM.Away_Goals)
                 OR (WM.away_team = T.Team_Name AND WM.Away_Goals > WM.Home_Goals) THEN 1 -- Win
            ELSE 0
        END AS Is_Win
    FROM
        world_cup_matches_db WM
    JOIN
        winning_worldcups_db WC ON WM.year = WC.year
    JOIN (
        SELECT DISTINCT home_team AS Team_Name FROM world_cup_matches_db
        UNION ALL
        SELECT DISTINCT away_team AS Team_Name FROM world_cup_matches_db
    ) AS T ON T.Team_Name = WM.home_team OR T.Team_Name = WM.away_team
),
Team_Overall_Stats AS (
    SELECT
        Team_Name,
        COUNT(ID) AS Total_Matches_Played,
        SUM(Is_Win) AS Total_Wins,
        SUM(Goals_Scored - Goals_Conceded) AS Total_Goal_Difference,
        AVG(CAST(Goals_Scored - Goals_Conceded AS REAL)) AS Average_Goal_Difference_Per_Match
    FROM
        Team_Match_Stats
    GROUP BY
        Team_Name
)
SELECT
    Team_Name,
    Total_Matches_Played,
    Total_Wins,
    Total_Goal_Difference,
    ROUND(Average_Goal_Difference_Per_Match, 2) AS Average_Goal_Difference_Per_Match
FROM
    Team_Overall_Stats
ORDER BY
    Average_Goal_Difference_Per_Match DESC
;

