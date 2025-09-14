##  Window Functions

This folder contains PostgreSQL scripts that demonstrate advanced analytical techniques using window functions. Each query is designed to solve real-world business problems and showcase SQL fluency for portfolio and interview use.

### Included Scripts:
- `rank_top_products.sql`  
  Uses `RANK()` to identify top-selling products within each region. Ideal for sales performance and inventory strategy.

- `order_sequence_by_customer.sql`  
  Uses `ROW_NUMBER()` to track the chronological order of customer purchases.

- `first_order_by_customer.sql`  
  Combines `ROW_NUMBER()` with a CTE to isolate each customer’s first order. Useful for first-time buyer analysis.

- `days_between_orders.sql`  
  Uses `LAG()` to calculate the number of days between customer orders. Great for engagement tracking and churn prediction.

