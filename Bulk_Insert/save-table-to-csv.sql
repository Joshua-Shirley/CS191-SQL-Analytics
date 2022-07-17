-- SAVE New Customers INTO CSV file.
COPY c_in(first_name, last_name, email, address_1, address_2, city, state, postal_code, country, phone) 
TO '\WGU\CS 191\customer_list_tab.csv' 
DELIMITER E'\t' 
CSV HEADER;
