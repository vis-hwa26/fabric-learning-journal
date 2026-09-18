SELECT D.MonthName,COUNT(*) AS TotalTrips,SUM(T.TotalAmount) AS Revenue FROM dbo.Date D JOIN dbo.Trip T ON D.DateID = T.DateID
GROUP BY D.MonthName;
GO

SELECT D.DayName,AVG(T.TripDurationSeconds) AS Avg_Duration,Avg(T.TripDistanceMiles) AS Avg_Distance FROM 
dbo.Date D JOIN dbo.Trip T ON D.DateID = T.DateID
GROUP BY D.DayName;



SELECT TOP 10
	G.City, 
	COUNT(*) AS TotalTrips 
FROM dbo.Trip AS T
JOIN dbo.Geography AS G
	ON T.DropoffGeographyID = G.GeographyID
GROUP BY G.City
ORDER BY TotalTrips DESC;

SELECT TOP 10
	G.City, 
	COUNT(*) AS TotalTrips 
FROM dbo.Trip AS T
JOIN dbo.Geography AS G
	ON T.PickupGeographyID = G.GeographyID
GROUP BY G.City
ORDER BY TotalTrips DESC;