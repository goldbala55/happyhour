-- It is expected you created a DB named happyhour using pgAdmin
-- Run these using pgAdmin to create read-only and read-write users
-- This allows team members to use the shared instance (AWS) without sharing 
-- the superuser id.
-- Remove open access from public schema from the happyhour DB as well.

-- --------------------------------------------------------------
-- create ro roles, grants
CREATE ROLE happyhour_ro;
GRANT CONNECT ON DATABASE happyhour TO happyhour_ro;
GRANT USAGE ON SCHEMA PUBLIC TO happyhour_ro;
GRANT SELECT ON ALL TABLES IN SCHEMA PUBLIC TO happyhour_ro; 
ALTER DEFAULT PRIVILEGES IN SCHEMA PUBLIC GRANT SELECT ON TABLES TO happyhour_ro;

-- create rw roles, grants
CREATE ROLE happyhour_rw;
GRANT CONNECT ON DATABASE happyhour TO happyhour_rw;
GRANT USAGE, CREATE ON SCHEMA PUBLIC TO happyhour_rw;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA PUBLIC TO happyhour_rw;
ALTER DEFAULT PRIVILEGES IN SCHEMA PUBLIC GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO happyhour_rw;
-- give write user the ability to create sequences
GRANT USAGE ON ALL SEQUENCES IN SCHEMA PUBLIC TO happyhour_rw;
ALTER DEFAULT PRIVILEGES IN SCHEMA PUBLIC GRANT USAGE ON SEQUENCES TO happyhour_rw;

-- create the read and write user
CREATE USER happyhour_ro1 WITH PASSWORD 'xxxxxxxxx';
GRANT happyhour_ro TO happyhour_ro1;

--write user 
CREATE USER happyhour_rw1 WITH PASSWORD 'yyyyyyyyy';
GRANT happyhour_rw TO happyhour_rw1;

-- --------------------------------------------------------------
-- Now lock down the schema
-- DO NOT RUN THESE COMMANDS UNTIL PROPER ROLES ARE CREATED and USERS GRANTED ACCESS
-- Revoke create access on the public schema 
    REVOKE CREATE ON SCHEMA PUBLIC FROM PUBLIC; 
-- The following statement revokes the public role’s ability to connect to the database:
    REVOKE ALL ON DATABASE happyhour FROM PUBLIC;

-- --------------------------------------------------------------
-- It seems that the rw user must also grant read access to the ro user roles.
set session authorization 'happyhour_rw1'
ALTER DEFAULT PRIVILEGES IN SCHEMA PUBLIC GRANT SELECT ON TABLES TO happyhour_ro;
