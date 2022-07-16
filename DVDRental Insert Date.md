

Rental Table 

rental_date - should be within 18 months of the table data( 5-24-2005 and 2-14-2006 )
inventory_id = must match dvd selection
customer_id = must match a customer
    customer - needs match from
      - 
return date - 1 to 14 days after the rental_date
      
staff_id = only 2 employees are in the table 


Customer Table

- first_name
- last-name
- email
- address_id  => Address Table

Address Table

- address
- address 2
- district
- city_id => City Table
- postal_code
- phone

City Table

- city
- country_id => Country Table

Country Table

- Country
