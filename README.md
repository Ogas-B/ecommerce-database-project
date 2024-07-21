# ecommerce-database-project
Este proyecto contiene la estructura de una base de datos para un comercio electrónico, datos generados usando Mockaroo, y un análisis realizado con Power BI.
## Últimas Actualizaciones

- **Fecha**: 21/07/2024
  - Agregado nuevo script para inserción de datos:
    - `database_inserts.sql`: Script para insertar datos en la base de datos.
  - Agregadas nuevas carpetas y scripts SQL:
    - Carpeta `stored_procedures`:
      - `sp_Order.sql`: Script para procedimientos almacenados relacionados con órdenes.
      - `sp_Product.sql`: Script para procedimientos almacenados relacionados con productos.
      - `sp_users.sql`: Script para procedimientos almacenados relacionados con usuarios.
    - Carpeta `views`:
      - `categoria_proveedores.sql`: Script para la vista de categorías de proveedores.
      - `mostrarproveedorproductos.sql`: Script para la vista de productos de proveedores.
      - `mostrarproductos.sql`: Script para la vista de productos.
      - `usuariosconcaracteres.sql`: Script para la vista de usuarios con caracteres especiales.
      - `vw_usuarios.sql`: Script para la vista de usuarios.

## Estructura del Proyecto

- **SQL/**: Contiene los scripts SQL para crear tablas, insertar datos, crear vistas y stored procedures.
  - `create_tables.sql`: Script para crear las tablas de la base de datos.
  - `insert_data.sql`: Script para insertar los datos generados en las tablas.
  - `create_views.sql`: Script para crear las vistas necesarias.
  - `database_inserts.sql`: Script para insertar datos en la base de datos.
  - `queries/`: Carpeta que contiene consultas SQL específicas.
    - `stored_procedures/`: Carpeta que contiene stored procedures.
      - `sp_Order.sql`: Script para procedimientos almacenados relacionados con órdenes.
      - `sp_Product.sql`: Script para procedimientos almacenados relacionados con productos.
      - `sp_users.sql`: Script para procedimientos almacenados relacionados con usuarios.
    - `views/`: Carpeta que contiene vistas.
      - `categoria_proveedores.sql`: Script para la vista de categorías de proveedores.
      - `mostrarproveedorproductos.sql`: Script para la vista de productos de proveedores.
      - `mostrarproductos.sql`: Script para la vista de productos.
      - `usuariosconcaracteres.sql`: Script para la vista de usuarios con caracteres especiales.
      - `vw_usuarios.sql`: Script para la vista de usuarios.
- **DataSet/**: Contiene los datos generados y los scripts utilizados.
- **PowerBI/**: Contiene el archivo del proyecto de Power BI y capturas de pantalla de los dashboards.
  - `ecommerce_analysis.pbix`: Archivo del proyecto de Power BI.
- **screenshots/**: Capturas de pantalla de los dashboards creados.
- **ERD/**: Contiene el diagrama de entidad-relación de la base de datos.
  - `erd_diagram.png`: Diagrama de entidad-relación de la base de datos.
  - `erd-Ecommerce.jpg`: Diagrama de entidad-relación de la base de datos.
- **Document/**: Documentación principal está disponible en formato PDF.
  - `Ecommerce-BrianOgas.pdf`: PDF que contiene la documentación del proyecto.
- **README.md**: Este archivo.

## Cómo Usar

### Crear la Base de Datos:

1. Ejecuta el script `create_tables.sql` para crear las tablas de la base de datos.
2. Ejecuta el script `database_inserts.sql` para insertar los datos en las tablas.
3. Ejecuta el script `create_views.sql` para crear las vistas necesarias.
4. Ejecuta los scripts en `queries/stored_procedures/` para utilizar los stored procedures, como `sp_Order.sql`, `sp_Product.sql` y `sp_users.sql`.

### Análisis en Power BI:

- Abre el archivo `PowerBI/ecommerce_analysis.pbix` en Power BI.
- Explora los dashboards y visualizaciones para obtener insights del comercio electrónico.

## Generación de Datos con Mockaroo

- Los datos fueron generados utilizando Mockaroo.

## Contacto

- Autor: Ogas Brian
- Email: ogasbrian735@gmail.com
- LinkedIn: Brian Emanuel Ogas
