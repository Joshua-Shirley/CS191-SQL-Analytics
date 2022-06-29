CREATE OR REPLACE VIEW public.dateview
 AS
 SELECT datefact.dateid,
    datefact.fulldate,
    datefact.year,
    datefact.month,
    datefact.day,
    to_char(datefact.fulldate::timestamp with time zone, 'Q'::text) AS quarter,
    to_char(datefact.fulldate::timestamp with time zone, 'Month'::text) AS monthname,
    to_char(datefact.fulldate::timestamp with time zone, 'Day'::text) AS weekday
   FROM datefact;

ALTER TABLE public.dateview
    OWNER TO postgres;
