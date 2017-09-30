USE CP_BASE
GO
CREATE TRIGGER IOD_WAREHOUSE_LIST
   ON  [dbo].[WAREHOUSE_LIST] 
   INSTEAD OF DELETE
AS 
	BEGIN
		DELETE FROM INVOICES
		WHERE WAREHOUSE_NUMBER IN (SELECT WAREHOUSE_NUMBER FROM deleted);

		DELETE FROM STOR_PROD
		WHERE WAREHOUSE_NUMBER IN (SELECT WAREHOUSE_NUMBER FROM deleted);
	END
GO


CREATE TRIGGER IOU_WAREHOUSE_LIST
   ON  [dbo].[WAREHOUSE_LIST] 
   INSTEAD OF UPDATE
AS 
	BEGIN
		IF UPDATE(WAREHOUSE_NUMBER)
		BEGIN
			UPDATE INVOICES
				SET WAREHOUSE_NUMBER=inserted.WAREHOUSE_NUMBER
				FROM inserted
				WHERE INVOICES.WAREHOUSE_NUMBER=inserted.WAREHOUSE_NUMBER;
			UPDATE STOR_PROD
				SET WAREHOUSE_NUMBER=inserted.WAREHOUSE_NUMBER
				FROM inserted
				WHERE STOR_PROD.WAREHOUSE_NUMBER=inserted.WAREHOUSE_NUMBER;
		END
	END
GO