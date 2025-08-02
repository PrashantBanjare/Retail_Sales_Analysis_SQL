# Retail Sales Analysis SQL Project

## Project Overview

**Project Title**: Retail Sales Analysis  
**Level**: Beginner  
**Database**: `p1_retail_db`

This project is designed to demonstrate SQL skills and techniques typically used by data analysts to explore, clean, and analyze retail sales data. 
The project involves setting up a retail sales database, performing exploratory data analysis (EDA), and answering specific business questions through SQL queries. 

## Project Structure

### 1. Database Setup
### 2. Data Exploration & Cleaning
### 3. Data Analysis & Findings

The following SQL queries were developed to answer specific business questions:

1. **Write a SQL query to retrieve all columns for sales made on '2022-11-05**:
2. **Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022**:
3. **Write a SQL query to calculate the total sales (total_sale) for each category.**:
4. **Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.**:
5. **Write a SQL query to find all transactions where the total_sale is greater than 1000.**:
6. **Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.**:
7. **Write a SQL query to calculate the average sale for each month. Find out best selling month in each year**:
8. **Write a SQL query to find the top 5 customers based on the highest total sales **:
9. **Write a SQL query to find the number of unique customers who purchased items from each category.**:
10. **Write a SQL query to create each shift and number of orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17)**:


## Retail Sales Analysis – Key Findings

1. Total Transactions: 1987 records analyzed after data cleaning; original dataset had 2000 rows with 13 missing values dropped.
2. Unique Customers: 155 distinct customers contributed to overall sales, showing a decent customer base for analysis.
3. Top Categories: The dataset includes 3 product categories – Clothing, Beauty, and Electronics.
4. Best-Selling Category: Clothing had the highest number of transactions, indicating it's the most frequently purchased category.
5. High-Value Sales: Transactions exceeding ₹1000 were mostly linked to Electronics and some premium Beauty products.
6. Customer Demographics: The average age of customers buying Beauty products is slightly higher than for other categories.
7. Peak Shopping Times: Most orders were placed during the Afternoon (12 PM – 5 PM), followed by Morning and Evening.
8. Monthly Performance: Using window functions, November emerged as a strong sales month in 2022 across most categories.
9. Top Customers: Top 5 high-spending customers were identified based on their highest single transaction value.
10. Gender-Based Trends: Gender-wise sales data reveals balanced purchasing across categories, with slight dominance of males in Clothing.
