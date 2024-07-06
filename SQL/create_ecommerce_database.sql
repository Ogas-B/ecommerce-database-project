create database ecommerce_db;
use ecommerce_db;
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    phone_number VARCHAR(30) NOT NULL,
    address VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE Categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único de la categoría.
    `name` VARCHAR(30) NOT NULL, -- Nombre de la categoría.
    `description` VARCHAR(255), -- Descripción de la categoría.
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Fecha y hora de creación del registro.
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP -- Fecha y hora de la última actualización del registro.
);


create table Products (
product_id int auto_increment primary key, -- Identificador único del producto.
`name` varchar(30) not null , -- Nombre del producto
`description` varchar (255) , -- Descripción del producto
price DECIMAL (10,2), -- Precio del producto
category_id int not null, -- (FK)Identificador de la categoría a la que pertenece el producto.
stock_quantity int , -- Cantidad de productos en stock
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Fecha y hora de creación del registro
updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- Fecha y hora de la última actualización del registro
FOREIGN KEY (category_id) REFERENCES Categories(category_id) -- Clave foránea.
);

create table Orders(
order_id int auto_increment primary key,-- Identificador único del pedido.
user_id int not null,--  Identificador del usuario que realizó el pedido.
order_date date not null, -- Fecha del pedido.
`status` varchar(20) not null, -- Estado del pedido.
total_amount DECIMAL(10, 2) not null, -- Monto total del pedido.
shipping_address varchar(50) not null, --  Dirección de envío del pedido.
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
FOREIGN KEY (user_id) REFERENCES Users(user_id) -- Clave foránea.
);

CREATE TABLE OrderDetails (
    order_detail_id INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único del detalle del pedido.
    order_id INT NOT NULL,-- Identificador del pedido al que pertenece el detalle.
    product_id INT NOT NULL,--  Identificador del producto incluido en el pedido.
    quantity INT NOT NULL,-- Cantidad de productos en el detalle.
    price DECIMAL(10 , 2 ),-- Precio del producto en el detalle.
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id)
        REFERENCES Orders (order_id),
    FOREIGN KEY (product_id)
        REFERENCES Products (product_id)
);

CREATE TABLE Payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    payment_date DATE,
    payment_method VARCHAR(30),
    amount DECIMAL(10 , 2 ),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id)
        REFERENCES Orders (order_id)
);

CREATE TABLE Shipping (
    shipping_id INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único del envío.
    order_id INT NOT NULL, -- Identificador del pedido al que corresponde el envío.
    shipping_date DATE NOT NULL, -- Fecha del envío.
    shipping_method VARCHAR(30) NOT NULL, -- Método de envío utilizado.
    tracking_number VARCHAR(50) NOT NULL, -- Número de seguimiento del envío.
    `status` VARCHAR(30) NOT NULL, -- Estado del envío.
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Fecha y hora de creación del registro.
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- Fecha y hora de la última actualización del registro.
    FOREIGN KEY (order_id) REFERENCES Orders(order_id) -- Clave foránea.
);

CREATE TABLE Reviews (
    review_id INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único de la reseña.
    product_id INT NOT NULL, -- Identificador del producto al que corresponde la reseña.
    user_id INT NOT NULL, -- Identificador del usuario que escribió la reseña.
    rating int NOT NULL, -- Calificación del producto, con hasta 4 dígitos y 2 decimales.
    `comment` VARCHAR(255), -- Comentario del usuario sobre el producto.
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Fecha y hora de creación del registro.
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- Fecha y hora de la última actualización del registro.
    FOREIGN KEY (product_id) REFERENCES Products(product_id), -- Clave foránea.
    FOREIGN KEY (user_id) REFERENCES Users(user_id) -- Clave foránea.
);
CREATE TABLE Inventory (
    inventory_id INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único del inventario.
    product_id INT NOT NULL, -- Identificador del producto al que corresponde el inventario.
    quantity INT, -- Cantidad de productos en el inventario.
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- Fecha y hora de la última actualización del inventario.
    FOREIGN KEY (product_id) REFERENCES Products(product_id) -- Clave foránea.
);

CREATE TABLE Suppliers (
    supplier_id INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único del proveedor.
    `name` VARCHAR(30) NOT NULL, -- Nombre del proveedor.
    contact_name VARCHAR(30) NOT NULL, -- Nombre del contacto.
    contact_email VARCHAR(60) NOT NULL, -- Correo electrónico del contacto.
    contact_phone VARCHAR(30) NOT NULL, -- Teléfono de contacto.
    address VARCHAR(60) NOT NULL, -- Dirección del proveedor.
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Fecha y hora de creación del registro.
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP -- Fecha y hora de la última actualización del registro.
);

CREATE TABLE SupplierProducts (
    supplier_product_id INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único del producto del proveedor.
    supplier_id INT NOT NULL, -- Identificador del proveedor.
    product_id INT NOT NULL, -- Identificador del producto.
    price DECIMAL(10,2) NOT NULL, -- Precio del producto proporcionado por el proveedor.
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Fecha y hora de creación del registro.
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- Fecha y hora de la última actualización del registro.
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id), -- Clave foránea que referencia al proveedor.
    FOREIGN KEY (product_id) REFERENCES Products(product_id) -- Clave foránea que referencia al producto.
);

CREATE TABLE Discounts (
    discount_id INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único del descuento.
    product_id INT NOT NULL, -- Identificador del producto al que aplica el descuento.
    discount_percentage DECIMAL(10,2) NOT NULL, -- Porcentaje de descuento.
    start_date DATE NOT NULL, -- Fecha de inicio del descuento.
    end_date DATE NOT NULL, -- Fecha de fin del descuento.
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Fecha y hora de creación del registro.
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- Fecha y hora de la última actualización del registro.
    FOREIGN KEY (product_id) REFERENCES Products(product_id) -- Clave foránea que referencia al producto.
);


CREATE TABLE Wishlist (
    wishlist_id INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único de la lista de deseos.
    user_id INT NOT NULL, -- Identificador del usuario dueño de la lista de deseos.
    product_id INT NOT NULL, -- Identificador del producto añadido a la lista de deseos.
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Fecha y hora de creación del registro.
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- Fecha y hora de la última actualización del registro.
    FOREIGN KEY (user_id) REFERENCES Users(user_id), -- Clave foránea que referencia al usuario.
    FOREIGN KEY (product_id) REFERENCES Products(product_id) -- Clave foránea que referencia al producto.
);


CREATE TABLE Cart (
    cart_id INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único del carrito de compras.
    user_id INT NOT NULL, -- Identificador del usuario dueño del carrito de compras.
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Fecha y hora de creación del registro.
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- Fecha y hora de la última actualización del registro.
    FOREIGN KEY (user_id) REFERENCES Users(user_id) -- Clave foránea que referencia al usuario.
);

CREATE TABLE CartItems (
    cart_item_id INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único del ítem en el carrito.
    cart_id INT NOT NULL, -- Identificador del carrito al que pertenece el ítem.
    product_id INT NOT NULL, -- Identificador del producto añadido al carrito.
    quantity INT, -- Cantidad del producto añadido al carrito.
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Fecha y hora de creación del registro.
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- Fecha y hora de la última actualización del registro.
    FOREIGN KEY (cart_id) REFERENCES Cart(cart_id), -- Clave foránea que referencia al carrito.
    FOREIGN KEY (product_id) REFERENCES Products(product_id) -- Clave foránea que referencia al producto.
);
