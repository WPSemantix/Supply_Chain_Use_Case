-- ------------------------------------------------------------
-- First query of the data that finds the name of any plant that produced fitness products from the soccer category
-- ------------------------------------------------------------
SELECT DISTINCT `product_name`,`produced_in[plant].plant_name`
FROM dtimbr.product
WHERE `department`='Fitness' and `category`='Soccer'
-- ------------------------------------------------------------
