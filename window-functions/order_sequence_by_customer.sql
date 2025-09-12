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

-- Assign row numbers to each customer's orders by date
-- Useful for identifying first-time buyers or tracking order sequence
SELECT 
    customer_id,
    order_id,
    order_date,
    order_amount,
    ROW_NUMBER() OVER (
        PARTITION BY customer_id 
        ORDER BY order_date
    ) AS order_sequence
FROM orders;