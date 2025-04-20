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

- **Top payment methods**: Retrieves the payment method and the count of transactions for each method.
- **Top rated category**: Finds the category with the highest average customer rating.
- **Day of the month with the highest number of transactions**: Identifies the day of the month with the most transactions.
- **Rating statistics by city and category**: Retrieves the max, min, and average rating for each city and category combination.
- **Categories ranked by total sales**: Displays categories sorted by their total sales in descending order.
- **Most frequently used payment method per branch**: Shows which payment method is most frequently used in each branch.
- **Transaction count distribution by time of day**: Analyzes the distribution of transactions across different times of day (Morning, Afternoon, Evening).
- **Year with the highest revenue drop**: Analyzes the yearly revenue and finds the year with the most significant drop in revenue compared to the previous year.

## Instructions

### Python Data Cleaning
1. Clone this repository to your local machine:
    ```bash
    git clone https://github.com/YOUR_USERNAME/walmart-sales-analysis.git
    ```
2. Open the Jupyter notebook `walmart_data_cleaning.ipynb` to view and run the data cleaning process.
3. Ensure you have the necessary libraries installed:
    ```bash
    pip install pandas numpy matplotlib seaborn
    ```
4. Run the notebook to clean the dataset.

### Running SQL Queries
1. Import the dataset (`walmart.csv`) into your SQL Server.
2. Run the queries from the `walmart_queries.sql` file in your SQL Server or any SQL tool of your choice.

## Dataset Information
- **invoice_id**: Unique identifier for each transaction.
- **Branch**: The Walmart branch where the transaction occurred.
- **City**: The city where the branch is located.
- **category**: The product category.
- **unit_price**: The price of a single unit of the product.
- **quantity**: The number of items sold in the transaction.
- **date**: The date of the transaction.
- **time**: The time of the transaction.
- **payment_method**: The method of payment used in the transaction (e.g., Credit card, Ewallet).
- **rating**: Customer rating for the product.
- **profit_margin**: Profit margin for the product.

## Results and Analysis
The analysis includes insights such as:
- The most frequently used payment method.
- The best-rated product category.
- Daily transaction trends.
- Yearly revenue changes.

## Contribution
Feel free to fork this repository and contribute by opening a pull request.

---

### Contact:
For any questions, feel free to contact me at [your_email@example.com].

---

## License:
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
