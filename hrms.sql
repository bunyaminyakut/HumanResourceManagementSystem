-- This script was generated by a beta version of the ERD tool in pgAdmin 4.
-- Please log an issue at https://redmine.postgresql.org/projects/pgadmin4/issues/new if you find any bugs, including reproduction steps.
BEGIN;


CREATE TABLE public.users
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 ),
    email character varying(40) NOT NULL UNIQUE,
    password character varying(16) NOT NULL,
    confirm_password character varying(16) NOT NULL CHECK(password=confirm_password),
    PRIMARY KEY (id)
);

CREATE TABLE public."Employers"
(
    user_id integer NOT NULL,
    company_name character varying(50) NOT NULL,
    website character varying(100) NOT NULL,
    phone_number character varying(15) NOT NULL,
    is_activited boolean NOT NULL,
    PRIMARY KEY (user_id)
);

CREATE TABLE public."systemPersonel"
(
    user_id integer NOT NULL,
    position_id integer NOT NULL,
    PRIMARY KEY (user_id)
);

CREATE TABLE public.job_tittle
(
    id integer NOT NULL,
    tittle character varying NOT NULL UNIQUE,
    position_id character varying NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public."jobSeekers"
(
    user_id integer NOT NULL,
    name character varying(20) NOT NULL,
    surname character varying(20) NOT NULL,
    identification_number character varying(11) NOT NULL UNIQUE,
    year_of_birth character varying(4) NOT NULL,
    PRIMARY KEY (user_id)
);

CREATE TABLE public.email_activation
(
    id integer NOT NULL,
    activate_message character varying(300),
    PRIMARY KEY (id)
);

ALTER TABLE public.users
    ADD FOREIGN KEY (id)
    REFERENCES public."Employers" (user_id)
    NOT VALID;


ALTER TABLE public.users
    ADD FOREIGN KEY (id)
    REFERENCES public."systemPersonel" (user_id)
    NOT VALID;


ALTER TABLE public.users
    ADD FOREIGN KEY (id)
    REFERENCES public."jobSeekers" (user_id)
    NOT VALID;


ALTER TABLE public.email_activation
    ADD FOREIGN KEY (id)
    REFERENCES public.users (id)
    NOT VALID;


ALTER TABLE public."systemPersonel"
    ADD FOREIGN KEY (user_id)
    REFERENCES public.job_tittle (id)
    NOT VALID;

END;