WITH CTE AS (
    SELECT store_id
    ,   dow
    ,   hour        
    ,   sum(R) AS rentals
    FROM (
-- use a union all to ensure some data is returned for each hour of the day
        SELECT hour
        ,   0 AS store_id
        ,   0 AS DOW
        ,   0 AS R        
        FROM timefact
        GROUP BY hour

        UNION ALL

        SELECT h
        ,   store_id
        ,   DOW
        ,   count(*)        
        FROM reports_rental_details
        GROUP BY h, store_id, DOW
    ) as R
    GROUP BY store_id, dow, hour
    
)
SELECT store_id
, CASE
    WHEN DOW = 0 THEN 'Sunday'
    WHEN DOW = 1 THEN 'Monday'
    WHEN DOW = 2 THEN 'Tuesday'
    WHEN DOW = 3 THEN 'Wednesday'
    WHEN DOW = 4 THEN 'Thursday'
    WHEN DOW = 5 THEN 'Friday'
    WHEN DOW = 6 THEN 'Saturday'
    ELSE ''
    END as "Day of Week"
-- Open Hours
,   AVG(rentals) FILTER (WHERE hour = 10)::INTEGER AS "10:00 AM"
,   AVG(rentals) FILTER (WHERE hour = 11)::INTEGER AS "11:00 AM"
,   AVG(rentals) FILTER (WHERE hour = 12)::INTEGER AS "12:00 PM"
,   AVG(rentals) FILTER (WHERE hour = 13)::INTEGER AS "1:00 PM"
,   AVG(rentals) FILTER (WHERE hour = 14)::INTEGER AS "2:00 PM"
,   AVG(rentals) FILTER (WHERE hour = 15)::INTEGER AS "3:00 PM"
,   AVG(rentals) FILTER (WHERE hour = 16)::INTEGER AS "4:00 PM"
,   AVG(rentals) FILTER (WHERE hour = 17)::INTEGER AS "5:00 PM"
,   AVG(rentals) FILTER (WHERE hour = 18)::INTEGER AS "6:00 PM"
,   AVG(rentals) FILTER (WHERE hour = 19)::INTEGER AS "7:00 PM"
,   AVG(rentals) FILTER (WHERE hour = 20)::INTEGER AS "8:00 PM"
,   AVG(rentals) FILTER (WHERE hour = 21)::INTEGER AS "9:00 PM"
,   AVG(rentals) FILTER (WHERE hour = 22)::INTEGER AS "10:00 PM"
,   AVG(rentals) FILTER (WHERE hour = 23)::INTEGER AS "11:00 PM"
,   AVG(rentals) FILTER (WHERE hour = 0)::INTEGER AS "12:00 AM"
-- Closed Hours
,   AVG(rentals) FILTER (WHERE hour in (1,2,3,4,5,6,7,8,9))::INTEGER AS "1 to 10 AM"

FROM CTE
WHERE store_id <> 0
GROUP BY store_id, dow;
