
TRUNCATE TABLE reports_rental_details;

WITH CTE AS (
SELECT rental_id
    , rental.inventory_id
    , rental_date
    , EXTRACT( YEAR FROM rental_date ) as Y
    , EXTRACT( MONTH FROM rental_date ) as M
    , EXTRACT( DAY FROM rental_date ) as D
    , EXTRACT( DOW FROM rental_date ) as DOW
    , EXTRACT( QUARTER FROM rental_date ) as Q
    , EXTRACT( HOUR FROM rental_date ) as H
    , EXTRACT( MINUTE FROM rental_date ) as MN
    , category.name as category
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
    WHERE DATE_PART( 'day' , return_date - rental_date ) IS NOT NULL
    order by rental_date
)
INSERT INTO reports_rental_details
SELECT rental_id
,   inventory_id
,   rental_date
,   y
,   m
,   d
,   dow
,   q
,   h   
,   mn
,   category
,   store_id
FROM CTE
