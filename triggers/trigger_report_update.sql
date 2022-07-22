CREATE TRIGGER report_update_details
    AFTER INSERT
    ON rental
    FOR EACH STATEMENT
    EXECUTE PROCEDURE log_rental_to_reports_detail();
