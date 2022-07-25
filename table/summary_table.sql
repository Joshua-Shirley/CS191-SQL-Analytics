CREATE TABLE IF NOT EXISTS public.report_pivot_days_hours
(
    store_city character varying(50) COLLATE pg_catalog."default",
    day text COLLATE pg_catalog."default",
    "10 AM" numeric,
    "11 AM" numeric,
    "12 PM" numeric,
    "1 PM" numeric,
    "2 PM" numeric,
    "3 PM" numeric,
    "4 PM" numeric,
    "5 PM" numeric,
    "6 PM" numeric,
    "7 PM" numeric,
    "8 PM" numeric,
    "9 PM" numeric,
    "10 PM" numeric,
    "11 PM" numeric,
    "12 AM" numeric,
    closed numeric
)

ALTER TABLE IF EXISTS public.report_pivot_days_hours
    OWNER to postgres;
