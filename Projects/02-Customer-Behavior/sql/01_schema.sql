-- Project 02: Customer Retention Analysis
-- PostgreSQL relational schema

CREATE TABLE customers (
    customer_id INTEGER PRIMARY KEY
);

CREATE TABLE products (
    stock_code VARCHAR(7) PRIMARY KEY,
    description TEXT
);

CREATE TABLE invoices (
    invoice_id INTEGER PRIMARY KEY,
    invoice VARCHAR(7) NOT NULL,
    invoice_date TIMESTAMP NOT NULL,
    customer_id INTEGER REFERENCES customers(customer_id),
    country TEXT
);

CREATE TABLE invoice_items (
    invoice_line_id INTEGER PRIMARY KEY,
    invoice_id INTEGER NOT NULL REFERENCES invoices(invoice_id),
    stock_code VARCHAR(7) NOT NULL REFERENCES products(stock_code),
    quantity INTEGER NOT NULL,
    price NUMERIC(12,2) NOT NULL
);