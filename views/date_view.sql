CREATE OR REPLACE VIEW public.dateview
 AS
    SELECT datefact.dateid
        ,   datefact.fulldate
        ,   datefact.year
        ,   datefact.month
        ,   datefact.day   
        ,   EXTRACT( Quarter FROM fulldate ) as Quarter
        ,   to_char(datefact.fulldate::timestamp with time zone, 'Month'::text) AS MonthName
        ,   EXTRACT( DOW FROM fulldate ) as DOW
        ,   to_char(datefact.fulldate::timestamp with time zone, 'Day'::text) AS Weekday   
    FROM datefact;

ALTER TABLE public.dateview
    OWNER TO postgres;
