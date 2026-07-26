# Retail Sales Analysis log

## Investigation 1 - Profitability by Category

### Business Question
Which product categories generate the highest total profit?

### SQL Techniques
- GROUP BY
- SUM()
- ORDER BY

### Findings
Technology generated the highest total profit, followed by Office Supplies. Furniture generated less profit.

### Business Impact
Furniture should be investigated further to determine why it significantly underperforms the other categories.

---

## Investigation 2 - Furniture Sub-Categories

### Business Question
Which furniture sub-categories contribute the most profit?

### SQL Techniques
- WHERE
- GROUP BY
- SUM()

### Findings
Chairs generated the highest total profit, followed by Furnishings. However, both Bookcases and Tables both generated a negative proift.

### Business Impact
Both Bookcases and Tables should be further investigated to see why they have generated negative profits.

---

## Investigation 3 - Discounts vs. Profitability

### Business Question
Are higher discounts associated with lower profitability?

### SQL Techniques
- GROUP BY
- COUNT()
- AVG()

### Findings
The analysis suggests that average profit generally declines as discount levels increase. However, discount levels with relatively few orders should be interpreted cautiously.

### Business Impact
Discount strategy should be evaluated alongside sales performance before making pricing decisions.

## Investigation 4 - Customer Segment Analysis

### Business Question

Which customer segment generates the greatest business value?

### Findings

Consumer generated the highest sales, the highest profit, and the largest number of orders, making it the company's largest revenue-generating segment.

However, Home Office generated the highest average profit per order, suggesting that although it is a smaller segment, each transaction is more profitable on average.

### Recommendation

Continue investigating in the Consumer segment because of its scale, but investigate why Home Office orders generate higher profit per transaction. Those insights may reveal opportunities to improve profitability across other customer segments.

### Limitations

This analysis does not account for customer acquisition costs, repeat purchase behavior, marketing spend, or product mix. Additional analysis is needed before recommending changes to resource allocation.

## Investigation 5 - Regional Investment Analysis

### Business Question

Which region should receive additional investment?

### Hypothesis

I believe the West region will be the strongest candidate because I expect it to generate the highest overall profit while maintaining strong sales performance.

### SQL Techniques Used

- GROUP BY
- Aggregate Functions
- ORDER BY
- Multi-level analysis

### Findings

The West region led in total sales, total profit, total orders, and profit margin. It also outperformed the other regions in Office Supplies and Furniture profitability, indicating that its success is driven by multiple product categories rather than a single area of strength.

## Recommendation

Based on the available data, I recommend investing in the West region. Its strong performance across multiple key performance indicators suggests that additional investment is likely to generate a favorable return.

## Limitations

This recommendation is based solely on historical sales data. Additional information, such as regional population, market saturation, customer acquisition costs, and competitor presence, would strengthen future investment decisions.

## Next Investigation

Determine whether customer behavior differs across regions and identify which customer segments drive regional success.