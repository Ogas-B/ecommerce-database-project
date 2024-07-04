CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `ecommerce_db`.`userswithcartitems` AS
    SELECT 
        `u`.`user_id` AS `user_id`,
        `u`.`first_name` AS `first_name`,
        `u`.`last_name` AS `last_name`,
        `u`.`email` AS `email`,
        `u`.`phone_number` AS `phone_number`,
        COUNT(`ci`.`product_id`) AS `product_count`
    FROM
        ((`ecommerce_db`.`users` `u`
        JOIN `ecommerce_db`.`cart` `c` ON ((`u`.`user_id` = `c`.`user_id`)))
        JOIN `ecommerce_db`.`cartitems` `ci` ON ((`ci`.`cart_id` = `c`.`cart_id`)))
    WHERE
        (`ci`.`product_id` IS NOT NULL)
    GROUP BY `u`.`user_id` , `u`.`first_name` , `u`.`last_name` , `u`.`email` , `u`.`phone_number`
    ORDER BY COUNT(`ci`.`product_id`) DESC