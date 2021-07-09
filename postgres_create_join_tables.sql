-- Create the passenger_details table
-- contains details dropped when creating train and test
-- then join the new passenger table with the training table - train

--create the table and grant permissions
CREATE TABLE public.passenger_details
(
    "Pkey" SERIAL PRIMARY KEY,
    "PassengerId" bigint NOT NULL REFERENCES orig ("PassengerId"),
    "Name" text COLLATE pg_catalog."default",
    "Sex" text COLLATE pg_catalog."default",
    "SibSp" bigint,
    "Parch" bigint,
    "Ticket" text COLLATE pg_catalog."default",
    "Cabin" text COLLATE pg_catalog."default"
)

TABLESPACE pg_default;

ALTER TABLE public.passenger_details
    OWNER to happyhour_rw1;

GRANT SELECT ON TABLE public.passenger_details TO happyhour_ro;

GRANT ALL ON TABLE public.passenger_details TO happyhour_rw1;

-- load the table
insert into passenger_details ("PassengerId", "Name", "Sex", "SibSp", "Parch", "Ticket", "Cabin") 
  select "PassengerId", "Name", "Sex", "SibSp", "Parch", "Ticket", "Cabin" from orig;

--  some joins
select pd.*, t.*
  from passenger_details as pd
  inner join train as t on (t."PassengerId" = pd."PassengerId");

select t."PassengerId", pd."Name", t."title", pd."Sex", t."Sex", pd."SibSp", pd."Parch", t."Pclass", pd."Cabin"
  from passenger_details as pd
  inner join train as t on (t."PassengerId" = pd."PassengerId");