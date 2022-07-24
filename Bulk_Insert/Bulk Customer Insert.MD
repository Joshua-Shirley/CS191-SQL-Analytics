# DVDRental - Bulk Insert of New Customers

1. [New Table](#step1)
2. [Copy CSV file into DB](#step2)
3. [Extract country data](#step3)
4. [Extract city data](#step4)
5. [Extract address data](#step5)
6. [Extract customer data](#step6)
7. [Random New Orders Stored Proceedure](#step7)
8. [Save data to csv file](#step8)
9. [Drop Table](#step9)

### Step 1 - Table to hold temporary data <a name="step1"></a>

    CREATE TABLE c_in (
            id SERIAL PRIMARY KEY
        ,   first_name TEXT NULL
        ,   last_name TEXT NULL
        ,   email TEXT NULL
        ,   address_1 TEXT NULL
        ,   address_2 TEXT NULL
        ,   city    TEXT NULL
        ,   state   TEXT NULL
        ,   postal_code TEXT NULL
        ,   country TEXT NULL
        ,   phone   TEXT NULL
        ,   country_id INT NULL
        ,   city_id INT NULL
        ,   address_id INT NULL
        ,   customer_id INT NULL    
    );

### Step 2 - Bulk import CSV File<a name="step2"></a>

    COPY c_in( first_name, last_name, email, address_1, address_2 , city , state , postal_code , country , phone )
    FROM '\random_customer.csv'
    DELIMITER ','
    CSV HEADER;
    
### Step 3 - Extract Country data from C_in into Country<a name="step3"></a>

    WITH CTE AS (
        SELECT country
        FROM c_in
        GROUP BY country
    )
    INSERT INTO country
    ( country )
    SELECT country
    FROM CTE
    WHERE country NOT IN (
        SELECT country FROM country
    );

    -- Match country records to the c_in table records

    WITH CTE AS (
        SELECT id
        ,   c_in.country    
        ,   country.country_id
        FROM c_in
        FULL JOIN country
        ON c_in.country = country.country
        WHERE c_in.id IS NOT NULL
        AND country.country_id IS NOT NULL
    )
    UPDATE c_in
    SET country_id = CTE.country_id
    FROM CTE
    WHERE c_in.id = CTE.id;

    -- Confirm all records where updated.
    SELECT *
    FROM c_in
    WHERE country_id IS NULL;

### Step 4 - Extract City Data from C_in into City<a name="step4"></a>

    -- insert new cities into the city table

    WITH CTE AS (
        SELECT city
        , country_id
        FROM c_in    
        GROUP BY city, country_id        
    )
    INSERT INTO city
    ( city, country_id )
    SELECT CTE.city
    ,   CTE.country_id
    FROM CTE
    FULL JOIN City
    ON CTE.city = City.city
    AND CTE.country_id = City.country_id
    WHERE City.City IS NULL;


    -- match city_id records

    WITH CTE AS (
        SELECT id
        --,   c_in.city    
        --,   city.city
        --,   c_in.city_id
        ,   city.city_id    
        FROM c_in
        LEFT JOIN city
        ON c_in.city = city.city
        AND c_in.country_id = city.country_id
    )
    UPDATE c_in
    SET city_id = CTE.city_id
    FROM CTE
    WHERE c_in.id = cte.id;

### Step 5 - Extract Address Data from C_in into Address<a name="step5"></a>

    -- INSERT UNIQUE ADDRESSES INTO THE address table

    WITH CTE AS (
        SELECT address_1
        ,   address_2
        ,   city_id
        ,   state
        ,   postal_code
        ,   phone
        FROM c_in
        GROUP BY address_1, address_2, city_id, state, postal_code, phone
    )
    INSERT INTO address
    ( address , address2 , district , city_id , postal_code , phone )
    SELECT 
        address_1 AS address
    ,   address_2 AS address2   
    ,   state AS district
    ,   CTE.city_id
    ,   CTE.postal_code
    ,   CTE.phone
    FROM CTE
    FULL JOIN address
    ON address.phone = CTE.phone
    AND address.postal_code = CTE.postal_code
    AND address.district = CTE.state
    AND address.city_id = CTE.city_id
    AND address.address = CTE.address_1
    WHERE address_id IS NULL;

    WITH CTE AS (
        SELECT id
        ,   address.address_id
        FROM c_in
        LEFT JOIN address
        ON c_in.phone = address.phone
        AND c_in.postal_code = address.postal_code
        AND c_in.state = address.district
        AND c_in.city_id = address.city_id
        AND c_in.address_1 = address.address
    )
    UPDATE c_in
    SET address_id = CTE.address_id
    FROM CTE
    WHERE c_in.id = CTE.id;

### Step 6 - Extract Customers from C_IN to Customer<a name="step6"></a>

    -- INSERT UNIQUE NEW CUSTOMERS INTO THE CUSTOMER TABLE

    INSERT INTO customer 
    ( store_id , first_name, last_name , email, address_id , activebool , create_date , active )
    SELECT floor( random() * (2 ) + 1 ) as store_id
    ,   first_name
    ,   last_name
    ,   email
    ,   address_id
    ,   true as activebool
    ,   now() as create_date
    ,   1 as active
    FROM c_in;


    -- UPDATE THE C_IN TABLE

    WITH CTE AS (
        SELECT id
        ,   customer.customer_id
        FROM c_in
        LEFT JOIN customer
        ON c_in.address_id = customer.address_id
        AND c_in.email = customer.email
        AND c_in.last_name = customer.last_name
        AND c_in.first_name = customer.first_name
        WHERE c_in.customer_id IS NULL
    )
    UPDATE c_in
    SET customer_id = CTE.customer_id
    FROM CTE
    WHERE c_in.id = CTE.id;

### Step 7 - Random Order Month Stored Procedure<a name="step7"></a>

The purpose of the random_orders_monthly() procedure is to create new orders to insert more data for testing.
The original database only includes sample data for 4 months in 2005.
For some of my pivot tables more data is needed to verify the pivot tables are returning the query correctly.

This is stored in the folder <a href="https://github.com/Joshua-Shirley/CS191-SQL-Analytics/blob/main/stored_procedures/random_orders_monthly.sql">here.</a>

### Step 8 - Copy data back to CSV file<a name="step7"></a>

This step is optional.  But show the code to copy c_in data back into a CSV file.

        -- SAVE New Customers INTO CSV file.
        COPY c_in(first_name, last_name, email, address_1, address_2, city, state, postal_code, country, phone) 
        TO '\customer_list_comma.csv' 
        DELIMITER ',' 
        CSV HEADER;

### Step 8 - DROP c_in Table<a name="step8"></a>

    DROP TABLE c_in;
    
