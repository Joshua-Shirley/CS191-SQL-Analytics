-- PROCEDURE: public.datesfromtables()

-- DROP PROCEDURE IF EXISTS public.datesfromtables();

CREATE OR REPLACE PROCEDURE public.date_range_from_tables(
	)
LANGUAGE 'plpgsql'
AS $BODY$
DECLARE
    low DATE;
    high DATE;
BEGIN
   
    SELECT INTO low, high
           MIN(min)::DATE
         , MAX(max)::DATE
    FROM (
        SELECT MIN(last_update), MAX(last_update) FROM actor  
            UNION ALL 
        SELECT MIN(last_update), MAX(last_update) FROM store  
            UNION ALL 
        SELECT MIN(last_update), MAX(last_update) FROM address  
            UNION ALL 
        SELECT MIN(last_update), MAX(last_update) FROM category  
            UNION ALL 
        SELECT MIN(last_update), MAX(last_update) FROM city  
            UNION ALL 
        SELECT MIN(last_update), MAX(last_update) FROM country  
            UNION ALL 
        SELECT MIN(create_date), MAX(create_date) FROM customer  
            UNION ALL 
        SELECT MIN(last_update), MAX(last_update) FROM customer  
            UNION ALL 
        SELECT MIN(last_update), MAX(last_update) FROM film_actor  
            UNION ALL 
        SELECT MIN(last_update), MAX(last_update) FROM film_category  
            UNION ALL 
        SELECT MIN(last_update), MAX(last_update) FROM inventory  
            UNION ALL 
        SELECT MIN(last_update), MAX(last_update) FROM language  
            UNION ALL 
        SELECT MIN(rental_date), MAX(rental_date) FROM rental  
            UNION ALL 
        SELECT MIN(return_date), MAX(return_date) FROM rental  
            UNION ALL 
        SELECT MIN(last_update), MAX(last_update) FROM rental  
            UNION ALL 
        SELECT MIN(last_update), MAX(last_update) FROM staff  
            UNION ALL 
        SELECT MIN(payment_date), MAX(payment_date) FROM payment  
            UNION ALL 
        SELECT MIN(last_update), MAX(last_update) FROM film         
    ) D;
    
    CALL public.update_date_table(low,high);
    
END;
$BODY$;

ALTER PROCEDURE public.date_range_from_tables()
    OWNER TO postgres;
