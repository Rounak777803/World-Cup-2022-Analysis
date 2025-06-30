USE worldcup_2022;

CREATE TABLE groups_db (
    GroupName VARCHAR(10),
    TeamName VARCHAR(50),
    FIFA_Ranking INT
);


drop table  international_matches_db
;
CREATE TABLE 2022_matches_db (
    ID INT PRIMARY KEY,
    Year INT,
    Match_Date DATE,
    Stage VARCHAR(50),
    Home_Team VARCHAR(50),
    Away_Team VARCHAR(50)
);


CREATE TABLE squads_db(
    ID INT,
    Team VARCHAR(50),
    Position VARCHAR(50),
    Player VARCHAR(100),
    Age INT,
    Caps INT,
    Goals INT,
    WC_Goals INT,
    League VARCHAR(100),
    Club VARCHAR(100)
);

CREATE TABLE international_matches_db (
    ID INT,
    Tournament VARCHAR(255),
    Date DATE,
    Home_Team VARCHAR(255),
    Home_Goals INT,
    Away_Goals INT,
    Away_Team VARCHAR(255),
    Win_Conditions TEXT,
    Home_Stadium  BOOLEAN
);


CREATE TABLE world_cup_matches_db (
    ID INT,
    Year INT,
    Date DATE,
    Stage VARCHAR(255),
    `Home Team` VARCHAR(255),
    `Home Goals` INT,
    `Away Goals` INT,
    `Away Team` VARCHAR(255),
    `Win Conditions` TEXT,
    `Host Team` BOOLEAN
);


CREATE TABLE winning_worldcups_db (
    Year INT,
    Host_Country VARCHAR(255),
    Winner VARCHAR(255),
    Runners_Up VARCHAR(255),
    Third VARCHAR(255),
    Fourth VARCHAR(255),
    Goals_Scored INT,
    Qualified_Teams INT,
    Matches_Played INT
);

