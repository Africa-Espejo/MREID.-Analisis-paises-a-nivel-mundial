# MREID.-Analisis-paises-a-nivel-mundial
Partiendo del Gravity Portal: MREID (Multinational Revenue, Employment, and  Investment Database), de la United States International Trade Commision se quiere hacer un análisis de los distintos países a nivel mundial.

Los OBJETIVOS de este proyecto son: 
 - Análisis y entendimiento de los datos origen.
 - Conexión, preparación y carga de datos en una base de datos MySQL (a través de n8n).
 - Preparación de estructuras de datos y consultas SQL.
 - Responder a las preguntas planteadas.
 - Configuración de herramientas de visualización de datos.
 - Construcción de dashboards que permita analizar los datos de manera visual (a través de Power BI Desktop).

DESCRIPCIÓN del proyecto:

Partiendo del Gravity Portal: MREID (Multinational Revenue, Employment, and Investment Database), de la 
United States International Trade Commision, disponible en https://www.usitc.gov/data/gravity/mreid.htm
se quiere hacer un análisis visual de los distintos países a nivel mundial.

El MREID proporciona información sobre los ingresos, el empleo y la inversión multinacional para un gran 
número de países e industrias. Las industrias abarcan los sectores de la agricultura, la minería, la energía, la 
manufactura y los servicios, lo que permite una descripción casi completa de la actividad de inversión 
extranjera directa (IED) de las empresas multinacionales con filiales transfronterizas en 185 países, 25 
industrias y un período de 12 años (2010 - 2021). 

Este documento está en formato separado por comas (csv) y se cargara a través de una herramienta ETL, en 
este caso n8n, a una base de datos relacional (MySQL). Tras ello se realizara un análisis estadístico de los 
datos y se responderán las preguntas planteadas. Además, se desarrollara un dashboard en Power Bi 
Desktop para un análisis visual de los datos.

---------------------------------------------------------------------------------------------

Starting from the Gravity Portal: MREID (Multinational Revenue, Employment, and Investment Database) by the United States International Trade Commission, a global country-level analysis is intended.

The OBJECTIVES of this project are:
- Analysis and understanding of the source data.
- Connection, preparation, and loading of data into a MySQL database (via n8n).
- Preparation of data structures and SQL queries.
- Answering the raised questions.
- Configuration of data visualization tools.
- Building dashboards for visual data analysis (using Power BI Desktop).

PROJECT DESCRIPTION:

Starting from the Gravity Portal: MREID (Multinational Revenue, Employment, and Investment Database) by the United States International Trade Commission, available at https://www.usitc.gov/data/gravity/mreid.htm, a visual analysis of countries worldwide is intended.

MREID provides information on multinational revenues, employment, and investment for a large number of countries and industries. The industries cover sectors such as agriculture, mining, energy, manufacturing, and services, allowing for a nearly complete description of foreign direct investment (FDI) activity by multinational companies with cross-border affiliates in 185 countries, 25 industries, and a 12-year period (2010-2021).

This document is in CSV format and will be loaded via an ETL tool, in this case, n8n, into a relational database (MySQL). After that, a statistical analysis of the data will be performed, and the raised questions will be answered. Additionally, a dashboard will be developed in Power BI Desktop for visual data analysis.
