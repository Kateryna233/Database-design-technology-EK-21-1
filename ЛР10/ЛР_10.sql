-- ЗАДАЧА 1
SELECT DISTINCT MFR
FROM ORDERS
WHERE YEAR(ORDER_DATE) = 2008
ORDER BY MFR;

-- ЗАДАЧА 2
SELECT 
    DATEDIFF(YEAR, HIRE_DATE, GETDATE()) AS YearsWorked,
    COUNT(*) AS EmployeeCount
FROM SALESREPS
GROUP BY DATEDIFF(YEAR, HIRE_DATE, GETDATE())
ORDER BY EmployeeCount DESC;


-- ЗАДАЧА 3
WITH HireCounts AS (
    SELECT 
        YEAR(HIRE_DATE) AS HireYear, 
        MONTH(HIRE_DATE) AS HireMonth, 
        COUNT(*) AS EmployeeCount
    FROM SALESREPS
    GROUP BY YEAR(HIRE_DATE), MONTH(HIRE_DATE)
)
SELECT 
    HireYear, 
    HireMonth, 
    EmployeeCount
FROM HireCounts
WHERE EmployeeCount = (
    SELECT MAX(EmployeeCount) 
    FROM HireCounts
)
ORDER BY HireYear, HireMonth;

-- ЗАДАЧА 4
SELECT 
    DATEPART(WEEKDAY, ORDER_DATE) AS DayOfWeekNumber,
    DATENAME(WEEKDAY, ORDER_DATE) AS DayOfWeekName,
    COUNT(DISTINCT ORDER_NUM) AS TotalOrders,
    SUM(AMOUNT) AS TotalSales,
    SUM(QTY) AS TotalQuantitySold
FROM ORDERS
WHERE MONTH(ORDER_DATE) IN (12, 1, 2)
GROUP BY DATEPART(WEEKDAY, ORDER_DATE), DATENAME(WEEKDAY, ORDER_DATE)
ORDER BY DayOfWeekNumber;


