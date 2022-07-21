COPY c_in( first_name, last_name, email, address_1, address_2 , city , state , postal_code , country , phone )
FROM '\customer_list_v1.csv'
DELIMITER ','
CSV HEADER;

-- INSERT FROM URL SOURCE
/*
COPY c_in( first_name, last_name, email, address_1, address_2 , city , state , postal_code , country , phone )
FROM PROGRAM 'curl "https://github.com/Joshua-Shirley/CS191-SQL-Analytics/blob/main/csv%20files/customer_list_v1.csv"'
DELIMITER ','
CSV HEADER;
*/
