-- Table: public.tr

-- DROP TABLE IF EXISTS public.tr;

CREATE TABLE IF NOT EXISTS public.tr
(
    id SERIAL ,
    code character varying(50) COLLATE pg_catalog."default",
    name character varying(50) COLLATE pg_catalog."default",
    e_name character varying(100) COLLATE pg_catalog."default"
)

ALTER TABLE public.tr  ADD CONSTRAINT tr_pkey PRIMARY KEY (id);
ALTER TABLE public.tr ADD CONSTRAINT unique_code UNIQUE (code);
ALTER TABLE public.tr ADD CONSTRAINT unique_name UNIQUE (name);
ALTER TABLE public.tr ADD CONSTRAINT unique_e_name UNIQUE (e_name);

ALTER TABLE public.tr ALTER COLUMN code SET NOT NULL;
ALTER TABLE public.tr ALTER COLUMN name SET NOT NULL;

ALTER TABLE public.tr  ALTER COLUMN name TYPE varchar(15);


ALTER TABLE public.tr DROP CONSTRAINT unique_name;

