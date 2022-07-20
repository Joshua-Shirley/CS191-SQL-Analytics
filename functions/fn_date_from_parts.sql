CREATE OR REPLACE FUNCTION public.fn_date_from_parts(
	year integer,
	month integer,
	day integer)
    RETURNS date
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
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
