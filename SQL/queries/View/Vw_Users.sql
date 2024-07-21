-- Crear una vista que muestre a los usuarios que han realizado al menos una compra en los últimos 30 días
CREATE VIEW ActiveUsers AS
SELECT 
    u.user_id,         -- Identificador único del usuario
    u.first_name,      -- Nombre del usuario
    u.last_name,       -- Apellido del usuario
    o.order_date       -- Fecha de la orden
FROM 
    Users u
-- Realiza una unión interna con la tabla Orders para obtener las órdenes de los usuarios
INNER JOIN 
    Orders o ON o.user_id = u.user_id
-- Filtra las órdenes que fueron realizadas en los últimos 30 días desde la fecha de la orden más reciente
WHERE 
o.order_date > DATE_SUB((SELECT MAX(order_date) FROM Orders), INTERVAL 30 DAY);
-- o.order_date > DATE_SUB (CURDATE() , INTERVAL 30 DAY);
-- -----------------------------------------------------------------------------------------------------------

-- Crear una vista que muestre el historial de compras de un usuario específico
CREATE VIEW UserPurchaseHistory AS
SELECT
    o.order_id,                     -- Identificador único de la orden
    o.order_date,                   -- Fecha en que se realizó la orden
    p.name AS product_name,         -- Nombre del producto comprado
    od.quantity,                    -- Cantidad comprada del producto
    od.price,                       -- Precio por unidad del producto
    od.quantity * od.price AS total_price  -- Precio total de la compra (cantidad * precio por unidad)
FROM
    Orders o
JOIN
    OrderDetails od ON o.order_id = od.order_id
JOIN
    Products p ON od.product_id = p.product_id
WHERE
    o.user_id = 25                  -- Filtrar por el usuario con user_id = 25
ORDER BY
    o.order_date DESC;              -- Ordenar las compras por fecha de orden en orden descendente
-- ----------------------------------------------------------------------------------------------------
-- Crear una vista que muestre el valor total de compras realizadas por cada usuario
CREATE VIEW TotalSalesByUser AS
SELECT 
    u.user_id,                    -- Identificador único del usuario
    u.first_name,                 -- Nombre del usuario
    u.last_name,                  -- Apellido del usuario
    SUM(o.total_amount) AS total_spent  -- Suma del monto total de las órdenes realizadas por el usuario
FROM 
    Users u
JOIN 
    Orders o ON o.user_id = u.user_id
GROUP BY 
    u.user_id, u.first_name, u.last_name;


-- -----------------------------------------------------------------------------------------------------

