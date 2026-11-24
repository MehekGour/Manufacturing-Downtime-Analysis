USE Manufacturing_analysis;
SELECT 
    *
FROM
    products AS p
LIMIT 10;

-- Count total rows
SELECT 
    COUNT(*) AS total_rows
FROM
    products;

-- Check NULL values
SELECT 
    *
FROM
    products
WHERE
    Product IS NULL OR Flavor IS NULL
        OR Size IS NULL
        OR `Min batch time` IS NULL
        OR `Size (ml)` IS NULL;
   
-- Check each Product
SELECT 
    Product, `Min batch time`
FROM
    products
ORDER BY Product;

-- Check Duplicates
SELECT 
    Product, COUNT(*) AS count
FROM
    products
GROUP BY Product
HAVING COUNT(*) > 1;