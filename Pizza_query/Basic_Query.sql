-- Retrieve the total number of orders placed.

SELECT 
    COUNT(order_id) AS total_orders
FROM
    orders;
   
   
   
-- Calculate the total revenue generated from pizza sales.
SELECT 
    round(sum(pizzas.price*order_details.quantity),2) as total_revenue
FROM
    pizzas
        JOIN
    order_details ON pizzas.pizza_id = order_details.pizza_id;
    
    
-- Identify the highest-priced pizza.
SELECT 
    pizza_type_id, price
FROM
    pizzas
GROUP BY pizza_type_id
ORDER BY price DESC
LIMIT 1;

-- Identify the most common pizza size ordered.
SELECT 
    pizzas.size, COUNT(order_details.order_id) AS no_of_orders
FROM
    pizzas
        JOIN
    order_details ON pizzas.pizza_id = order_details.pizza_id
GROUP BY pizzas.size
ORDER BY no_of_orders DESC;

-- List the top 5 most ordered pizza types along with their quantities.
SELECT 
    pizza_types.name, sum(order_details.quantity) AS quantity
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.name
ORDER BY quantity DESC
LIMIT 5;