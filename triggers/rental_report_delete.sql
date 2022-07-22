CREATE FUNCTION rental_report_delete()
    RETURNS TRIGGER
    LANGUAGE PLPGSQL
AS $BODY$
BEGIN

    DELETE FROM report_rental_detail
    WHERE rental_id = OLD.rental_id;

END;
$BODY$;

CREATE TRIGGER rental_report_delete
    AFTER DELETE
    ON rental
    FOR EACH STATEMENT
    EXECUTE PROCEDURE rental_report_delete();
