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

-- Rank customers by total spend using window functions
-- Useful for loyalty targeting and revenue concentration analysis

SELECT 
    customer_id,
    SUM(order_amount) AS total_spent,
    RANK() OVER (
        ORDER BY SUM(order_amount) DESC
    ) AS spend_rank
FROM orders
GROUP BY customer_id
ORDER BY spend_rank;