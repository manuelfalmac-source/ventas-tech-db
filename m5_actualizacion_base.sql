-- ==========================================
-- M5 - Actualizacion de la base de datos
-- Ventas_Tech_DB
-- Autor: Manuel F.
-- ==========================================

USE Ventas_Tech_DB;
GO

-- ==========================================
-- 1. CREAR TABLA TERRITORIOS
-- ==========================================

CREATE TABLE territorios (
    id_territorio INT PRIMARY KEY,
    region VARCHAR(50) NOT NULL,
    pais VARCHAR(50) NOT NULL,
    zona VARCHAR(50),
    ciudad VARCHAR(50),
    sucursal VARCHAR(100)
);
GO


-- ==========================================
-- 2. AGREGAR CAMPOS NECESARIOS PARA M5
-- ==========================================

ALTER TABLE clientes
ADD segmento VARCHAR(50);
GO

ALTER TABLE productos
ADD categoria VARCHAR(50);
GO

ALTER TABLE ventas
ADD id_territorio INT,
    canal VARCHAR(50);
GO


-- ==========================================
-- 3. CARGAR TERRITORIOS
-- ==========================================

INSERT INTO territorios VALUES
(1, 'Centro',  'Argentina', 'CABA',       'Buenos Aires', 'Sucursal Buenos Aires'),
(2, 'Centro',  'Argentina', 'Centro',     'Cordoba',      'Sucursal Cordoba'),
(3, 'Litoral', 'Argentina', 'Santa Fe',   'Rosario',      'Sucursal Rosario'),
(4, 'Cuyo',    'Argentina', 'Oeste',      'Mendoza',      'Sucursal Mendoza'),
(5, 'Norte',   'Argentina', 'NOA',        'Tucuman',      'Sucursal Tucuman');
GO


-- ==========================================
-- 4. COMPLETAR SEGMENTOS
-- ==========================================

UPDATE clientes SET segmento = 'Corporativo' WHERE id_cliente = 1;
UPDATE clientes SET segmento = 'Minorista'   WHERE id_cliente = 2;
UPDATE clientes SET segmento = 'Minorista'   WHERE id_cliente = 3;
UPDATE clientes SET segmento = 'PyME'        WHERE id_cliente = 4;
UPDATE clientes SET segmento = 'Corporativo' WHERE id_cliente = 5;
GO


-- ==========================================
-- 5. COMPLETAR CATEGORIAS DE PRODUCTOS
-- ==========================================

UPDATE productos SET categoria = 'Computacion'    WHERE id_producto IN (1, 3);
UPDATE productos SET categoria = 'Accesorios'     WHERE id_producto IN (2, 6);
UPDATE productos SET categoria = 'Audio'          WHERE id_producto = 4;
UPDATE productos SET categoria = 'Almacenamiento' WHERE id_producto = 5;
GO


-- ==========================================
-- 6. ASIGNAR TERRITORIO Y CANAL A LAS VENTAS
-- ==========================================

UPDATE ventas SET id_territorio = 1 WHERE id_cliente = 1;
UPDATE ventas SET id_territorio = 2 WHERE id_cliente = 2;
UPDATE ventas SET id_territorio = 3 WHERE id_cliente = 3;
UPDATE ventas SET id_territorio = 4 WHERE id_cliente = 4;
UPDATE ventas SET id_territorio = 5 WHERE id_cliente = 5;

UPDATE ventas SET canal = 'Online'
WHERE id_venta IN (1, 3, 5, 7, 9);

UPDATE ventas SET canal = 'Presencial'
WHERE id_venta IN (2, 4, 6, 8, 10);
GO


-- ==========================================
-- 7. CREAR FOREIGN KEY
-- ==========================================

ALTER TABLE ventas
ADD CONSTRAINT FK_ventas_territorios
FOREIGN KEY (id_territorio)
REFERENCES territorios(id_territorio);
GO


-- ==========================================
-- 8. AGREGAR CASOS SIN VENTAS
-- ==========================================

INSERT INTO clientes
(id_cliente, nombre, email, ciudad, fecha_registro, segmento)
VALUES
(6, 'Diego Fernandez', 'diego@mail.com', 'Salta', '2024-03-20', 'Minorista');

INSERT INTO productos
(id_producto, nombre_producto, id_categoria, precio, stock, activo, categoria)
VALUES
(7, 'Webcam HD 1080', 2, 65.00, 20, 1, 'Accesorios');
GO


-- ==========================================
-- 9. VALIDACION
-- ==========================================

SELECT * FROM clientes;
SELECT * FROM productos;
SELECT * FROM territorios;
SELECT * FROM ventas;
GO
