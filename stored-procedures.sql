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


