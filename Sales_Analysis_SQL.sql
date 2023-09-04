---Inspecting Data
select * from customers

-- unique values
select distinct status from customers 
select distinct year_id from customers
select distinct PRODUCTLINE from customers 
select distinct COUNTRY from customers 
select distinct DEALSIZE from customers 
select distinct TERRITORY from customers 

select distinct MONTH_ID from customers
where year_id = 2003

---ANALYSIS
----Let's start by grouping sales by productline
select PRODUCTLINE, sum(sales) Revenue
from customers
group by PRODUCTLINE
order by 2 desc


select YEAR_ID, sum(sales) Revenue
from customers
group by YEAR_ID
order by 2 desc

select  DEALSIZE,  sum(sales) Revenue
from customers
group by  DEALSIZE
order by 2 desc


--What was the best month for sales in a specific year? How much was earned that month? 
select  MONTH_ID, sum(sales) Revenue, count(ORDERNUMBER) Frequency
from customers
where YEAR_ID = 2004 --change year to see the rest
group by  MONTH_ID
order by 2 desc


--November seems to be the month, what product do they sell in November, Classic I believe
select  MONTH_ID, PRODUCTLINE, sum(sales) Revenue, count(ORDERNUMBER)
from customers
where YEAR_ID = 2004 and MONTH_ID = 11 --change year to see the rest
group by  MONTH_ID, PRODUCTLINE
order by 3 desc


--What city has the highest number of sales in a specific country
select city, sum (sales) Revenue
from customers
where country = 'UK'
group by city
order by 2 desc



---What is the best product in United States?
select country, YEAR_ID, PRODUCTLINE, sum(sales) Revenue
from customers
where country = 'USA'
group by  country, YEAR_ID, PRODUCTLINE
order by 4 desc
