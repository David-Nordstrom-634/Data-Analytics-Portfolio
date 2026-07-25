-- Ticket 003
-- Determine whether discounts are associated with lower profitability.

SELECT discount, COUNT(order_id) as number_of_orders, AVG(profit) as average_profit
FROM superstoredata
GROUP BY discount
ORDER BY discount ASC;