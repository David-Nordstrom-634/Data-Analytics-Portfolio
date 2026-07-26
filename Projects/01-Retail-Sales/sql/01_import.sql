-- Retail Sales Project
-- Import Script

-- Create table
CREATE TABLE superstoredata (
    row_id INTEGER PRIMARY KEY,
    order_id VARCHAR(16),
    order_date DATE,
    ship_date DATE,
    ship_mode TEXT,
    customer_id VARCHAR(8),
    customer_name TEXT,
    segment TEXT,
    country TEXT,
    city TEXT,
    state TEXT,
    postal_code VARCHAR(5),
    region TEXT,
    product_id VARCHAR(15),
    category TEXT,
    sub_category TEXT,
    product_name TEXT,
    sales NUMERIC,
    quantity INTEGER,
    discount NUMERIC,
    profit NUMERIC
),

-- Data imported using the pgAdmin Import/Export tool. 