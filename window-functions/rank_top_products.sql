-- Rank top-selling products by region using window functions
-- Useful for identifying regional leaders and optimizing inventory strategy

SELECT 
    region,
    product_name,
    SUM(sales_amount) AS total_sales,
    RANK() OVER (
        PARTITION BY region 
        ORDER BY SUM(sales_amount) DESC
    ) AS product_rank
FROM sales_data
GROUP BY region, product_name
ORDER BY region, product_rank;
