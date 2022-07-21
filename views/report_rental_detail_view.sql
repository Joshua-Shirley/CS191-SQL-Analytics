CREATE OR REPLACE VIEW public.report_rental_detail_view
 AS
 SELECT report_rental_detail.rental_id,
    d1.fulldate + t1.hour::double precision * '01:00:00'::interval + t1.minute::double precision * '00:01:00'::interval AS rental_date_timestamp,
    d1.fulldate AS rental_date,
    d1.year AS rent_year,
    d1.month AS rent_month,
    d1.day AS rent_day,
    d1.monthname AS rent_month_name,
    d1.dow AS rent_dow,
    d1.weekday AS rent_week_day,
    t1.hour::double precision * '01:00:00'::interval + t1.minute::double precision * '00:01:00'::interval AS rent_time,
    t1.hour,
    t1.minute,
    report_rental_detail.return_date_id,
    report_rental_detail.customer_id,
    report_rental_detail.staff_id,
    report_rental_detail.store_id,
    report_rental_detail.inventory_id,
    report_rental_detail.category_id,
    category.name AS category
   FROM report_rental_detail
     LEFT JOIN date_view d1 ON report_rental_detail.rental_date_id = d1.dateid
     LEFT JOIN timefact t1 ON report_rental_detail.rental_time_id = t1.timeid
     LEFT JOIN category ON report_rental_detail.category_id = category.category_id;

ALTER TABLE public.report_rental_detail_view
    OWNER TO postgres;
