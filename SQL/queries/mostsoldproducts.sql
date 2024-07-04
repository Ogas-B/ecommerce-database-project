CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `ecommerce_db`.`mostsoldproducts` AS
    SELECT 
        `p`.`product_id` AS `product_id`,
        `p`.`name` AS `name`,
        SUM(`od`.`quantity`) AS `total_quantity_sold`
    FROM
        (`ecommerce_db`.`products` `p`
        JOIN `ecommerce_db`.`orderdetails` `od` ON ((`od`.`product_id` = `p`.`product_id`)))
    GROUP BY `p`.`product_id` , `p`.`name`
    ORDER BY `total_quantity_sold` DESC