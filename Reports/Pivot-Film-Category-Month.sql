DROP VIEW Report_Pivot_Film_Category_Month;

CREATE VIEW Report_Pivot_Film_Category_Month
AS
WITH CTE AS (
    SELECT month
        , SUM(COUNT)
    FROM (

        SELECT
            month
            , 0 AS COUNT
        FROM dateview
        GROUP BY month

        UNION ALL

        SELECT 
            month
            , count(days_rented) AS COUNT
        FROM reports_rental_dates
        GROUP BY month

    ) AS D
    GROUP BY month
)
, rentals AS (
    SELECT 
        reports_rental_dates.name
    ,   count(reports_rental_dates.days_rented) FILTER (WHERE reports_rental_dates.month = 1) AS January
    ,   count(reports_rental_dates.days_rented) FILTER (WHERE reports_rental_dates.month = 2) AS Febuary
    ,   count(reports_rental_dates.days_rented) FILTER (WHERE reports_rental_dates.month = 3) AS March
    ,   count(reports_rental_dates.days_rented) FILTER (WHERE reports_rental_dates.month = 4) AS April
    ,   count(reports_rental_dates.days_rented) FILTER (WHERE reports_rental_dates.month = 5) AS May
    ,   count(reports_rental_dates.days_rented) FILTER (WHERE reports_rental_dates.month = 6) AS June
    ,   count(reports_rental_dates.days_rented) FILTER (WHERE reports_rental_dates.month = 7) AS July
    ,   count(reports_rental_dates.days_rented) FILTER (WHERE reports_rental_dates.month = 8) AS August
    ,   count(reports_rental_dates.days_rented) FILTER (WHERE reports_rental_dates.month = 9) AS September
    ,   count(reports_rental_dates.days_rented) FILTER (WHERE reports_rental_dates.month = 10) AS October
    ,   count(reports_rental_dates.days_rented) FILTER (WHERE reports_rental_dates.month = 11) AS November
    ,   count(reports_rental_dates.days_rented) FILTER (WHERE reports_rental_dates.month = 12) AS December
    FROM reports_rental_dates
    GROUP BY reports_rental_dates.name
) 
SELECT 
    rentals.name as "Film Category"
,   rentals.January
,   rentals.Febuary
,   rentals.March
,   rentals.April
,   rentals.May
,   rentals.June
,   rentals.July
,   rentals.August
,   rentals.September
,   rentals.October
,   rentals.November
,   rentals.December
FROM rentals;
