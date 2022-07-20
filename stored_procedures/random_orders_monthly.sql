-- PROCEDURE: public.random_orders_monthly(integer, integer, integer)

-- DROP PROCEDURE IF EXISTS public.random_orders_monthly(integer, integer, integer);

CREATE OR REPLACE PROCEDURE public.random_orders_monthly(
	IN yearin integer,
	IN monthin integer,
	IN quantity integer)
LANGUAGE 'plpgsql'
AS $BODY$
DECLARE 
    DateTrigger INT;
BEGIN       
        
    SELECT count(*) INTO DateTrigger FROM dateview WHERE year = yearin and month = monthin;
        
    IF DateTrigger = 0 THEN    
        
        CALL public.updatedatetable(fn_date_from_parts((SELECT min(year) FROM dateview), 1, 1), fn_date_from_parts(yearin, 12, 31));
        
    END IF;
    
    WITH RECURSIVE CTE(id) AS (
        SELECT 1

        UNION ALL

        SELECT id + 1       
        FROM CTE
        WHERE id + 1 < ( quantity ) + 1
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
        ,   floor( random() * ( CMax - 1 + 1) + 1 )::INTEGER AS Random_Customer
        FROM CTE, CTE_Customer_Max
    )
    , CTE_Level_Two AS (
        SELECT id    
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
        ,   customer_id
        ,   CTE_Level_Two.store_id
        ,   floor( random() * (MaxInv - 1 + 1) + 1 )::INTEGER AS Random_Id
        FROM CTE_Level_Two
        LEFT JOIN CTE_Inventory_Max
        ON CTE_Level_Two.store_id = CTE_Inventory_Max.store_id
    )  
    , CTE_Level_Three AS (
        SELECT id    
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
    , CTE_Level_Four AS (
        SELECT                 
            id
        ,   inventory_id
        ,   customer_id    
        ,   staff_id
        FROM CTE_Level_Three
        LEFT JOIN CTE_staff
        ON CTE_Level_Three.store_id = CTE_staff.store_id
        AND CTE_staff.store_row = 1    
    )
    , CTE_dates AS (
        SELECT dateid
        ,   fulldate
        FROM datefact
        WHERE year = yearin
        AND month = monthin
    )
    , CTE_date_min_max AS (
        SELECT min(dateid) as dateMin
        ,   max(dateid) as dateMax
        FROM CTE_dates
    )
    , CTE_date_random AS (
        SELECT id
        ,   floor( random() * (dateMax - dateMin + 1) + dateMin  )::INTEGER AS rental_date_id    
        FROM CTE, CTE_date_min_max
    ), CTE_Z AS (
        SELECT 
            CTE_Level_Four.id
        ,   inventory_id
        ,   customer_id
        ,   staff_id
        ,   rental_date_id    
        ,   fulldate
        ,   floor( random() * (10 - 0 + 1) + 0) AS return_days
        ,   random() AS h
        ,   FLOOR( random() * (60)  ) * interval '1 minute' as minute
        FROM CTE_Level_Four
        LEFT JOIN CTE_date_random
        ON CTE_Level_Four.id = CTE_date_random.id
        LEFT JOIN datefact
        ON CTE_date_random.rental_date_id = datefact.dateid
    ) 
    , CTE_ZZ as (
        SELECT id
        ,   inventory_id
        ,   customer_id
        ,   staff_id
        ,   rental_date_id
        ,   fulldate as rental_date
        ,   fulldate + return_days::INTEGER AS return_date
        ,   CASE 
                WHEN h < .01 THEN 0
                WHEN h < .07 THEN 10
                WHEN h < .09 THEN 11
                WHEN h < .10 THEN 12
                WHEN h < .11 THEN 13
                WHEN h < .12 THEN 14
                WHEN h < .13 THEN 15
                WHEN h < .16 then 16
                WHEN h < .28 then 17
                when h < .46 then 18
                when h < .61 then 19
                when h < .75 then 20
                when h < .87 then 21
                when h < .95 then 22
                ELSE 23
            END 
            AS hour    
        ,   minute
        FROM CTE_Z
    )
    INSERT INTO rental
    ( rental_date , inventory_id, customer_id, return_date, staff_id )
    SELECT 
        rental_date + minute + hour * interval '1 hour' as rental_date
    ,   inventory_id
    ,   customer_id
    ,   return_date + minute + hour * interval '1 hour' as return_date
    ,   staff_id 
    FROM CTE_ZZ;
        
END;
$BODY$;
ALTER PROCEDURE public.random_orders_monthly(integer, integer, integer)
    OWNER TO postgres;
