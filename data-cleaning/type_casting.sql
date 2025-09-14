-- type_casting.sql
-- Purpose: Convert raw text fields into proper data types for analysis
-- Portfolio Note: Demonstrates CAST, TO_DATE, and CASE logic for schema alignment

-- Drop and recreate temp table
DROP TABLE IF EXISTS raw_orders;

CREATE TEMP TABLE raw_orders (
    order_id TEXT,
    order_date TEXT,
    order_amount TEXT,
    active_flag TEXT
);

-- Insert messy data
INSERT INTO raw_orders VALUES
('001', '2025-09-01', '100.50', 'TRUE'),
('002', '2025-09-02', '250', 'false'),
('003', '2025/09/03', 'N/A', 'True'),
('004', '', '300.75', 'FALSE'),
('005', '2025-09-05', NULL, 'true');

-- Clean and cast the data
SELECT 
    CAST(order_id AS INTEGER) AS order_id_int,
    TO_DATE(order_date, 'YYYY-MM-DD') AS order_date_clean,
    CASE 
        WHEN order_amount ~ '^[0-9.]+$' THEN CAST(order_amount AS NUMERIC)
        ELSE NULL
    END AS order_amount_clean,
    CASE 
        WHEN LOWER(active_flag) = 'true' THEN TRUE
        WHEN LOWER(active_flag) = 'false' THEN FALSE
        ELSE NULL
    END AS active_flag_bool
FROM raw_orders;