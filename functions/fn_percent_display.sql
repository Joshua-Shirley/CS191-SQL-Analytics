DROP FUNCTION fn_percent_display;

CREATE OR REPLACE FUNCTION public.fn_percent_display(
    Dividend BIGINT
,   Divisor BIGINT
)
    RETURNS numeric(5,2)
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
AS $BODY$
DECLARE 
    perc numeric(5,2);
BEGIN
  
    --(A::NUMERIC / total)*100::NUMERIC(5,2)

    SELECT (( Dividend::NUMERIC / DIVISOR ) * 100)::NUMERIC(5,2) INTO perc;
    
    RETURN perc;
END;
$BODY$;

ALTER FUNCTION public.fn_percent_display(BIGINT,BIGINT)
    OWNER TO postgres;
