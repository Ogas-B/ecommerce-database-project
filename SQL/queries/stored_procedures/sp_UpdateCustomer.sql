-- Actualiza la información del usuario en la tabla Users
use ecommerce_db;
DELIMITER //

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

CALL Update_User(1001, 'John', 'Doe', 'john.doe@example.com', 'new_password', '987654321', '456 Elm St');
