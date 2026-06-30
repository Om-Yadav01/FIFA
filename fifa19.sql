/*
  FIFA 19 Players Descriptive Analysis
  SQL dialect: Microsoft SQL Server

  Before running:
  1. Create or use the fifa19 database.
  2. Import FIFA19_Players_Datasets.csv as dbo.tbl_players.
  3. Keep the CSV header row as column names during import.
*/

IF DB_ID('fifa19') IS NULL
BEGIN
    CREATE DATABASE fifa19;
END;
GO

USE fifa19;
GO

-- Preview the imported dataset.
SELECT TOP (10) *
FROM dbo.tbl_players;


-- Q1. How many players are there in the dataset?
SELECT COUNT(*) AS total_players
FROM dbo.tbl_players;


-- Q2. How many unique nationalities do these players belong to?
SELECT COUNT(DISTINCT Nationality) AS unique_nationalities
FROM dbo.tbl_players;


-- Q3. Which nationalities have the highest number of players?
SELECT TOP (3)
    Nationality,
    COUNT(*) AS player_count
FROM dbo.tbl_players
GROUP BY Nationality
ORDER BY player_count DESC;


-- Q4. What are the total, average, and standard deviation of wages?
SELECT
    SUM(TRY_CONVERT(float, Wage)) AS total_wage,
    AVG(TRY_CONVERT(float, Wage)) AS average_wage,
    STDEV(TRY_CONVERT(float, Wage)) AS standard_deviation_wage
FROM dbo.tbl_players;


-- Q5. Which players have the highest and lowest wages?
SELECT Name, Club, Nationality, Wage
FROM dbo.tbl_players
WHERE TRY_CONVERT(float, Wage) = (
    SELECT MAX(TRY_CONVERT(float, Wage))
    FROM dbo.tbl_players
);

SELECT Name, Club, Nationality, Wage
FROM dbo.tbl_players
WHERE TRY_CONVERT(float, Wage) = (
    SELECT MIN(TRY_CONVERT(float, Wage))
    FROM dbo.tbl_players
);


-- Q6. Which players have the best and worst overall ratings?
SELECT Name, Club, Nationality, Overall_rating
FROM dbo.tbl_players
WHERE TRY_CONVERT(float, Overall_rating) = (
    SELECT MAX(TRY_CONVERT(float, Overall_rating))
    FROM dbo.tbl_players
);

SELECT Name, Club, Nationality, Overall_rating
FROM dbo.tbl_players
WHERE TRY_CONVERT(float, Overall_rating) = (
    SELECT MIN(TRY_CONVERT(float, Overall_rating))
    FROM dbo.tbl_players
);


-- Q7. Which clubs have the highest total overall rating?
SELECT TOP (3)
    Club,
    SUM(TRY_CONVERT(float, Overall_rating)) AS total_rating
FROM dbo.tbl_players
GROUP BY Club
ORDER BY total_rating DESC;


-- Q8. Which clubs have the highest average overall rating?
SELECT TOP (5)
    Club,
    COUNT(*) AS player_count,
    AVG(TRY_CONVERT(float, Overall_rating)) AS average_rating
FROM dbo.tbl_players
GROUP BY Club
ORDER BY average_rating DESC;


-- Q9. What is the distribution of preferred foot?
SELECT
    Preferred_Foot,
    COUNT(*) AS player_count
FROM dbo.tbl_players
GROUP BY Preferred_Foot
ORDER BY player_count DESC;


-- Q10. Which jersey number has the highest total wage?
SELECT TOP (1)
    Jersey_No,
    SUM(TRY_CONVERT(float, Wage)) AS total_wage
FROM dbo.tbl_players
GROUP BY Jersey_No
ORDER BY total_wage DESC;


-- Q11. What is the nationality distribution for clubs starting with M?
SELECT
    Club,
    Nationality,
    COUNT(*) AS player_count
FROM dbo.tbl_players
WHERE Club LIKE 'M%'
GROUP BY Club, Nationality
ORDER BY Club, player_count DESC;


-- Q12. How many players joined between 20 May 2018 and 10 April 2019?
SELECT COUNT(*) AS players_joined_in_range
FROM dbo.tbl_players
WHERE TRY_CONVERT(date, Joined, 105)
      BETWEEN '2018-05-20' AND '2019-04-10';


-- Q13. How many players joined date-wise?
SELECT
    TRY_CONVERT(date, Joined, 105) AS joined_date,
    COUNT(*) AS player_count
FROM dbo.tbl_players
WHERE TRY_CONVERT(date, Joined, 105) IS NOT NULL
GROUP BY TRY_CONVERT(date, Joined, 105)
ORDER BY player_count DESC, joined_date;


-- Q14. How many players joined year-wise?
SELECT
    YEAR(TRY_CONVERT(date, Joined, 105)) AS joined_year,
    COUNT(*) AS player_count
FROM dbo.tbl_players
WHERE TRY_CONVERT(date, Joined, 105) IS NOT NULL
GROUP BY YEAR(TRY_CONVERT(date, Joined, 105))
ORDER BY player_count DESC;
