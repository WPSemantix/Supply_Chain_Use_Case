-- ------------------------------------------------------------
-- Creates all the concepts that contain the relevant data in the knowledge graph
-- ------------------------------------------------------------
CREATE OR REPLACE CONCEPT `product` (`category` string, `department` string, `product_id` int, `product_image` string, `product_name` string, `product_price` string , PRIMARY KEY(`product_id`), LABEL(`product_name`)) INHERITS (`thing`);
CREATE OR REPLACE CONCEPT `order` (`customer_id` string, `market` string, `order_city` string, `order_country` string, `order_date` date, `order_id` string, `order_item_discount` string, `order_item_discount_rate` string, `order_item_profit_ratio` string, `order_item_quantity` string, `order_item_total` string, `order_profit` string, `order_region` string, `order_state` string, `order_status` string, `order_zipcode` string, `product_id` int, `product_price` string, `sales` string , PRIMARY KEY(`order_id`), LABEL(`order_id`)) INHERITS (`thing`);
CREATE OR REPLACE CONCEPT `customer` (`customer_email` string, `customer_id` string, `customer_name` string, `customer_password` string, `customer_segment` string , PRIMARY KEY(`customer_id`), LABEL(`customer_name`)) INHERITS (`thing`);
CREATE OR REPLACE CONCEPT `shipment` (`customer_id` string, `delivery_status` string, `late_delivery_risk` string, `order_id` string, `real_days_for_shipment` string, `scheduled_days_for_shipment` string, `shipment_id` string, `shipping_date` string, `shipping_mode` string , PRIMARY KEY(`shipment_id`), LABEL(`shipment_id`)) INHERITS (`thing`);
CREATE OR REPLACE CONCEPT `plant` (`plant_city` string, `plant_country` string, `plant_description` string, `plant_id` string, `plant_name` string, `producing_product_id` string , PRIMARY KEY(`plant_id`), LABEL(`plant_name`))  INHERITS (`thing`); 
CREATE OR REPLACE CONCEPT `material` (`delivery_time_per_10_kg` string, `delivery_time_per_1_kg` string, `delivery_time_per_5_kg` string, `id` integer, `materials` string, `material_id` integer, `price_per_10_kg` string, `price_per_1_kg` string, `price_per_5_kg` string, `supplier_location` string, `supplier_name` string , PRIMARY KEY(`material_id`), LABEL(`materials`)) INHERITS (`thing`);
CREATE OR REPLACE CONCEPT `inventory` (`category` string, `department` string, `internal_storage_id` string, `inventory_city` string, `inventory_country` string, `inventory_id` string, `inventory_name` string, `inventory_state` string, `item_quantity` string, `product_id` int, `product_name` string , PRIMARY KEY(`inventory_id`), LABEL(`inventory_name`)) INHERITS (`thing`); 
CREATE OR REPLACE CONCEPT `bill_of_material` (`material_1` string, `material_2` string, `material_3` string, `product_id` int, `product_name` string, `quantity_material_1` string, `quantity_material_2` string, `quantity_material_3` string, `ratio_material_1` string, `ratio_material_2` string, `ratio_material_3` string , PRIMARY KEY(`product_id`), LABEL(`material_1`, `material_2`, `material_3`)) INHERITS (`thing`); 
CREATE OR REPLACE CONCEPT `fitness_product`  INHERITS (`product`) FROM `timbr`.`product` WHERE `department` = 'Fitness'; 
CREATE OR REPLACE CONCEPT `outdoors_product`  INHERITS (`product`) FROM `timbr`.`product` WHERE `department` = 'Outdoors'; 
CREATE OR REPLACE CONCEPT `fan_shop_product`  INHERITS (`product`) FROM `timbr`.`product` WHERE `department` = 'Fan Shop'; 
CREATE OR REPLACE CONCEPT `apparel_product`  INHERITS (`product`) FROM `timbr`.`product` WHERE `department` = 'Apparel'; 
CREATE OR REPLACE CONCEPT `golf_product`  INHERITS (`product`) FROM `timbr`.`product` WHERE `department` = 'Golf'; 
CREATE OR REPLACE CONCEPT `footwear_product`  INHERITS (`product`) FROM `timbr`.`product` WHERE `department` = 'Footwear'; 
CREATE OR REPLACE CONCEPT `latin_america_order`  INHERITS (`order`) FROM `timbr`.`order` WHERE `market` = 'LATAM'; 
CREATE OR REPLACE CONCEPT `europe_order`  INHERITS (`order`) FROM `timbr`.`order` WHERE `market` = 'Europe'; 
CREATE OR REPLACE CONCEPT `asia_order`  INHERITS (`order`) FROM `timbr`.`order` WHERE `market` = 'Pacific Asia'; 
CREATE OR REPLACE CONCEPT `africa_order`  INHERITS (`order`) FROM `timbr`.`order` WHERE `market` = 'Africa'; 
CREATE OR REPLACE CONCEPT `us_canada_order`  INHERITS (`order`) FROM `timbr`.`order` WHERE `market` = 'USCA'; 
CREATE OR REPLACE CONCEPT `home_office_customer`  INHERITS (`customer`) FROM `timbr`.`customer` WHERE `customer_segment` = 'Home Office'; 
CREATE OR REPLACE CONCEPT `corporate_customer`  INHERITS (`customer`) FROM `timbr`.`customer` WHERE `customer_segment` = 'Corporate'; 
CREATE OR REPLACE CONCEPT `consumer_customer`  INHERITS (`customer`) FROM `timbr`.`customer` WHERE `customer_segment` = 'Consumer'; 
CREATE OR REPLACE CONCEPT `first_class_shipment`  INHERITS (`shipment`) FROM `timbr`.`shipment` WHERE `shipping_mode` = 'First Class'; 
CREATE OR REPLACE CONCEPT `standard_class_shipment`  INHERITS (`shipment`) FROM `timbr`.`shipment` WHERE `shipping_mode` = 'Standard Class'; 
CREATE OR REPLACE CONCEPT `second_class_shipment`  INHERITS (`shipment`) FROM `timbr`.`shipment` WHERE `shipping_mode` = 'Second Class'; 
CREATE OR REPLACE CONCEPT `same_day_shipment`  INHERITS (`shipment`) FROM `timbr`.`shipment` WHERE `shipping_mode` = 'Same Day';
-- ------------------------------------------------------------
