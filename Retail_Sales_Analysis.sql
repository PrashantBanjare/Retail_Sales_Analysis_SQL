create database if not exists Retail_Sales;
use Retail_Sales;

-- table--
CREATE TABLE IF NOT EXISTS retail_sales (
    transactions_id INT PRIMARY KEY,
    sale_date DATE,
    sale_time TIME,
    customer_id INT,
    gender VARCHAR(10),
    age INT,
    category VARCHAR(15),
    quantity INT,
    price_per_unit FLOAT,
    cogs FLOAT,
    total_sale FLOAT
);
  -- ### DATA CLEANING ### --
SELECT 
    *
FROM
    retail_sales
LIMIT 10;

-- count the data --
SELECT 
    COUNT(*)
FROM
    retail_sales;-- 1987 =  it is nomber of rows--

SELECT 
    *
FROM
    retail_sales
WHERE
    transactions_id IS NULL
        OR sale_date IS NULL
        OR sale_time IS NULL
        OR gender IS NULL;-- it shows no null value--

DELETE FROM retail_sales 
WHERE
    transactions_id IS NULL
    OR sale_date IS NULL
    OR sale_time IS NULL
    OR gender IS NULL;-- it will give an error because we dont have null values -- 
    
SELECT 
    COUNT(*)
FROM
    retail_sales;


-- ### DATA EXPLORATION ### --

SELECT 
    COUNT(transactions_id) AS total_sales
FROM
    retail_sales;-- answer = 1987 -- 

SELECT 
    COUNT(DISTINCT (customer_id)) AS customers
FROM
    retail_sales;-- answer = 155

SELECT DISTINCT
    (category)
FROM
    retail_sales;   -- answer = 3, Beauty, Clothing, Electronics.

------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 	               ## START THE QUERIES ## --
------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05
select * from retail_sales where sale_date = '2022-11-05';


-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 2 in the month of Nov-2022
SELECT 
    *
FROM
    retail_sales
WHERE
    category = 'Clothing'
        AND EXTRACT(MONTH FROM sale_date) = 11
        AND EXTRACT(YEAR FROM sale_date) = 2022
        AND quantity > 2;


-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
SELECT 
    category, SUM(total_sale) AS Total_Sales
FROM
    retail_sales
GROUP BY category;


-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
SELECT 
    category, AVG(age)
FROM
    retail_sales
WHERE
    category = 'Beauty'
GROUP BY category;

-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
SELECT 
    *
FROM
    retail_sales
WHERE
    total_sale > '1000';

-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
SELECT 
    category, gender, SUM(transactions_id)
FROM
    retail_sales
GROUP BY category , gender;

-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year
SELECT 
    EXTRACT(YEAR FROM sale_date) AS Years,
    EXTRACT(MONTH FROM sale_date) AS months,
    AVG(total_sale) AS average,
    RANK() OVER(partition by EXTRACT(YEAR FROM sale_date) order by AVG(total_sale) desc) as Best_selling_month
FROM
    retail_sales
GROUP BY Years , months;

-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 
SELECT 
    customer_id, MAX(total_sale) AS max_sale
FROM
    retail_sales
GROUP BY customer_id
ORDER BY max_sale DESC
LIMIT 5;


-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
SELECT 
    COUNT(DISTINCT (customer_id)) AS dist_cust, category
FROM
    retail_sales
GROUP BY category;

-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)
SELECT 
    COUNT(transactions_id) AS total_orders,
    CASE
        WHEN EXTRACT(HOUR FROM sale_time) < 12 THEN 'Morning'
        WHEN EXTRACT(HOUR FROM sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS shift
FROM
    retail_sales
GROUP BY shift;
