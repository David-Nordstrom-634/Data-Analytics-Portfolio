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