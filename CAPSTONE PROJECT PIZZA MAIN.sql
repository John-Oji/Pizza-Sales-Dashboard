--Creation of orders table
CREATE TABLE orders_table (
    order_id INT PRIMARY KEY,
    date DATE,
    time TIME
);


--Creation of pizza_types table
CREATE TABLE pizza_types_table (
    pizza_type_id VARCHAR(100) PRIMARY KEY,
    name VARCHAR(100),
    category VARCHAR(50),
    ingredients VARCHAR (500)
);

--Creation of pizzas table
CREATE TABLE pizzas_table (
    pizza_id VARCHAR(100) PRIMARY KEY,
    pizza_type_id VARCHAR(100) REFERENCES pizza_types_table(pizza_type_id),
    size VARCHAR(10),
    price DECIMAL(10, 2)
);


--Creation of order_details table
CREATE TABLE order_details (
		order_details_id INT,
		order_id INT REFERENCES orders_table(order_id),
		pizza_id VARCHAR(100) REFERENCES pizzas_table(pizza_id),
		quantity INT
);

SELECT * 
FROM order_details

--1-How many customers do we have each day? Are there any peak hours?

SELECT
    TO_CHAR(date, 'FMDay') AS days_of_the_week,
    COUNT(*) AS total_customers
FROM orders_table
GROUP BY days_of_the_week
ORDER BY total_customers DESC;




---1b. Are there any peak hours?

SELECT 
    TO_CHAR(time, 'HH24:00:00') AS hour_of_the_day,
    COUNT(*) AS no_of_orders
FROM orders_table
GROUP BY hour_of_the_day
ORDER BY no_of_orders DESC
LIMIT 5;

-----OR

SELECT
    LPAD(EXTRACT(HOUR FROM time)::TEXT, 2, '0') || ':00:00' AS hour_of_the_day,
    COUNT(*) AS no_of_orders
FROM orders_table
GROUP BY hour_of_the_day
ORDER BY no_of_orders DESC
LIMIT 5;



---2. How many pizzas are typically in an order? Do we have any bestsellers?

SELECT ROUND(SUM(quantity) / COUNT(DISTINCT order_id), 2) AS avg_no_of_pizza
FROM order_details;

-----OR

SELECT
	 CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2)) AS avg_no_of_pizza
FROM order_details;


2B----Do we have any bestsellers?

SELECT name,
	SUM(quantity * price) AS revenue
FROM order_details
JOIN pizzas_table ON order_details.pizza_id = pizzas_table.pizza_id
JOIN pizza_types_table ON pizzas_table.pizza_type_id = pizza_types_table.pizza_type_id
GROUP BY name
ORDER BY revenue DESC
LIMIT 5;


---3. How much money did we make this year? 
SELECT
	SUM(quantity * price) AS revenue
FROM pizzas_table
JOIN order_details ON pizzas_table.pizza_id = order_details.pizza_id;

---3b. Can we identify any seasonality in the sales?

SELECT 
    TO_CHAR(date, 'Month') AS months,
    COUNT(DISTINCT order_id) AS no_of_orders
FROM orders_table
GROUP BY TO_CHAR(date, 'Month')
ORDER BY no_of_orders DESC;



---4. Are there any pizzas we should take off the menu? (5 least popular pizza varieties in terms of sales)

SELECT pizza_types_table.pizza_type_id, name,
	SUM(quantity) AS pizza_sold
FROM pizza_types_table
JOIN pizzas_table ON pizza_types_table.pizza_type_id = pizzas_table.pizza_type_id
JOIN order_details ON pizzas_table.pizza_id = order_details.pizza_id
GROUP BY pizza_types_table.pizza_type_id, name
ORDER BY pizza_sold
LIMIT 5;

--4b. Top five best-selling pizza types

SELECT pizza_types_table.pizza_type_id, name,
	SUM(quantity) AS pizza_sold
FROM pizza_types_table
JOIN pizzas_table ON pizza_types_table.pizza_type_id = pizzas_table.pizza_type_id
JOIN order_details ON pizzas_table.pizza_id = order_details.pizza_id
GROUP BY pizza_types_table.pizza_type_id, name
ORDER BY pizza_sold DESC
LIMIT 5;

