CREATE OR REPLACE PROCEDURE public.updatedatetable(
	IN startdate date,
	IN enddate date)
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
ALTER PROCEDURE public.updatedatetable(date, date)
    OWNER TO postgres;
