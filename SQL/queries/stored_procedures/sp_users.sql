use ecommerce_db;
-- Este procedimiento almacenado permite agregar un nuevo usuario a la tabla Users.
DELIMITER //

CREATE PROCEDURE Add_Users(
    IN first_name VARCHAR(30),
    IN last_name VARCHAR(30),
    IN email VARCHAR(50),
    IN password VARCHAR(255),
    IN phone_number VARCHAR(30),
    IN address VARCHAR(255)
)
BEGIN
    -- Inserción de datos en la tabla Users
    INSERT INTO Users (
        first_name,
        last_name,
        email,
        `password`,
        phone_number,
        address
    )
    VALUES (
        first_name,
        last_name,
        email,
        password,
        phone_number,
        address
    );
END //

DELIMITER ;
CALL Add_Users('javier', 'Doe', 'javier.doe@gmail.com', 'pass', '123456789', '123 dere re');

-- -------------------------------------------------------------------------------------------

DELIMITER //
CREATE PROCEDURE DeleteUser( 
    IN U_id INT,
    IN e_mail VARCHAR(50)
)
BEGIN 
    -- Elimina un usuario de la tabla Users basado en su user_id o email
    DELETE FROM Users
    WHERE 
        user_id = U_id OR 
        email = e_mail;
END //
DELIMITER ;
CALL DeleteUser(null,'javier.doe@gmail.com');
-- -----------------------------------------------------------------------
DELIMITER //

CREATE PROCEDURE GetAllUsers()
BEGIN 
    -- Selecciona todos los campos de la tabla Users
    SELECT * FROM users;
END //

DELIMITER ;

call GetAllUsers()

-- ------------------------------------------------------------------------
DELIMITER //

CREATE PROCEDURE GetUserByID(
    IN u_id INT,
    IN e_mail VARCHAR(50)
)
BEGIN
    -- Selecciona todos los campos de la tabla Users
    -- donde el user_id coincide con u_id o el email coincide con e_mail
    SELECT * 
    FROM users 
    WHERE user_id = u_id OR email = e_mail;
END //

DELIMITER ;

call GetUserByID(13,null)

-- --------------------------------------------------------------------------
DELIMITER //
-- Actualizar la tabla Users con los nuevos valores proporcionados
CREATE PROCEDURE Update_User(

    IN U_id INT,
    IN f_name VARCHAR(30),
    IN l_name VARCHAR(30),
    IN e_mail VARCHAR(50),
    IN p_assword VARCHAR(255),
    IN p_number VARCHAR(30),
    IN a_ddress VARCHAR(255)
)
BEGIN
    
    UPDATE Users
    SET 
        first_name = f_name,
        last_name = l_name,
        email = e_mail,
        `password` = p_assword,
        phone_number = p_number,
        address = a_ddress
    WHERE 
        user_id = U_id;
END //

DELIMITER ;

CALL Update_User(1001, 'Javier', 'Doe', 'javier.doe@gmail.com', 'pass', '987654321', '555 44 er');
