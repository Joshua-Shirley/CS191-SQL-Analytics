
-- Unique countries to add to the country table from the bulk data.

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
