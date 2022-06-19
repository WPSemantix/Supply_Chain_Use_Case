-- ------------------------------------------------------------
-- Creates the relationships that connect between the knowledge graph concepts
-- ------------------------------------------------------------
-- ------------------------------------------------------------
-- Creates product relationships
-- ------------------------------------------------------------
CREATE OR REPLACE CONCEPT `product` (`category` string, `department` string, `product_id` int, `product_image` string, `product_name` string, `product_price` string , PRIMARY KEY(`product_id`), LABEL(`product_name`),  CONSTRAINT `has_bill_of_material` FOREIGN KEY (`product_id`) REFERENCES `bill_of_material` (`product_id`) INVERSEOF `of_product`,  CONSTRAINT `has_inventory` FOREIGN KEY (`product_id`) REFERENCES `inventory` (`product_id`) INVERSEOF `stores_product`,  CONSTRAINT `in_order` FOREIGN KEY (`product_id`) REFERENCES `order` (`product_id`) INVERSEOF `includes_product`,  CONSTRAINT `contains` MULTIREFERENCE `material` INVERSEOF `part_of`,  CONSTRAINT `produced_in` MULTIREFERENCE `plant` INVERSEOF `producing`) INHERITS (`thing`);
-- ------------------------------------------------------------
-- Creates many-to-many realtionships from product to material
-- ------------------------------------------------------------
CREATE OR REPLACE MAPPING `contains` (CONSTRAINT `contains` FOREIGN KEY (`material`) REFERENCES `material`(`materials`), CONSTRAINT `part_of` FOREIGN KEY (`product_id`) REFERENCES `product`(`product_id`)) AS SELECT CAST(`product_id` AS SIGNED) AS `product_id`, `material_1` AS `material` FROM `supply_chain_demo`.`bill_of_material`
UNION ALL
SELECT CAST(`product_id` AS SIGNED) AS `product_id`, `material_2` AS `material` FROM `supply_chain_demo`.`bill_of_material`
UNION ALL
SELECT CAST(`product_id` AS SIGNED) AS `product_id`, `material_3` AS `material` FROM `supply_chain_demo`.`bill_of_material`;
CREATE OR REPLACE MAPPING `produced_in` (CONSTRAINT `produced_in` FOREIGN KEY (`plant_id`) REFERENCES `plant`(`plant_id`), CONSTRAINT `producing` FOREIGN KEY (`producing_product_id`) REFERENCES `product`(`product_id`)) AS SELECT CAST(`producing_product_id` AS SIGNED) AS `producing_product_id`, `Plant_id` AS `plant_id` FROM `supply_chain_demo`.`plant`;
-- ------------------------------------------------------------
-- Creates plant relationships
-- ------------------------------------------------------------
CREATE OR REPLACE CONCEPT `plant` (`plant_city` string, `plant_country` string, `plant_description` string, `plant_id` string, `plant_name` string , PRIMARY KEY(`plant_id`), LABEL(`plant_name`),  CONSTRAINT `sent_shipment_to` MULTIREFERENCE `inventory` INVERSEOF `received_shipment_from`,  CONSTRAINT `producing` MULTIREFERENCE `product` INVERSEOF `produced_in`) INHERITS (`thing`);
-- ------------------------------------------------------------
-- Creates many-to-many realtionships from plant to inventory
-- ------------------------------------------------------------
CREATE OR REPLACE MAPPING `map_plant_sent_shipment_to_inventory` (CONSTRAINT `sent_shipment_to` FOREIGN KEY (`inventory_id`) REFERENCES `inventory`(`inventory_id`), CONSTRAINT `received_shipment_from` FOREIGN KEY (`plant_id`) REFERENCES `plant`(`plant_id`)) AS SELECT CAST(`plant_id` AS string) AS `plant_id`, CAST(`inventory_id` AS string) AS `inventory_id` FROM `supply_chain_demo`.`plan_inventory`;
CREATE OR REPLACE MAPPING `producing` (CONSTRAINT `producing` FOREIGN KEY (`producing_product_id`) REFERENCES `product`(`product_id`), CONSTRAINT `produced_in` FOREIGN KEY (`plant_id`) REFERENCES `plant`(`plant_id`)) AS SELECT CAST(`producing_product_id` AS SIGNED) AS `producing_product_id`, `Plant_id` AS `plant_id` FROM `supply_chain_demo`.`plant`; 
-- ------------------------------------------------------------
-- Creates material relationships
-- ------------------------------------------------------------
CREATE OR REPLACE CONCEPT `material` (`delivery_time_per_10_kg` string, `delivery_time_per_1_kg` string, `delivery_time_per_5_kg` string, `id` integer, `materials` string, `material_id` integer, `price_per_10_kg` string, `price_per_1_kg` string, `price_per_5_kg` string, `supplier_location` string, `supplier_name` string , PRIMARY KEY(`material_id`), LABEL(`materials`),  CONSTRAINT `part_of_1` FOREIGN KEY (`materials`) REFERENCES `bill_of_material` (`material_1`) INVERSEOF `contains_1`,  CONSTRAINT `part_of_2` FOREIGN KEY (`materials`) REFERENCES `bill_of_material` (`material_2`) INVERSEOF `contains_2`,  CONSTRAINT `part_of_3` FOREIGN KEY (`materials`) REFERENCES `bill_of_material` (`material_3`) INVERSEOF `contains_3`,  CONSTRAINT `part_of` MULTIREFERENCE `product` INVERSEOF `contains`) INHERITS (`thing`);
-- ------------------------------------------------------------
-- Creates many-to-many realtionships from material to product
-- ------------------------------------------------------------
CREATE OR REPLACE MAPPING `part_of` (CONSTRAINT `part_of` FOREIGN KEY (`product_id`) REFERENCES `product`(`product_id`), CONSTRAINT `contains` FOREIGN KEY (`material`) REFERENCES `material`(`materials`)) AS SELECT CAST(`product_id` AS SIGNED) AS `product_id`, `material_1` AS `material` FROM `supply_chain_demo`.`bill_of_material`
UNION ALL
SELECT CAST(`product_id` AS SIGNED) AS `product_id`, `material_2` AS `material` FROM `supply_chain_demo`.`bill_of_material`
UNION ALL
SELECT CAST(`product_id` AS SIGNED) AS `product_id`, `material_3` AS `material` FROM `supply_chain_demo`.`bill_of_material`;
-- ------------------------------------------------------------
-- Creates shipment relationships
-- ------------------------------------------------------------
CREATE OR REPLACE CONCEPT `shipment` (`customer_id` string, `delivery_status` string, `late_delivery_risk` string, `order_id` string, `real_days_for_shipment` string, `scheduled_days_for_shipment` string, `shipment_id` string, `shipping_date` string, `shipping_mode` string , PRIMARY KEY(`shipment_id`), LABEL(`shipment_id`),  CONSTRAINT `for_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) INVERSEOF `has_shipment`) INHERITS (`thing`);
-- ------------------------------------------------------------
-- Creates order relationships
-- ------------------------------------------------------------
CREATE OR REPLACE CONCEPT `order` (`customer_id` string, `market` string, `order_city` string, `order_country` string, `order_date` date, `order_id` string, `order_item_discount` string, `order_item_discount_rate` string, `order_item_profit_ratio` string, `order_item_quantity` string, `order_item_total` string, `order_profit` string, `order_region` string, `order_state` string, `order_status` string, `order_zipcode` string, `product_id` int, `product_price` string, `sales` string , PRIMARY KEY(`order_id`), LABEL(`order_id`),  CONSTRAINT `ordered_by` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) INVERSEOF `has_ordered`,  CONSTRAINT `in_shipment` FOREIGN KEY (`order_id`) REFERENCES `shipment` (`order_id`) INVERSEOF `has_order`) INHERITS (`thing`);
-- ------------------------------------------------------------
