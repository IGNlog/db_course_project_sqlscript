USE CP_BASE
GO
CREATE TABLE [dbo].[STOR_PROD](
	[WAREHOUSE_NUMBER] [int] NOT NULL CHECK([WAREHOUSE_NUMBER]>=(2000)),
	[PROD_CODE] [int] NOT NULL CHECK([PROD_CODE]>=(1)),
	[LAST_MOD_DATE] [date] NULL,
	[ALL_AMOUNT] [real] NULL DEFAULT (0) CONSTRAINT CH_ALL_AMOUNT CHECK ([ALL_AMOUNT]>=(0)),
	[STOR_COND][nvarchar](200) NULL DEFAULT (''),
	CONSTRAINT PK_STOR_PROD PRIMARY KEY(WAREHOUSE_NUMBER,PROD_CODE)
	) ON [PRIMARY]