USE [CP_BASE]
GO
CREATE PROCEDURE [dbo].[Get_All_Amount_N](@N REAL)
AS
	BEGIN
		SET NOCOUNT ON;
		SELECT [WAREHOUSE_NUMBER] AS '����� ������', [PROD_CODE] AS '��� ������', [ALL_AMOUNT] AS '����� �����'
		FROM [dbo].[STOR_PROD]
		WHERE ALL_AMOUNT>@N;
	END
GO

USE CP_BASE
GO
DECLARE @N REAL
SET @N=20;
EXECUTE Get_All_Amount_N @N;
GO