-- repeat_customers.sql
-- Purpose: Identify customers with multiple orders
-- Portfolio Note: Demonstrates GROUP BY, HAVING, and customer segmentation logic

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
(2, 102, '2025-01-05', 150),
(3, 101, '2025-02-10', 200),
(4, 103, '2025-03-15', 300),
(5, 104, '2025-04-20', 250),
(6, 102, '2025-05-25', 100),
(7, 105, '2025-06-30', 500),
(8, 101, '2025-07-05', 120);

-- Identify repeat customers
SELECT 
    customer_id,
    COUNT(order_id) AS total_orders
FROM orders
GROUP BY customer_id
HAVING COUNT(order_id) > 1
ORDER BY total_orders DESC;