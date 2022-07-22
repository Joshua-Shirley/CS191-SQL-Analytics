# D191 - Advanced Data Management

## Performance Assessment: Advanced Data Management

### A. Business Report To Generate - Percentage of Sales Pivot Table

As I looked through the database data I noticed that the dvd rental operates two stores with two employees.
They will be looking to hire more staff quickly.  The managers need to know when to schedule employees based on customer needs.
The managers will schedule the workers on a weekly basis.
This report helps them determine staffing needs.

Here is an example of that report:

| Store      	| Day       	| 10:00 AM 	| 11:00 AM 	| 12:00 PM 	| 1:00 PM 	| 2:00 PM 	| 3:00 PM 	| 4:00 PM 	| 5:00 PM 	| 6:00 PM 	| 7:00 PM 	| 8:00 PM 	| 9:00 PM 	| 10:00 PM 	| 11:00 PM 	| 12:00 AM 	| Closed 	|
|------------	|-----------	|----------	|----------	|----------	|---------	|---------	|---------	|---------	|---------	|---------	|---------	|---------	|---------	|----------	|----------	|----------	|--------	|
| Lethbridge 	| Total     	| 344      	| 309      	| 310      	| 313     	| 333     	| 457     	| 349     	| 322     	| 364     	| 370     	| 338     	| 376     	| 287      	| 338      	| 342      	| 2920   	|
| Lethbridge 	| Sunday    	| 3.84     	| 4.18     	| 4.44     	| 4.52    	| 5.55    	| 3.92    	| 3.58    	| 4.95    	| 4.61    	| 5.29    	| 3.92    	| 4.27    	| 3.24     	| 3.75     	| 3.33     	| 36.6   	|
| Lethbridge 	| Monday    	| 3.59     	| 4.82     	| 3.77     	| 3.42    	| 3.5     	| 4.55    	| 4.12    	| 4.29    	| 3.33    	| 5.43    	| 4.47    	| 5.08    	| 3.59     	| 4.47     	| 5.17     	| 36.43  	|
| Lethbridge 	| Tuesday   	| 3.19     	| 3.27     	| 2.79     	| 4.15    	| 3.75    	| 11.17   	| 4.47    	| 3.11    	| 4.95    	| 4.31    	| 4.87    	| 3.75    	| 3.11     	| 3.75     	| 4.79     	| 34.56  	|
| Lethbridge 	| Wednesday 	| 4.13     	| 4.13     	| 3.58     	| 3.85    	| 3.85    	| 4.77    	| 5.05    	| 3.94    	| 4.95    	| 3.3     	| 3.76    	| 6.06    	| 4.5      	| 3.94     	| 4.13     	| 36.06  	|
| Lethbridge 	| Thursday  	| 5.23     	| 3.12     	| 3.94     	| 3.49    	| 4.4     	| 4.77    	| 3.76    	| 4.68    	| 3.76    	| 4.77    	| 4.4     	| 4.04    	| 3.39     	| 4.95     	| 3.58     	| 37.71  	|
| Lethbridge 	| Friday    	| 5.48     	| 4.35     	| 3.83     	| 3.92    	| 3.66    	| 3.92    	| 4.7     	| 2.96    	| 4.53    	| 5.13    	| 3.92    	| 4.87    	| 4.09     	| 4.18     	| 4.44     	| 36.03  	|
| Lethbridge 	| Saturday  	| 4.51     	| 2.98     	| 4.59     	| 3.74    	| 4.17    	| 5.95    	| 4.59    	| 4.08    	| 5.36    	| 3.83    	| 3.91    	| 4.68    	| 3.06     	| 4.34     	| 4.17     	| 36.05  	|
| Woodridge  	| Total     	| 341      	| 359      	| 327      	| 335     	| 324     	| 433     	| 330     	| 349     	| 370     	| 354     	| 365     	| 338     	| 341      	| 317      	| 355      	| 3034   	|
| Woodridge  	| Sunday    	| 4.14     	| 4.81     	| 2.96     	| 3.97    	| 3.38    	| 4.56    	| 4.65    	| 4.14    	| 4.48    	| 4.22    	| 5.66    	| 3.38    	| 3.46     	| 4.05     	| 3.97     	| 38.18  	|
| Woodridge  	| Monday    	| 4.82     	| 4.3      	| 5.26     	| 3.77    	| 3.25    	| 4.39    	| 3.25    	| 3.42    	| 5.35    	| 4.21    	| 3.51    	| 3.6     	| 4.65     	| 4.12     	| 3.95     	| 38.16  	|
| Woodridge  	| Tuesday   	| 3.24     	| 4.19     	| 3.95     	| 4.19    	| 3.87    	| 11.37   	| 3.71    	| 3.71    	| 3.87    	| 4.27    	| 3.24    	| 3.95    	| 3.79     	| 3.4      	| 4.66     	| 34.6   	|
| Woodridge  	| Wednesday 	| 4.47     	| 3.54     	| 4.72     	| 4.05    	| 3.63    	| 4.05    	| 4.97    	| 4.81    	| 4.64    	| 4.47    	| 4.97    	| 4.55    	| 4.3      	| 4.3      	| 5.06     	| 33.47  	|
| Woodridge  	| Thursday  	| 4.96     	| 4.44     	| 3.68     	| 4.27    	| 4.96    	| 3.76    	| 3.76    	| 4.7     	| 4.62    	| 4.27    	| 4.96    	| 4.79    	| 4.02     	| 3.42     	| 4.19     	| 35.21  	|
| Woodridge  	| Friday    	| 3.46     	| 5.11     	| 3.2      	| 4.24    	| 3.38    	| 3.98    	| 4.42    	| 4.33    	| 4.59    	| 4.16    	| 3.81    	| 3.98    	| 4.85     	| 3.55     	| 3.64     	| 39.31  	|
| Woodridge  	| Saturday  	| 3.84     	| 4.01     	| 3.93     	| 3.84    	| 4.95    	| 4.01    	| 3.16    	| 4.44    	| 3.84    	| 4.36    	| 4.78    	| 4.36    	| 3.84     	| 4.01     	| 4.53     	| 38.09  	|

#### A1. Describe the data used for the report.

The report will require data from multiple tables.  
Tables:  Rental, Inventory, Film, Category, Store, Address

#### A2. New Tables - details & summary

I have added 3 new tables to the database.
New Tables: datefact, timefact, report_rental_detail
New Views: report_rental_detail_view, report_pivot_days_hours_percentage

#### A3. Specific fields in the detailed and summary sections

The detailed section is comprised of two objects: table - report_rental_detail, view - report_rental_detail_view.
The summary section is the view report_pivot_days_hours_percentage.

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

| Report_Rental_Detail_View 	|           	|
|---------------------------	|-----------	|
| Name                      	| Data Type 	|
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

| Report_Pivot_Days_Hours_Percentage 	|              	|
|------------------------------------	|--------------	|
| Name                               	| Data Type    	|
| store_city                         	| TEXT         	|
| day                                	| TEXT         	|
| 10 AM                              	| numeric(5,2) 	|
| 11 AM                              	| numeric(5,2) 	|
| 12 PM                              	| numeric(5,2) 	|
| 1 PM                               	| numeric(5,2) 	|
| 2 PM                               	| numeric(5,2) 	|
| 3 PM                               	| numeric(5,2) 	|
| 4 PM                               	| numeric(5,2) 	|
| 5 PM                               	| numeric(5,2) 	|
| 6 PM                               	| numeric(5,2) 	|
| 7 PM                               	| numeric(5,2) 	|
| 8 PM                               	| numeric(5,2) 	|
| 9 PM                               	| numeric(5,2) 	|
| 10 PM                              	| numeric(5,2) 	|
| 11 PM                              	| numeric(5,2) 	|
| 12 AM                              	| numeric(5,2) 	|
| Closed Hours                       	| numeric(5,2) 	|

#### A4. Data Transformations - custom functions

  Rental dates and Payment dates are off by an average of 607 days.
  Either the data was input incorrectly or the video store didn't collect money for a long time, which probably resulted in the shuttering.

  ** Stored Proceedures **
  
  1. insertTime
  2. insertDate
  
  ** User Defined Functions **
  
  1. fn_isleapyear(int)
  2. fn_daysinmonth(year smallint, month smallint)

#### A5. Data Triggers - with continual update.
#### A6. Refresh frequency - What is relevant to stakeholders.

### B. SQL Code Tables to hold reports

### C. SQL Extract and Validation

### D. Data Transformation
Identify one field in the detailed section that will require a custom transformation and explain why it should be transformed.  For example, you might translate a field with a value of 'N' to 'No' and 'Y' to 'Yes'.

### E. SQL Triggers

### F. Stored Procedure - Refresh detailed and summary tables.

#### F1. Explain how the stored procedure can run on a schedule.
