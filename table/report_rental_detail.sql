CREATE TABLE report_rental_detail (
        rental_id INTEGER PRIMARY KEY
    ,   inventory_id INTEGER
    ,   film_id INTEGER
    ,   rental_date_id INTEGER
    ,   rental_time_id INTEGER
    ,   return_date_id INTEGER
    ,   return_time_id INTEGER
    ,   store_id INTEGER
    ,   category_id INTEGER
    
);

ALTER TABLE IF EXISTS public.report_rental_detail
    OWNER to postgres;
