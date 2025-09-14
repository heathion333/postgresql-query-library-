-- outlier_removal.sql
-- Purpose: Identify outliers in order amounts using IQR logic
-- Portfolio Note: Demonstrates statistical filtering for data quality and dashboard prep

-- Drop and recreate temp table
DROP TABLE IF EXISTS orders;

CREATE TEMP TABLE orders (
    order_id INT,
    customer_id INT,
    order_amount NUMERIC
);

-- Insert sample data
INSERT INTO orders VALUES
(1, 101, 100),
(2, 102, 150),
(3, 103, 200),
(4, 104, 250),
(5, 105, 300),
(6, 106, 1000),  -- Outlier
(7, 107, 50),
(8, 108, 120),
(9, 109, 5000),  -- Outlier
(10, 110, 180);

-- IQR-based outlier detection
WITH stats AS (
  SELECT 
    PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY order_amount) AS q1,
    PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY order_amount) AS q3
  FROM orders
),
flagged AS (
  SELECT 
    o.*,
    CASE 
      WHEN o.order_amount < (s.q1 - 1.5 * (s.q3 - s.q1)) OR 
           o.order_amount > (s.q3 + 1.5 * (s.q3 - s.q1)) 
      THEN 'Outlier'
      ELSE 'Normal'
    END AS outlier_flag
  FROM orders o, stats s
)
SELECT * FROM flagged;