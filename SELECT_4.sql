USE [CP_BASE]
GO

SELECT s.PROD_CODE AS 'Код продукта', ROUND(SUM(s.ALL_AMOUNT),6) AS 'Общий объём со всех складов'
FROM STOR_PROD s 
GROUP BY s.PROD_CODE
GO