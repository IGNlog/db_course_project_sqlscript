USE [CP_BASE]
GO
/****** Object:  StoredProcedure [dbo].[Get_All_Amount_N]    Script Date: 09.10.2017 17:17:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_All_Amount_N](@N REAL)
AS
	BEGIN
		SET NOCOUNT ON;
		SELECT [WAREHOUSE_NUMBER] AS 'Номер склада', [PROD_CODE] AS 'Код товара', [ALL_AMOUNT] AS 'Общий объём'
		FROM [dbo].[STOR_PROD]
		WHERE ALL_AMOUNT>@N;
	END

GO
