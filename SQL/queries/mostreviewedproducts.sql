CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `ecommerce_db`.`mostreviewedproducts` AS
    SELECT 
        `p`.`product_id` AS `product_id`,
        `p`.`name` AS `name`,
        COUNT(`r`.`review_id`) AS `Count_Reviews_Product`
    FROM
        (`ecommerce_db`.`products` `p`
        LEFT JOIN `ecommerce_db`.`reviews` `r` ON ((`r`.`product_id` = `p`.`product_id`)))
    GROUP BY `p`.`product_id` , `p`.`name`
    ORDER BY `Count_Reviews_Product` DESC