-- ------------------------------------------------------------
-- Second query of the data that also finds the name of any plant that produced fitness products from the soccer category, however this time doing so with busniess logic
-- ------------------------------------------------------------
SELECT DISTINCT `product_name`, `produced_in[plant].plant_name`
FROM dtimbr.`fitness_product`
WHERE `category`='Soccer'
-- ------------------------------------------------------------
