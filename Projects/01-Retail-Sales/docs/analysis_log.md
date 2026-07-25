## Ticket 001 - Profit by Category

### Business Question
Which product categories generate the highest total profit?

### SQL Used
```sql
SELECT category,
       SUM(profit) AS total_profit
FROM superstoredata
GROUP BY category
ORDER BY total_profit DESC;
```

# Discount Analysis

## Business Question

Are higher discounts associated with lower profitability?

## Method

Grouped transactions by discount level and calculated:

- Average Profit
- Number of Ordes

## Findings

- 0% and 20% discounts accounted for most orders.
- Average profit generally decreased as discount levels increased.
- Some high discount levels had vary few orders, making conclusions less reliable.

## Next Investigation

Determine whether higher discounts increase average sales enough to justify lower profits.