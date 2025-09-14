# Data Cleaning Scripts

This folder contains PostgreSQL scripts designed to clean and prepare raw data for analysis, dashboarding, and business decision-making. Each script demonstrates practical techniques used in real-world workflows and interview scenarios.

---

## 🧼 Included Scripts

### `null_handling.sql`
Replaces NULLs and empty strings with fallback values using `COALESCE`, `CASE`, and `TRIM`.  
**Use case**: Prepping customer contact fields for segmentation and dashboard filters.

### `string_cleaning.sql`
Cleans messy text fields by trimming whitespace, standardizing casing, and removing special characters using `TRIM`, `LOWER`, `INITCAP`, and `REGEXP_REPLACE`.  
**Use case**: CRM cleanup, NLP prep, and email campaign readiness.

### `type_casting.sql`
Converts raw text fields into proper data types using `CAST`, `TO_DATE`, and conditional logic.  
**Use case**: Ensures schema alignment for joins, filters, and dashboard metrics.

### `outlier_removal.sql`
Flags extreme values in numeric fields using the Interquartile Range (IQR) method via `PERCENTILE_CONT` and `CASE`.  
**Use case**: Sales anomaly detection, fraud screening, and data quality control.

---

## 💡 Portfolio Impact

These scripts are designed to:
- Simulate realistic data issues
- Demonstrate hands-on SQL fluency
- Prepare datasets for Tableau, Power BI, or Snowflake integration
- Showcase problem-solving and business logic layering
