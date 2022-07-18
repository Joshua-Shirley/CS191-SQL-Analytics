-- INSERT UNIQUE NEW CUSTOMERS INTO THE CUSTOMER TABLE

WITH CTE AS (
SELECT 
    first_name
,   last_name
,   email
,   address_id
FROM c_in
GROUP BY first_name, last_name, email, address_id
)
SELECT *
FROM CTE
FULL JOIN customer
ON CTE.address_id = customer.address_id
AND CTE.email = customer.email
AND CTE.last_name = customer.last_name
AND CTE.first_name = customer.first_name
WHERE customer_id IS NULL;


-- UPDATE THE C_IN TABLE

WITH CTE AS (
    SELECT id
    ,   customer.customer_id
    FROM c_in
    LEFT JOIN customer
    ON c_in.address_id = customer.address_id
    AND c_in.email = customer.email
    AND c_in.last_name = customer.last_name
    AND c_in.first_name = customer.first_name
    WHERE c_in.customer_id IS NULL
)
UPDATE c_in
SET customer_id = CTE.customer_id
FROM CTE
WHERE c_in.id = CTE.id;
