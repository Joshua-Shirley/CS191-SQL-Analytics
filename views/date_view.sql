CREATE OR REPLACE VIEW public.date_view
 AS
 SELECT datefact.dateid,
    datefact.fulldate,
    datefact.year,
    datefact.month,
    datefact.day,    
    EXTRACT( Quarter FROM fulldate ) as Quarter,
    to_char(datefact.fulldate::timestamp with time zone, 'Month'::text) AS MonthName,    
    EXTRACT( DOW FROM fulldate ) as DOW,
    to_char(datefact.fulldate::timestamp with time zone, 'Weekday'::text) AS Weekday
    
   FROM datefact;

ALTER TABLE public.date_view
    OWNER TO postgres;
