-- ------------------------------------------------------------
-- Creates all the data mappings in the knowledge graph
-- ------------------------------------------------------------
CREATE OR REPLACE MAPPING `map_product_1` INTO `product` AS SELECT DISTINCT `Category` AS `category`, `Department` AS `department`, `Image` AS `product_image`, `Price` AS `product_price`, CAST(`product_id` AS SIGNED) AS `product_id`, `Product_name` AS `product_name` FROM `supply_chain_demo`.`product`;
CREATE OR REPLACE MAPPING `map_shipment_2` INTO `shipment` AS SELECT `customer_id` AS `customer_id`, `delivery_status` AS `delivery_status`, `late_delivery_risk` AS `late_delivery_risk`, `order_id` AS `order_id`, `real_days_for_shipment` AS `real_days_for_shipment`, `scheduled_days_for_shipment` AS `scheduled_days_for_shipment`, `shipment_id` AS `shipment_id`, `shipping_date` AS `shipping_date`, `shipping_mode` AS `shipping_mode` FROM `scdata`.`datacosupplychaindataset_shipment`;
CREATE OR REPLACE MAPPING `map_customer_1` INTO `customer` AS SELECT CONCAT(`customer_first_name`, ' ', `customer_last_name`) AS `customer_name`, `customer_email` AS `customer_email`, `customer_id` AS `customer_id`, `customer_password` AS `customer_password`, `customer_segment` AS `customer_segment` FROM `scdata`.`datacosupplychaindataset_customer`;
CREATE OR REPLACE MAPPING `map_inventory_1` INTO `inventory` AS SELECT `Category` AS `category`, `Department` AS `department`, `Internal_storage_id` AS `internal_storage_id`, `Inventory_city` AS `inventory_city`, `Inventory_country` AS `inventory_country`, `Inventory_id` AS `inventory_id`, `Inventory_name` AS `inventory_name`, `Inventory_state` AS `inventory_state`, `Item_quantity` AS `item_quantity`, CAST(`Product_id` AS SIGNED) AS `product_id`, `Product_name` AS `product_name` FROM `supply_chain_demo`.`inventory`;
CREATE OR REPLACE MAPPING `map_material_1` INTO `material` AS SELECT `delivery_time_per_10_kg` AS `delivery_time_per_10_kg`, `delivery_time_per_1_kg` AS `delivery_time_per_1_kg`, `delivery_time_per_5_kg` AS `delivery_time_per_5_kg`, `id` AS `id`, `materials` AS `materials`, CAST(`material_id` AS INTEGER) AS `material_id`, `price_per_10_kg` AS `price_per_10_kg`, `price_per_1_kg` AS `price_per_1_kg`, `price_per_5_kg` AS `price_per_5_kg`, `supplier_location` AS `supplier_location`, `supplier_name` AS `supplier_name` FROM `supply_chain_demo`.`material`;
CREATE OR REPLACE MAPPING `map_order_1` INTO `order` AS SELECT `customer_id` AS `customer_id`, `Market` AS `market`, `order_city` AS `order_city`, `order_country` AS `order_country`, CAST(CONCAT(SUBSTRING(`order_date` FROM 7 FOR 4), '-', SUBSTRING(`order_date` FROM 1 FOR 2), '-', SUBSTRING(`order_date` FROM 4 FOR 2)) AS DATE) AS `order_date`, `order_id` AS `order_id`, `order_item_discount` AS `order_item_discount`, `order_item_discount_rate` AS `order_item_discount_rate`, `order_item_profit_ratio` AS `order_item_profit_ratio`, `order_item_quantity` AS `order_item_quantity`, `order_item_total` AS `order_item_total`, `order_profit` AS `order_profit`, `order_region` AS `order_region`, `order_state` AS `order_state`, `order_status` AS `order_status`, `order_zipcode` AS `order_zipcode`, CAST(`product_id` AS SIGNED) AS `product_id`, `product_price` AS `product_price`, `sales` AS `sales` FROM `scdata`.`datacosupplychaindataset_order`;
CREATE OR REPLACE MAPPING `map_plant_1` INTO `plant` AS SELECT DISTINCT `plant_city` AS `plant_city`, `plant_country` AS `plant_country`, `plant_description` AS `plant_description`, `plant_id` AS `plant_id`, `plant_name` AS `plant_name` FROM `supply_chain_demo`.`plant`;
CREATE OR REPLACE MAPPING `map_bill_of_material_1` INTO `bill_of_material` AS SELECT `material_1` AS `material_1`, `material_2` AS `material_2`, `material_3` AS `material_3`, CAST(`product_id` AS SIGNED) AS `product_id`, `product_name` AS `product_name`, `quantity_material_1` AS `quantity_material_1`, `quantity_material_2` AS `quantity_material_2`, `quantity_material_3` AS `quantity_material_3`, `ratio_material_1` AS `ratio_material_1`, `ratio_material_2` AS `ratio_material_2`, `ratio_material_3` AS `ratio_material_3` FROM `supply_chain_demo`.`bill_of_material` 
-- ------------------------------------------------------------