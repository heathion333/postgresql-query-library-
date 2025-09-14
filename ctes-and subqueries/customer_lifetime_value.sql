-- customer_lifetime_value.sql
-- Purpose: Calculate total spend per customer and rank by lifetime value
-- Portfolio Note: Demonstrates CTEs, aggregation, and window functions

-- Drop and recreate temp table
DROP TABLE IF EXISTS orders;

CREATE TEMP TABLE orders (
    order_id INT,
    customer_id INT,
    order_date DATE,
    order_amount NUMERIC
);

-- Insert sample data
INSERT INTO orders VALUES
(1, 101, '2025-01-01', 100),
(2, 101, '2025-02-15', 150),
(3, 102, '2025-03-10', 200),
(4, 103, '2025-04-05', 300),
(5, 101, '2025-05-20', 250),
(6, 102, '2025-06-01', 100),
(7, 104, '2025-07-12', 500);

-- CTE to calculate lifetime value
WITH customer_spend AS (
  SELECT 
    customer_id,
    SUM(order_amount) AS lifetime_value
  FROM orders
  GROUP BY customer_id
),
ranked_customers AS (
  SELECT 
    customer_id,
    lifetime_value,
    RANK() OVER (ORDER BY lifetime_value DESC) AS value_rank
  FROM customer_spend
)
SELECT * FROM ranked_customers;
