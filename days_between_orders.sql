DROP TABLE IF EXISTS orders;

CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    order_amount NUMERIC(10,2)
);

INSERT INTO orders (customer_id, order_date, order_amount) VALUES
(101, '2025-07-01', 250.00),
(101, '2025-07-15', 300.00),
(102, '2025-07-20', 150.00),
(101, '2025-08-01', 200.00),
(103, '2025-08-05', 400.00),
(102, '2025-08-10', 175.00),
(103, '2025-08-15', 350.00);

-- Calculate days between customer orders using LAG()
-- Useful for identifying customer engagement patterns and churn risk
SELECT 
    customer_id,
    order_date,
    LAG(order_date) OVER (
        PARTITION BY customer_id 
        ORDER BY order_date
    ) AS previous_order_date,
    order_date - LAG(order_date) OVER (
        PARTITION BY customer_id 
        ORDER BY order_date
    ) AS days_between_orders
FROM orders;