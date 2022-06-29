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
