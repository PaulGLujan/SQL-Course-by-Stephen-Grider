-- Get directory where Postgres is running from
SHOW data_directory;

-- Get names of databases and internal identifier
SELECT oid, datname FROM pg_database;

-- List DB objects
SELECT * FROM pg_class;