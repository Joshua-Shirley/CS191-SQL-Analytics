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


-- 
