CREATE DATABASE Manufacturing_analysis;
USE Manufacturing_analysis;

-- Q1. What is the current line efficiency? (min time/total time)

SELECT 
    SUM(p.`Min batch time`) AS min_batch_time,
    SUM(lp.`Production Time(minutes)`) AS total_actual_time,
    ROUND(SUM(p.`Min batch time`) / SUM(lp.`Production Time(minutes)`),
            2) AS line_efficiency
FROM
    line_productivity AS lp
        JOIN
    (SELECT 
        Product, MAX(`Min batch time`) AS `Min batch time`
    FROM
        products
    GROUP BY Product) AS p ON lp.Product = p.Product;


-- Q2. Are any operators underperforming?

SELECT 
    lp.Operator,
    ROUND(AVG(lp.`Production Time(minutes)`), 0) AS Avg_actual_time,
    ROUND(AVG(p.`Min batch time`), 0) AS Avg_expected_time,
    ROUND(AVG(lp.`Production Time(minutes)`), 0) - ROUND(AVG(p.`Min batch time`), 0) AS Delay
FROM
    line_productivity AS lp
        JOIN
    products AS p ON lp.product = p.product
GROUP BY lp.Operator
ORDER BY Delay DESC;

-- Q3. What are the leading factors for downtime?

SELECT 
    df.Description, SUM(ld.`downtime minutes`) AS Total_downtime
FROM
    line_downtime AS ld
        JOIN
    downtime_factors AS df ON ld.factor = df.factor
GROUP BY df.Description
ORDER BY Total_downtime DESC;

-- Q4. Do any operators struggle with particular types of operator error?

SELECT 
    lp.Operator, df.Description, COUNT(*) AS Error_count
FROM
    line_downtime AS ld
        JOIN
    line_productivity AS lp ON ld.Batch = lp.Batch
        JOIN
    downtime_factors AS df ON ld.factor = df.factor
WHERE
    df.`Operator Error` = 'Yes'
GROUP BY lp.Operator , df.Description
ORDER BY Error_count DESC;


