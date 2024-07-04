-- Calculate the percentage contribution of each pizza type to total revenue.
SELECT 
    pizza_types.category,
    ROUND(SUM(pizzas.price * order_details.quantity) / (SELECT 
                    SUM(order_details.quantity * pizzas.price) AS total_sale
                FROM
                    pizzas
                        JOIN
                    order_details ON order_details.pizza_id = pizzas.pizza_id) * 100,
            2) AS total_revenue
FROM
    pizza_types
        JOIN
    pizzas ON pizzas.pizza_type_id = pizza_types.pizza_type_id
        JOIN
    order_details ON pizzas.pizza_id = order_details.pizza_id
GROUP BY pizza_types.category;



-- Analyze the cumulative revenue generated over time.
select order_date, sum(revenue) over(order by order_date) as cum_revenue
from
(select orders.order_date, sum(order_details.quantity * pizzas.price) as revenue
from pizzas join order_details on pizzas.pizza_id = order_details.pizza_id
join orders on order_details.
order_id = orders.order_id group by orders.order_date) as sales;






-- Determine the top 3 most ordered pizza types based on
--  revenue for each pizza category;

select category, name, revenue
from
(select category,name,revenue,
rank() over(partition by category order by revenue desc) as rn
from
(SELECT 
    pizza_types.category,
    pizza_types.name,
    SUM(order_details.quantity * pizzas.price) AS revenue
FROM
    pizzas
        JOIN
    pizza_types ON pizzas.pizza_type_id = pizza_types.pizza_type_id
        JOIN
    order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.category,pizza_types.name) as a) as b
group by category
order by revenue desc;








