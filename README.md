# Pizza Sales Analysis

This repository contains the `Pizza_sales` dataset and SQL queries for analyzing various aspects of pizza sales. 
The dataset includes information about pizzas, pizza types, orders, and order details. The analysis is divided into three levels: Beginner, Intermediate, and Advanced.

## Datasets

### 1. Pizzas

- `Pizza_id`: varchar, not null, primary key
- `Pizza_type_id`: Name of pizza without size
- `Size`: Size of pizza (s, m, l)
- `Price`: Price of pizza

### 2. Pizza_types

- `Pizza_type_id`: Identifier for the pizza type
- `Name`: Name of the pizza type
- `Category`: Category of the pizza (chicken, supreme, classic, veggie)
- `Ingredients`: Ingredients of the pizza

### 3. Orders

- `Order_id`: Identifier for the order
- `Order_date`: Date of the order
- `Order_time`: Time of the order

### 4. Order_details

- `Order_details`: Details of the order
- `Order_id`: Identifier for the order
- `Pizza_id`: Identifier for the pizza
- `Quantity`: Quantity of the pizza ordered

## SQL Analysis Levels

### Beginner Level

1. Retrieve the total number of orders placed.
2. Calculate the total revenue generated from pizza sales.
3. Identify the highest-priced pizza.
4. Identify the most common pizza size ordered.
5. List the top 5 most ordered pizza types along with their quantities.

### Intermediate Level

1. Join the necessary tables to find the total quantity of each pizza category ordered.
2. Determine the distribution of orders by hour of the day.
3. Join relevant tables to find the category-wise distribution of pizzas.
4. Group the orders by date and calculate the average number of pizzas ordered per day.
5. Determine the top 3 most ordered pizza types based on revenue.

### Advanced Level

1. Calculate the percentage contribution of each pizza type to total revenue.
2. Analyze the cumulative revenue generated over time.
3. Determine the top 3 most ordered pizza types based on revenue for each pizza category.

## Queries

The SQL queries for solving the above tasks are provided in the `Pizza_Query` folder. 
Each query is named according to the task it addresses and includes comments for clarity.
