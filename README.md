# Pizza-Sales-Dashboard

Title: Pizza Sales Analytics Dashboard 2015

![pizza sales dashboard-1](https://github.com/user-attachments/assets/6b18c3a8-f6f3-4b77-a636-12108503d939)


### Description: 

This project involves the creation of a Pizza Sales Analytics Dashboard to provide insights into sales performance and customer behavior throughout the year 2015. The dashboard displays total revenue, total pizzas sold, total orders, average pizzas per order, and average order value. It also includes data on customer trends by day, peak order hours, monthly sales, and popular and least popular pizza varieties.


### Objectives:

- To visualize and analyze pizza sales data to identify trends and patterns.
  
- To understand customer behavior in terms of order frequency and peak times.
  
- To identify the best-selling and least popular pizzas to inform inventory and marketing strategies.

  
### Goals:

- To improve decision-making through a clear visual representation of sales data.
  
- Increase overall revenue by optimizing sales and marketing strategies based on customer preferences and behaviors.
  
- Enhance customer satisfaction by ensuring availability of popular pizza varieties and optimizing peak hour operations.
  

### Scope:

- The dashboard covers pizza sales data for the entire year of 2015
  
- It includes analysis of revenue, total pizzas sold, total orders, and average order metrics.
  
- Customer trends, peak hours, monthly sales, and pizza popularity are analyzed.
  
### Limitations:

- The data does not include detailed reasons for sales fluctuations or customer preferences.
  
- The analysis is limited to the available data of 2015 and does not account for external factors affecting sales.
  
## Data Description

Data Sources: 

- The data for this project was sourced from the pizza restaurant's sales records, including transaction details, order timestamps, and product information.
  
Collection Methods: 

- The data was extracted from the restaurant's point-of-sale (POS) system and compiled into a structured format for analysis and visualization.

  ## Tools
  - Excel :      Used for data cleaning
  - SQL Server : Used for Data Analysis
  - Power BI :   Used for visualization.

## Methodology

Data Cleaning:
- Removed duplicates and irrelevant records.
- Handled missing values by imputing or excluding incomplete records.
- Standardized data formats for consistency (e.g., dates, product names).
  
Data Preprocessing:
- Categorized sales data by day, hour, month, and pizza type.
- Calculated total revenue, total pizzas sold, total orders, average pizzas per order, and average order value.
- Aggregated data for visualization (e.g., customer trends by day, monthly sales).


## Data Analysis

Some questions answered  in this project with code:

1. How many customers do we have each day?
``` sql
SELECT
    TO_CHAR(date, 'FMDay') AS days_of_the_week,
    COUNT(*) AS total_customers
FROM orders_table
GROUP BY days_of_the_week
ORDER BY total_customers DESC;
```

2. Top five pizza bestsellers?
``` sql
SELECT name,
	SUM(quantity * price) AS revenue
FROM order_details
JOIN pizzas_table ON order_details.pizza_id = pizzas_table.pizza_id
JOIN pizza_types_table ON pizzas_table.pizza_type_id = pizza_types_table.pizza_type_id
GROUP BY name
ORDER BY revenue DESC
LIMIT 5;
```
  
## Results
Summary of Key Findings and Insights

Overall Performance:

- Total revenue for 2015 was $817,805.
- A total of 49,570 pizzas were sold across 21,350 orders.
- The average pizza per order was 2, and the average order value was $38.3.

Customer Trends:

- The number of customers peaks on Fridays (0.157) and is lowest on Sundays (0.127).
  
- Peak hours for orders are between 12 PM and 2 PM, with the highest number of orders at 12 PM (2,520).
  
Monthly Sales:

- Sales are highest in January (1,929) and lowest in December (1,585).
  
- Monthly sales show fluctuations, with notable peaks in the early and mid-year periods.
  
Pizza Popularity:

- The top 5 best-selling pizzas are The Thai Chicken Pizza ($43K), The Barbecue Chicken Pizza ($43K), The California Pizza ($41K), The Classic Deluxe Pizza ($38K), and The Spicy Italian Pizza ($35K).
  
- The 5 least popular pizzas are The Soppressata Pizza (961), The Spinach Pizza (950), The Calabrese Pizza (937), The Mediterranean Pizza (934), and The Brie Caramelized Onion Pizza (490).
  

## Conclusion

- The Pizza Sales Analytics Dashboard provides a comprehensive view of the restaurant's sales performance and customer behavior in 2015. It highlights key trends in customer activity, peak order times, monthly sales variations, and pizza popularity. The insights gained from this analysis can inform strategic decisions to optimize sales, marketing, and inventory management.

## Recommendations

- Increase staffing and streamline operations during peak hours (12 PM - 2 PM) to handle the high volume of orders efficiently.
  
- Implement special promotions or discounts during non-peak hours to balance customer traffic.

- Ensure the availability of top-selling pizzas like The Thai Chicken Pizza and The Barbecue Chicken Pizza to meet customer demand.
  
- Promote the least popular pizzas through special offers or limited-time discounts to increase their sales.

- Analyze the reasons behind the high sales in January and implement similar strategies in other months to boost overall sales.
  
- Plan targeted marketing campaigns during months with traditionally lower sales to drive customer engagement.

- Leverage customer trends data to plan events or promotions on days with lower customer activity (e.g., Sundays).
  
- Use loyalty programs or incentives to encourage repeat purchases and increase average order value.

- Continuously update the dashboard with real-time data to monitor sales performance and customer behavior.
  
- Use the insights from the dashboard to make informed decisions on menu offerings, pricing strategies, and marketing efforts.
