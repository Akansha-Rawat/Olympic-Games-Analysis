
SELECT
	ID,
	Name AS 'Competitor Name',                                   --Renamed the column
	CASE 
	   WHEN Sex = 'M' THEN 'Male' ELSE 'Female'                  --Better name for filters and visuals
	   END AS Gender,
	Age,
	CASE                                                         --Categorizing Age into segments
	   WHEN [Age] < 18 THEN 'Under 18'
	   WHEN [Age] BETWEEN 18 AND 25 THEN '18-25'
       WHEN [Age] BETWEEN 25 AND 30 THEN '25-30'
	   WHEN [Age] > 30 THEN 'Over 30' 
	 END AS [Age Grouping],
	Height,
	Weight,
	NOC AS 'Country Code',                                       --Renamed for better understanding of the column
	LEFT(Games,CHARINDEX(' ', Games)-1) AS 'Year',               --Split column to generate year
	Sport,
	Event,
	CASE                                                 
	   WHEN Medal = 'NA' THEN 'Not Registered' ELSE Medal        --Replaced NA with Not Registered for better understanding
	   END AS 'Medal'
FROM [dbo].[athletes_event_results]
WHERE RIGHT(Games, CHARINDEX(' ', REVERSE(Games))-1) = 'Summer'  --The only season we are going to analyse is 'Summer Season'