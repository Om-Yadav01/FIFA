# FIFA 19 Player Analysis with SQL

![SQL Server](https://img.shields.io/badge/SQL%20Server-Descriptive%20Analysis-blue)
![Dataset](https://img.shields.io/badge/Dataset-FIFA%2019-green)
![Rows](https://img.shields.io/badge/Rows-16%2C643-orange)

A SQL Server project for exploring FIFA 19 player data through descriptive analytics. The analysis answers practical questions about player nationality, wages, club strength, preferred foot, jersey numbers, and joining trends.

![FIFA 19 analysis preview](https://user-images.githubusercontent.com/114581035/216782659-f603a4d0-5cb1-4eb0-a680-9f202cece263.png)

## Project Highlights

- Analyzes 16,643 FIFA 19 player records across 15 dataset columns.
- Uses SQL Server queries for aggregation, ranking, filtering, and date analysis.
- Identifies top nationalities, best-rated players, highest wage earners, and strongest clubs.
- Includes a complete CSV dataset and a ready-to-run SQL analysis script.

## Repository Contents

| File | Description |
| --- | --- |
| `FIFA19_Players_Datasets.csv` | FIFA 19 player dataset used for analysis. |
| `fifa19.sql` | SQL Server script containing all descriptive analysis queries. |
| `README.md` | Project documentation, setup guide, and key insights. |

## Dataset Overview

| Metric | Value |
| --- | ---: |
| Total players | 16,643 |
| Columns | 15 |
| Nationalities | 161 |
| Highest overall rating | 94 |
| Highest wage | 565,000 |

Main columns include `Name`, `Age`, `Nationality`, `Overall_rating`, `Potential_rating`, `Club`, `Value`, `Wage`, `Preferred_Foot`, `Jersey_No`, `Joined`, `Height`, `Weight`, and `Penalties`.

## Analysis Questions

The SQL script answers questions such as:

- How many players are in the dataset?
- How many unique nationalities are represented?
- Which nationalities have the most players?
- What are the total, average, and standard deviation of wages?
- Which players have the highest and lowest wages?
- Who are the best and worst overall-rated players?
- Which clubs have the highest total and average overall ratings?
- What is the left-foot vs right-foot distribution?
- Which jersey number has the highest total wage?
- How many players joined clubs within a selected date range?
- What are the date-wise and year-wise joining trends?

## Key Findings

| Question | Result |
| --- | --- |
| Most represented nationality | England, with 1,475 players |
| Highest wage earner | L. Messi, with 565,000 |
| Best overall-rated players | L. Messi and Cristiano Ronaldo, both rated 94 |
| Club with highest total rating | Real Madrid |
| Club with highest average rating | Juventus |
| Most common preferred foot | Right foot, used by 12,823 players |
| Highest wage jersey number | Number 10 |

## How to Run

1. Open SQL Server Management Studio or Azure Data Studio.
2. Create a database named `fifa19`, or run the first section of `fifa19.sql`.
3. Import `FIFA19_Players_Datasets.csv` into a table named `dbo.tbl_players`.
4. Keep the first row as column headers during import.
5. Run `fifa19.sql` query by query to inspect the results.

The `Joined` column uses `DD-MM-YYYY` format. The SQL script uses `TRY_CONVERT(date, [Joined], 105)` for date-based questions.

## Tech Stack

- SQL Server
- SQL Server Management Studio or Azure Data Studio
- CSV dataset

## Reference

Original learning reference: [Descriptive Analysis of FIFA19 Players](https://medium.com/@kmrmanish/beginners-guide-for-data-analysis-using-sql-platform-microsoft-sql-server-practice-datasets-7da6520eb684)
