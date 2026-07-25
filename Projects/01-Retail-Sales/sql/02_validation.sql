SELECT COUNT(*) AS total_rows
FROM superstoredata;

SELECT *
FROM superstoredata
LIMIT 10;

SELECT
    MIN(order_date) AS earliest_date,
    MAX(order_date) AS latest_date
FROM superstoredata;

SELECT row_id
    COUNT(*) AS occurences
FROM superstoredata
GROUP BY row_id
HAVING COUNT(*) > 1;