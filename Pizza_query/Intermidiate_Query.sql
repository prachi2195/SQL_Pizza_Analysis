-- Join the necessary tables to find the total quantity of each pizza category ordered.
SELECT 
    pizza_types.category AS pizza_category, sum(order_details.quantity) AS Total_Quantity
FROM
    pizza_types
        JOIN
    pizzas ON pizzas.pizza_type_id = pizza_types.pizza_type_id
        JOIN
    order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_category
ORDER BY Total_Quantity desc;


-- Determine the distribution of orders by hour of the day.
SELECT 
    HOUR(order_time) as Hour, COUNT(order_id) AS No_of_orders
FROM
    orders
    GROUP BY Hour;
    
    
-- Join relevant tables to find the category-wise distribution of pizzas.
SELECT 
    category,
    COUNT(name) AS name
FROM
    pizza_types
    GROUP BY category;
    
-- Group the orders by date and calculate the average number of pizzas ordered per day.
SELECT 
    ROUND(AVG(quantity),0) AS avg_pizza_sale_perDay
FROM
    (SELECT 
        orders.order_date, SUM(order_details.quantity) as quantity
    FROM
        orders
    JOIN order_details ON orders.order_id = order_details.order_id
    GROUP BY orders.order_date) AS order_quantity;

select count(order_id)/DAY(order_date) from orders;


-- Determine the top 3 most ordered pizza types based on revenue.
SELECT 
    pizza_types.name,
    sum(pizzas.price * order_details.quantity) AS Revenue
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    order_details ON pizzas.pizza_id = order_details.pizza_id
GROUP BY name
ORDER BY Revenue DESC
LIMIT 3;

