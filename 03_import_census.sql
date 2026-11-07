-- Run using PostgreSQL COPY.
-- The CSV must be accessible to the PostgreSQL server.
-- Replace the path with the CSV's actual location.

COPY employees_raw
FROM '/path/to/employees_census_raw.csv'
WITH (
    FORMAT CSV,
    HEADER TRUE
);