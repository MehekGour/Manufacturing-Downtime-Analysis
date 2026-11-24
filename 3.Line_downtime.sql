USE Manufacturing_analysis;
SELECT 
    *
FROM
    line_downtime AS ld
LIMIT 10;

-- Count total rows
SELECT 
    COUNT(*) AS total_rows
FROM
    line_downtime;

-- Check NULL values
SELECT 
    *
FROM
    line_downtime
WHERE
    batch IS NULL OR factor IS NULL
        OR `downtime minutes` IS NULL;
   
-- Check Duplicates
SELECT 
    batch, COUNT(*) AS count
FROM
    line_downtime
GROUP BY batch
HAVING COUNT(*) > 1;
