# Walmart Sales Analysis — learning project

Run `walmart_data_cleaning.ipynb` from here after installing `requirements.txt` with Python 3.12.
It preserves `Walmart.csv`, converts dates before export, and writes `reports/Walmart_cleaned.csv`.
SQL export is opt-in through `WALMART_SQL_URL` and replaces only the explicitly configured practice
table. Install pyodbc and the appropriate system ODBC driver separately for SQL Server.

`walmart_queries.sql` contains completed SQL Server queries. Payment-method modes are now ranked
per branch with ties; the abandoned incomplete CTE was removed. The revenue-drop measure is an
absolute currency change, not a percentage. No live SQL Server verification is claimed.
