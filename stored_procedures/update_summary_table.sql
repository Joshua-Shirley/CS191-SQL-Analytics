CREATE OR REPLACE PROCEDURE public.update_summary_table()
LANGUAGE 'plpgsql'
AS $BODY$
BEGIN  
    
    TRUNCATE TABLE report_pivot_days_hours;

     WITH cte AS (
             SELECT report_rental_detail_view.city,
                report_rental_detail_view.rent_dow,
                report_rental_detail_view.rent_week_day,
                count(*) AS total,
                count(*) FILTER (WHERE report_rental_detail_view.hour = ANY (ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9])) AS closed_hours,
                count(*) FILTER (WHERE report_rental_detail_view.hour = 10) AS h10,
                count(*) FILTER (WHERE report_rental_detail_view.hour = 11) AS h11,
                count(*) FILTER (WHERE report_rental_detail_view.hour = 12) AS h12,
                count(*) FILTER (WHERE report_rental_detail_view.hour = 13) AS h13,
                count(*) FILTER (WHERE report_rental_detail_view.hour = 14) AS h14,
                count(*) FILTER (WHERE report_rental_detail_view.hour = 15) AS h15,
                count(*) FILTER (WHERE report_rental_detail_view.hour = 16) AS h16,
                count(*) FILTER (WHERE report_rental_detail_view.hour = 17) AS h17,
                count(*) FILTER (WHERE report_rental_detail_view.hour = 18) AS h18,
                count(*) FILTER (WHERE report_rental_detail_view.hour = 19) AS h19,
                count(*) FILTER (WHERE report_rental_detail_view.hour = 20) AS h20,
                count(*) FILTER (WHERE report_rental_detail_view.hour = 21) AS h21,
                count(*) FILTER (WHERE report_rental_detail_view.hour = 22) AS h22,
                count(*) FILTER (WHERE report_rental_detail_view.hour = 23) AS h23,
                count(*) FILTER (WHERE report_rental_detail_view.hour = 0) AS h0
               FROM report_rental_detail_view
              GROUP BY report_rental_detail_view.city, report_rental_detail_view.rent_dow, report_rental_detail_view.rent_week_day
            ), cte_display AS (
             SELECT report_rental_detail_view.city,
                '-1'::integer AS rent_dow,
                'Total'::text AS day,
                count(*) FILTER (WHERE report_rental_detail_view.hour = ANY (ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9])) AS closed,
                count(*) FILTER (WHERE report_rental_detail_view.hour = 10) AS h10,
                count(*) FILTER (WHERE report_rental_detail_view.hour = 11) AS h11,
                count(*) FILTER (WHERE report_rental_detail_view.hour = 12) AS h12,
                count(*) FILTER (WHERE report_rental_detail_view.hour = 13) AS h13,
                count(*) FILTER (WHERE report_rental_detail_view.hour = 14) AS h14,
                count(*) FILTER (WHERE report_rental_detail_view.hour = 15) AS h15,
                count(*) FILTER (WHERE report_rental_detail_view.hour = 16) AS h16,
                count(*) FILTER (WHERE report_rental_detail_view.hour = 17) AS h17,
                count(*) FILTER (WHERE report_rental_detail_view.hour = 18) AS h18,
                count(*) FILTER (WHERE report_rental_detail_view.hour = 19) AS h19,
                count(*) FILTER (WHERE report_rental_detail_view.hour = 20) AS h20,
                count(*) FILTER (WHERE report_rental_detail_view.hour = 21) AS h21,
                count(*) FILTER (WHERE report_rental_detail_view.hour = 22) AS h22,
                count(*) FILTER (WHERE report_rental_detail_view.hour = 23) AS h23,
                count(*) FILTER (WHERE report_rental_detail_view.hour = 0) AS h0
               FROM report_rental_detail_view
              GROUP BY report_rental_detail_view.city
            UNION ALL
             SELECT cte.city,
                cte.rent_dow,
                cte.rent_week_day AS day,
                fn_percent_display(cte.closed_hours, cte.total) AS closed,
                fn_percent_display(cte.h10, cte.total) AS fn_percent_display,
                fn_percent_display(cte.h11, cte.total) AS fn_percent_display,
                fn_percent_display(cte.h12, cte.total) AS fn_percent_display,
                fn_percent_display(cte.h13, cte.total) AS fn_percent_display,
                fn_percent_display(cte.h14, cte.total) AS fn_percent_display,
                fn_percent_display(cte.h15, cte.total) AS fn_percent_display,
                fn_percent_display(cte.h16, cte.total) AS fn_percent_display,
                fn_percent_display(cte.h17, cte.total) AS fn_percent_display,
                fn_percent_display(cte.h18, cte.total) AS fn_percent_display,
                fn_percent_display(cte.h19, cte.total) AS fn_percent_display,
                fn_percent_display(cte.h20, cte.total) AS fn_percent_display,
                fn_percent_display(cte.h21, cte.total) AS fn_percent_display,
                fn_percent_display(cte.h22, cte.total) AS fn_percent_display,
                fn_percent_display(cte.h23, cte.total) AS fn_percent_display,
                fn_percent_display(cte.h0, cte.total) AS fn_percent_display
               FROM cte
            )        

    INSERT INTO report_pivot_days_hours
    ( store_city, day , "10 AM" , "11 AM" , "12 PM" , "1 PM" , "2 PM" , "3 PM", "4 PM", "5 PM", "6 PM", "7 PM", "8 PM", "9 PM", "10 PM", "11 PM", "12 AM", closed )

    SELECT cte_display.city AS store_city,
        cte_display.day,
        cte_display.h10 AS "10 AM",
        cte_display.h11 AS "11 AM",
        cte_display.h12 AS "12 PM",
        cte_display.h13 AS "1 PM",
        cte_display.h14 AS "2 PM",
        cte_display.h15 AS "3 PM",
        cte_display.h16 AS "4 PM",
        cte_display.h17 AS "5 PM",
        cte_display.h18 AS "6 PM",
        cte_display.h19 AS "7 PM",
        cte_display.h20 AS "8 PM",
        cte_display.h21 AS "9 PM",
        cte_display.h22 AS "10 PM",
        cte_display.h23 AS "11 PM",
        cte_display.h0 AS "12 AM",
        cte_display.closed   
    FROM cte_display
    ORDER BY cte_display.city, cte_display.rent_dow;

END;
$BODY$;

