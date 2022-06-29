

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
  
    IF ( month IN (1,3,5,7,8,10,11) ) THEN
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
