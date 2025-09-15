-- nested_subquery_top_products.sql
-- Purpose: Identify top-selling products based on total revenue
-- Portfolio Note: Demonstrates nested subqueries and aggregation logic

-- Drop and recreate temp table
DROP TABLE IF EXISTS product_orders;

CREATE TEMP TABLE product_orders (
    order_id INT,
    product_id INT,
    product_name TEXT,
    quantity INT,
    unit_price NUMERIC
);

-- Insert sample data
INSERT INTO product_orders VALUES
(1, 201, 'Widget A', 5, 20),
(2, 202, 'Widget B', 2, 50),
(3, 203, 'Widget C', 10, 15),
(4, 201, 'Widget A', 3, 20),
(5, 202, 'Widget B', 1, 50),
(6, 204, 'Widget D', 20, 5),
(7, 203, 'Widget C', 5, 15);

-- Subquery to find top-selling product(s) by revenue
SELECT 
    product_id,
    product_name,
    SUM(quantity * unit_price) AS total_revenue
FROM product_orders
GROUP BY product_id, product_name
HAVING SUM(quantity * unit_price) = (
    SELECT MAX(total_revenue)
    FROM (
        SELECT 
            product_id,
            SUM(quantity * unit_price) AS total_revenue
        FROM product_orders
        GROUP BY product_id
    ) AS revenue_summary
)
ORDER BY product_id;