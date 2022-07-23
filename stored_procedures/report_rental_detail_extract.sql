CREATE OR REPLACE PROCEDURE public.report_rental_detail_extract(
	)
LANGUAGE 'plpgsql'
AS $BODY$
DECLARE              
BEGIN
        
    TRUNCATE report_rental_detail;    
        
    INSERT INTO report_rental_detail
    ( rental_id,  inventory_id, rental_date_id , rental_time_id, return_date_id, return_time_id , customer_id , staff_id, store_id , category_id, film_id )
    SELECT      
            rental_id
        ,   rental.inventory_id               
        ,   d1.dateid as rental_date_id
        ,   t1.timeid as rental_time_id            
        ,   d2.dateid as return_date_id
        ,   t2.timeid as return_time_id
        ,   customer_id
        ,   staff_id
        ,   store_id
        ,   film_category.category_id
        ,   film.film_id 
        FROM rental
        LEFT JOIN inventory
        ON rental.inventory_id = inventory.inventory_id
        LEFT JOIN film
        ON inventory.film_id = film.film_id
        LEFT JOIN film_category
        ON film.film_id = film_category.film_id
        LEFT JOIN category
        ON film_category.category_id = category.category_id
        LEFT JOIN datefact d1
        ON d1.fulldate = rental.rental_date::date
        LEFT JOIN datefact d2
        ON d2.fulldate = rental.return_date::date
        LEFT JOIN timefact t1
        ON t1.hour = EXTRACT( HOUR FROM rental.rental_date)
        AND t1.minute = EXTRACT( MINUTE FROM rental.rental_date)
        LEFT JOIN timefact t2
        ON t2.hour = EXTRACT( HOUR FROM rental.return_date)
        AND t2.minute = EXTRACT( MINUTE FROM rental.return_date)
        WHERE rental_id NOT IN (
            SELECT rental_id 
            FROM report_rental_detail
        )
        order by rental_date;
        
END;
$BODY$;

ALTER PROCEDURE public.report_rental_detail_extract()
    OWNER TO postgres;
