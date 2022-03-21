

-- Olympic Statistics from 1896 to 2016 
-- Minor Data Cleaning in SQL

SELECT
	   [ID]
      ,[Name] AS 'Competitor Name' 
      ,CASE WHEN [Sex] = 'M' THEN 'Male' ELSE 'Female' END AS Sex
      ,[Age]
	  ,CASE WHEN [Age] < 18 THEN 'Under 18'
			WHEN [Age] BETWEEN 18 AND 25 THEN '18-25'
			WHEN [Age] BETWEEN 25 AND 30 THEN '25-30'
			WHEN [Age] > 30 THEN 'Over 30'
		END AS [Age Grouping]
      ,[Height]
      ,[Weight]
      ,[NOC] AS 'Nation Code' -- renamed Column for clarity 
--      ,[Games]
--      ,[City]
	  ,LEFT(Games, CHARINDEX(' ', Games) - 1) AS 'Year' -- Isolate to specifically show Year only on Columns
      ,[Sport]
      ,[Event]
      ,CASE WHEN Medal = 'NA' THEN 'Not Registered' ELSE Medal END as Medal  
  FROM [olympic_games].[dbo].[athletes_event_results]
  WHERE RIGHT(Games, CHARINDEX(' ', REVERSE(Games)) - 1) = 'Summer' -- Isolate to specifically show Summer Season of Olympics
  
  