-- Este procedimiento almacenado permite agregar un nuevo usuario a la tabla Users.
use ecommerce_db;

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
CALL Add_Users('John', 'Doe', 'john.doe@example.com', 'hashed_password', '123456789', '123 Main St');




