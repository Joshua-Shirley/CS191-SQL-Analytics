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
        ( year , month , day)
        VALUES
        ( DYear, DMonth, DDay );
       
    END IF;
        
END;
$$;
