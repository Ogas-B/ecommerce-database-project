
CREATE VIEW UsersWithCartItems AS
-- Consulta que muestra los usuarios que tienen productos en su carrito de compras y el número total de productos que tienen
    SELECT 
        u.user_id,        -- ID del usuario
        u.first_name,     -- Nombre del usuario
        u.last_name,      -- Apellido del usuario
        u.email,          -- Correo electrónico del usuario
        u.phone_number,   -- Número de teléfono del usuario
        COUNT(ci.product_id) AS product_count  -- Número total de productos en el carrito del usuario, renombrado como 'product_count'
    FROM
        `users` u         -- Tabla de usuarios
    JOIN
        cart c ON u.user_id = c.user_id  -- Unión con la tabla de carritos basada en el ID del usuario
    JOIN
        cartitems ci ON ci.cart_id = c.cart_id  -- Unión con la tabla de ítems del carrito basada en el ID del carrito
    WHERE
        ci.product_id IS NOT NULL  -- Filtra para asegurarse de que el carrito cuente con al menos un producto
    GROUP BY 
        u.user_id,        -- Agrupa los resultados por ID del usuario
        u.first_name,     -- Agrupa los resultados por nombre del usuario
        u.last_name,      -- Agrupa los resultados por apellido del usuario
        u.email,          -- Agrupa los resultados por correo electrónico del usuario
        u.phone_number    -- Agrupa los resultados por número de teléfono del usuario
    ORDER BY 
        product_count DESC;  -- Ordena los resultados por la cantidad de productos en orden descendente

SELECT * FROM UsersWithCartItems; -- consultar la vista


CREATE VIEW MostSoldProducts AS
-- Consulta para obtener los productos más vendidos
SELECT 
    p.product_id,           -- ID del producto
    p.name,                 -- Nombre del producto
    SUM(od.quantity) AS total_quantity_sold  -- Suma de la cantidad vendida de cada producto, renombrada a 'total_quantity_sold'
FROM 
    products p              -- Tabla de productos
JOIN 
    orderdetails od         -- Tabla de detalles de pedidos
ON 
    od.product_id = p.product_id  -- Condición de unión: el ID del producto en orderdetails coincide con el ID del producto en products
GROUP BY 
    p.product_id,           -- Agrupar por ID de producto
    p.name                  -- Agrupar por nombre de producto
ORDER BY 
    total_quantity_sold DESC;  -- Ordenar los resultados por la cantidad total vendida en orden descendente

SELECT * FROM MostSoldProducts; -- consultar la vista




CREATE VIEW MostReviewedProducts AS
-- Consulta para obtener el producto más popular basado en el número de reseñas
SELECT 
    p.product_id,                   -- ID del producto
    p.name,                         -- Nombre del producto
    COUNT(r.review_id) AS Count_Reviews_Product  -- Cuenta de reseñas por producto, renombrada como 'Count_Reviews_Product'
FROM 
    Products p                      -- Tabla de productos
LEFT JOIN 
    Reviews r ON r.product_id = p.product_id  -- Unión izquierda con la tabla de reseñas basada en el ID del producto
GROUP BY 
    p.product_id,                   -- Agrupar por ID del producto
    p.name                          -- Agrupar por nombre del producto
ORDER BY 
    Count_Reviews_Product DESC;      -- Ordenar los resultados por la cantidad de reseñas en orden descendente

SELECT * FROM MostReviewedProducts; -- consultar la vista

CREATE VIEW CategoryRevenue AS
-- Consulta para obtener los ingresos generados por cada categoría de productos
SELECT 
    c.category_id,                  -- ID de la categoría
    c.name,                         -- Nombre de la categoría
    SUM(od.quantity * od.price) AS total_revenue  -- Suma de los ingresos generados por la categoría, renombrada a 'total_revenue'
FROM 
    Categories c                    -- Tabla de categorías
JOIN 
    Products p ON p.category_id = c.category_id  -- Unión con la tabla de productos basada en el ID de la categoría
JOIN 
    OrderDetails od ON od.product_id = p.product_id  -- Unión con la tabla de detalles de pedidos basada en el ID del producto
GROUP BY 
    c.category_id,                  -- Agrupar por ID de la categoría
    c.name                          -- Agrupar por nombre de la categoría
ORDER BY 
    total_revenue DESC;             -- Ordenar los resultados por los ingresos totales en orden descendente

SELECT * FROM CategoryRevenue;
