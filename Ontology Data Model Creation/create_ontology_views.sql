-- ------------------------------------------------------------
-- Creates first ontology view that will find the average order profit per product by customer segment
-- ------------------------------------------------------------
CREATE OR REPLACE VIEW `order_profit_per_product_and_customer_segment`
    AS  
      SELECT `customer_segment`, `has_ordered[order].includes_product[product].product_name`, COUNT(DISTINCT `has_ordered[order].order_id`) AS `orders`, SUM(`has_ordered[order].revenue`) AS `revenue`, AVG(`has_ordered[order].order_id`) AS `avg_order_profit`
FROM `dtimbr`.`customer`
WHERE `has_ordered[order].includes_product[product].product_name` IS NOT NULL
GROUP BY `customer_segment`, `has_ordered[order].includes_product[product].product_name`

-- ------------------------------------------------------------
-- Creates second ontology view that will find the quantity and the average discount per product category
-- ------------------------------------------------------------
CREATE OR REPLACE VIEW `quantity_and_avg_discount_per_product_category`
    AS  
      SELECT `category` AS `product_category`, COUNT(`in_order[order].order_id`) AS `orders`, SUM(`in_order[order].order_item_quantity`) AS `item_quantity`, AVG(`in_order[order].order_item_discount`) AS `avg_discount`
FROM `dtimbr`.`product`
GROUP BY `category`

-- ------------------------------------------------------------
-- Creates third ontology view that will find the item quantity per product, as well as the inventory city
-- ------------------------------------------------------------
CREATE OR REPLACE VIEW `item_quantity_per_product_and_city`
    AS  
     SELECT `product_name`, `has_inventory[inventory].department` AS `department`, `has_inventory[inventory].inventory_country` AS `inventory_country`, `has_inventory[inventory].inventory_city` AS `inventory_city`, SUM(CAST(`has_inventory[inventory].item_quantity` AS SIGNED)) AS `item_quantity`
FROM `dtimbr`.`product`
WHERE `has_inventory[inventory].department` IS NOT NULL
GROUP BY `product_name`, `has_inventory[inventory].department`, `has_inventory[inventory].inventory_country`, `has_inventory[inventory].inventory_city`
ORDER BY `product_name`, `has_inventory[inventory].department`, `has_inventory[inventory].inventory_country`, `has_inventory[inventory].inventory_city`

-- ------------------------------------------------------------
-- Creates fourth ontology view that will find the order_id's per shipping mode
-- ------------------------------------------------------------
CREATE OR REPLACE VIEW `orders_per_shipping_mode`
    AS  
      SELECT `shipping_mode`, COUNT(DISTINCT `has_order[order].order_id`) AS `order_id`
FROM `dtimbr`.`shipment`
GROUP BY `shipping_mode`

-- ------------------------------------------------------------
-- Creates fifth ontology view that will find products per material, as well as product department 
-- ------------------------------------------------------------
CREATE OR REPLACE VIEW `products_per_material`
    AS  
     SELECT `materials`, `part_of[product].department` AS `department`, COUNT(DISTINCT `part_of[product].product_id`) AS `number_of_products`
FROM `dtimbr`.`material`
GROUP BY `materials`, `part_of[product].department`

-- ------------------------------------------------------------
-- Creates sixth ontology view that will find low inventory products in the United States
-- ------------------------------------------------------------
CREATE OR REPLACE VIEW `us_low_inventory_products`
    AS  
     SELECT `category` AS `product_category`, COUNT(`in_order[order].order_id`) AS `orders`, SUM(`in_order[order].order_item_quantity`) AS `item_quantity`
FROM `dtimbr`.`product`
WHERE `produced_in[plant].plant_country` = 'USA' AND `has_inventory[inventory].item_quantity` < 20
GROUP BY `category`
-- ------------------------------------------------------------
