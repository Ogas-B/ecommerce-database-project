DELIMITER //

-- Crear el procedimiento almacenado llamado AddProduct
CREATE PROCEDURE AddProduct(
    IN `n_ame` varchar(30),        -- Parámetro de entrada para el nombre del producto
    IN `d_escription` varchar(255), -- Parámetro de entrada para la descripción del producto
    IN p_rice decimal(10,2),       -- Parámetro de entrada para el precio del producto
    IN c_id int,                   -- Parámetro de entrada para el ID de la categoría del producto
    IN s_quantity int              -- Parámetro de entrada para la cantidad en stock del producto
)
BEGIN
    -- Inserción de datos en la tabla Products
    INSERT INTO products (
        `name`,                    -- Nombre del producto
        `description`,             -- Descripción del producto
        price,                     -- Precio del producto
        category_id,               -- ID de la categoría del producto
        stock_quantity             -- Cantidad en stock del producto
    )
    VALUES (
        n_ame,                     -- Valor para el nombre del producto
        d_escription,              -- Valor para la descripción del producto
        p_rice,                    -- Valor para el precio del producto
        c_id,                      -- Valor para el ID de la categoría del producto
        s_quantity                 -- Valor para la cantidad en stock del producto
    );
END //

DELIMITER ;

-- Ejemplo de llamada al procedimiento almacenado
CALL AddProduct('Oso', 'Peluche', 21.00, 2, 2);

-- ----------------------------------------------------------------------------------
DELIMITER //

-- Crear el procedimiento almacenado llamado DeleteProduct
CREATE PROCEDURE DeleteProduct( 
    IN p_id INT  -- Parámetro de entrada para el ID del producto
)
BEGIN 
    -- Elimina un producto de la tabla products basado en su product_id
    DELETE FROM products
    WHERE 
        product_id = p_id;  -- Condición para eliminar el producto con el ID específico
END //

DELIMITER ;

-- Ejemplo de llamada al procedimiento almacenado
CALL DeleteProduct(501);


-- -----------------------------------------------------------------------------------
DELIMITER //

-- Crear el procedimiento almacenado llamado GetAllProduct
CREATE PROCEDURE GetAllProduct()
BEGIN 
    -- Selecciona todos los campos de la tabla products
    SELECT * FROM products;
END //

DELIMITER ;

-- Ejemplo de llamada al procedimiento almacenado
CALL GetAllProduct();
-- -----------------------------------------------------------------------------------
DELIMITER //

-- Crear el procedimiento almacenado llamado sp_GetProductByName
CREATE PROCEDURE sp_GetProductByName(
    IN p_name VARCHAR(30)  -- Parámetro de entrada para el nombre del producto
)
BEGIN 
    -- Selecciona todos los campos de la tabla products donde el nombre contiene el valor de p_name
    SELECT * FROM products
    WHERE `name` LIKE CONCAT('%', p_name, '%');
END //

DELIMITER ;

-- Ejemplo de llamada al procedimiento almacenado
CALL sp_GetProductByName('Aceite');
