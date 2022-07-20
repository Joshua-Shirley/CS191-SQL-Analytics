CREATE TABLE timefact(
	TimeID SERIAL PRIMARY KEY,	
	Hour SMALLINT NULL,
	Minute SMALLINT NULL,
	Second SMALLINT NULL
);

ALTER TABLE IF EXISTS public.timeFact
    OWNER to postgres;