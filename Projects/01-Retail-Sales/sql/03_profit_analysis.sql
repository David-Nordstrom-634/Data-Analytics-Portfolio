-- DETERMINE WHICH PRODUCT CATEGORIES GENERATED THE HIGHEST TOTAL PROFIT
SELECT category, 
       SUM(profit) as total_profit
FROM superstoredata
GROUP BY category
ORDER BY total_profit DESC;

-- WHY IS FURNITURE UNDERPERFORMING
SELECT category,
       sub_category,
       SUM(proift) AS total_profit
FROM superstoredata
WHERE category = 'Furniture'
GROUP BY category, sub_category
ORDER BY total_profit DESC;