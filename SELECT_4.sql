USE [CP_BASE]
GO

SELECT s.PROD_CODE AS '��� ��������', ROUND(SUM(s.ALL_AMOUNT),6) AS '����� ����� �� ���� �������'
FROM STOR_PROD s 
GROUP BY s.PROD_CODE
GO