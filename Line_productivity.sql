USE Manufacturing_analysis;
SELECT 
    *
FROM
    line_productivity AS lp
LIMIT 10;

-- Count total rows
SELECT 
    COUNT(*) AS total_rows
FROM
    line_productivity;

-- Check NULL values
SELECT 
    *
FROM
    line_productivity
WHERE
    Date IS NULL OR Product IS NULL
        OR Batch IS NULL
        OR Operator IS NULL
        OR `Start Time` IS NULL
        OR `End Time` IS NULL
        OR `Production Time(minutes)` IS NULL;
   
-- Check Duplicates
SELECT 
    Batch, COUNT(*) AS count
FROM
    line_productivity
GROUP BY Batch
HAVING COUNT(*) > 1;

-- Unique Batches
SELECT 
    COUNT(DISTINCT Batch) AS unique_batches
FROM
    line_productivity;

-- Check Production Time
SELECT 
    SUM(`Production Time(minutes)`) AS total_actual_time
FROM
    line_productivity;

-- Check each Product
SELECT 
    Product,
    COUNT(*) AS batch_count,
    SUM(`Production Time(minutes)`) AS actual_time
FROM
    line_productivity
GROUP BY Product
ORDER BY Product;
