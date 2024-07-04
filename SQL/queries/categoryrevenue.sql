CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `ecommerce_db`.`categoryrevenue` AS
    SELECT 
        `c`.`category_id` AS `category_id`,
        `c`.`name` AS `name`,
        SUM((`od`.`quantity` * `od`.`price`)) AS `total_revenue`
    FROM
        ((`ecommerce_db`.`categories` `c`
        JOIN `ecommerce_db`.`products` `p` ON ((`p`.`category_id` = `c`.`category_id`)))
        JOIN `ecommerce_db`.`orderdetails` `od` ON ((`od`.`product_id` = `p`.`product_id`)))
    GROUP BY `c`.`category_id` , `c`.`name`
    ORDER BY `total_revenue` DESC