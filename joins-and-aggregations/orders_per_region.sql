DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name TEXT,
    region TEXT
);

INSERT INTO customers (customer_id, customer_name, region) VALUES
(101, 'Marcus Wright', 'South'),
(102, 'Ava Johnson', 'East'),
(103, 'Liam Carter', 'West'),
(104, 'Nia Patel', 'South'),
(105, 'Ethan Kim', 'East');

-- Count total orders per region by joining customers and orders
-- Useful for identifying regional activity and volume trends

SELECT 
    c.region,
    COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.region
ORDER BY total_orders DESC;