# D191 - Advanced Data Management

https://github.com/Joshua-Shirley/CS191-SQL-Analytics

## Performance Assessment: Advanced Data Management

### A. Business Report To Generate - Percentage of Sales Pivot Table

DVDRental is a new business, and they are understaffed. The managers would like to hire employees but are unsure how many employees they should hire and when to schedule them. I have created a report named report_pivot_days_hours_percentage as a view. The pivot table report helps solve the store managers’ when-to-schedule problem.
The pivot report breaks down the percentage of daily business into hours. Each store manager can use the historical data for daily and hourly schedules.
Many business reports are often visualized within date ranges.  


Here is an example of that report:

| store_city 	| Day       	| 10:00 AM 	| 11:00 AM 	| 12:00 PM 	| 1:00 PM 	| 2:00 PM 	| 3:00 PM 	| 4:00 PM 	| 5:00 PM 	| 6:00 PM 	| 7:00 PM 	| 8:00 PM 	| 9:00 PM 	| 10:00 PM 	| 11:00 PM 	| 12:00 AM 	|
|------------	|-----------	|----------	|----------	|----------	|---------	|---------	|---------	|---------	|---------	|---------	|---------	|---------	|---------	|----------	|----------	|----------	|
| Lethbridge 	| Total     	| 443      	| 145      	| 79       	| 97      	| 86      	| 89      	| 217     	| 949     	| 1507    	| 1197    	| 1150    	| 1001    	| 645      	| 398      	| 69       	|
| Lethbridge 	| Sunday    	| 4.95     	| 2.05     	| 1.28     	| 1.02    	| 1.11    	| 1.62    	| 2.73    	| 11.09   	| 18.86   	| 15.44   	| 13.23   	| 12.37   	| 8.45     	| 4.69     	| 1.11     	|
| Lethbridge 	| Monday    	| 4.12     	| 1.84     	| 0.7      	| 1.31    	| 1.4     	| 1.23    	| 3.06    	| 12.61   	| 17.6    	| 14.27   	| 15.85   	| 11.38   	| 8.41     	| 5.25     	| 0.96     	|
| Lethbridge 	| Tuesday   	| 6.23     	| 1.68     	| 1.36     	| 0.8     	| 0.8     	| 0.72    	| 2.47    	| 10.85   	| 19.87   	| 14.29   	| 15.4    	| 11.65   	| 7.74     	| 5.75     	| 0.4      	|
| Lethbridge 	| Wednesday 	| 6.61     	| 1.93     	| 0.64     	| 1.56    	| 1.1     	| 0.46    	| 2.02    	| 10.09   	| 20      	| 14.86   	| 11.93   	| 12.39   	| 10.28    	| 5.23     	| 0.92     	|
| Lethbridge 	| Thursday  	| 5.96     	| 1.47     	| 1.28     	| 1.38    	| 1.19    	| 1.38    	| 2.94    	| 13.49   	| 18.44   	| 13.03   	| 13.76   	| 12.66   	| 7.98     	| 4.31     	| 0.73     	|
| Lethbridge 	| Friday    	| 5.13     	| 1.91     	| 0.61     	| 1.74    	| 0.78    	| 1.04    	| 2.44    	| 11.23   	| 18.19   	| 15.4    	| 15.14   	| 13.4    	| 6.7      	| 4.96     	| 1.31     	|
| Lethbridge 	| Saturday  	| 5.44     	| 1.7      	| 0.94     	| 0.68    	| 1.11    	| 1.28    	| 3.15    	| 13.01   	| 17.69   	| 16.41   	| 14.2    	| 13.01   	| 6.55     	| 4.25     	| 0.6      	|
| Woodridge  	| Total     	| 467      	| 163      	| 94       	| 82      	| 76      	| 96      	| 264     	| 933     	| 1471    	| 1305    	| 1184    	| 977     	| 662      	| 433      	| 65       	|
| Woodridge  	| Sunday    	| 4.73     	| 2.53     	| 0.84     	| 1.27    	| 1.77    	| 0.84    	| 2.53    	| 11.49   	| 16.89   	| 15.37   	| 14.44   	| 12.08   	| 8.19     	| 6.33     	| 0.68     	|
| Woodridge  	| Monday    	| 5.61     	| 2.19     	| 0.96     	| 1.05    	| 0.88    	| 1.32    	| 3.16    	| 11.84   	| 16.67   	| 14.91   	| 13.42   	| 12.46   	| 8.33     	| 6.32     	| 0.88     	|
| Woodridge  	| Tuesday   	| 6.08     	| 1.18     	| 1.5      	| 1.34    	| 1.11    	| 1.74    	| 3.48    	| 10.51   	| 16.82   	| 16.51   	| 13.98   	| 12.24   	| 6.87     	| 5.53     	| 1.11     	|
| Woodridge  	| Wednesday 	| 6.32     	| 2.28     	| 1.26     	| 0.93    	| 0.51    	| 1.01    	| 2.87    	| 11.38   	| 17.03   	| 14.59   	| 14.84   	| 13.41   	| 7.76     	| 4.89     	| 0.93     	|
| Woodridge  	| Thursday  	| 5.56     	| 1.88     	| 1.37     	| 0.94    	| 1.03    	| 1.54    	| 2.65    	| 10.51   	| 20.17   	| 15.81   	| 14.02   	| 10.94   	| 8.8      	| 4.19     	| 0.6      	|
| Woodridge  	| Friday    	| 5.8      	| 1.73     	| 0.87     	| 0.61    	| 0.52    	| 0.69    	| 3.98    	| 12.21   	| 19.31   	| 15.24   	| 15.5    	| 10.3    	| 7.97     	| 4.68     	| 0.61     	|
| Woodridge  	| Saturday  	| 5.38     	| 2.05     	| 1.11     	| 0.77    	| 0.6     	| 0.94    	| 3.67    	| 11.1    	| 17.68   	| 17.93   	| 14.01   	| 11.19   	| 8.2      	| 4.7      	| 0.68     	|


#### A1. Describe the data used for the report.

The report requires data from these tables.   
* Rental
* Inventory
* Film
* Category
* Store
* Address

#### A2. New Tables - details & summary

I have added 3 new tables to the database.
New Tables: 
* datefact
* timefact
* report_rental_detail
New Views: 
* report_rental_detail_view
* report_pivot_days_hours_percentage
* date_view

I wanted to test date and time normalization with this class project. Specifically, I wanted to experiment with storing dates, times, and date extractions in a normalized table. 

#### A3. Specific fields in the detailed and summary sections

The detailed section is comprised of two objects: table - report_rental_detail, view - report_rental_detail_view.
The summary section is the view report_pivot_days_hours_percentage.

<table border="0" bgcolor="white" style="border-color: white;">
<tr>
<td border="0" bordercolor="white" valign="top" style="vertical-align: top; border-color: white;">
    
    
| Report_Rental_Detail 	|           	|
|----------------------	|-----------	|
| Name                 	| Data Type 	|
| rental_id            	| INTEGER   	|
| rental_date_id       	| INTEGER   	|
| rental_time_id       	| INTEGER   	|
| return_date_id       	| INTEGER   	|
| return_time_id       	| INTEGER   	|
| customer_id          	| INTEGER   	|
| staff_id             	| INTEGER   	|
| store_id             	| INTEGER   	|
| inventory_id         	| INTEGER   	|
| category_id          	| INTEGER   	|
| film_id              	| INTEGER   	|

    
</td>
<td border="0" bordercolor="white" valign="top" style="vertical-align: top; border-color: white;">
    
    
| Report_Rental_Detail_View 	|           	|
|---------------------------	|-----------	|
| Name                      	| Type      	|
| rental_id                 	| INTEGER   	|
| rental_date_timestamp     	| TIMESTAMP 	|
| rental_date               	| DATE      	|
| rent_year                 	| SMALLINT  	|
| rent_month                	| SMALLINT  	|
| rent_day                  	| SMALLINT  	|
| rent_month_name           	| SMALLINT  	|
| rent_dow                  	| SMALLINT  	|
| rent_week_day             	| TEXT      	|
| rent_time                 	| TIMESTAMP 	|
| hour                      	| SMALLINT  	|
| minute                    	| SMALLINT  	|
| return_date_id            	| INTEGER   	|
| customer_id               	| INTEGER   	|
| staff_id                  	| INTEGER   	|
| store_id                  	| INTEGER   	|
| inventory_id              	| INTEGER   	|
| category_id               	| INTEGER   	|
| category                  	| TEXT      	|
| city                      	| TEXT      	|

    
</td>
<td border="0"  bordercolor="white"  valign="top" style="vertical-align: top; border-color: white;">
    
| Pivot_Days_Hours 	|              	|
|------------------	|--------------	|
| Name             	| Data Type    	|
| store_city       	| TEXT         	|
| day              	| TEXT         	|
| 10 AM            	| numeric(5,2) 	|
| 11 AM            	| numeric(5,2) 	|
| 12 PM            	| numeric(5,2) 	|
| 1 PM             	| numeric(5,2) 	|
| 2 PM             	| numeric(5,2) 	|
| 3 PM             	| numeric(5,2) 	|
| 4 PM             	| numeric(5,2) 	|
| 5 PM             	| numeric(5,2) 	|
| 6 PM             	| numeric(5,2) 	|
| 7 PM             	| numeric(5,2) 	|
| 8 PM             	| numeric(5,2) 	|
| 9 PM             	| numeric(5,2) 	|
| 10 PM            	| numeric(5,2) 	|
| 11 PM            	| numeric(5,2) 	|
| 12 AM            	| numeric(5,2) 	|
| Closed Hours     	| numeric(5,2) 	|
  
</td>
</tr>
<tr>
<td border="0"  bordercolor="white"  valign="top" style="vertical-align: top; border-color: white;">
    
| DateFact 	|          	|
|----------	|----------	|
| Name     	| Type  	|
| DateId   	| INTEGER  	|
| fulldate 	| Date     	|
| year     	| SMALLINT 	|
| month    	| SMALLINT 	|
| day      	| SMALLINT 	|
    
</td>
<td border="0"  bordercolor="white"  valign="top" style="vertical-align: top; border-color: white;">
    
| Date_View  	|          	|
|-----------	|----------	|
| Name      	| Type     	|
| dateid    	| integer  	|
| fulldate  	| date     	|
| year      	| SMALLINT 	|
| month     	| SMALLINT 	|
| day       	| SMALLINT 	|
| quarter   	| SMALLINT 	|
| monthname 	| TEXT     	|
| dow       	| SMALLINT 	|
| weekday   	| TEXT     	|    
    
</td>
<td border="0"  bordercolor="white"  valign="top" style="vertical-align: top; border-color: white;">

| TimeFact 	|          	|
|----------	|----------	|
| Name     	| Type 	    |
| timeId   	| INTEGER  	|
| hour     	| SMALLINT 	|
| minute   	| SMALLINT 	|
| second   	| SMALLINT 	|
    
</td>
</tr>
    
</table>
     

#### A4. Data Transformations - custom functions

For the pivot table hourly data we use a function to divide integers and output a numeric(5,2) data type.  
The data is transformed to help the viewer to easily read the percentages.

    CREATE OR REPLACE FUNCTION public.fn_percent_display(
      dividend bigint,
      divisor bigint)
        RETURNS numeric
        LANGUAGE 'plpgsql'
        COST 100
        VOLATILE PARALLEL UNSAFE
    AS $BODY$
    DECLARE 
        perc numeric(5,2);
    BEGIN  
        --(A::NUMERIC / total)*100::NUMERIC(5,2)
        SELECT (( Dividend::NUMERIC / DIVISOR ) * 100)::NUMERIC(5,2) INTO perc;    
        RETURN perc;
    END;
    $BODY$;
    
I find that whenever possible using table data to create the customizations typically provides faster query executions.
SQL very efficiently combines and filters table data.  My experience with larger data sets functions should be minimized with large queries.  User defined functions become useful once the query has summarized data into small sets.

Many of the business reports that I have created in the past often times use dates that need to be transformed into month names, day names, and quarters.  With a date table and date view those transformations take place on smaller sets of data and are joined to the larger set.  

** Rental Table example: **
160,000 rental_dates 
Date range 4 months ~ 120 days.
The report output "2005-05-15" transforming month to "May" and the day of the week to "Sunday".
Postgres EXTRACT functions are fast but using some joined tables is more efficient.
    
#### A5. Business uses of the detailed and summary sections.

The main business use for the summary report is to view transactions per hour each day.
The report can be used to determine when each store needs more or less staff.

The (Report_Rental_Detail_View) detailed report provides broader information and can be used to create many variations of the summary report.
I have found through experience that managers almost always ask for a few variations of the summary report.  I like to add relevant complimentary data into the detailed table report so I can quickly make changes to the summary report or reports.

While working on this project I wrote 4 different summary reports from the detail table.

#### A6. Refresh frequency - What is relevant to stakeholders.

The Report_Pivot_Days_Hours_Percentage report is available on demand.  The summary report should be available to the stakeholders on a weekly basis.  The managers can schedule employees on a weekly basis.   

The data is refreshed through data triggers on the rental table.  The detailed report is updated after each statement insert/update/delete action on the rental table.  I choose "for each statement" triggers to allow for fast transactions in the case of mase data imports.  I tested the insert trigger with stored procedure that allows rental inserts thousands per transaction.  

### B. SQL Code Tables to hold reports

Report_Rental_Detail Table

        CREATE TABLE report_rental_detail (
                rental_id INTEGER PRIMARY KEY
            ,   rental_date_id INTEGER
            ,   rental_time_id INTEGER
            ,   return_date_id INTEGER
            ,   return_time_id INTEGER
            ,   customer_id INTEGER        
            ,   staff_id INTEGER
            ,   store_id INTEGER        
            ,   inventory_id INTEGER
            ,   category_id INTEGER         
            ,   film_id INTEGER 
        );

        ALTER TABLE IF EXISTS public.report_rental_detail
            OWNER to postgres;

        CREATE INDEX rental_id ON report_rental_detail(rental_id asc);

DateFact Table

        CREATE TABLE datefact ( 
            dateid SERIAL PRIMARY KEY,
            fullDate date NOT NULL,
            year smallint NOT NULL,
            month smallint NOT NULL,
            day smallint NOT NULL 
        );

        ALTER TABLE IF EXISTS public.datefact
            OWNER to postgres;

        CREATE INDEX dates ON datefact(fulldate asc);
 
Date_View View

        CREATE OR REPLACE VIEW public.date_view
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

        ALTER TABLE public.date_view
            OWNER TO postgres;

TimeFact Table

        CREATE TABLE timefact(
            TimeID SERIAL PRIMARY KEY,	
            Hour SMALLINT NULL,
            Minute SMALLINT NULL,
            Second SMALLINT NULL
        );

        ALTER TABLE IF EXISTS public.timeFact
            OWNER to postgres;

Report_Rental_Detail_View View

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
            category.name AS category,
            city.city
           FROM report_rental_detail
             LEFT JOIN date_view d1 ON report_rental_detail.rental_date_id = d1.dateid
             LEFT JOIN timefact t1 ON report_rental_detail.rental_time_id = t1.timeid
             LEFT JOIN category ON report_rental_detail.category_id = category.category_id
             LEFT JOIN store ON report_rental_detail.store_id = store.store_id
             LEFT JOIN address ON store.address_id = address.address_id
             LEFT JOIN city ON address.city_id = city.city_id;

        ALTER TABLE public.report_rental_detail_view
            OWNER TO postgres;


### C. SQL Extract and Validation

The initial extraction can be called with the report_rental_detail_extract() stored procedure.  
Any insert, update, or delete within the rental table would also update the detail report.

    CREATE OR REPLACE PROCEDURE public.report_rental_detail_extract()
    LANGUAGE 'plpgsql'
    AS $BODY$
    DECLARE              
    BEGIN

        INSERT INTO report_rental_detail
        ( rental_id,  inventory_id, rental_date_id , rental_time_id, return_date_id, return_time_id , customer_id , staff_id, store_id , category_id, film_id )
        SELECT      
                rental_id
            ,   rental.inventory_id               
            ,   d1.dateid as rental_date_id
            ,   t1.timeid as rental_time_id            
            ,   d2.dateid as return_date_id
            ,   t2.timeid as return_time_id
            ,   customer_id
            ,   staff_id
            ,   store_id
            ,   film_category.category_id
            ,   film.film_id 
            FROM rental
            LEFT JOIN inventory
            ON rental.inventory_id = inventory.inventory_id
            LEFT JOIN film
            ON inventory.film_id = film.film_id
            LEFT JOIN film_category
            ON film.film_id = film_category.film_id
            LEFT JOIN category
            ON film_category.category_id = category.category_id
            LEFT JOIN datefact d1
            ON d1.fulldate = rental.rental_date::date
            LEFT JOIN datefact d2
            ON d2.fulldate = rental.return_date::date
            LEFT JOIN timefact t1
            ON t1.hour = EXTRACT( HOUR FROM rental.rental_date)
            AND t1.minute = EXTRACT( MINUTE FROM rental.rental_date)
            LEFT JOIN timefact t2
            ON t2.hour = EXTRACT( HOUR FROM rental.return_date)
            AND t2.minute = EXTRACT( MINUTE FROM rental.return_date)
            WHERE rental_id NOT IN (
                SELECT rental_id 
                FROM report_rental_detail
            )
            order by rental_date;        
    END;
    $BODY$;

    ALTER PROCEDURE public.report_rental_detail_extract()
        OWNER TO postgres;


### D. Data Transformation

Fn_percent_display is used in the summary tables to alter decimals into the more readable percentage values.  This could easily be performed on each row within the query but it makes the select query more readable and reduces code.

        CREATE OR REPLACE FUNCTION public.fn_percent_display(
            Dividend BIGINT
        ,   Divisor BIGINT
        )
            RETURNS numeric(5,2)
            LANGUAGE 'plpgsql'       
        AS $BODY$
        DECLARE 
            perc numeric(5,2);
        BEGIN        
            SELECT (( Dividend::NUMERIC / DIVISOR ) * 100)::NUMERIC(5,2) INTO perc;
            RETURN perc;
        END;
        $BODY$;

        ALTER FUNCTION public.fn_percent_display(BIGINT,BIGINT)
            OWNER TO postgres;

There are some more functions I wrote for the datefact table.  There is a stored procedure that updates the date range within the datefact table.  In order to only insert actual dates I needed to create a couple functions that confirm real dates.  Firstly, each month has a set number of days. Fn_days_in_month returns the number of days for a month in a given year.  The function needs to also check if a year is a leap year or not. 

Days In Month Function

        CREATE OR REPLACE FUNCTION public.fn_days_in_month(
            year integer,
            month integer)
            RETURNS integer
            LANGUAGE 'plpgsql'          
        AS $BODY$
        DECLARE 
            Days INT;
        BEGIN

            IF ( month IN (1,3,5,7,8,10,12) ) THEN
                Days := 31;   
            ELSEIF ( month IN (4,6,9,11) ) THEN
                Days := 30;
            ELSE
                IF fn_is_leap_year(year) = TRUE THEN
                    Days := 29;
                ELSE
                    Days := 28;
                END IF;
            END IF;

            RETURN Days;
        END;
        $BODY$;

        ALTER FUNCTION public.fn_days_in_month(integer, integer)
            OWNER TO postgres;
            
Is Leap Year Function

        CREATE OR REPLACE FUNCTION public.fn_is_leap_year(
            year integer)
            RETURNS boolean
            LANGUAGE 'plpgsql'            
        AS $BODY$
        DECLARE 
            TF BOOLEAN;
        BEGIN

            IF (Year % 4 = 0 AND Year % 100 <> 0) OR (Year % 400 = 0) THEN
                TF := TRUE;
            ELSE
                TF := FALSE;
            END IF;

            RETURN TF;
        END;
        $BODY$;

        ALTER FUNCTION public.fn_is_leap_yea(integer)
            OWNER TO postgres;

Fn Date From Parts
This function uses integers to create a date. 

        CREATE OR REPLACE FUNCTION public.fn_date_from_parts(
            year integer,
            month integer,
            day integer)
            RETURNS date
            LANGUAGE 'plpgsql'            
        AS $BODY$
        DECLARE 
            D DATE;
            Y INT;
            M INT;
            A INT;
        BEGIN

            Y := Year::TEXT;
            M := RIGHT( ('00' || Month::TEXT) , 2);
            A := RIGHT( ('00' || Day::TEXT) , 2);

            SELECT TO_DATE( (Y || '-' || M || '-' || A) , 'YYYY-MM-DD' ) INTO D;

            RETURN D;
        END;
        $BODY$;

        ALTER FUNCTION public.fn_date_from_parts(integer, integer, integer)
            OWNER TO postgres;

### E. SQL Triggers

Rental Table - Insert Trigger Function and Trigger

        CREATE OR REPLACE FUNCTION public.log_rental_to_reports_detail()
            RETURNS trigger
            LANGUAGE 'plpgsql'       
        AS $BODY$
        BEGIN  

                INSERT INTO report_rental_detail        
                SELECT rental_id
                    , rental.inventory_id
                    , film.film_id            
                    , d1.dateid as rental_date_id
                    , t1.timeid as rental_time_id            
                    , d2.dateid as return_date_id
                    , t2.timeid as return_time_id
                    , film_category.category_id
                    , store_id
                FROM rental
                LEFT JOIN inventory
                ON rental.inventory_id = inventory.inventory_id
                LEFT JOIN film
                ON inventory.film_id = film.film_id
                LEFT JOIN film_category
                ON film.film_id = film_category.film_id
                LEFT JOIN category
                ON film_category.category_id = category.category_id
                LEFT JOIN datefact d1
                ON d1.fulldate = rental.rental_date::date
                LEFT JOIN datefact d2
                ON d2.fulldate = rental.return_date::date
                LEFT JOIN timefact t1
                ON t1.hour = EXTRACT( HOUR FROM rental.rental_date)
                AND t1.minute = EXTRACT( MINUTE FROM rental.rental_date)
                LEFT JOIN timefact t2
                ON t2.hour = EXTRACT( HOUR FROM rental.return_date)
                AND t2.minute = EXTRACT( MINUTE FROM rental.return_date)
                WHERE rental_id NOT IN (
                    SELECT rental_id FROM report_rental_detail   
                )
                order by rental_date;

            return new;
        END;
        $BODY$;

        CREATE TRIGGER report_update_details
            AFTER INSERT
            ON rental
            FOR EACH STATEMENT
            EXECUTE PROCEDURE log_rental_to_reports_detail();
        ALTER FUNCTION public.log_rental_to_reports_detail()
            OWNER TO postgres;

Rental Table - Delete Function Trigger and Trigger

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
            FOR EACH ROW
            EXECUTE PROCEDURE rental_report_delete();

### F. Stored Procedure - Refresh detailed and summary tables.

#### F1. Explain how the stored procedure can run on a schedule.
