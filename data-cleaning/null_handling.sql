-- null_handling.sql
-- Purpose: Replace NULLs in customer contact fields for dashboard readiness
-- Portfolio Note: Demonstrates COALESCE and CASE logic for data cleaning

-- Drop and recreate temp table
DROP TABLE IF EXISTS raw_customers;

CREATE TEMP TABLE raw_customers (
    customer_id INT,
    email TEXT,
    phone_number TEXT,
    address TEXT,
    state TEXT,
    zip_code TEXT
);

-- Insert messy rows
INSERT INTO raw_customers VALUES
(1, NULL, NULL, '123 Main St', 'AL', NULL),
(2, 'user@example.com', '555-1234', '', NULL, '35203'),
(3, '', NULL, NULL, 'TX', '00000'),
(4, '   spaced@email.com   ', '   ', '456 Elm St', NULL, ''),
(5, NULL, '999-9999', NULL, '', NULL);

-- Clean the data
SELECT 
    customer_id,
    COALESCE(NULLIF(TRIM(email), ''), 'no_email_provided') AS cleaned_email,
    COALESCE(NULLIF(TRIM(phone_number), ''), '000-000-0000') AS cleaned_phone,
    COALESCE(NULLIF(TRIM(address), ''), 'no_address_available') AS cleaned_address,
    COALESCE(NULLIF(TRIM(state), ''), 'Unknown') AS cleaned_state,
    COALESCE(NULLIF(TRIM(zip_code), ''), '00000') AS cleaned_zip
FROM raw_customers;
