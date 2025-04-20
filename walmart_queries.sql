--the methods and the transactions 
select payment_method , count(*) from walmart
group by payment_method


--Top Rated Category by Average Customer Rating
WITH best_rated_category AS (
    SELECT category AS category_name, AVG(rating) AS average_rating
    FROM walmart
    GROUP BY category
)
SELECT category_name, average_rating
FROM best_rated_category
WHERE average_rating = (
    SELECT MAX(average_rating) FROM best_rated_category
);


---- ?? Get the day of the month with the highest number of transactions from Walmart table

WITH DailyTransactions AS (
    SELECT 
        FORMAT(date, 'dd') AS DayOfMonth,
        COUNT(*) AS TransactionCount
    FROM walmart
    GROUP BY FORMAT(date, 'dd')
)
SELECT 
    DayOfMonth,
    TransactionCount
FROM DailyTransactions
WHERE TransactionCount = (
    SELECT MAX(TransactionCount) FROM DailyTransactions
);

-- ?? Number of transactions per payment method in the Walmart table

select payment_method , count(*)from walmart
group by payment_method;


-- ?? Rating statistics (Max, Min, Avg) grouped by city and category
SELECT 
    city, 
    category, 
    MAX(rating) AS MaxRating,
    MIN(rating) AS MinRating,
    AVG(rating) AS AvgRating
FROM walmart 
GROUP BY city, category;


-- ?? Ranking categories by total sales (highest to lowest)

SELECT 
    category, 
    SUM(Total) AS TotalSales
FROM walmart
GROUP BY category
ORDER BY SUM(Total) DESC;

-- ?? Count of the most frequently used payment method per branch
WITH a AS (
    SELECT TOP 1 
        payment_method
    FROM walmart
    GROUP BY payment_method
    ORDER BY COUNT(*) DESC
)

SELECT 
    w.Branch, 
    COUNT(*) AS PaymentCount
FROM walmart w
JOIN a ON w.payment_method = a.payment_method
GROUP BY w.Branch
ORDER BY PaymentCount DESC;


with a as(

	select time ,count(*)
	case 
	when 
)


-- ? Transaction count distribution by time of day (Morning / Afternoon / Evening)

SELECT 
  CASE 
    WHEN CAST(time AS TIME) BETWEEN '05:00:00' AND '11:59:59' THEN 'Morning'
    WHEN CAST(time AS TIME) BETWEEN '12:00:00' AND '17:59:59' THEN 'Afternoon'
    WHEN CAST(time AS TIME) BETWEEN '18:00:00' AND '23:59:59' THEN 'Evening'
    ELSE 'Late Night'
  END AS TimeOfDay,
  COUNT(*) AS TransactionsCount
FROM walmart
GROUP BY 
  CASE 
    WHEN CAST(time AS TIME) BETWEEN '05:00:00' AND '11:59:59' THEN 'Morning'
    WHEN CAST(time AS TIME) BETWEEN '12:00:00' AND '17:59:59' THEN 'Afternoon'
    WHEN CAST(time AS TIME) BETWEEN '18:00:00' AND '23:59:59' THEN 'Evening'
    ELSE 'Late Night'
  END
ORDER BY TransactionsCount DESC;



-- ?? The year with the highest revenue drop compared to the previous year

WITH yearly_revenue AS (
    SELECT 
        FORMAT(date, 'yyyy') AS year,
        SUM(Total) AS revenue
    FROM walmart
    GROUP BY FORMAT(date, 'yyyy')
),
diffs AS (
    SELECT 
        year,
        revenue,
        revenue - LAG(revenue) OVER (ORDER BY year) AS revenue_diff
    FROM yearly_revenue
)
SELECT TOP 1 *
FROM diffs
WHERE revenue_diff < 0
ORDER BY revenue_diff ASC;
