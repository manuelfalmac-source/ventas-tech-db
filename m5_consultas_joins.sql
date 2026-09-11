-- ==========================================
-- M5 - Consultas con JOINs
-- Ventas_Tech_DB
-- Autor: Manuel F.
-- ==========================================

USE Ventas_Tech_DB;
GO


-- ==========================================
-- CONSULTA 1 - Vista base del proyecto
-- INNER JOIN
-- ==========================================

SELECT
    v.fecha_venta,
    c.nombre AS cliente,
    c.segmento,
    t.region,
    p.nombre_producto,
    p.categoria,
    v.cantidad,
    v.precio_unitario,
    v.cantidad * v.precio_unitario AS total_venta,
    v.canal
FROM ventas v
INNER JOIN clientes c
    ON v.id_cliente = c.id_cliente
INNER JOIN productos p
    ON v.id_producto = p.id_producto
INNER JOIN territorios t
    ON v.id_territorio = t.id_territorio
ORDER BY v.fecha_venta;

-- ==========================================
-- CONSULTA 2 - Clientes sin ventas
-- LEFT JOIN
-- ==========================================

SELECT
    c.nombre,
    c.email,
    c.fecha_registro
FROM clientes c
LEFT JOIN ventas v
    ON c.id_cliente = v.id_cliente
WHERE v.id_venta IS NULL;

-- ==========================================
-- CONSULTA 3 - Productos sin ventas
-- LEFT JOIN
-- ==========================================

SELECT
    p.nombre_producto,
    p.categoria,
    p.precio
FROM productos p
LEFT JOIN ventas v
    ON p.id_producto = v.id_producto
WHERE v.id_venta IS NULL;

-- ==========================================
-- CONSULTA 4 - Consolidado por canal
-- UNION ALL
-- ==========================================

SELECT
    canal,
    SUM(total_venta) AS total_por_canal
FROM (
    SELECT
        'Online' AS canal,
        cantidad * precio_unitario AS total_venta
    FROM ventas
    WHERE canal = 'Online'

    UNION ALL

    SELECT
        'Presencial' AS canal,
        cantidad * precio_unitario AS total_venta
    FROM ventas
    WHERE canal = 'Presencial'
) AS ventas_por_canal
GROUP BY canal;

-- ==========================================
-- HALLAZGOS
-- ==========================================

-- ==========================================
-- HALLAZGOS
-- ==========================================

-- 1. El canal Online concentra la mayor facturacion, con 4560,
-- frente a 1884 del canal Presencial.

-- 2. Diego Fernandez figura como cliente registrado sin compras,
-- por lo que podria considerarse para acciones de activacion comercial.

-- 3. La Webcam HD 1080 no registra ventas, por lo que conviene
-- monitorear su desempeño y evaluar acciones para impulsar su demanda.
