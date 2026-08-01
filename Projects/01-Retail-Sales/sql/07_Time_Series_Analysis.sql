--- Overall Business Growth

SELECT
      EXTRACT(YEAR FROM order_date) as year,
      COUNT(*) AS total_orders,
      SUM(sales) AS total_sales,
      SUM(profit) AS total_profit,
      AVG(sales) AS average_sales_per_order,
      AVG(profit) AS average_profit_per_order,
      SUM(profit) / NULLIF(SUM(sales), 0) * 100 AS profit_margin
FROM superstoredata
GROUP BY year
ORDER BY year ASC;

--- Category Growth

SELECT
      EXTRACT(YEAR FROM order_date) AS year,
      category,
      COUNT(*) AS total_orders,
      SUM(sales) AS total_sales,
      SUM(profit) AS total_profit,
      AVG(sales) AS average_sales_per_order,
      AVG(profit) AS average_profit_per_order,
      SUM(profit) / NULLIF(SUM(sales), 0) * 100 AS profit_margin
FROM superstoredata
GROUP BY year, category
ORDER BY year ASC, total_sales DESC;

--- Regional Growth

SELECT
      EXTRACT(YEAR FROM order_date) AS year,
      region,
      COUNT(*) AS total_orders,
      SUM(sales) AS total_sales,
      SUM(profit) AS total_profit,
      AVG(sales) AS average_sales_per_order,
      AVG(profit) AS average_profit_per_order,
      SUM(profit) / NULLIF(SUM(sales), 0) * 100 AS profit_margin
FROM superstoredata
GROUP BY year, region
ORDER BY year ASC, total_sales DESC;

--- Discount Trends
SELECT
      EXTRACT(YEAR FROM order_date) AS year,
      discount,
      COUNT(*) AS total_orders,
      SUM(profit) AS total_profit,
      SUM(sales) AS total_sales,
      AVG(profit) AS average_profit_per_order,
      SUM(profit) / NULLIF(SUM(sales), 0) * 100 AS profit_margin
FROM superstoredata
GROUP BY year, discount
ORDER BY year ASC, profit_margin DESC;
