select * from pizza_sales
select SUM(total_price) as Total_Revenue from pizza_sales

select * from pizza_sales
	select SUM(total_price) / COUNT(distinct order_id) as Avg_order_value from pizza_sales
	select SUM(quantity) as Total_Pizza_Sold from pizza_sales
	select COUNT(distinct order_id) as Total_pizza_orders from pizza_sales

	select cast(cast	(SUM(quantity) as decimal(10,2)) / 
	cast(COUNT(distinct order_id) as decimal(10,2)) as decimal(10,2)) as Avg_pizza_per_order from pizza_sales

select * from pizza_sales
--- Daily Trends
	select DATENAME(dw,order_date) as order_day, COUNT(distinct order_id) as Total_orders_per_day from pizza_sales
	group by DATENAME(dw,order_date)

---- Hourly Trends
	select DATEPART(hour,order_time) as order_hours, COUNT(distinct order_id) as Total_order_per_hour from pizza_sales
	group by DATEPART(hour,order_time)
	order by DATEPART(hour,order_time)

select * from pizza_sales
--- Find the percentage of sales
	select pizza_category, SUM(total_price) * 100 / (select SUM(total_price) from pizza_sales) as PCT_sales from pizza_sales
	group by pizza_category
--- adding total sales
	select pizza_category,sum(total_price) as total_sales, SUM(total_price) * 100 / (select SUM(total_price) from pizza_sales) as PCT_sales from pizza_sales
	group by pizza_category
--- Applying filter to fine month wise sales
	select pizza_category,sum(total_price) as total_sales, SUM(total_price) * 100 / (select SUM(total_price) from pizza_sales) as PCT_sales from pizza_sales
	where MONTH(order_date)=1
	group by pizza_category

	select pizza_category,sum(total_price) as total_sales, SUM(total_price) * 100 / 
	(select SUM(total_price) from pizza_sales where MONTH(order_date)=1) as PCT_sales from pizza_sales
	where MONTH(order_date)=1
	group by pizza_category


select * from pizza_sales
	select pizza_size,cast(sum(total_price) as decimal(10,2)) as total_sales,CAST(
	SUM(total_price) * 100 / (select SUM(total_price) from pizza_sales) as decimal(10,2)) as PCT_sales from pizza_sales
	group by pizza_size
	order by PCT_sales desc

	select pizza_size,cast(sum(total_price) as decimal(10,2)) as total_sales,CAST(
	SUM(total_price) * 100 / (select SUM(total_price) from pizza_sales where DATEPART(QUARTER, order_date)=1) as decimal(10,2)) as PCT_sales from pizza_sales
	where DATEPART(QUARTER, order_date)=1
	group by pizza_size
	order by PCT_sales desc

select * from pizza_sales
	select pizza_category, SUM(quantity) as Total_pizza_sold from pizza_sales
	group by pizza_category


select * from pizza_sales
	select top 5 pizza_name, SUM(quantity) as Total_pizza_sold from pizza_sales
	group by pizza_name
	order by Total_pizza_sold desc

	select top 5 pizza_name, SUM(quantity) as Total_pizza_sold from pizza_sales
	group by pizza_name
	order by Total_pizza_sold ASC

	select top 5 pizza_name, SUM(quantity) as Total_pizza_sold from pizza_sales
	where MONTH(order_date)=1
	group by pizza_name
	order by Total_pizza_sold ASC