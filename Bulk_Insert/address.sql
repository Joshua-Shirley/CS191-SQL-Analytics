-- INSERT UNIQUE ADDRESSES INTO THE address table

WITH CTE AS (
    SELECT address_1
    ,   address_2
    ,   city_id
    ,   state
    ,   postal_code
    ,   phone
    FROM c_in
    GROUP BY address_1, address_2, city_id, state, postal_code, phone
)
INSERT INTO address
( address , address2 , district , city_id , postal_code , phone )
SELECT 
    address_1 AS address
,   address_2 AS address2   
,   state AS district
,   CTE.city_id
,   CTE.postal_code
,   CTE.phone
FROM CTE
FULL JOIN address
ON address.phone = CTE.phone
AND address.postal_code = CTE.postal_code
AND address.district = CTE.state
AND address.city_id = CTE.city_id
AND address.address = CTE.address_1
WHERE address_id IS NULL;



WITH CTE AS (
    SELECT id
    ,   address.address_id
    FROM c_in
    LEFT JOIN address
    ON c_in.phone = address.phone
    AND c_in.postal_code = address.postal_code
    AND c_in.state = address.district
    AND c_in.city_id = address.city_id
    AND c_in.address_1 = address.address
)
UPDATE c_in
SET address_id = CTE.address_id
FROM CTE
WHERE c_in.id = CTE.id;


