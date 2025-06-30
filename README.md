# ⚽ World Cup 2022 Data Analysis & Historical Performance Dashboard
This repository showcases an in-depth data analysis project focused on the FIFA World Cup, combining comprehensive 2022 tournament data with historical World Cup records. The project demonstrates an end-to-end data pipeline, from SQL-based ETL and data cleaning to advanced analytical querying and interactive dashboard creation in Power BI.

# ✨ Project Overview
The objective was to transform raw World Cup data into actionable insights, covering current tournament specifics (2022) and historical trends. The analysis provides deep dives into team performance, player statistics, goal trends, and championship history, designed to offer strategic insights for football enthusiasts and analysts alike.

# 🛠️ Technologies & Tools Used
**MySQL:**
Employed for robust ETL (Extract, Transform, Load) processes, meticulous data cleaning, data modeling (including an ERD), and extensive Exploratory Data Analysis (EDA) using complex SQL queries, subqueries, Common Table Expressions (CTEs), and Window Functions.

**Microsoft Power BI:**
Utilized for designing and implementing highly interactive and visually compelling dashboards, leveraging DAX (Data Analysis Expressions) for advanced calculations and robust data modeling.

**SQL (DDL & DML):**
Proficiently used for defining database schemas (CREATE TABLE, ALTER TABLE), loading multiple datasets (LOAD DATA INFILE), and performing intricate data manipulation and querying.

# 📊 Key Analytical Steps & Deliverables

**Database Design & ETL:**
Designed and implemented a relational database schema in MySQL, as depicted in the ERD Model, to efficiently store and manage various World Cup datasets (groups, 2022 matches, squads, international matches, world cup matches, winning world cups).

Executed comprehensive ETL processes to load data from 8 distinct CSV files into their respective MySQL tables.

Rigorous Data Cleaning & Preprocessing (in SQL):

Conducted thorough data validation to identify and address data quality issues, including:

Checking for and handling missing values in critical columns (e.g., scores, player details).

Standardizing date formats (STR_TO_DATE) for consistent time-series analysis across different datasets.

Identifying and resolving inconsistencies in team/country names across disparate tables (using UNION operations to find distinct names).

Addressing potential leading/trailing spaces in text fields (though TRIM was noted, checking for issues was the primary step).

Identifying and handling duplicate player entries.

Performed schema adjustments by renaming inconsistent column names (e.g., Home Team to Home_Team) using ALTER TABLE for improved query readability and consistency.

In-depth Exploratory Data Analysis (EDA) with Advanced SQL:

Analyzed group stage dynamics (number of teams per group, 2022 participating teams & FIFA rankings).

Quantified tournament goals, including total goals across all World Cups and average goals per tournament.

Identified historical powerhouses: Top 10 teams by World Cup titles and by total goals scored.

Assessed player statistics: Distribution of player positions, average age of players by position and team.

Evaluated historical team performance: Identified countries with the most World Cup Finals participations and wins, historical goal trends, and calculated win rates for teams.

Conducted specific team analysis (e.g., Brazil): Calculated total matches, wins, losses, draws, and win percentages for a selected country.

All analytical queries leveraged complex SQL structures, including subqueries, Common Table Expressions (CTEs), and various Window Functions (RANK(), DENSE_RANK()) for detailed ranking and aggregation.

Interactive Power BI Dashboard Development:

Designed and implemented three comprehensive and interactive Power BI dashboards to visualize key insights:

World Cup Overview.jpg: Provided historical context with total tournaments, matches, goals, and a World Cup Winner timeline.

2022 World Cup.jpg: Focused on the 2022 tournament, showcasing player position goals, stages of matches, group standings, and overall tournament statistics.

Each Team Performance.jpg: Offered a granular view of individual team performance (e.g., Brazil), displaying total matches, wins, losses, draws, win percentage, goal difference by year, and scored vs. conceded goals.

Utilized DAX formulas for advanced calculations, measures, and data modeling to ensure accurate and dynamic dashboard functionalities.



# 💡 Key Learnings & Skills Demonstrated 
**Database Design & SQL Mastery:**
Proficiently designed relational schemas and executed complex analytical queries with advanced SQL features.

**Comprehensive Data Cleaning & ETL:**
Expertly handled diverse data quality issues across multiple datasets.

**Advanced Data Analysis & Sports Analytics:**
Applied analytical techniques to extract meaningful insights from large sports data.

**Business Intelligence & Data Visualization:**
Skilled in developing interactive, multi-faceted dashboards with Power BI and DAX.

**Problem-Solving & Critical Thinking:**
Addressed complex analytical challenges to provide data-driven conclusions.

**Data Storytelling:**
Translated intricate sports data into clear, compelling visual narratives.
