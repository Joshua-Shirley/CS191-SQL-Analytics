# D191 - Advanced Data Management

## Performance Assessment: Advanced Data Management

### A. Month Sales / Average Rental Time / Rental Sales By Category / Rental Time By Category Pivot Table

| Attribute         	| New Entity            	| Explaination                                	|
|-------------------	|-----------------------	|---------------------------------------------	|
| Bagel Order ID    	| Order                 	| Primary Key                                 	|
| Order Date        	| Order                 	| Functionally dependent on Order ID.         	|
| Delivery Fee      	| Order                 	| Functionally dependent on Order ID          	|
| Special Notes     	| Order                 	| Functionally dependent on Order ID          	|
| Customer ID       	| Order                 	| Foreign Key                                 	|
| Customer ID       	| Customer              	| Primary Key                                 	|
| First Name        	| Customer              	| Functionally dependent on Customer ID       	|
| Last Name         	| Customer              	| Functionally dependent on Customer ID       	|
| Address 1         	| Customer              	| Functionally dependent on Customer ID       	|
| Address 2         	| Customer              	| Functionally dependent on Customer ID       	|
| City              	| Customer              	| Functionally dependent on Customer ID       	|
| State             	| Customer              	| Functionally dependent on Customer ID       	|
| Zip               	| Customer              	| Functionally dependent on Customer ID       	|
| Mobile Phone      	| Customer              	| Functionally dependent on Customer ID       	|
| Bagel Order ID    	| Bagel Order Line Item 	| Primary Key / Foreign Key                   	|
| Bagel ID          	| Bagel Order Line Item 	| Primary Key / Foreign Key                   	|
| Bagel Quantity    	| Bagel Order Line Item 	| Partial dependence on Order ID and Bagel ID 	|
| Bagel ID          	| Bagel                 	| Primary Key                                 	|
| Bagel Name        	| Bagel                 	| Functional dependence on bagel ID           	|
| Bagel Description 	| Bagel                 	| Functional dependence on bagel ID           	|
| Bagel Price       	| Bagel                 	| Functional dependence on bagel ID           	|

#### A1. Describe the data used for the report.

 

#### A2. New Tables - details & summary
#### A3. Specific fields in the detailed and summary sections
#### A4. Data Transformations - custom functions

  Rental dates and Payment dates are off by an average of 607 days.
  Either the data was input incorrectly or the video store didn't collect money for a long time, which probably resulted in the shuttering.



#### A5. Data Triggers - with continual update.
#### A6. Refresh frequency - What is relevant to stakeholders.

### B. SQL Code Tables to hold reports

### C. SQL Extract and Validation

### D. Data Transformation
Identify one field in the detailed section that will require a custom transformation and explain why it should be transformed.  For example, you might translate a field with a value of 'N' to 'No' and 'Y' to 'Yes'.

### E. SQL Triggers

### F. Stored Procedure - Refresh detailed and summary tables.

#### F1. Explain how the stored procedure can run on a schedule.
