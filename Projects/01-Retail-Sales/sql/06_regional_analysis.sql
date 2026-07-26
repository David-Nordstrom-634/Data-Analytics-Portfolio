-- ==========================================
-- Investigation 5
-- Regional Performance Analysis
-- Business Question:
-- Which region should receive additional investment?
-- ==========================================

-- Query 1
-- Overall regional performance

SELECT
      region,
      COUNT(*) as total_orders,
      SUM(sales) as total_sales,
      SUM(profit) as total_profit
FROM superstoredata
GROUP BY region;

-------------------------------------------------

-- Query 2
-- Regional efficiency

SELECT
      region,
      AVG(sales) as average_sales,
      AVG(profit) as average_profit,
      SUM(profit)/SUM(sales) * 100 as profit_margin
FROM superstoredata
GROUP BY region;

-------------------------------------------------

-- Query 3
-- Category performance by region

SELECT
      region,
      category,
      COUNT(*) as total_orders,
      SUM(profit) as total_profit,
      SUM(sales) as total_sales,
      AVG(profit) as average_profit,
      AVG(sales) as average_sales
FROM superstoredata
GROUP BY region, category
ORDER BY region, total_orders DESC;

-------------------------------------------------

-- Query 4
-- Discount impact by region

SELECT
      region,
      discount,
      COUNT(*) as total_orders,
      AVG(profit) as average_profit,
      AVG(sales) as average_sales
FROM superstoredata
GROUP BY region, discount
ORDER BY discount ASC;
