-- Create a mock customers table for join-and-aggregation queries
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name TEXT,
    region TEXT
);

-- Insert sample data
INSERT INTO customers (customer_id, customer_name, region) VALUES
(101, 'Marcus Wright', 'South'),
(102, 'Ava Johnson', 'East'),
(103, 'Liam Carter', 'West'),
(104, 'Nia Patel', 'South'),
(105, 'Ethan Kim', 'East');

-- Total spend per customer by region
SELECT 
    c.region,
    c.customer_id,
    c.customer_name,
    SUM(o.order_amount) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.region, c.customer_id, c.customer_name
ORDER BY c.region, total_spent DESC;
