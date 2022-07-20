CREATE OR REPLACE FUNCTION public.fn_daysinmonth(
	year integer,
	month integer)
    RETURNS integer
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
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

ALTER FUNCTION public.fn_daysinmonth(integer, integer)
    OWNER TO postgres;
