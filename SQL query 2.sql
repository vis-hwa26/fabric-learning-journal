--Verifying consistency
SELECT COUNT(*) FROM dbo.Trip WHERE TripDurationSeconds>86400;

SELECT COUNT(*) FROM dbo.Trip WHERE TripDurationSeconds<0;

--Create a View
CREATE VIEW dbo.JanTrip
As
SELECT D.DayName,AVG(T.TripDurationSeconds) AS AvgDuration,AVG(T.TripDistanceMiles) AS AvgDistance
FROM dbo.Trip T JOIN dbo.Date D ON T.DateID = D.DateID
WHERE D.Month = '01'
GROUP BY D.DayName;

SELECT * FROM dbo.Geography;

--total trip count by day
with cte 
as 
(SELECT D.Date AS Date,COUNT(T.DateID) TotalTrip FROM dbo.Trip T JOIN dbo.Date D ON T.DateID = D.DateID
GROUP BY D.Date)SELECT Date,TotalTrip, sum(TotalTrip) OVER(Order by Date) FROM cte;

--Rank Pickup borough by sales
with cte 
AS
(SELECT G.County County,Sum(T.TotalAmount) Revenue
FROM dbo.Trip T JOIN dbo.Geography G ON T.PickupGeographyID = G.GeographyID GROUP by G.County)SELECT County,Revenue,
RANK() Over(Order By Revenue DESC) as Rank from cte;


-- Find the single longest trip
SELECT Date,Distance,Zipcode FROM (Select D.Date Date,T.TripDistanceMiles Distance,ROW_NUMBER() OVER(PARTITION by D.Date ORDER by T.TripDistanceMiles DESC) As Rank,G.ZipCode Zipcode FROM dbo.Trip T 
JOIN dbo.Geography G ON T.PickupGeographyID = G.GeographyID Join dbo.Date D ON T.DateID = D.DateID)As T Where Rank=1;

--Top 10 revenue using cte
with cte
as 
(
	Select D.Date date,SUM(T.TotalAmount) As Revenue from dbo.Date D Join dbo.Trip T On D.DateID = T.DateID
	GROUP by D.Date
)Select TOP 10 * From cte Order by Revenue desc;

with cte
As
(
	Select M.MedallionID ID,AVG(T.FareAmount) as Avgoffare from dbo.Medallion M JOIN dbo.Trip T ON M.MedallionID = T.MedallionID
	Group by M.MedallionID
)Select ID,Avgoffare From cte where Avgoffare > (Select Avg(Avgoffare) from cte);



--For each month, show total revenue and the percentage change from the previous month.
with cte
as
(
	Select D.Month Month,Sum(T.TotalAmount) As Revenue from dbo.Date D JOIN dbo.Trip T ON D.DateID = T.DateID
	Group by D.Month
)Select Month,Revenue,(Revenue-lag(Revenue) over(Order by Month))*100/lag(Revenue) over(Order by Month) as Percentchange
From cte
Order by Month;

Select * from dbo.Trip;
Select * from dbo.Time;
Select * from dbo.Trip A JOIN dbo.Time B ON A.PickupTimeID = B.TimeID;

-- For each borough, find the 3 busiest hours of the day (by trip count) — one result set showing top 3 per borough, not overall.
-- Select G.County,Ti.HourNumber TotalHours,Count(T.PickupTimeID) TotalTrips,Row_number() Over(Partition by G.County Order by Count(T.PickupTimeID)) as Rank
-- from dbo.Geography G JOIN dbo.Trip T ON G.GeographyID = T.PickupGeographyID JOIN dbo.Time Ti ON T.PickupTimeID = Ti.TimeID
-- Group by G.County,Ti.HourNumber;


-- Compare average trip fare on rainy days vs. non-rainy days.
WITH weather_cte AS (
    SELECT 
        CASE 
            WHEN W.PrecipitationInches > 0 THEN 'Rainy Day'
            ELSE 'Non Rainy Day'
        END AS Daytype,
        AVG(T.TotalAmount) AS AvgFare
    FROM dbo.Trip T 
    JOIN dbo.Weather W ON T.DateID = W.DateID
    GROUP BY 
        CASE 
            WHEN W.PrecipitationInches > 0 THEN 'Rainy Day'
            ELSE 'Non Rainy Day'
        END
)
SELECT 
    Daytype, 
    AvgFare 
FROM weather_cte;

Select Avg(T.TotalAmount)
from dbo.Trip T JOIN dbo.Weather W ON T.DateID = W.DateID
Where W.PrecipitationInches=0;

Select PickupTimeID,Ti.TimeID From dbo.Trip T JOIN dbo.Time Ti ON T.PickupTimeID = Ti.TimeID

Select DropoffTimeID,Ti.TimeID From  dbo.Trip T JOIN dbo.Time Ti ON T.DropoffTimeID = Ti.TimeID
Select count(Distinct(DateID)) from dbo.Trip
Select DateID,PickupTimeID,DropoffTimeID from dbo.Trip
select * from dbo.Time;

