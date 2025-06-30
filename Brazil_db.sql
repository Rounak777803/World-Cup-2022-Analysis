SELECT
    COUNT(*) AS Total_Matches,
    SUM(CASE
        WHEN (home_team = 'Brazil' AND home_goals > away_goals) OR
             (away_team = 'Brazil' AND away_goals > home_goals) THEN 1
        ELSE 0
    END) AS Total_Wins,
    SUM(CASE
        WHEN (home_team = 'Brazil' AND home_goals < away_goals) OR
             (away_team = 'Brazil' AND away_goals < home_goals) THEN 1
        ELSE 0
    END) AS Total_Losses,
    SUM(CASE
        WHEN home_goals = away_goals THEN 1
        ELSE 0
    END) AS Total_Draws,
    CAST(SUM(CASE
        WHEN (home_team = 'Brazil' AND home_goals > away_goals) OR
             (away_team = 'Brazil' AND away_goals > home_goals) THEN 1
        ELSE 0
    END) AS REAL) * 100.0 / COUNT(*) AS Win_Percentage
FROM
    world_cup_matches_db
WHERE
    home_team = 'Brazil' OR away_team = 'Brazil';