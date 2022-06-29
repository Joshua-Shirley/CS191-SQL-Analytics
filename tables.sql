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
