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

-- Aggregate total sales by month for time series analysis
-- Useful for identifying seasonal trends and forecasting

SELECT 
    DATE_TRUNC('month', order_date) AS sale_month,
    SUM(order_amount) AS total_sales
FROM orders
GROUP BY sale_month
ORDER BY sale_month;