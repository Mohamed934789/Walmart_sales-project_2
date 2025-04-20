# Walmart Sales Analysis Project

## Overview
This project involves analyzing Walmart sales data using Python and SQL. The dataset contains transactional information about the sales of various products across different branches, cities, and categories. The analysis includes cleaning the data, performing SQL queries for insights, and visualizing the results.

## Files in this Repository:
1. **walmart_data_cleaning.ipynb**: Jupyter notebook for cleaning and preprocessing the Walmart dataset using Python.
2. **walmart_queries.sql**: SQL queries for performing different analysis on the Walmart sales data.
3. **walmart.csv**: The dataset containing transactional data for Walmart sales.

## Project Description
This project contains the following tasks:

### 1. Data Cleaning
The `walmart_data_cleaning.ipynb` file contains Python code to clean the dataset. This includes:
- Removing duplicates.
- Handling missing values.
- Converting data types (e.g., converting the `unit_price` to a numeric format).
- Dropping irrelevant columns and rows with invalid data.

### 2. SQL Queries
The `walmart_queries.sql` file contains various SQL queries for data analysis:

```sql
-- the methods and the transactions
SELECT payment_method, COUNT(*) 
FROM walmart
GROUP BY payment_method;
```
-- Top Rated Category by Average Customer Rating
```sql
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
```
-- Get the day of the month with the highest number of transactions from Walmart table
```sql
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
```
-- Number of transactions per payment method in the Walmart table
```sql
SELECT payment_method, COUNT(*)
FROM walmart
GROUP BY payment_method;
```
-- Rating statistics (Max, Min, Avg) grouped by city and category
```sql
SELECT 
    city, 
    category, 
    MAX(rating) AS MaxRating,
    MIN(rating) AS MinRating,
    AVG(rating) AS AvgRating
FROM walmart 
GROUP BY city, category;
```
-- Top Categories by Total Sales
```sql
SELECT 
    category, 
    SUM(Total) AS TotalSales
FROM walmart
GROUP BY category
ORDER BY SUM(Total) DESC;
```
-- Most Frequent Payment Method per Branch
```sql
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
```
-- Transaction count distribution by time of day (Morning / Afternoon / Evening)
```sql
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
```
-- The year with the highest revenue drop compared to the previous year
```sql
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
```
import pandas as pd 
df = pd.read_csv('Walmart.csv')
df.head()

# Initial info and shape of the data
df.shape
df.info()

# Handling missing values
df.isnull().sum()

# Remove duplicates
df.duplicated().sum()
df.drop_duplicates(inplace=True)

# Check for missing data again after dropping duplicates
df.isna().sum()

# Dropping rows with missing values
df.dropna(inplace=True)

# After cleaning
df.isna().sum()

# Clean the 'unit_price' column to convert it to numeric
df['unit_price'] = df['unit_price'].replace('[\$,]', '', regex=True).astype(float)

# Final cleaned data
df.head()


Conclusion
This repository provides all the necessary steps to analyze Walmart's sales data. It includes both SQL queries for aggregating and summarizing data and Python scripts for cleaning and preparing the data for further analysis.

