# D191 - Advanced Data Management

## Performance Assessment: Advanced Data Management

### A. Month Sales / Average Rental Time / Rental Sales By Category / Rental Time By Category Pivot Table

| Film Category 	| January 	| Febuary 	| March 	| April 	| May 	| June 	| July 	| August 	| September 	| October 	| November 	| December 	|
|---------------	|---------	|---------	|-------	|-------	|-----	|------	|------	|--------	|-----------	|---------	|----------	|----------	|
| Action        	| 541     	| 199     	| 302   	| 345   	| 309 	| 160  	| 464  	| 384    	| 514       	| 308     	| 530      	| 451      	|
| Animation     	| 645     	| 222     	| 265   	| 363   	| 297 	| 174  	| 489  	| 408    	| 565       	| 308     	| 596      	| 477      	|
| Children      	| 498     	| 179     	| 230   	| 298   	| 239 	| 130  	| 406  	| 332    	| 439       	| 267     	| 447      	| 423      	|
| Classics      	| 496     	| 181     	| 236   	| 285   	| 246 	| 136  	| 384  	| 348    	| 447       	| 264     	| 462      	| 442      	|
| Comedy        	| 508     	| 196     	| 230   	| 329   	| 232 	| 135  	| 383  	| 342    	| 458       	| 284     	| 463      	| 441      	|
| Documentary   	| 533     	| 209     	| 261   	| 348   	| 266 	| 160  	| 429  	| 368    	| 485       	| 311     	| 498      	| 464      	|
| Drama         	| 523     	| 201     	| 257   	| 298   	| 280 	| 152  	| 463  	| 353    	| 495       	| 258     	| 550      	| 446      	|
| Family        	| 553     	| 202     	| 259   	| 330   	| 286 	| 154  	| 460  	| 384    	| 514       	| 325     	| 539      	| 483      	|
| Foreign       	| 584     	| 184     	| 288   	| 347   	| 261 	| 142  	| 432  	| 377    	| 435       	| 295     	| 520      	| 497      	|
| Games         	| 530     	| 146     	| 263   	| 278   	| 266 	| 142  	| 392  	| 352    	| 463       	| 269     	| 507      	| 416      	|
| Horror        	| 483     	| 174     	| 210   	| 281   	| 202 	| 116  	| 366  	| 299    	| 388       	| 232     	| 450      	| 372      	|
| Music         	| 410     	| 126     	| 202   	| 262   	| 205 	| 133  	| 348  	| 277    	| 378       	| 257     	| 403      	| 333      	|
| New           	| 530     	| 191     	| 234   	| 312   	| 246 	| 132  	| 389  	| 346    	| 457       	| 264     	| 484      	| 402      	|
| Sci-Fi        	| 611     	| 198     	| 277   	| 334   	| 321 	| 162  	| 462  	| 385    	| 468       	| 300     	| 561      	| 492      	|
| Sports        	| 627     	| 242     	| 302   	| 372   	| 298 	| 159  	| 497  	| 432    	| 598       	| 316     	| 561      	| 516      	|
| Travel        	| 428     	| 150     	| 184   	| 218   	| 202 	| 124  	| 345  	| 298    	| 396       	| 242     	| 429      	| 345      	|
|               	|         	|         	|       	|       	|     	|      	|      	|        	|           	|         	|          	|          	|
|               	|         	|         	|       	|       	|     	|      	|      	|        	|           	|         	|          	|          	|

#### A1. Describe the data used for the report.

 

#### A2. New Tables - details & summary
#### A3. Specific fields in the detailed and summary sections
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
