-- active_customers_last_30_days.sql
-- Purpose: Identify customers with recent activity using date filtering
-- Portfolio Note: Demonstrates CTEs, date logic, and DISTINCT filtering

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
(1, 101, CURRENT_DATE - INTERVAL '10 days', 100),
(2, 102, CURRENT_DATE - INTERVAL '35 days', 150),
(3, 103, CURRENT_DATE - INTERVAL '5 days', 200),
(4, 104, CURRENT_DATE - INTERVAL '60 days', 300),
(5, 105, CURRENT_DATE - INTERVAL '25 days', 250),
(6, 106, CURRENT_DATE - INTERVAL '2 days', 100);

-- CTE to filter recent orders
WITH recent_orders AS (
  SELECT 
    customer_id,
    order_date,
    order_amount
  FROM orders
  WHERE order_date >= CURRENT_DATE - INTERVAL '30 days'
)
SELECT DISTINCT customer_id
FROM recent_orders
ORDER BY customer_id;