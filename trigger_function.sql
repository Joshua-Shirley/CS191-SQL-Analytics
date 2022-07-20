CREATE OR REPLACE FUNCTION public.log_rental_to_reports_detail()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
BEGIN  
    
        INSERT INTO report_rental_detail
        
        SELECT rental_id
            , rental.inventory_id
            , film.film_id            
            , d1.dateid as rental_date_id
            , t1.timeid as rental_time_id            
            , d2.dateid as return_date_id
            , t2.timeid as return_time_id
            , film_category.category_id
            , store_id
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
            SELECT rental_id FROM report_rental_detail   
        )
        order by rental_date;

    return new;

END;
$BODY$;

ALTER FUNCTION public.log_rental_to_reports_detail()
    OWNER TO postgres;