CREATE OR REPLACE PROCEDURE insertDate(
    D DATE
)
LANGUAGE plpgsql
AS $$
DECLARE 
    DDay INT; 
    DMonth INT;
    DYear INT;
    DId INT;
BEGIN
    
    SELECT DATE_PART('YEAR',D) INTO DYear;
    SELECT DATE_PART('MONTH',D) INTO DMonth;
    SELECT DATE_PART('DAY',D) INTO DDay;
        
    SELECT COUNT(dateid) INTO DId
    FROM datefact
    WHERE Year = DYear AND Month = DMonth AND Day = DDay;
            
    IF DId = 0 THEN    
        
        INSERT INTO datefact
        ( fulldate, year , month , day)
        VALUES
        ( fn_date_from_parts(DYear,DMonth,DDay) , DYear, DMonth, DDay );
       
    END IF;
        
END;
$$;


CREATE OR REPLACE PROCEDURE public.updateDateTable
(
    startDate DATE,
    endDate DATE
)
LANGUAGE 'plpgsql'
AS $BODY$
DECLARE        
    y INT;
    m INT;
    d INT;
    md INT;        
BEGIN
    
    -- Start the from the first year
    y := DATE_PART('YEAR',startDate);
    while y <= DATE_PART('YEAR', endDate) loop
   
        m := 1;
        while m <= 12 loop

            -- Determine the number of days in month
            -- this determines leap year Febuary as well.
            md := fn_daysinmonth(y,m);

            -- Start the day loop at 1
            d := 1;
            while d <= md loop

                call insertdate(  fn_date_from_parts(y,m,d)  );

                -- increment the day by 1
                d := d + 1;
            end loop;

            -- increment the month by 1
            m := m + 1;
        end loop;

        -- increment the year by 1
        y := y + 1;
    end loop;
    
END;
$BODY$;

CREATE OR REPLACE PROCEDURE public.updateTimeTable()
LANGUAGE 'plpgsql'
AS $BODY$
BEGIN 
    
    /* Fill TimeFact with Data */
    WITH RECURSIVE minutes(mi,s) AS (
        SELECT 0, 0

        UNION ALL

        SELECT mi + 1, 0
        FROM minutes
        WHERE mi + 1 < 60
    ), hours(h,mi,s) AS (    
        SELECT 0 , mi, s
        FROM minutes

        UNION ALL

        SELECT h + 1, mi, s
        FROM hours
        WHERE h + 1 < 24
    )
    INSERT INTO timefact
    ( hour , minute , second )
    SELECT *
    FROM hours;
    
END;
$BODY$

CREATE OR REPLACE PROCEDURE public.DatesFromTables
()
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
            UNION ALL 
        SELECT MIN(fulldate), MAX(fulldate) FROM datefact  
            UNION ALL 
        SELECT MIN(fulldate), MAX(fulldate) FROM dateview
    ) D;
    
    CALL public.updateDateTable(low,high);
    
END;
$BODY$;
