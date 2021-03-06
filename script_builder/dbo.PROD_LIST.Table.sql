USE [CP_BASE]
GO
--Создание таблицы
CREATE TABLE [dbo].[PROD_LIST](
	[PROD_CODE] [dbo].[KEY_TYPE] IDENTITY(1,1),
	[PROD_NAME] [nvarchar](50) NOT NULL,
	[MANUFACTURER] [nvarchar](100) NOT NULL,
	[MANU_ADDRESS] [nvarchar](100) NOT NULL,
	[PHONE_NUMBER] [nvarchar](11) NULL CONSTRAINT [DF_PROD_LIST_PHONE_NUMBER]  DEFAULT (''),
	[UNIT] [nvarchar](20) NULL CONSTRAINT [DF_PROD_LIST_UNIT]  DEFAULT (''),
 CONSTRAINT [PK_PROD_LIST] PRIMARY KEY CLUSTERED 
(
	[PROD_CODE] ASC
) ON [PRIMARY]
) ON [PRIMARY]

--Добавление ограничений
ALTER TABLE [dbo].[PROD_LIST] ADD  CONSTRAINT [CH_PROD_LIST_PROD_CODE] CHECK  (([PROD_CODE]>=(1)))
GO

--Добавление данных
GO
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