USE CP_BASE
GO
CREATE TABLE [dbo].[PROD_LIST] (
	[PROD_CODE] [int] IDENTITY(1,1) NOT NULL CONSTRAINT PK_PROD_LIST PRIMARY KEY CLUSTERED,
	[PROD_NAME] [nvarchar](50) NOT NULL,
	[MANUFACTURER] [nvarchar](100) NOT NULL,
	[MANU_ADDRESS] [nvarchar](100) NOT NULL,
	[PHONE_NUMBER] [nvarchar](11) NULL,
	[UNIT] [nvarchar](20) NULL
) ON [PRIMARY]
GO