
CREATE OR REPLACE PROCEDURE public.random_orders_monthly(
    YearIn INT,
    MonthIn INT,
    Quantity INT
)
LANGUAGE 'plpgsql'
AS $BODY$
DECLARE 
   
BEGIN       
    
    WITH RECURSIVE CTE(id) AS (
        SELECT 1

        UNION ALL

        SELECT id + 1       
        FROM CTE
        WHERE id + 1 < ( Quantity ) + 1
    )
    , CTE_dates AS (
        SELECT *
        FROM datefact
        WHERE year = YearIn
        AND month = MonthIn
    )
    , CTE_date_min_max AS (
        SELECT min(dateid) as dateMin
        ,   max(dateid) as dateMax
        FROM CTE_dates
    )
    , CTE_date_random AS (
        SELECT id
        ,   floor( random() * (dateMax - dateMin + 1) + dateMin  )::INTEGER AS rental_date_id
        --,   floor( random() * ( )  )
        FROM CTE, CTE_date_min_max
    )
    , CTE_Level_One AS (
        SELECT id
        ,   fulldate AS rental_date
        FROM CTE_date_random
        LEFT JOIN datefact
        ON CTE_date_random.rental_date_id = datefact.dateid
    )
    , CTE_Customer AS (
        SELECT row_number() OVER ( ORDER BY random()) as customer_row
        ,   customer_id
        ,   store_id
        FROM customer
        WHERE active = 1
    )
    , CTE_Customer_Max AS (
        SELECT max(customer_row) AS CMax
        FROM CTE_Customer
    )  
    , CTE_Random_Customer AS (
        SELECT id
        ,   rental_date
        ,   floor( random() * ( CMax - 1 + 1) + 1 )::INTEGER AS Random_Customer
        FROM CTE_Level_One, CTE_Customer_Max
    )
    , CTE_Level_Two AS (
        SELECT id
        ,   rental_date
        --,   random_customer
        ,   CTE_Customer.customer_id
        ,   CTE_Customer.store_id
        FROM CTE_Random_Customer
        LEFT JOIN CTE_Customer
        ON CTE_Random_Customer.random_customer = CTE_Customer.customer_row
    )
    , CTE_Inventory AS (
        SELECT store_id
        ,   row_number() OVER (Partition by store_id ) as row_store_film
        ,   inventory_id
        FROM inventory
    )
    , CTE_Inventory_Max AS (
        SELECT store_id
        ,   count(inventory_id) AS MaxInv
        FROM CTE_Inventory
        GROUP BY store_id
    )
    , CTE_Inventory_Random AS (
        SELECT id
        ,   rental_date
        ,   customer_id
        ,   CTE_Level_Two.store_id
        ,   floor( random() * (MaxInv - 1 + 1) + 1 )::INTEGER AS Random_Id
        FROM CTE_Level_Two
        LEFT JOIN CTE_Inventory_Max
        ON CTE_Level_Two.store_id = CTE_Inventory_Max.store_id
    ) 
    , CTE_Level_Three AS (
        SELECT id
        ,   rental_date
        ,   customer_id
        ,   CTE_Inventory_Random.store_id
        ,   CTE_Inventory.inventory_id
        FROM CTE_Inventory_Random
        LEFT JOIN CTE_Inventory
        ON CTE_Inventory_Random.store_id = CTE_Inventory.store_id
        AND CTE_Inventory_Random.Random_Id = CTE_Inventory.row_store_film
    )
    , CTE_staff AS (
        SELECT store_id
        ,   row_number() OVER (PARTITION BY store_id) as store_row
        ,   staff_id
        FROM staff
    )     
    , CTE_Final AS (
        SELECT 
            rental_date
        ,   inventory_id
        ,   customer_id
        ,   (rental_date + ( floor( random() * ( 12 - 0 + 1 ) + 0 )::integer * interval '1 day' ))::date as return_date
        ,   staff_id
        FROM CTE_Level_Three
        LEFT JOIN CTE_staff
        ON CTE_Level_Three.store_id = CTE_staff.store_id
        AND CTE_staff.store_row = 1
        ORDER BY rental_date ASC
    )
    INSERT INTO rental
    ( rental_date, inventory_id, customer_id, return_date , staff_id )
    SELECT *
    FROM CTE_FINAL;
    
    return;

END;
$BODY$;

ALTER PROCEDURE public.random_orders_monthly(int,int,int)
    OWNER TO postgres;







   
