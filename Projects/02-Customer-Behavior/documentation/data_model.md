## customers
One row per identified customer.

## products
One row per unique StockCode.

## invoices
One row per unique Invoice + InvoiceDate combination.
A surrogate invoice_id is used as the primary key.

## invoice_items
One row per original transaction line.
A surrogate invoice_line_id is used as the primary key.

Country lives in invoices rather than customers because the profiling showed that sime identified customers were associated with multiple countries.