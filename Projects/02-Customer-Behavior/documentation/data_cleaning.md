## Missing Customer ID
- Retained for overall business analysis.
- Excluded when customer identity is required.

## Missing Description
- Transactions retained.
- Canonical product descriptions created seperately.

## Bad Debt Adjustments
- Excluded from sales/customer analysis.

## Cancellations / Returns
- Retained.
- Treated seperately depending on the metric.

## Exact Duplicate Rows
- Retained because the source does not provide enough evidence to determine whether they are erroneous.

## Product Descriptions
- StockCode treated as the stable product identifier.
- Most frequently occuring valid description selected as the canonical description.
- Products without a reliable description labeled "UNKNOWN DESCRIPTION."