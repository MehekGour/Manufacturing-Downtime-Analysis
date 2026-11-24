USE Manufacturing_analysis;

SELECT 
    *
FROM
    downtime_factors AS df
LIMIT 10;

-- Count total rows
SELECT 
    COUNT(*) AS total_rows
FROM
    downtime_factors;
    
-- Check NULL values
SELECT 
    *
FROM
    downtime_factors
WHERE
    Factor IS NULL OR Description IS NULL
        OR `Operator Error` IS NULL
        OR `Is Operator Error` IS NULL;
