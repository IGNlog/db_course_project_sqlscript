USE [master]
GO
/****** Object:  Database [CP_BASE]    Script Date: 08.10.2017 19:46:46 ******/
CREATE DATABASE [CP_BASE]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CP_BASE', FILENAME = N'D:\db\CP_DB\CP_BASE.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CP_BASE_log', FILENAME = N'D:\db\CP_DB\CP_BASE_log.ldf' , SIZE = 1024KB , MAXSIZE = 2097152KB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CP_BASE] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CP_BASE].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CP_BASE] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CP_BASE] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CP_BASE] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CP_BASE] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CP_BASE] SET ARITHABORT OFF 
GO
ALTER DATABASE [CP_BASE] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [CP_BASE] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CP_BASE] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CP_BASE] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CP_BASE] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CP_BASE] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CP_BASE] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CP_BASE] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CP_BASE] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CP_BASE] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CP_BASE] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CP_BASE] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CP_BASE] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CP_BASE] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CP_BASE] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CP_BASE] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CP_BASE] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CP_BASE] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CP_BASE] SET  MULTI_USER 
GO
ALTER DATABASE [CP_BASE] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CP_BASE] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CP_BASE] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CP_BASE] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [CP_BASE] SET DELAYED_DURABILITY = DISABLED 
GO
USE [CP_BASE]
GO
/****** Object:  Table [dbo].[INVOICES]    Script Date: 08.10.2017 19:46:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[INVOICES](
	[INVOICE_NUMBER] [int] IDENTITY(1000,1) NOT NULL,
	[WAREHOUSE_NUMBER] [int] NOT NULL,
	[PERSON_IN_CHARGE] [nvarchar](100) NOT NULL,
	[PROD_CODE] [int] NOT NULL,
	[ATTRIBUTE] [bit] NOT NULL,
	[AMOUNT] [real] NULL DEFAULT ((0)),
	[MOD_DATE] [date] NULL,
 CONSTRAINT [PK_INVOICES] PRIMARY KEY CLUSTERED 
(
	[INVOICE_NUMBER] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PROD_LIST]    Script Date: 08.10.2017 19:46:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PROD_LIST](
	[PROD_CODE] [int] IDENTITY(1,1) NOT NULL,
	[PROD_NAME] [nvarchar](50) NOT NULL,
	[MANUFACTURER] [nvarchar](100) NOT NULL,
	[MANU_ADDRESS] [nvarchar](100) NOT NULL,
	[PHONE_NUMBER] [nvarchar](11) NULL,
	[UNIT] [nvarchar](20) NULL,
 CONSTRAINT [PK_PROD_LIST] PRIMARY KEY CLUSTERED 
(
	[PROD_CODE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[STOR_PROD]    Script Date: 08.10.2017 19:46:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STOR_PROD](
	[WAREHOUSE_NUMBER] [int] NOT NULL,
	[PROD_CODE] [int] NOT NULL,
	[LAST_MOD_DATE] [date] NULL,
	[ALL_AMOUNT] [real] NULL DEFAULT ((0)),
	[STOR_COND] [nvarchar](200) NULL DEFAULT (''),
 CONSTRAINT [PK_STOR_PROD] PRIMARY KEY CLUSTERED 
(
	[WAREHOUSE_NUMBER] ASC,
	[PROD_CODE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WAREHOUSE_LIST]    Script Date: 08.10.2017 19:46:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WAREHOUSE_LIST](
	[WAREHOUSE_NUMBER] [int] IDENTITY(2000,1) NOT NULL,
	[WAREHOUSE_NAME] [nvarchar](100) NOT NULL DEFAULT (''),
	[PERSON_IN_CHARGE] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_WHS] PRIMARY KEY CLUSTERED 
(
	[WAREHOUSE_NUMBER] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[INVOICES] ON 

INSERT [dbo].[INVOICES] ([INVOICE_NUMBER], [WAREHOUSE_NUMBER], [PERSON_IN_CHARGE], [PROD_CODE], [ATTRIBUTE], [AMOUNT], [MOD_DATE]) VALUES (1000, 2003, N'Улекаев Владимир Сергеевич', 2, 1, 4.5, CAST(N'2017-06-20' AS Date))
INSERT [dbo].[INVOICES] ([INVOICE_NUMBER], [WAREHOUSE_NUMBER], [PERSON_IN_CHARGE], [PROD_CODE], [ATTRIBUTE], [AMOUNT], [MOD_DATE]) VALUES (1001, 2004, N'Валуев Максим Анатольевич', 8, 1, 1.45, CAST(N'2017-07-13' AS Date))
INSERT [dbo].[INVOICES] ([INVOICE_NUMBER], [WAREHOUSE_NUMBER], [PERSON_IN_CHARGE], [PROD_CODE], [ATTRIBUTE], [AMOUNT], [MOD_DATE]) VALUES (1002, 2009, N'Исаев Олег Викторович', 4, 1, 120, CAST(N'2017-05-15' AS Date))
INSERT [dbo].[INVOICES] ([INVOICE_NUMBER], [WAREHOUSE_NUMBER], [PERSON_IN_CHARGE], [PROD_CODE], [ATTRIBUTE], [AMOUNT], [MOD_DATE]) VALUES (1003, 2002, N'Сухова Надежда Дмитриевна', 12, 1, 12, CAST(N'2017-07-15' AS Date))
INSERT [dbo].[INVOICES] ([INVOICE_NUMBER], [WAREHOUSE_NUMBER], [PERSON_IN_CHARGE], [PROD_CODE], [ATTRIBUTE], [AMOUNT], [MOD_DATE]) VALUES (1004, 2000, N'Ведина Ирина Алексеевна', 5, 1, 300, CAST(N'2017-05-30' AS Date))
INSERT [dbo].[INVOICES] ([INVOICE_NUMBER], [WAREHOUSE_NUMBER], [PERSON_IN_CHARGE], [PROD_CODE], [ATTRIBUTE], [AMOUNT], [MOD_DATE]) VALUES (1005, 2001, N'Соколовкий Руслан Игоревич', 3, 1, 209, CAST(N'2017-06-14' AS Date))
INSERT [dbo].[INVOICES] ([INVOICE_NUMBER], [WAREHOUSE_NUMBER], [PERSON_IN_CHARGE], [PROD_CODE], [ATTRIBUTE], [AMOUNT], [MOD_DATE]) VALUES (1006, 2000, N'Ведина Ирина Алексеевна', 10, 1, 3, CAST(N'2017-06-01' AS Date))
INSERT [dbo].[INVOICES] ([INVOICE_NUMBER], [WAREHOUSE_NUMBER], [PERSON_IN_CHARGE], [PROD_CODE], [ATTRIBUTE], [AMOUNT], [MOD_DATE]) VALUES (1007, 2001, N'Соколовский Руслан Игоревич', 3, 1, 100, CAST(N'2017-07-19' AS Date))
INSERT [dbo].[INVOICES] ([INVOICE_NUMBER], [WAREHOUSE_NUMBER], [PERSON_IN_CHARGE], [PROD_CODE], [ATTRIBUTE], [AMOUNT], [MOD_DATE]) VALUES (1008, 2009, N'Исаев Олег Викторович', 4, 1, 23, CAST(N'2017-06-14' AS Date))
INSERT [dbo].[INVOICES] ([INVOICE_NUMBER], [WAREHOUSE_NUMBER], [PERSON_IN_CHARGE], [PROD_CODE], [ATTRIBUTE], [AMOUNT], [MOD_DATE]) VALUES (1009, 2000, N'Ведина Ирина Алексеевна', 5, 0, 40, CAST(N'2017-08-02' AS Date))
INSERT [dbo].[INVOICES] ([INVOICE_NUMBER], [WAREHOUSE_NUMBER], [PERSON_IN_CHARGE], [PROD_CODE], [ATTRIBUTE], [AMOUNT], [MOD_DATE]) VALUES (1010, 2009, N'Исаев Олег Дмитреевич', 4, 0, 30, CAST(N'2017-09-17' AS Date))
INSERT [dbo].[INVOICES] ([INVOICE_NUMBER], [WAREHOUSE_NUMBER], [PERSON_IN_CHARGE], [PROD_CODE], [ATTRIBUTE], [AMOUNT], [MOD_DATE]) VALUES (1011, 2001, N'Соколовский Руслан Игоревич', 3, 0, 103, CAST(N'2017-09-14' AS Date))
INSERT [dbo].[INVOICES] ([INVOICE_NUMBER], [WAREHOUSE_NUMBER], [PERSON_IN_CHARGE], [PROD_CODE], [ATTRIBUTE], [AMOUNT], [MOD_DATE]) VALUES (1012, 2002, N'Сухова Надежда Дмитриевна', 12, 0, 10, CAST(N'2017-09-07' AS Date))
INSERT [dbo].[INVOICES] ([INVOICE_NUMBER], [WAREHOUSE_NUMBER], [PERSON_IN_CHARGE], [PROD_CODE], [ATTRIBUTE], [AMOUNT], [MOD_DATE]) VALUES (1013, 2003, N'Улекаев Владимир Сергеевич', 2, 0, 2.4, CAST(N'2017-09-15' AS Date))
INSERT [dbo].[INVOICES] ([INVOICE_NUMBER], [WAREHOUSE_NUMBER], [PERSON_IN_CHARGE], [PROD_CODE], [ATTRIBUTE], [AMOUNT], [MOD_DATE]) VALUES (1014, 2005, N'Вилова Нина Олеговна', 6, 1, 13, CAST(N'2017-09-18' AS Date))
INSERT [dbo].[INVOICES] ([INVOICE_NUMBER], [WAREHOUSE_NUMBER], [PERSON_IN_CHARGE], [PROD_CODE], [ATTRIBUTE], [AMOUNT], [MOD_DATE]) VALUES (1015, 2005, N'Вилова Нина Олеговна', 6, 0, 8, CAST(N'2017-09-19' AS Date))
INSERT [dbo].[INVOICES] ([INVOICE_NUMBER], [WAREHOUSE_NUMBER], [PERSON_IN_CHARGE], [PROD_CODE], [ATTRIBUTE], [AMOUNT], [MOD_DATE]) VALUES (1081, 2009, N'Мингазов Валерий Дмитреевич', 6, 1, 6, CAST(N'2017-09-20' AS Date))
INSERT [dbo].[INVOICES] ([INVOICE_NUMBER], [WAREHOUSE_NUMBER], [PERSON_IN_CHARGE], [PROD_CODE], [ATTRIBUTE], [AMOUNT], [MOD_DATE]) VALUES (1082, 2009, N'Мингазов Валерий Дмитреевич ', 1, 1, 30, CAST(N'2017-09-21' AS Date))
INSERT [dbo].[INVOICES] ([INVOICE_NUMBER], [WAREHOUSE_NUMBER], [PERSON_IN_CHARGE], [PROD_CODE], [ATTRIBUTE], [AMOUNT], [MOD_DATE]) VALUES (1083, 2009, N'Мингазов Валерий Дмитеевич', 10, 1, 20, CAST(N'2017-09-22' AS Date))
INSERT [dbo].[INVOICES] ([INVOICE_NUMBER], [WAREHOUSE_NUMBER], [PERSON_IN_CHARGE], [PROD_CODE], [ATTRIBUTE], [AMOUNT], [MOD_DATE]) VALUES (1084, 2009, N'Мингазов Валерий Дмитреевич', 9, 1, 30, CAST(N'2017-09-23' AS Date))
SET IDENTITY_INSERT [dbo].[INVOICES] OFF
SET IDENTITY_INSERT [dbo].[PROD_LIST] ON 

INSERT [dbo].[PROD_LIST] ([PROD_CODE], [PROD_NAME], [MANUFACTURER], [MANU_ADDRESS], [PHONE_NUMBER], [UNIT]) VALUES (1, N'Стеклоочиститель, 5л', N'ООО "ПРОМСПИРТ"', N'г. Казань, ул. Промышленная, 12', N'88435566110', N'шт.')
INSERT [dbo].[PROD_LIST] ([PROD_CODE], [PROD_NAME], [MANUFACTURER], [MANU_ADDRESS], [PHONE_NUMBER], [UNIT]) VALUES (2, N'Хлоргиксидин', N'ООО "НОВХИМ"', N'г. Нижний Новгород, ул. Энгельса, 143', N'88245904453', N'т.')
INSERT [dbo].[PROD_LIST] ([PROD_CODE], [PROD_NAME], [MANUFACTURER], [MANU_ADDRESS], [PHONE_NUMBER], [UNIT]) VALUES (3, N'Морозильная камера "POZIS" мод. 123456', N'AO "ПОЗиС"', N'г. Зеленодольск, ул.Привокзальная, 4', N'88435673434', N'шт.')
INSERT [dbo].[PROD_LIST] ([PROD_CODE], [PROD_NAME], [MANUFACTURER], [MANU_ADDRESS], [PHONE_NUMBER], [UNIT]) VALUES (4, N'Ёмкости пластмасовые прямоугольные', N'ООО "Пласт Инжиниринг"', N'г. Казань, ул. Халитова , 4', N'88432491604', N'шт.')
INSERT [dbo].[PROD_LIST] ([PROD_CODE], [PROD_NAME], [MANUFACTURER], [MANU_ADDRESS], [PHONE_NUMBER], [UNIT]) VALUES (5, N'ПЭТ-листы Novattro, 2250x2250', N'ООО "СафтПласт"', N'г. Стерлетомак, ул. Ленина, 1', N'84323302801', N'шт.')
INSERT [dbo].[PROD_LIST] ([PROD_CODE], [PROD_NAME], [MANUFACTURER], [MANU_ADDRESS], [PHONE_NUMBER], [UNIT]) VALUES (6, N'Ножи бытовые рыбные', N'ЗАО «Мелита-К»', N'г. Казань, ул. Восстания, д. 100', N'88432125159', N'шт.')
INSERT [dbo].[PROD_LIST] ([PROD_CODE], [PROD_NAME], [MANUFACTURER], [MANU_ADDRESS], [PHONE_NUMBER], [UNIT]) VALUES (7, N'Мешки полипропиленовые', N'ООО "Миало"', N'г. Москва,ул. Восстания, 113', N'84994343343', N'шт.')
INSERT [dbo].[PROD_LIST] ([PROD_CODE], [PROD_NAME], [MANUFACTURER], [MANU_ADDRESS], [PHONE_NUMBER], [UNIT]) VALUES (8, N'Дистиллированная вода', N'ООО "СПЕЦХИМ"', N'г. Саратов, ул. Кремневая, 20', N'83547690648', N'т.')
INSERT [dbo].[PROD_LIST] ([PROD_CODE], [PROD_NAME], [MANUFACTURER], [MANU_ADDRESS], [PHONE_NUMBER], [UNIT]) VALUES (9, N'Двери металлические', N'ООО "РУСНА"', N'г. Казань, ул. Адоратского, 50а', N'88432377433', N'шт.')
INSERT [dbo].[PROD_LIST] ([PROD_CODE], [PROD_NAME], [MANUFACTURER], [MANU_ADDRESS], [PHONE_NUMBER], [UNIT]) VALUES (10, N'Аппараты для розлива растительного масла', N'ООО "Стандартпродмаш"', N'г. Казань, д. Самосырово, ул. Дорожная, 12а', N'88432501524', N'шт.')
INSERT [dbo].[PROD_LIST] ([PROD_CODE], [PROD_NAME], [MANUFACTURER], [MANU_ADDRESS], [PHONE_NUMBER], [UNIT]) VALUES (11, N'Моющее средство для бесконтактной мойки, 5л', N'ООО "МАХИМ"', N'г. Чита, ул. Садовая, 14', N'86757394345', N'шт.')
INSERT [dbo].[PROD_LIST] ([PROD_CODE], [PROD_NAME], [MANUFACTURER], [MANU_ADDRESS], [PHONE_NUMBER], [UNIT]) VALUES (12, N'Пластиковые трубы, 5м', N'ООО "Сантехприбор"', N'г. Санкт-Петербург, ул. Кирова, 13', N'84934350034', N'шт.')
SET IDENTITY_INSERT [dbo].[PROD_LIST] OFF
INSERT [dbo].[STOR_PROD] ([WAREHOUSE_NUMBER], [PROD_CODE], [LAST_MOD_DATE], [ALL_AMOUNT], [STOR_COND]) VALUES (2000, 5, CAST(N'2017-09-30' AS Date), 260, N'')
INSERT [dbo].[STOR_PROD] ([WAREHOUSE_NUMBER], [PROD_CODE], [LAST_MOD_DATE], [ALL_AMOUNT], [STOR_COND]) VALUES (2000, 10, CAST(N'2017-09-30' AS Date), 3, N'')
INSERT [dbo].[STOR_PROD] ([WAREHOUSE_NUMBER], [PROD_CODE], [LAST_MOD_DATE], [ALL_AMOUNT], [STOR_COND]) VALUES (2001, 3, CAST(N'2017-09-30' AS Date), 206, N'')
INSERT [dbo].[STOR_PROD] ([WAREHOUSE_NUMBER], [PROD_CODE], [LAST_MOD_DATE], [ALL_AMOUNT], [STOR_COND]) VALUES (2002, 12, CAST(N'2017-09-30' AS Date), 2, N'')
INSERT [dbo].[STOR_PROD] ([WAREHOUSE_NUMBER], [PROD_CODE], [LAST_MOD_DATE], [ALL_AMOUNT], [STOR_COND]) VALUES (2003, 2, CAST(N'2017-09-30' AS Date), 2.1, N'')
INSERT [dbo].[STOR_PROD] ([WAREHOUSE_NUMBER], [PROD_CODE], [LAST_MOD_DATE], [ALL_AMOUNT], [STOR_COND]) VALUES (2004, 8, CAST(N'2017-09-30' AS Date), 1.45, N'')
INSERT [dbo].[STOR_PROD] ([WAREHOUSE_NUMBER], [PROD_CODE], [LAST_MOD_DATE], [ALL_AMOUNT], [STOR_COND]) VALUES (2005, 6, CAST(N'2017-09-30' AS Date), 5, N'')
INSERT [dbo].[STOR_PROD] ([WAREHOUSE_NUMBER], [PROD_CODE], [LAST_MOD_DATE], [ALL_AMOUNT], [STOR_COND]) VALUES (2009, 1, CAST(N'2017-09-30' AS Date), 30, N'')
INSERT [dbo].[STOR_PROD] ([WAREHOUSE_NUMBER], [PROD_CODE], [LAST_MOD_DATE], [ALL_AMOUNT], [STOR_COND]) VALUES (2009, 4, CAST(N'2017-09-30' AS Date), 113, N'')
INSERT [dbo].[STOR_PROD] ([WAREHOUSE_NUMBER], [PROD_CODE], [LAST_MOD_DATE], [ALL_AMOUNT], [STOR_COND]) VALUES (2009, 6, CAST(N'2017-09-30' AS Date), 6, N'')
INSERT [dbo].[STOR_PROD] ([WAREHOUSE_NUMBER], [PROD_CODE], [LAST_MOD_DATE], [ALL_AMOUNT], [STOR_COND]) VALUES (2009, 9, CAST(N'2017-09-30' AS Date), 30, N'')
INSERT [dbo].[STOR_PROD] ([WAREHOUSE_NUMBER], [PROD_CODE], [LAST_MOD_DATE], [ALL_AMOUNT], [STOR_COND]) VALUES (2009, 10, CAST(N'2017-09-30' AS Date), 20, N'')
SET IDENTITY_INSERT [dbo].[WAREHOUSE_LIST] ON 

INSERT [dbo].[WAREHOUSE_LIST] ([WAREHOUSE_NUMBER], [WAREHOUSE_NAME], [PERSON_IN_CHARGE]) VALUES (2000, N'ООО "РУСАГРО"', N'Антонов Валерий Юрьевич')
INSERT [dbo].[WAREHOUSE_LIST] ([WAREHOUSE_NUMBER], [WAREHOUSE_NAME], [PERSON_IN_CHARGE]) VALUES (2001, N'ОАО "ЗСЛ"', N'Уткин Дмитрий Александрович')
INSERT [dbo].[WAREHOUSE_LIST] ([WAREHOUSE_NUMBER], [WAREHOUSE_NAME], [PERSON_IN_CHARGE]) VALUES (2002, N'ООО "БСК"', N'Гафуров Дамир Азатович')
INSERT [dbo].[WAREHOUSE_LIST] ([WAREHOUSE_NUMBER], [WAREHOUSE_NAME], [PERSON_IN_CHARGE]) VALUES (2003, N'ООО "ДВ СКЛАДЫ"', N'Кузнецов Иван Александрович')
INSERT [dbo].[WAREHOUSE_LIST] ([WAREHOUSE_NUMBER], [WAREHOUSE_NAME], [PERSON_IN_CHARGE]) VALUES (2004, N'ОА "ВинСклад"', N'Трушин Роман Сергеевич')
INSERT [dbo].[WAREHOUSE_LIST] ([WAREHOUSE_NUMBER], [WAREHOUSE_NAME], [PERSON_IN_CHARGE]) VALUES (2005, N'ООО "КРОКУС ИНТЕРСКЛАД"', N'Алётким Максим Владимирович')
INSERT [dbo].[WAREHOUSE_LIST] ([WAREHOUSE_NUMBER], [WAREHOUSE_NAME], [PERSON_IN_CHARGE]) VALUES (2006, N'ООО "ТБСС"', N'Улеев Арсений Никалаевич')
INSERT [dbo].[WAREHOUSE_LIST] ([WAREHOUSE_NUMBER], [WAREHOUSE_NAME], [PERSON_IN_CHARGE]) VALUES (2007, N'ООО "ВЕСТ-СКЛАД"', N'Вилтов Игнат Семёнович')
INSERT [dbo].[WAREHOUSE_LIST] ([WAREHOUSE_NUMBER], [WAREHOUSE_NAME], [PERSON_IN_CHARGE]) VALUES (2008, N'ООО "АЛЬЯНС-С"', N'Соснов Илья Олегович')
INSERT [dbo].[WAREHOUSE_LIST] ([WAREHOUSE_NUMBER], [WAREHOUSE_NAME], [PERSON_IN_CHARGE]) VALUES (2009, N'ООО "ТЕРМИНАЛ-ТРАНС"', N'Фомин Никита Борисович')
SET IDENTITY_INSERT [dbo].[WAREHOUSE_LIST] OFF
ALTER TABLE [dbo].[INVOICES]  WITH CHECK ADD  CONSTRAINT [PROD_LIST_INV] FOREIGN KEY([PROD_CODE])
REFERENCES [dbo].[PROD_LIST] ([PROD_CODE])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[INVOICES] CHECK CONSTRAINT [PROD_LIST_INV]
GO
ALTER TABLE [dbo].[INVOICES]  WITH CHECK ADD  CONSTRAINT [W_L_INV] FOREIGN KEY([WAREHOUSE_NUMBER])
REFERENCES [dbo].[WAREHOUSE_LIST] ([WAREHOUSE_NUMBER])
GO
ALTER TABLE [dbo].[INVOICES] CHECK CONSTRAINT [W_L_INV]
GO
ALTER TABLE [dbo].[STOR_PROD]  WITH CHECK ADD  CONSTRAINT [PROD_LIST_STOR_PROD] FOREIGN KEY([PROD_CODE])
REFERENCES [dbo].[PROD_LIST] ([PROD_CODE])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[STOR_PROD] CHECK CONSTRAINT [PROD_LIST_STOR_PROD]
GO
ALTER TABLE [dbo].[STOR_PROD]  WITH CHECK ADD  CONSTRAINT [W_L_STOR_PROD] FOREIGN KEY([WAREHOUSE_NUMBER])
REFERENCES [dbo].[WAREHOUSE_LIST] ([WAREHOUSE_NUMBER])
GO
ALTER TABLE [dbo].[STOR_PROD] CHECK CONSTRAINT [W_L_STOR_PROD]
GO
ALTER TABLE [dbo].[INVOICES]  WITH CHECK ADD  CONSTRAINT [CH_AMOUNT] CHECK  (([AMOUNT]>=(0)))
GO
ALTER TABLE [dbo].[INVOICES] CHECK CONSTRAINT [CH_AMOUNT]
GO
ALTER TABLE [dbo].[INVOICES]  WITH CHECK ADD CHECK  (([ATTRIBUTE]>=(0) AND [ATTRIBUTE]<=(1)))
GO
ALTER TABLE [dbo].[INVOICES]  WITH CHECK ADD CHECK  (([PROD_CODE]>=(1)))
GO
ALTER TABLE [dbo].[INVOICES]  WITH CHECK ADD CHECK  (([WAREHOUSE_NUMBER]>=(2000)))
GO
ALTER TABLE [dbo].[STOR_PROD]  WITH CHECK ADD  CONSTRAINT [CH_ALL_AMOUNT] CHECK  (([ALL_AMOUNT]>=(0)))
GO
ALTER TABLE [dbo].[STOR_PROD] CHECK CONSTRAINT [CH_ALL_AMOUNT]
GO
ALTER TABLE [dbo].[STOR_PROD]  WITH CHECK ADD CHECK  (([PROD_CODE]>=(1)))
GO
ALTER TABLE [dbo].[STOR_PROD]  WITH CHECK ADD CHECK  (([WAREHOUSE_NUMBER]>=(2000)))
GO
/****** Object:  StoredProcedure [dbo].[Get_All_Amount_N]    Script Date: 08.10.2017 19:46:47 ******/
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
/****** Object:  Trigger [dbo].[AI_INVOICES]    Script Date: 08.10.2017 19:46:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[AI_INVOICES] ON [dbo].[INVOICES]
	FOR INSERT
AS 
BEGIN
	DECLARE @Count int;
	SET @Count=@@ROWCOUNT;
	IF @Count=0
		RETURN;
	--SET NOCOUNT ON;
	--	UPDATE STOR_PROD
	--	SET ALL_AMOUNT=ALL_AMOUNT+(SELECT SUM(AMOUNT) FROM inserted i 
	--		WHERE i.WAREHOUSE_NUMBER=STOR_PROD.WAREHOUSE_NUMBER AND
	--			i.PROD_CODE=STOR_PROD.PROD_CODE AND
	--				i.ATTRIBUTE=1);
	--	UPDATE STOR_PROD
	--	SET ALL_AMOUNT=ALL_AMOUNT-(SELECT SUM(AMOUNT) FROM inserted i 
	--		WHERE i.WAREHOUSE_NUMBER=STOR_PROD.WAREHOUSE_NUMBER AND
	--			i.PROD_CODE=STOR_PROD.PROD_CODE AND
	--				i.ATTRIBUTE=0);
	SELECT SUM(i.AMOUNT) AS amount1, i.WAREHOUSE_NUMBER, i.PROD_CODE INTO #tmp_tbl1 
	FROM inserted i WHERE i.ATTRIBUTE=1
	GROUP BY i.PROD_CODE, i.WAREHOUSE_NUMBER;
	
	SELECT SUM(i.AMOUNT)*(-1) AS amount0, i.WAREHOUSE_NUMBER, i.PROD_CODE INTO #tmp_tbl0
	FROM inserted i WHERE i.ATTRIBUTE=0
	GROUP BY i.PROD_CODE, i.WAREHOUSE_NUMBER;

	UPDATE STOR_PROD
		SET ALL_AMOUNT = ALL_AMOUNT + amount1, LAST_MOD_DATE = GETDATE()--tmp1.MOD_DATE
			FROM STOR_PROD s, #tmp_tbl1 tmp1 WHERE
				s.WAREHOUSE_NUMBER=tmp1.WAREHOUSE_NUMBER AND
				s.PROD_CODE=tmp1.PROD_CODE;

	UPDATE STOR_PROD
		SET ALL_AMOUNT = ALL_AMOUNT + amount0, LAST_MOD_DATE = GETDATE()--tmp0.MOD_DATE
			FROM STOR_PROD s, #tmp_tbl0 tmp0 WHERE
				s.WAREHOUSE_NUMBER=tmp0.WAREHOUSE_NUMBER AND
				s.PROD_CODE=tmp0.PROD_CODE;


	SELECT #tmp_tbl1.WAREHOUSE_NUMBER, #tmp_tbl1.PROD_CODE, #tmp_tbl1.amount1 INTO #tmp_tbl_EXC_1_1
	FROM #tmp_tbl1
	EXCEPT
	SELECT s.WAREHOUSE_NUMBER, s.PROD_CODE, amount1
	FROM STOR_PROD s, #tmp_tbl1;

	SELECT #tmp_tbl0.WAREHOUSE_NUMBER, #tmp_tbl0.PROD_CODE, #tmp_tbl0.amount0 INTO #tmp_tbl_EXC_0_0
	FROM #tmp_tbl0
	EXCEPT
	SELECT s.WAREHOUSE_NUMBER, s.PROD_CODE, amount0
	FROM STOR_PROD s, #tmp_tbl0;

	SELECT #tmp_tbl_EXC_1_1.WAREHOUSE_NUMBER, #tmp_tbl_EXC_1_1.PROD_CODE, #tmp_tbl_EXC_1_1.amount1+#tmp_tbl_EXC_0_0.amount0 AS amountRes INTO #tmp_tbl_EXC_Res
	FROM #tmp_tbl_EXC_1_1 INNER JOIN #tmp_tbl_EXC_0_0 ON
	(#tmp_tbl_EXC_1_1.WAREHOUSE_NUMBER=#tmp_tbl_EXC_0_0.WAREHOUSE_NUMBER) AND (#tmp_tbl_EXC_1_1.PROD_CODE=#tmp_tbl_EXC_0_0.PROD_CODE);

	SELECT #tmp_tbl_EXC_1_1.WAREHOUSE_NUMBER, #tmp_tbl_EXC_1_1.PROD_CODE, #tmp_tbl_EXC_1_1.amount1 INTO #tmp_tbl_EXC_for_ins
	FROM #tmp_tbl_EXC_1_1
	EXCEPT
	SELECT #tmp_tbl_EXC_1_1.WAREHOUSE_NUMBER, #tmp_tbl_EXC_1_1.PROD_CODE, #tmp_tbl_EXC_1_1.amount1+#tmp_tbl_EXC_0_0.amount0 AS amountRes
	FROM #tmp_tbl_EXC_1_1 INNER JOIN #tmp_tbl_EXC_0_0 ON
	(#tmp_tbl_EXC_1_1.WAREHOUSE_NUMBER=#tmp_tbl_EXC_0_0.WAREHOUSE_NUMBER) AND (#tmp_tbl_EXC_1_1.PROD_CODE=#tmp_tbl_EXC_0_0.PROD_CODE);

	SELECT * INTO #tmp_tbl_ins_S_P
	FROM (SELECT * FROM #tmp_tbl_EXC_for_ins
		  UNION
		  SELECT * FROM #tmp_tbl_EXC_Res) #tmp_tbl_ins_S_P;
	
	SET @Count=@@ROWCOUNT;
	IF @Count>0
	BEGIN
		INSERT INTO STOR_PROD(WAREHOUSE_NUMBER, PROD_CODE, LAST_MOD_DATE, ALL_AMOUNT)
		SELECT WAREHOUSE_NUMBER, PROD_CODE, GETDATE(), amount1
		FROM  #tmp_tbl_ins_S_P
	END;


	
	--UPDATE STOR_PROD
	--	SET ALL_AMOUNT = ALL_AMOUNT + amount1, LAST_MOD_DATE = GETDATE()--tmp1.MOD_DATE
	--		FROM STOR_PROD s INNER JOIN #tmp_tbl1 tmp1 ON
	--			s.WAREHOUSE_NUMBER=tmp1.WAREHOUSE_NUMBER AND
	--			s.PROD_CODE=tmp1.PROD_CODE;
	
	--UPDATE STOR_PROD
	--	SET ALL_AMOUNT = ALL_AMOUNT - amount0, LAST_MOD_DATE = GETDATE()--tmp0.MOD_DATE
	--		FROM STOR_PROD s INNER JOIN #tmp_tbl0 tmp0 ON
	--			s.WAREHOUSE_NUMBER=tmp0.WAREHOUSE_NUMBER AND
	--			s.PROD_CODE=tmp0.PROD_CODE;

	--SELECT  #tmp_tbl0.WAREHOUSE_NUMBER, #tmp_tbl0.PROD_CODE, amount0 INTO #tmp_tbl_i0
	--	FROM STOR_PROD s, #tmp_tbl0 WHERE
	--	(s.WAREHOUSE_NUMBER<>#tmp_tbl0.WAREHOUSE_NUMBER OR s.PROD_CODE<>#tmp_tbl0.PROD_CODE)
	--	GROUP BY #tmp_tbl0.WAREHOUSE_NUMBER, #tmp_tbl0.PROD_CODE, amount0;
	--SET @Count= @@ROWCOUNT;
	--IF @Count>0
	--	BEGIN
	--		INSERT INTO STOR_PROD(WAREHOUSE_NUMBER, PROD_CODE, LAST_MOD_DATE, ALL_AMOUNT)
	--		SELECT WAREHOUSE_NUMBER, PROD_CODE,GETDATE() ,amount0 
	--		FROM #tmp_tbl_i0
	--	END
	--SELECT  #tmp_tbl1.WAREHOUSE_NUMBER, #tmp_tbl1.PROD_CODE, amount1 INTO #tmp_tbl_i1
	--	FROM STOR_PROD s, #tmp_tbl1 WHERE
	--	(s.WAREHOUSE_NUMBER<>#tmp_tbl1.WAREHOUSE_NUMBER OR s.PROD_CODE<>#tmp_tbl1.PROD_CODE)
	--	GROUP BY #tmp_tbl1.WAREHOUSE_NUMBER, #tmp_tbl1.PROD_CODE, amount1;
	--	--WHERE s.WAREHOUSE_NUMBER<>#tmp_tbl1.WAREHOUSE_NUMBER OR s.PROD_CODE<>#tmp_tbl1.PROD_CODE;
	--SET @Count=@@ROWCOUNT;
	--IF @Count>0	
	--	BEGIN
	--		INSERT INTO STOR_PROD(WAREHOUSE_NUMBER, PROD_CODE, LAST_MOD_DATE, ALL_AMOUNT)
	--		SELECT WAREHOUSE_NUMBER, PROD_CODE,GETDATE() ,amount1 
	--		FROM #tmp_tbl_i1
	--	END

	--INSERT INTO STOR_PROD(WAREHOUSE_NUMBER, PROD_CODE, LAST_MOD_DATE, ALL_AMOUNT)
	--SELECT WAREHOUSE_NUMBER, PROD_CODE,GETDATE() ,amount0 
	--FROM #tmp_tbl_i0

	--INSERT INTO STOR_PROD(WAREHOUSE_NUMBER, PROD_CODE, LAST_MOD_DATE, ALL_AMOUNT)
	--SELECT WAREHOUSE_NUMBER, PROD_CODE,GETDATE() ,amount1
	--FROM #tmp_tbl_i1
	
	--UPDATE STOR_PROD
	--	SET ALL_AMOUNT = ALL_AMOUNT + amount1, LAST_MOD_DATE = GETDATE()--tmp1.MOD_DATE
	--		FROM STOR_PROD s INNER JOIN #tmp_tbl1 tmp1 ON
	--			s.WAREHOUSE_NUMBER=tmp1.WAREHOUSE_NUMBER AND
	--			s.PROD_CODE=tmp1.PROD_CODE;
	
	--UPDATE STOR_PROD
	--	SET ALL_AMOUNT = ALL_AMOUNT - amount0, LAST_MOD_DATE = GETDATE()--tmp0.MOD_DATE
	--		FROM STOR_PROD s INNER JOIN #tmp_tbl0 tmp0 ON
	--			s.WAREHOUSE_NUMBER=tmp0.WAREHOUSE_NUMBER AND
	--			s.PROD_CODE=tmp0.PROD_CODE;
	
	--INSERT INTO STOR_PROD(WAREHOUSE_NUMBER, PROD_CODE, LAST_MOD_DATE, ALL_AMOUNT)
	--SELECT WAREHOUSE_NUMBER, PROD_CODE,GETDATE() ,amount0 
	--FROM #tmp_tbl_i0

	--INSERT INTO STOR_PROD(WAREHOUSE_NUMBER, PROD_CODE, LAST_MOD_DATE, ALL_AMOUNT)
	--SELECT WAREHOUSE_NUMBER, PROD_CODE,GETDATE() ,amount1
	--FROM #tmp_tbl_i1
	
END

GO
/****** Object:  Trigger [dbo].[AU_INVOICES]    Script Date: 08.10.2017 19:46:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[AU_INVOICES] ON [dbo].[INVOICES]
   AFTER UPDATE
AS 
BEGIN
	DECLARE @Count int;
	SET @Count=@@ROWCOUNT;
	IF @Count=0 RETURN;
	SET NOCOUNT ON;

   IF UPDATE(AMOUNT) OR UPDATE(PROD_CODE) OR UPDATE(WAREHOUSE_NUMBER) OR UPDATE(ATTRIBUTE)
		BEGIN
			SELECT * FROM deleted WHERE ATTRIBUTE=1
			SET @Count=@@ROWCOUNT;
			IF @Count>0 
				BEGIN
					UPDATE STOR_PROD
					SET ALL_AMOUNT= ALL_AMOUNT-(SELECT SUM(AMOUNT)
							FROM deleted d
							WHERE d.ATTRIBUTE=1 AND d.WAREHOUSE_NUMBER=STOR_PROD.WAREHOUSE_NUMBER AND d.PROD_CODE=STOR_PROD.PROD_CODE
							GROUP BY PROD_CODE,WAREHOUSE_NUMBER,ATTRIBUTE)
					WHERE PROD_CODE IN (SELECT PROD_CODE FROM deleted d1) AND WAREHOUSE_NUMBER IN (SELECT WAREHOUSE_NUMBER FROM deleted d1)
				END
			SELECT * FROM deleted WHERE ATTRIBUTE=0
			SET @Count=@@ROWCOUNT;
			IF @Count>0 
				BEGIN
					UPDATE STOR_PROD
					SET	ALL_AMOUNT= ALL_AMOUNT+(SELECT SUM(AMOUNT)
							FROM deleted d
							WHERE d.ATTRIBUTE=0 AND d.WAREHOUSE_NUMBER=STOR_PROD.WAREHOUSE_NUMBER AND d.PROD_CODE=STOR_PROD.PROD_CODE
							GROUP BY PROD_CODE,WAREHOUSE_NUMBER,ATTRIBUTE)
					WHERE PROD_CODE IN (SELECT PROD_CODE FROM deleted d1) AND WAREHOUSE_NUMBER IN (SELECT WAREHOUSE_NUMBER FROM deleted d1)
				END
			SELECT * FROM INSERTED WHERE ATTRIBUTE=1
			SET @Count=@@ROWCOUNT;
			IF @Count>0
				BEGIN
					UPDATE STOR_PROD
					SET ALL_AMOUNT=ALL_AMOUNT+(SELECT SUM(AMOUNT)
							FROM inserted i
							WHERE i.ATTRIBUTE=1 AND i.WAREHOUSE_NUMBER=STOR_PROD.WAREHOUSE_NUMBER AND i.PROD_CODE=STOR_PROD.PROD_CODE
							GROUP BY PROD_CODE, WAREHOUSE_NUMBER,ATTRIBUTE)
					WHERE PROD_CODE IN (SELECT PROD_CODE FROM inserted i1) AND WAREHOUSE_NUMBER IN (SELECT WAREHOUSE_NUMBER FROM inserted i1);
				END
			SELECT * FROM INSERTED WHERE ATTRIBUTE=0
			SET @Count=@@ROWCOUNT;
			IF @Count>0
				BEGIN
					UPDATE STOR_PROD
					SET	ALL_AMOUNT=ALL_AMOUNT-(SELECT SUM(AMOUNT)
							FROM inserted i
							WHERE i.ATTRIBUTE=0 AND i.WAREHOUSE_NUMBER=STOR_PROD.WAREHOUSE_NUMBER AND i.PROD_CODE=STOR_PROD.PROD_CODE
							GROUP BY PROD_CODE, WAREHOUSE_NUMBER,ATTRIBUTE)
					WHERE PROD_CODE IN (SELECT PROD_CODE FROM inserted i1) AND WAREHOUSE_NUMBER IN (SELECT WAREHOUSE_NUMBER FROM inserted i1);
				END
		END
    -- Insert statements for trigger here


END

GO
/****** Object:  Trigger [dbo].[BD_INVOICES]    Script Date: 08.10.2017 19:46:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[BD_INVOICES] ON [dbo].[INVOICES]
   AFTER DELETE
AS 
BEGIN
	DECLARE @Count int;
	SET @Count=@@ROWCOUNT;
	IF @Count=0
		RETURN;
		SELECT SUM(d.AMOUNT) AS amount1, d.WAREHOUSE_NUMBER, d.PROD_CODE, d.ATTRIBUTE, d.MOD_DATE INTO #tmp_tbl1
		FROM deleted d WHERE d.ATTRIBUTE=1
		GROUP BY d.PROD_CODE, d.WAREHOUSE_NUMBER, d.ATTRIBUTE, d.MOD_DATE;
	SELECT SUM(d.AMOUNT) AS amount0, d.WAREHOUSE_NUMBER, d.PROD_CODE, d.ATTRIBUTE, d.MOD_DATE INTO #tmp_tbl0
		FROM inserted d WHERE d.ATTRIBUTE=0
		GROUP BY d.PROD_CODE, d.WAREHOUSE_NUMBER, d.ATTRIBUTE, d.MOD_DATE;
		--WHERE i.ATTRIBUTE=1
	UPDATE STOR_PROD
		SET ALL_AMOUNT = ALL_AMOUNT - amount1, LAST_MOD_DATE = tmp1.MOD_DATE
			FROM STOR_PROD s INNER JOIN #tmp_tbl1 tmp1 ON
				s.WAREHOUSE_NUMBER=tmp1.WAREHOUSE_NUMBER AND
				s.PROD_CODE=tmp1.PROD_CODE;
	
	UPDATE STOR_PROD
		SET ALL_AMOUNT = ALL_AMOUNT + amount0, LAST_MOD_DATE = tmp0.MOD_DATE
			FROM STOR_PROD s INNER JOIN #tmp_tbl0 tmp0 ON
				s.WAREHOUSE_NUMBER=tmp0.WAREHOUSE_NUMBER AND
				s.PROD_CODE=tmp0.PROD_CODE;

END

GO
/****** Object:  Trigger [dbo].[IOD_WAREHOUSE_LIST]    Script Date: 08.10.2017 19:46:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[IOD_WAREHOUSE_LIST]
   ON  [dbo].[WAREHOUSE_LIST] 
   INSTEAD OF DELETE
AS 
	BEGIN
		DELETE FROM STOR_PROD
		WHERE WAREHOUSE_NUMBER IN (SELECT WAREHOUSE_NUMBER FROM deleted);
		
		DELETE FROM INVOICES
		WHERE WAREHOUSE_NUMBER IN (SELECT WAREHOUSE_NUMBER FROM deleted);

	END

GO
/****** Object:  Trigger [dbo].[IOU_WAREHOUSE_LIST]    Script Date: 08.10.2017 19:46:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE TRIGGER [dbo].[IOU_WAREHOUSE_LIST]
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
USE [master]
GO
ALTER DATABASE [CP_BASE] SET  READ_WRITE 
GO
