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

-- Calculate average order value per customer
-- Useful for identifying high-value customers and spend behavior

SELECT 
    customer_id,
    AVG(order_amount) AS avg_order_value
FROM orders
GROUP BY customer_id
ORDER BY avg_order_value DESC;