WITH RECURSIVE CTE(id) AS (
        SELECT 0
    
        UNION ALL

        SELECT id + 1       
        FROM CTE
        WHERE id + 1 < ( 50 * 10 )
),
CTE_max AS (
   SELECT count(*) AS MaxCustomer
   FROM customer          
),
CTE_One AS (
    SELECT id
    ,   floor( random() * (30 - 1 + 1) + 1  )::INTEGER AS rental_date
    ,   0 AS Inventory_Id
    ,   floor( random() * (MaxCustomer - 1 + 1) + 1  )::INTEGER AS Customer_Id
    ,   0 AS store_id
    ,   floor( random() * (2 - 1 + 1) + 1)::INTEGER AS staff_Id
    FROM CTE, CTE_max   
), 
CTE_Two AS (
    SELECT id
    ,   rental_date
    ,   inventory_id
    ,   CTE_One.customer_id
    ,   customer.store_id
    ,   staff_id
    FROM CTE_One
    LEFT JOIN customer
    ON CTE_One.customer_id = customer.customer_id
), 
CTE_Inventory AS (
    SELECT store_id
    ,   row_number() OVER (Partition by store_id ) as row_store_film
    ,   inventory_id
    FROM inventory
),
CTE_Inventory_Max AS (
    SELECT store_id
    ,   count(inventory_id) AS MaxInv
    FROM CTE_Inventory
    GROUP BY store_id
)
, CTE_Inventory_Random AS (
    SELECT id
    ,   rental_date
    ,   inventory_id
    ,   floor( random() * (MaxInv - 1 + 1) + 1 )::INTEGER AS Inventory_Random
    ,   customer_id
    ,   CTE_Two.store_id
    ,   staff_id
    FROM CTE_Two
    LEFT JOIN CTE_Inventory_Max
    ON CTE_Two.store_id = CTE_Inventory_Max.store_id    
)
SELECT id
,   rental_date
,   CTE_Inventory_Random.inventory_id
,   Inventory_Random
,   customer_id
,   CTE_Inventory_Random.store_id
,   staff_id
,   CTE_Inventory.inventory_id
FROM CTE_Inventory_Random
LEFT JOIN CTE_Inventory
ON CTE_Inventory_Random.store_id = CTE_Inventory.store_id
AND CTE_Inventory_Random.Inventory_Random = CTE_Inventory.row_store_film

ORDER BY id
   
