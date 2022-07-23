CREATE VIEW report_pivot_days_hours_percentage

AS

WITH CTE AS (
    SELECT city
    ,   rent_dow
    ,   rent_week_day
    ,   count(*) AS total
    ,   count(*) FILTER (WHERE hour = ANY (ARRAY[ 1, 2, 3, 4, 5, 6, 7, 8, 9])) AS closed_hours
    ,   count(*) FILTER (WHERE hour = 10 ) AS H10
    ,   count(*) FILTER (WHERE hour = 11 ) AS H11
    ,   count(*) FILTER (WHERE hour = 12 ) AS H12
    ,   count(*) FILTER (WHERE hour = 13 ) AS H13
    ,   count(*) FILTER (WHERE hour = 14 ) AS H14
    ,   count(*) FILTER (WHERE hour = 15 ) AS H15
    ,   count(*) FILTER (WHERE hour = 16 ) AS H16
    ,   count(*) FILTER (WHERE hour = 17 ) AS H17
    ,   count(*) FILTER (WHERE hour = 18 ) AS H18
    ,   count(*) FILTER (WHERE hour = 19 ) AS H19
    ,   count(*) FILTER (WHERE hour = 20 ) AS H20
    ,   count(*) FILTER (WHERE hour = 21 ) AS H21
    ,   count(*) FILTER (WHERE hour = 22 ) AS H22
    ,   count(*) FILTER (WHERE hour = 23 ) AS H23
    ,   count(*) FILTER (WHERE hour = 0 ) AS H0
    FROM report_rental_detail_view
    GROUP BY city, rent_dow, rent_week_day    
)
, CTE_Display AS (
    SELECT city
        ,   -1 as rent_dow
        ,   'Total' AS Day
        ,   count(*) FILTER (WHERE hour = ANY (ARRAY[ 1, 2, 3, 4, 5, 6, 7, 8, 9])) AS Closed
        ,   count(*) FILTER (WHERE hour = 10 ) AS H10
        ,   count(*) FILTER (WHERE hour = 11 ) AS H11
        ,   count(*) FILTER (WHERE hour = 12 ) AS H12
        ,   count(*) FILTER (WHERE hour = 13 ) AS H13
        ,   count(*) FILTER (WHERE hour = 14 ) AS H14
        ,   count(*) FILTER (WHERE hour = 15 ) AS H15
        ,   count(*) FILTER (WHERE hour = 16 ) AS H16
        ,   count(*) FILTER (WHERE hour = 17 ) AS H17
        ,   count(*) FILTER (WHERE hour = 18 ) AS H18
        ,   count(*) FILTER (WHERE hour = 19 ) AS H19
        ,   count(*) FILTER (WHERE hour = 20 ) AS H20
        ,   count(*) FILTER (WHERE hour = 21 ) AS H21
        ,   count(*) FILTER (WHERE hour = 22 ) AS H22
        ,   count(*) FILTER (WHERE hour = 23 ) AS H23
        ,   count(*) FILTER (WHERE hour = 0 ) AS H0  
    FROM report_rental_detail_view
    GROUP BY city

    UNION ALL

    SELECT  
        city  
    ,   rent_dow    
    ,   rent_week_day AS Day
    ,   fn_percent_display(closed_hours,total) AS Closed
    ,   fn_percent_display(H10,total)
    ,   fn_percent_display(H11,total) 
    ,   fn_percent_display(H12,total)
    ,   fn_percent_display(H13,total) 
    ,   fn_percent_display(H14,total) 
    ,   fn_percent_display(H15,total) 
    ,   fn_percent_display(H16,total) 
    ,   fn_percent_display(H17,total) 
    ,   fn_percent_display(H18,total) 
    ,   fn_percent_display(H19,total) 
    ,   fn_percent_display(H20,total) 
    ,   fn_percent_display(H21,total) 
    ,   fn_percent_display(H22,total) 
    ,   fn_percent_display(H23,total) 
    ,   fn_percent_display(H0,total) 
    FROM CTE
)
SELECT city as Store_City
,   day
,   H10 AS "10 AM"
,   H11 AS "11 AM"
,   H12 AS "12 PM"
,   H13 AS "1 PM"
,   H14 AS "2 PM"
,   H15 AS "3 PM"
,   H16 AS "4 PM"
,   H17 AS "5 PM"
,   H18 AS "6 PM"
,   H19 AS "7 PM"
,   H20 AS "8 PM"
,   H21 AS "9 PM"
,   H22 AS "10 PM"
,   H23 AS "11 PM"
,   H0 AS "12 AM"
,   closed
FROM CTE_Display
ORDER BY 1, rent_dow



