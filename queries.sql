CREATE DATABASE sales_project;
USE sales_project;

CREATE TABLE train (
Row_ID INT,
Order_ID VARCHAR(50),
Order_Date VARCHAR(50),
Ship_Date VARCHAR(50),
Ship_Mode VARCHAR(50),
Customer_ID VARCHAR(50),
Customer_Name VARCHAR(100),
Segment VARCHAR(50),
Country VARCHAR(50),
City VARCHAR(50),
State VARCHAR(50),
Postal_Code VARCHAR(20),
Region VARCHAR(50),
Product_ID VARCHAR(50),
Category VARCHAR(50),
Sub_Category VARCHAR(50),
Product_Name VARCHAR(150),
Sales FLOAT
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/train.csv'
INTO TABLE train
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


SELECT * FROM train LIMIT 10;

Select region,SUM(sales) as total_sales 
from train
group by region
order by total_sales desc;

Select city,sum(sales) as total_sales
from train
group by city
order by total_sales desc limit 10;

Select category,sum(sales) as total_sales
from train
group by category;

select *from train;
Select customer_name,sum(sales) as total_sales
from train
group by customer_name order by total_sales desc;

Select count(distinct order_id) as total_orders from train;

select region,sum(sales) as total_sales from train
group by region order by total_sales desc;

select city,sum(sales) as total_sales from train
group by city order by total_sales desc limit 5;

select * from train;
select category,sum(sales) as total_sales from train
group by category order by total_sales desc;

select customer_name,sum(sales) as total_sales from train
group by customer_name order by total_sales desc;

select *from train;
select order_id,avg(sales) as avg_sales from train
group by order_id order by avg_sales desc;

select state,sum(sales) as total_sales from train
group by state order by total_sales asc;

select *from train;
select product_name,sum(sales) as total_sales from train
group by product_name order by total_sales desc limit 3;

select segment,sum(sales) as total_sales from train
group by segment order by total_sales desc;

select city , count(distinct order_id) as total_orders, sum(sales) as total_sales from train 
group by city having total_orders >50  order by total_sales asc;

SELECT SUM(Sales) / COUNT(DISTINCT Order_ID) AS avg_sales_per_order
FROM train;

SELECT 
    DATE_FORMAT(STR_TO_DATE(Order_Date, '%d-%m-%Y'), '%Y-%m') AS month,
    SUM(Sales) AS total_sales
FROM train
GROUP BY month
ORDER BY total_sales desc;

select date_format(str_to_date(order_date,'%d-%m-%Y'),'%Y-%m') as month,sum(sales) as total_sales from train
group by month order by total_sales desc limit 5;

select date_format(str_to_date(order_date,'%d-%m-%Y'),'%Y-%m') as month,count(distinct order_id) as total_orders from train
group by month order by month;