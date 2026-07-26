-- Verify row count

SELECT COUNT(*) AS total_rows
FROM superstoredata;

------------------------------------------------

-- Preview first 10 rows

SELECT *
FROM superstoredata
LIMIT 10;

------------------------------------------------

-- Verify order date range

SELECT
    MIN(order_date) AS earliest_date,
    MAX(order_date) AS latest_date
FROM superstoredata;

------------------------------------------------

-- Check for duplicate Row IDs

SELECT row_id
    COUNT(*) AS occurences
FROM superstoredata
GROUP BY row_id
HAVING COUNT(*) > 1;