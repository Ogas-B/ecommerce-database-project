use ecommerce_db;
DELIMITER //

-- Crear el procedimiento almacenado llamado sp_CreateOrder
CREATE PROCEDURE sp_CreateOrder (
    IN u_id INT,                -- Parámetro de entrada para el ID de usuario
    IN o_date DATE,             -- Parámetro de entrada para la fecha de la orden
    IN s_tatus VARCHAR(20),     -- Parámetro de entrada para el estado de la orden
    IN t_amount DECIMAL(10,2),  -- Parámetro de entrada para el monto total de la orden
    IN s_address VARCHAR(50)    -- Parámetro de entrada para la dirección de envío
)
BEGIN
    -- Insertar datos en la tabla orders
    INSERT INTO orders (
        user_id,
        order_date,
        status,
        total_amount,
        shipping_address
    )
    VALUES (
        u_id,
        o_date,
        s_tatus,
        t_amount,
        s_address
    );
END //

DELIMITER ;

-- Ejemplo de llamada al procedimiento almacenado
CALL sp_CreateOrder(1001, '2024-07-17', 'Pending', 150.00, '123 Main St');
-- ----------------------------------------------------------------------------
DELIMITER //

-- Crear el procedimiento almacenado llamado sp_UpdateOrderStatus
CREATE PROCEDURE sp_UpdateOrderStatus(
    IN o_id INT,                -- Parámetro de entrada para el ID de la orden
    IN s_tatus VARCHAR(20)      -- Parámetro de entrada para el nuevo estado de la orden
)
BEGIN
    -- Actualizar el estado de la orden en la tabla orders
    UPDATE orders
    SET `status` = s_tatus
    WHERE order_id = o_id;
END //

DELIMITER ;

-- Ejemplo de llamada al procedimiento almacenado
CALL sp_UpdateOrderStatus(1001, 'Shipped');
-- -----------------------------------------------------------------------------------
DELIMITER //

-- -------Crear el procedimiento almacenado llamado sp_GetAllOrders---------------------
CREATE PROCEDURE sp_GetAllOrders()
BEGIN
    -- Selecciona todos los campos de la tabla Orders
    SELECT * FROM Orders;
END //

DELIMITER ;

-- Ejemplo de llamada al procedimiento almacenado
CALL sp_GetAllOrders();
-- ---------------------------------------------------------------------------------------
DELIMITER //

-- *****************Crear el procedimiento almacenado llamado sp_GetOrdersByUserID--------------------------
CREATE PROCEDURE sp_GetOrdersByUserID(
    IN u_id INT  -- Parámetro de entrada para el ID de usuario
)
BEGIN
    -- Seleccionar todos los campos de la tabla orders donde user_id coincide con el valor proporcionado
    SELECT * FROM orders
    WHERE user_id = u_id;
END //

-- Restaura el delimitador de comandos SQL al punto y coma (;)
DELIMITER ;

-- Ejemplo de llamada al procedimiento almacenado
CALL sp_GetOrdersByUserID(100);
