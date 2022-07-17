-- insert new cities into the city table

WITH CTE AS (
    SELECT city
    , country_id
    FROM c_in    
    GROUP BY city, country_id        
)
INSERT INTO city
( city, country_id )
SELECT CTE.city
,   CTE.country_id
FROM CTE
FULL JOIN City
ON CTE.city = City.city
AND CTE.country_id = City.country_id
WHERE City.City IS NULL;


-- match city_id records

WITH CTE AS (
    SELECT id
    --,   c_in.city    
    --,   city.city
    --,   c_in.city_id
    ,   city.city_id    
    FROM c_in
    LEFT JOIN city
    ON c_in.city = city.city
    AND c_in.country_id = city.country_id
)
UPDATE c_in
SET city_id = CTE.city_id
FROM CTE
WHERE c_in.id = cte.id;
