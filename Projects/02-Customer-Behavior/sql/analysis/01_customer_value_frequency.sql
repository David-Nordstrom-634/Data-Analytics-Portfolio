-- Investigation 1: Customer Value & Purchase Frequency
-- Purpose:
-- Measure customer purchasing activity, repeat behavior,
-- customer value, and typical time between purchases. 

-- Customer-level analysis excludes transactions without
-- an identified customer. 

-- Classify transaction lines as purchases or returns. 
WITH customer_purchases AS(
	SELECT
		c.customer_id,
		i.invoice,
		i.invoice_date,
		ii.quantity,
		ii.price,
		ii.quantity * ii.price AS line_value,
		CASE
			WHEN i.invoice LIKE 'C%' OR ii.quantity < 0 THEN 'Return'
			ELSE 'Purchase'
		END AS transaction_type
	FROM customers c
	INNER JOIN invoices i
		ON c.customer_id = i.customer_id
	INNER JOIN invoice_items ii
		ON i.invoice_id = ii.invoice_id
),

-- Create one row per completed purchase invoice
purchase_invoices AS (
	SELECT DISTINCT
		customer_id,
		invoice,
		invoice_date
	FROM customer_purchases
	WHERE transaction_type = 'Purchase'
),

-- Calculate previous purchase date using LAG()
purchase_dates AS (
	SELECT
		customer_id,
		invoice,
		invoice_date,
		LAG(invoice_date) OVER (
			PARTITION BY customer_id
			ORDER BY invoice_date
		) AS previous_purchase_date
	FROM purchase_invoices
),

-- Calculate time between purchases
purchase_gaps AS (
	SELECT
		customer_id,
		invoice,
		invoice_date,
		previous_purchase_date,
		EXTRACT(
			EPOCH FROM (invoice_date - previous_purchase_date)
		) / 86400.0 AS days_since_previous_purchase
	FROM purchase_dates
),

-- Aggregate value and purchasing behavior by customer
customer_purchase_gaps AS (
	SELECT
		customer_id,
		AVG(days_since_previous_purchase) AS avg_days_between_purchases
	FROM purchase_gaps
	GROUP BY customer_id
),
customer_value AS (
	SELECT
		customer_id,
		COUNT(
			DISTINCT CASE
				WHEN transaction_type = 'Purchase' THEN invoice
			END
		) AS purchase_count,
		SUM(
			CASE
				WHEN transaction_type = 'Purchase' THEN line_value
				ELSE 0
			END
		) AS gross_sales,

		SUM(line_value) AS net_sales,

		CASE
			WHEN COUNT(
				DISTINCT CASE
					WHEN transaction_type = 'Purchase' THEN invoice
				END
			) > 1
				THEN 'Yes'
			ELSE 'No'
		END AS repeat_customer
	FROM customer_purchases
	GROUP BY customer_id
),

-- Summarize customer-level results
customer_level AS (
	SELECT
		cv.customer_id,
		cv.purchase_count,
		cv.gross_sales,
		cv.net_sales,
		cv.repeat_customer,
		cpg.avg_days_between_purchases
	FROM customer_value cv
	LEFT JOIN customer_purchase_gaps cpg
		ON cv.customer_id = cpg.customer_id
	ORDER BY cv.gross_sales DESC
)
SELECT
	COUNT(customer_id) as total_identified_customers,
	COUNT(
		CASE
			WHEN repeat_customer = 'Yes' THEN customer_id
		END
	) AS repeat_customer_count,
	COUNT(
		CASE
			WHEN repeat_customer = 'Yes' THEN customer_id
		END
	) * 100.0
	/ NULLIF(COUNT(customer_id), 0) AS repeat_customer_rate,
	AVG(gross_sales) AS avg_gross_sales_per_customer,
	AVG(net_sales) AS avg_net_sales_per_customer,
	AVG(purchase_count) AS avg_purchase_count,
	AVG(
		CASE
			WHEN purchase_count > 1
			THEN avg_days_between_purchases
		END
	) AS avg_days_beteen_purchases
FROM customer_level;