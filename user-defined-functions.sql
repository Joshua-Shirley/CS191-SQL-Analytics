

CREATE OR REPLACE FUNCTION public.fn_isleapyear(Year INT)
    RETURNS BOOLEAN
    LANGUAGE 'plpgsql'
AS
$BODY$
DECLARE 
    TF BOOLEAN;
BEGIN

    IF (Year % 4 = 0 AND Year % 100 <> 0) OR (Year % 400 = 0) THEN
        TF := TRUE;
    ELSE
        TF := FALSE;
    END IF;

    RETURN TF;
END;
$BODY$;

ALTER FUNCTION public.fn_isleapyear(Year INT) OWNER TO postgres;


CREATE OR REPLACE FUNCTION public.fn_daysInMonth(year INT, month INT)
    RETURNS INT
    LANGUAGE 'plpgsql'    
AS $BODY$
DECLARE 
    Days INT;
BEGIN
  
    IF ( month IN (1,3,5,7,8,10,12) ) THEN
        Days := 31;   
    ELSEIF ( month IN (4,6,9,11) ) THEN
        Days := 30;
    ELSE
        IF fn_isleapyear(year) = TRUE THEN
            Days := 29;
        ELSE
            Days := 28;
        END IF;
    END IF;

    RETURN Days;
END;
$BODY$;

ALTER FUNCTION public.fn_daysInMonth(smallint,smallint)
    OWNER TO postgres;

CREATE OR REPLACE FUNCTION public.fn_date_from_parts(
	year integer,
	month integer,
	day integer)
    RETURNS date
    LANGUAGE 'plpgsql'    
AS $BODY$
DECLARE 
    D DATE;
    Y INT;
    M INT;
    A INT;
BEGIN

    Y := Year::TEXT;
    M := RIGHT( ('00' || Month::TEXT) , 2);
    A := RIGHT( ('00' || Day::TEXT) , 2);

    SELECT TO_DATE( (Y || '-' || M || '-' || A) , 'YYYY-MM-DD' ) INTO D;

    RETURN D;
END;
$BODY$;

ALTER FUNCTION public.fn_date_from_parts(integer, integer, integer)
    OWNER TO postgres;
