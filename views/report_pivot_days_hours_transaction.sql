CREATE OR REPLACE VIEW public.report_pivot_days_hours_transaction
 AS
 SELECT report_rental_detail_view.store_id,
    report_rental_detail_view.rent_week_day,
    count(*) FILTER (WHERE report_rental_detail_view.hour = ANY (ARRAY[0, 1, 2, 3, 4, 5, 6, 7, 8, 9])) AS closed_hours,
    count(*) FILTER (WHERE report_rental_detail_view.hour = ANY (ARRAY[10, 11, 12])) AS morning,
    count(*) FILTER (WHERE report_rental_detail_view.hour = ANY (ARRAY[13, 14, 15, 16, 17])) AS afternoon,
    count(*) FILTER (WHERE report_rental_detail_view.hour = ANY (ARRAY[18, 19, 20, 21, 22, 23])) AS evening
   FROM report_rental_detail_view
  GROUP BY report_rental_detail_view.store_id, report_rental_detail_view.rent_dow, report_rental_detail_view.rent_week_day
  ORDER BY report_rental_detail_view.store_id, report_rental_detail_view.rent_dow;

ALTER TABLE public.report_pivot_days_hours_transaction
    OWNER TO postgres;
