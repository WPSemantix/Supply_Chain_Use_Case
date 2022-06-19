-- ------------------------------------------------------------
-- Third query of the data that finds the number of orders per shipping mode for customers in the Home Office segment, including their name and sum profit of their total orders
-- ------------------------------------------------------------
SELECT `for_customer[customer].customer_name` as customer_name, `shipping_mode`, COUNT(distinct `has_order[order].order_id`) as num_of_orders, 
SUM(`has_order[order].order_profit`) as total_order_profit
FROM dtimbr.`shipment`
WHERE `for_customer[customer].customer_segment` = 'Home Office' and `has_order[order].market` = 'Europe'
GROUP BY `for_customer[customer].customer_name`, `shipping_mode`
HAVING COUNT(distinct `has_order[order].order_id`) > 1
-- ------------------------------------------------------------
