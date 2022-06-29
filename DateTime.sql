CREATE TABLE datefact ( 
	dateid SERIAL PRIMARY KEY,
	fullDate date NOT NULL,
	year smallint NOT NULL,
	month smallint NOT NULL,
	day smallint NOT NULL 
);

ALTER TABLE IF EXISTS public.datefact
    OWNER to postgres;

CREATE TABLE timefact(
	TimeID SERIAL PRIMARY KEY,
	Hour SMALLINT NULL,
	Minute SMALLINT NULL,
	Second SMALLINT NULL
);

ALTER TABLE IF EXISTS public.timeFact
    OWNER to postgres;

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
