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
SELECT reports_rental_dates.name,
    count(reports_rental_dates.days_rented) FILTER (WHERE reports_rental_dates.month = 1) AS january,
    count(reports_rental_dates.days_rented) FILTER (WHERE reports_rental_dates.month = 2) AS febuary,
    count(reports_rental_dates.days_rented) FILTER (WHERE reports_rental_dates.month = 3) AS march,
    count(reports_rental_dates.days_rented) FILTER (WHERE reports_rental_dates.month = 4) AS april,
    count(reports_rental_dates.days_rented) FILTER (WHERE reports_rental_dates.month = 5) AS may,
    count(reports_rental_dates.days_rented) FILTER (WHERE reports_rental_dates.month = 6) AS june,
    count(reports_rental_dates.days_rented) FILTER (WHERE reports_rental_dates.month = 7) AS july,
    count(reports_rental_dates.days_rented) FILTER (WHERE reports_rental_dates.month = 8) AS august,
    count(reports_rental_dates.days_rented) FILTER (WHERE reports_rental_dates.month = 9) AS september,
    count(reports_rental_dates.days_rented) FILTER (WHERE reports_rental_dates.month = 10) AS october,
    count(reports_rental_dates.days_rented) FILTER (WHERE reports_rental_dates.month = 11) AS november,
    count(reports_rental_dates.days_rented) FILTER (WHERE reports_rental_dates.month = 12) AS december
   FROM reports_rental_dates
  GROUP BY reports_rental_dates.name
) 
SELECT *
FROM rentals;
