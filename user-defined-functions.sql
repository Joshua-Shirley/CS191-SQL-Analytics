

CREATE OR REPLACE FUNCTION public.fn_isleapyear(Year INT)
    RETURNS BOOLEAN
    LANGUAGE plpgsql
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
