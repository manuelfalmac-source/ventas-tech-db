# ventas-tech-db

# RetailPro

RetailPro es un proyecto académico de análisis de datos desarrollado en el curso de Data Analytics. El proyecto trabaja sobre una empresa ficticia de retail/tecnología y tiene como objetivo analizar ventas, clientes, productos y territorios mediante distintas herramientas de análisis y visualización.

## Herramientas utilizadas

- SQL Server
- Power Query
- Power BI
- DAX
- GitHub

## Estructura del repositorio

### Scripts SQL

- `ventas_tech_db.sql`: crea la base de datos inicial, las tablas y los datos de ejemplo.
- `m4_consultas_negocio.sql`: contiene consultas SQL orientadas al análisis de ventas, productos y clientes.
- `m5_actualizacion_base.sql`: amplía la base incorporando territorios, segmentos, categorías y canales.
- `m5_consultas_joins.sql`: incluye consultas con INNER JOIN, LEFT JOIN y UNION ALL.

### Archivos de Power BI

- `M6/`: contiene el archivo de Power BI correspondiente al proceso de ETL y limpieza de datos.
- `M8/`: contiene el archivo de Power BI con el modelo de relaciones, tabla calendario y medidas DAX.

## Pipeline de datos

El proyecto comienza con la creación de una base de datos ficticia en SQL Server.

Luego se realizan consultas de análisis y se amplía la estructura de la base para incorporar nuevas dimensiones como territorios, segmentos y canales.

Posteriormente, los datos son trabajados en Power Query para realizar tareas de limpieza, transformación y tipado.

Finalmente, en Power BI se construye el modelo de datos, se crean medidas DAX y se preparan visualizaciones para el análisis de la información.

## Principales medidas DAX

Entre las medidas creadas se encuentran:

- Total Ventas
- Ventas Online
- Ventas YTD
- Ventas LY
- % Crecimiento Anual

## Cómo reproducir el proyecto

1. Clonar o descargar este repositorio.
2. Abrir SQL Server Management Studio.
3. Ejecutar `ventas_tech_db.sql` para crear la base de datos inicial.
4. Ejecutar `m4_consultas_negocio.sql` para realizar las primeras consultas de análisis.
5. Ejecutar `m5_actualizacion_base.sql` para ampliar la estructura de la base.
6. Ejecutar `m5_consultas_joins.sql` para realizar las consultas con JOINs y UNION ALL.
7. Abrir los archivos `.pbix` incluidos en las carpetas correspondientes para revisar el trabajo realizado en Power BI.

## Objetivo del proyecto

Aplicar de forma integrada herramientas de análisis de datos para transformar, modelar y analizar información comercial y generar resultados útiles para la toma de decisiones.
