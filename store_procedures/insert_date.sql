/*

*/

CREATE OR REPLACE PROCEDURE public.insert_date(
	IN d date)
LANGUAGE 'plpgsql'
AS $BODY$
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
$BODY$;

ALTER PROCEDURE public.insert_date(date)
    OWNER TO postgres;
