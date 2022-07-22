CREATE OR REPLACE PROCEDURE public.change_rental_times(
	)
LANGUAGE 'plpgsql'
AS $BODY$
DECLARE              
BEGIN

    WITH CTE AS (
        SELECT rental_id
        ,   rental_date    
        ,   random() AS H
        ,   FLOOR( random() * (60)  ) * interval '1 minute' as minute
        FROM rental
    )
    , CTE_Time AS (
        SELECT rental_id
            ,   rental_date
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
            AS Hour
            ,   minute          
        FROM CTE
    )
    , CTE_Update AS (
    SELECT rental_id
    ,   rental_date::date + minute + Hour * interval '1 hour' as n
    --,   rental_date::date + 17 * interval '1 hour ' as n
    FROM CTE_Time
    )
    UPDATE rental
    SET rental_date = n
    FROM CTE_Update
    WHERE rental.rental_id = CTE_Update.rental_id;
    
    call report_rental_complete_update();

END;
$BODY$;
ALTER PROCEDURE public.change_rental_times()
    OWNER TO postgres;
