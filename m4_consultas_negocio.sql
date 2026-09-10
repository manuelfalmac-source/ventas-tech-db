-- ==========================================
-- M4 - Consultas SQL de negocio
-- Ventas_Tech_DB
-- Autor: Manuel F.
-- Fecha: 10/09/2026
-- ==========================================

USE Ventas_Tech_DB;
GO

-- CONSULTA 1 - Resumen ejecutivo mensual

SELECT
    MONTH(fecha_venta) AS mes,
    SUM(cantidad * precio_unitario) AS total_facturado,
    COUNT(*) AS cantidad_pedidos,
    AVG(cantidad * precio_unitario) AS ticket_promedio
FROM ventas
GROUP BY MONTH(fecha_venta)
ORDER BY mes;

-- CONSULTA 2 - Ranking de productos

SELECT TOP 5
    id_producto,
    SUM(cantidad) AS unidades_vendidas,
    SUM(cantidad * precio_unitario) AS total_facturado
FROM ventas
GROUP BY id_producto
ORDER BY total_facturado DESC;

-- CONSULTA 3 - Clientes recurrentes

SELECT
    id_cliente,
    COUNT(*) AS cantidad_pedidos,
    SUM(cantidad * precio_unitario) AS total_gastado
FROM ventas
GROUP BY id_cliente
HAVING COUNT(*) > 1
ORDER BY total_gastado DESC;

-- CONSULTA 4 - Meses por encima/debajo del promedio

WITH ventas_mensuales AS (
    SELECT
        MONTH(fecha_venta) AS mes,
        SUM(cantidad * precio_unitario) AS total_facturado
    FROM ventas
    GROUP BY MONTH(fecha_venta)
)

SELECT
    mes,
    total_facturado,
    CASE
        WHEN total_facturado > (
            SELECT AVG(total_facturado)
            FROM ventas_mensuales
        )
        THEN 'Por encima'
        WHEN total_facturado < (
            SELECT AVG(total_facturado)
            FROM ventas_mensuales
        )
        THEN 'Por debajo'
        ELSE 'Igual al promedio'
    END AS performance
FROM ventas_mensuales
ORDER BY mes;

-- HALLAZGOS

-- 1. El producto 1 genera 3600 de facturación, aproximadamente el 56% del total.
-- Esto muestra una alta concentración de ingresos en un solo producto que conviene monitorear.

-- 2. El producto 2 es el de mayor volumen, con 13 unidades vendidas, pero genera
-- solamente 364 de facturación. Esto muestra que un alto volumen no necesariamente
-- implica una alta contribución a los ingresos.

-- 3. El cliente 1 presenta el mayor gasto total, con 2640, seguido por el cliente 5
-- con 2100. Estos clientes podrían ser prioritarios para acciones de fidelización.
