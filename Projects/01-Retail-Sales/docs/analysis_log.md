## Ticket #001 - Profit by Category

### Business Question
Which product categories generate the highest total profit?

### SQL Used
```sql
SELECT category,
       SUM(profit) AS total_profit
FROM superstoredata
GROUP BY category
ORDER BY total_profit DESC;