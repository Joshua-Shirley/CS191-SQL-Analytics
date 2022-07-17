
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

