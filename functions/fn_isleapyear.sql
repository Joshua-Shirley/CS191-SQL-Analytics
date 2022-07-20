CREATE OR REPLACE FUNCTION public.fn_isleapyear(
	year integer)
    RETURNS boolean
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
AS $BODY$
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

ALTER FUNCTION public.fn_isleapyear(integer)
    OWNER TO postgres;
