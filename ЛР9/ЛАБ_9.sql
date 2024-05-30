SELECT DISTINCT MFR 
from ORDERS
WHERE AMOUNT % 2 = 0
  AND QTY % 2 = 1    
ORDER BY MFR

SELECT MFR_ID,
    ROUND(SUM(QTY_ON_HAND * PRICE), 2) AS TotalValue,
    ROUND(AVG(PRICE), 2) AS AveragePrice
FROM 
    PRODUCTS
GROUP BY 
    MFR_ID
ORDER BY 
    MFR_ID;


WITH SalesDifference AS (
    SELECT 
        EMPL_NUM,
        NAME,
        ROUND(ABS(QUOTA - SALES), 2) AS SalesDifference,
        ROUND(DATEDIFF(YEAR, DATEADD(YEAR, AGE, GETDATE()), HIRE_DATE), 2) AS AgeAtHire
    FROM 
        SALESREPS
)
SELECT 
    EMPL_NUM,
    NAME,
    SalesDifference,
    AgeAtHire
FROM 
    SalesDifference
WHERE 
    SalesDifference = (SELECT MAX(SalesDifference) FROM SalesDifference)
ORDER BY 
    EMPL_NUM;
