#Crear tabla de inversiones afiliadas
CREATE TABLE Inversiones_afiliadas (
    iso3_o CHAR(3),  
    country_o VARCHAR(100),                              
    iso3_d CHAR(3),
    country_d VARCHAR(100),                                  
    year INT,                                  
    naics2 INT,                         
    naics2description VARCHAR(255),            
    extensive INT,                             
    greenfield INT,                            
    mergers INT,                               
    OperatingrevenueTurnover FLOAT,   
    OperatingrevenueTurnover_green FLOAT, 
    OperatingrevenueTurnover_mergers FLOAT, 
    TotalassetsthUSD FLOAT,           
    TotalassetsthUSD_green FLOAT,    
    TotalassetsthUSD_mergers FLOAT,  
    Numberofemployees FLOAT,                     
    Numberofemployees_green INT,               
    Numberofemployees_mergers INT,   
    FixedassetsthUSD FLOAT,           
    FixedassetsthUSD_green FLOAT,     
    FixedassetsthUSD_mergers FLOAT  
              
);

#1. Top 10 paises:ratio Facturación por empleado es más alto
SELECT 
	country_d, 
	SUM(OperatingrevenueTurnover) / SUM(Numberofemployees) AS Facturacion_por_empleado
FROM Inversiones_afiliadas ia 
GROUP BY country_d 
HAVING SUM(Numberofemployees) > 0
ORDER BY Facturacion_por_empleado DESC  
LIMIT 10;

#2. Bottom 10 paises:ratio Facturación por empleado es más bajo
SELECT 
	country_d, 
	IFNULL(SUM(OperatingrevenueTurnover)/SUM(Numberofemployees),0) AS Facturacion_por_empleado
FROM Inversiones_afiliadas ia 
GROUP BY country_d 
HAVING SUM(Numberofemployees) > 0 
ORDER BY Facturacion_por_empleado 
LIMIT 10;

#3. 5 sectores mejor evolucion 2010-2021, inversion domestica España
SELECT 
	naics2 AS sector,
	naics2description,
	SUM(CASE WHEN year = 2021 THEN extensive ELSE 0 END)- SUM(CASE WHEN year = 2010 THEN extensive ELSE 0 END) AS evolucion_2010_2021,
	SUM(CASE WHEN year = 2021 THEN TotalassetsthUSD ELSE 0 END ) AS total_activos_2021 
FROM Inversiones_afiliadas ia 
WHERE 
	country_o = 'Spain'
	AND country_d = 'Spain'
	AND year BETWEEN 2010 AND 2021
GROUP BY naics2, naics2description 
ORDER BY evolucion_2010_2021 DESC 
LIMIT 5;  

-- la pregunta anterior sin la evolución
SELECT 
	year,
	naics2description,
	SUM(extensive) AS NUMERO_EMPRESAS,
	SUM(TotalassetsthUSD) AS INVERSION
FROM Inversiones_afiliadas ia
WHERE 
	country_o = 'Spain'
	AND country_d = 'Spain'
	AND year BETWEEN 2010 AND 2021	
GROUP BY year, naics2description
ORDER BY 1, 2;


#4. 5 sectores peor evolucion 2010-2021, inversion internacional España
SELECT 
	naics2 AS sector,
	naics2description, 
	SUM(CASE WHEN year = 2021 THEN extensive ELSE 0 END)-SUM(CASE WHEN year = 2010 THEN extensive ELSE 0 END) AS evolucion_2010_2021
FROM Inversiones_afiliadas ia 
WHERE 
	country_o != 'Spain'
	AND country_d = 'Spain'
	AND year BETWEEN 2010 AND 2021
GROUP BY naics2, naics2description 
ORDER BY evolucion_2010_2021  
LIMIT 5;  

-- la pregunta anterior sin la evolución
SELECT 
		year,
		naics2description,
		SUM(extensive) AS NUMERO_EMPRESAS,
		SUM(TotalassetsthUSD) AS INVERSION
FROM Inversiones_afiliadas ia
WHERE 
	country_o != 'Spain'
	AND country_d = 'Spain'
	AND year BETWEEN 2010 AND 2021	
GROUP BY year, naics2description
ORDER BY 1, 2;
	

#5. € inversion extranjera en penindula iberica, 2020, finanzas y seguros 
SELECT country_d
FROM Inversiones_afiliadas ia 
WHERE country_d = "Andorra";
 -- puesto que andorra si esta en los datos, consideramos peninsula iberica: españa, portugal y andorra
-- calculo cada pais que forma la península ibérica en inversion extranjera 
SELECT 
	country_d, 
	year, 
	naics2description,
	SUM(OperatingrevenueTurnover) * 0.85 AS Importe_en_Euros
FROM Inversiones_afiliadas ia 
WHERE 
	country_d IN ('Spain', 'Portugal', 'Andorra') 
	AND year=2020
	AND TRIM(naics2description) = 'Finance and Insurance'
GROUP BY country_d, year, naics2description
ORDER BY Importe_en_Euros ; 

-- calculo el total para toda la peninsula iberica
SELECT SUM(OperatingrevenueTurnover) * 0.85 AS Importe_en_Euros
FROM Inversiones_afiliadas ia 
WHERE 
	country_d IN ('Spain', 'Portugal', 'Andorra') 
	AND year=2020
	AND TRIM(naics2description) = 'Finance and Insurance';
	
#6. € “Facturación por empleado”, Italia, 2015, Bienes Raíces
 SELECT 
	country_d, 
	year, 
	naics2description,
	(SUM(OperatingrevenueTurnover) / SUM(Numberofemployees)) * 0.85 AS Facturacion_empleados
FROM Inversiones_afiliadas ia 
WHERE 
	country_d = 'Italy' 
	AND year=2015
	AND TRIM(naics2description) = 'Real Estate'
GROUP BY country_d, naics2description, year;

