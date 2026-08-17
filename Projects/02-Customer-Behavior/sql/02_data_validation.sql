-- Customer Count Check
SELECT COUNT(*) AS total_customers
FROM customers;

-- Products Count Check
SELECT COUNT(*) AS total_products
FROM products;

-- Invoices Count Check
SELECT COUNT(*) AS total_invoices
FROM invoices;

-- Invoice Items Count Check
SELECT COUNT(*) AS total_invoice_items
FROM invoice_items;

-- Primary-key validation
SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT invoice_line_id) AS unique_line_ids
FROM invoice_items;

-- Invoice Relationship Validation
SELECT COUNT(*) AS invalid_invoice_links
FROM invoice_items ii 
LEFT JOIN invoices 
    ON ii.invoice_id = i.invoice_id
WHERE i.invoice_id IS NULL;

-- Product Relationship Validation
SELECT COUNT(*) AS invalid_product_links
FROM invoice_items ii
LEFT JOIN products p
    ON ii.stock_code = p.stock_code
WHERE p.stock_code IS NULL;

-- Original Transaction Restructure
SELECT
    ii.invoice_line_id,
    i.invoice,
    i.invoice_date,
    i.customer_id,
    i.country,
    p.stock_code,
    p.description,
    ii.quantity,
    ii.price
FROM invoice_items ii
INNER JOIN invoices i
    ON ii.invoice_id = i.invoice_id
INNER JOIN products p
    ON ii.stock_code = p.stock_code
LIMIT 20;