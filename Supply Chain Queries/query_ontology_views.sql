-- ------------------------------------------------------------
-- Runs the first view that will find the average order profit per product by customer segment
-- ------------------------------------------------------------
SELECT * FROM vtimbr.order_profit_per_product_and_customer_segment
-- ------------------------------------------------------------

-- ------------------------------------------------------------
-- Runs the second view that will find the quantity and the average discount per product category
-- ------------------------------------------------------------
SELECT * FROM vtimbr.quantity_and_avg_discount_per_product_category
-- ------------------------------------------------------------

-- ------------------------------------------------------------
-- Runs the third view that will find the item quantity per product, as well as the inventory city
-- ------------------------------------------------------------
SELECT * FROM vtimbr.item_quantity_per_product_and_city
-- ------------------------------------------------------------

-- ------------------------------------------------------------
-- Runs the fourth view that will find the order_id's per shipping mode
-- ------------------------------------------------------------
SELECT * FROM vtimbr.orders_per_shipping_mode
-- ------------------------------------------------------------

-- ------------------------------------------------------------
-- Runs the fifth view that will find products per material, as well as product department 
-- ------------------------------------------------------------
SELECT * FROM vtimbr.products_per_material
-- ------------------------------------------------------------

-- ------------------------------------------------------------
-- Runs the sixth view that will find low inventory products in the United States
-- ------------------------------------------------------------
SELECT * FROM vtimbr.us_low_inventory_products
-- ------------------------------------------------------------
