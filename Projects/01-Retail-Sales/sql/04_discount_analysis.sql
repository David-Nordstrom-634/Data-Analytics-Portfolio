-- Ticket 003
-- Determine whether discounts are associated with lower profitability.

-- Business Question:
-- Are larger discounts associated with lower average profit?

SELECT discount, COUNT(*) as number_of_orders, AVG(profit) as average_profit
FROM superstoredata
GROUP BY discount
ORDER BY discount ASC;