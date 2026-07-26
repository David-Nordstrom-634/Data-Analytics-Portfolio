-- Ticket 001
-- Which categories generate the most profit?

SELECT category, 
       SUM(profit) as total_profit
FROM superstoredata
GROUP BY category
ORDER BY total_profit DESC;

---------------------------------------------------------

-- Ticket 002
-- Which furniture sub-categories contribute the most profit?
SELECT category,
       sub_category,
       SUM(proift) AS total_profit
FROM superstoredata
WHERE category = 'Furniture'
GROUP BY category, sub_category
ORDER BY total_profit DESC;