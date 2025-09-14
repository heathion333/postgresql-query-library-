-- string_cleaning.sql
-- Purpose: Clean and standardize string fields for analysis and dashboarding
-- Portfolio Note: Demonstrates TRIM, LOWER, REPLACE, and REGEXP_REPLACE

-- Drop and recreate temp table
DROP TABLE IF EXISTS messy_strings;

CREATE TEMP TABLE messy_strings (
    customer_id INT,
    full_name TEXT,
    email TEXT,
    notes TEXT
);

-- Insert messy data
INSERT INTO messy_strings VALUES
(1, '  Marcus L. Wright  ', '  MARCUS@EXAMPLE.COM  ', 'Great! Client #1'),
(2, 'JANE DOE', 'Jane.Doe@Example.com', 'Follow-up needed...'),
(3, 'john-smith', 'john_smith@example.com', 'VIP!'),
(4, '  aLiCe   ', 'ALICE@EXAMPLE.COM', '  New lead '),
(5, '', NULL, 'Check-in: overdue');

-- Clean the strings
SELECT 
    customer_id,
    INITCAP(TRIM(full_name)) AS cleaned_name,
    LOWER(TRIM(email)) AS cleaned_email,
    REGEXP_REPLACE(TRIM(notes), '[^a-zA-Z0-9 ]', '', 'g') AS cleaned_notes
FROM messy_strings;