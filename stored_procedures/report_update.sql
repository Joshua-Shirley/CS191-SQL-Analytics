CREATE OR REPLACE PROCEDURE public.report_update(
	)
LANGUAGE 'plpgsql'
AS $BODY$
DECLARE              
BEGIN

    CALL report_rental_detail_extract();
    
    CALL update_summary_table();

END
$BODY$

ALTER PROCEDURE public.report_update()
    OWNER TO postgres;
