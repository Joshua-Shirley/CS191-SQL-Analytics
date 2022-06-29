CREATE TABLE DateFact ( 
	DateID SERIAL PRIMARY KEY,
	Year SMALLINT NOT NULL,
	Month SMALLINT NOT NULL,
	Day SMALLINT NOT NULL
);

CREATE TABLE TimeFact(
	TimeID SERIAL PRIMARY KEY,
	Hour SMALLINT NULL,
	Minute SMALLINT NULL,
	Second SMALLINT NULL
);

/*
WITH RECURSIVE seconds(s) AS (
    SELECT 0
    
    UNION ALL
    
    SELECT s + 1
    FROM seconds
    WHERE s + 1 < 60        
), minutes(mi,s) AS (

    SELECT 0, s
    FROM seconds

    UNION ALL

    SELECT mi + 1, s
    FROM minutes
    WHERE mi + 1 < 60

), hours(h,mi,s) AS (
    
    SELECT 0 , mi, s
    FROM minutes
    
    UNION ALL
    
    SELECT h + 1, mi, s
    FROM hours
    WHERE h + 1 < 24
)
SELECT *
FROM hours
*/


/* Fill TimeFact with Data */
WITH RECURSIVE minutes(mi,s) AS (
    SELECT 0, 0
    
    UNION ALL

    SELECT mi + 1, 0
    FROM minutes
    WHERE mi + 1 < 60
), hours(h,mi,s) AS (    
    SELECT 0 , mi, s
    FROM minutes
    
    UNION ALL
    
    SELECT h + 1, mi, s
    FROM hours
    WHERE h + 1 < 24
)
INSERT INTO timefact
( hour , minute , second )
SELECT *
FROM hours;
