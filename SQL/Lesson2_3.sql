-- Table: public.stations

-- DROP TABLE IF EXISTS public.stations;

CREATE TABLE IF NOT EXISTS public.stations
(
    id SERIAL ,
    code character varying(50) COLLATE pg_catalog."default",
    name character varying(50) COLLATE pg_catalog."default",
    e_name character varying(100) COLLATE pg_catalog."default"
)

ALTER TABLE public.stations  ADD CONSTRAINT tr_pkey PRIMARY KEY (id);
ALTER TABLE public.stations ADD CONSTRAINT unique_code UNIQUE (code);
ALTER TABLE public.stations ADD CONSTRAINT unique_name UNIQUE (name);
ALTER TABLE public.stations ADD CONSTRAINT unique_e_name UNIQUE (e_name);

ALTER TABLE public.stations ALTER COLUMN code SET NOT NULL;
ALTER TABLE public.stations ALTER COLUMN name SET NOT NULL;

ALTER TABLE public.stations  ALTER COLUMN name TYPE varchar(15);


ALTER TABLE public.stations DROP CONSTRAINT unique_name;

