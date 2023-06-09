USE [master]
GO
/****** Object:  Database [DemoFrol]    Script Date: 25.03.2023 12:52:41 ******/
CREATE DATABASE [DemoFrol]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DemoFrol', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\DemoFrol.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DemoFrol_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\DemoFrol_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [DemoFrol] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DemoFrol].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DemoFrol] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DemoFrol] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DemoFrol] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DemoFrol] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DemoFrol] SET ARITHABORT OFF 
GO
ALTER DATABASE [DemoFrol] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DemoFrol] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DemoFrol] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DemoFrol] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DemoFrol] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DemoFrol] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DemoFrol] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DemoFrol] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DemoFrol] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DemoFrol] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DemoFrol] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DemoFrol] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DemoFrol] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DemoFrol] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DemoFrol] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DemoFrol] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DemoFrol] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DemoFrol] SET RECOVERY FULL 
GO
ALTER DATABASE [DemoFrol] SET  MULTI_USER 
GO
ALTER DATABASE [DemoFrol] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DemoFrol] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DemoFrol] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DemoFrol] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DemoFrol] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'DemoFrol', N'ON'
GO
ALTER DATABASE [DemoFrol] SET QUERY_STORE = OFF
GO
USE [DemoFrol]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [DemoFrol]
GO
/****** Object:  Table [dbo].[transport_type]    Script Date: 25.03.2023 12:52:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[transport_type](
	[transport_type_id] [int] NOT NULL,
	[transport_type] [nvarchar](50) NULL,
 CONSTRAINT [PK_transport_type] PRIMARY KEY CLUSTERED 
(
	[transport_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[transport]    Script Date: 25.03.2023 12:52:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[transport](
	[transport_id] [int] NOT NULL,
	[transport_type_id] [int] NULL,
	[transport_color] [varchar](50) NULL,
	[transport_model] [varchar](50) NULL,
	[transport_number] [varchar](10) NULL,
	[transport_enabled] [nvarchar](3) NULL,
	[current_point_location_number] [int] NULL,
	[current_point_location_address] [varchar](50) NULL,
	[price] [money] NULL,
	[date_create] [datetime] NULL,
 CONSTRAINT [PK_transport] PRIMARY KEY CLUSTERED 
(
	[transport_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[1]    Script Date: 25.03.2023 12:52:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[1]
AS
SELECT        dbo.transport_type.transport_type, dbo.transport.transport_color, dbo.transport.transport_model, dbo.transport.transport_number, dbo.transport.transport_enabled, dbo.transport.current_point_location_address, 
                         dbo.transport.price
FROM            dbo.transport INNER JOIN
                         dbo.transport_type ON dbo.transport.transport_type_id = dbo.transport_type.transport_type_id
GO
/****** Object:  Table [dbo].[clients]    Script Date: 25.03.2023 12:52:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clients](
	[client_id] [int] NOT NULL,
	[name] [varchar](50) NULL,
	[surname] [varchar](50) NULL,
	[patronymic] [varchar](50) NULL,
	[phone_number] [varchar](50) NULL,
 CONSTRAINT [PK_clients] PRIMARY KEY CLUSTERED 
(
	[client_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[clients_transports]    Script Date: 25.03.2023 12:52:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clients_transports](
	[id] [int] NOT NULL,
	[client_id] [int] NULL,
	[transport_id] [int] NULL,
	[date_begin] [datetime] NULL,
	[date_end] [datetime] NULL,
	[begin_point] [varchar](50) NULL,
	[end_point] [varchar](50) NULL,
 CONSTRAINT [PK_clients_transports] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[2]    Script Date: 25.03.2023 12:52:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[2]
AS
SELECT        dbo.clients.name, dbo.clients.surname, dbo.clients.patronymic, dbo.clients.phone_number, dbo.transport.transport_color, dbo.transport.transport_model, dbo.transport.date_create, dbo.transport.transport_number, 
                         dbo.transport.transport_enabled, dbo.transport.price, dbo.transport.current_point_location_address, dbo.clients_transports.date_begin, dbo.clients_transports.date_end
FROM            dbo.clients INNER JOIN
                         dbo.clients_transports ON dbo.clients.client_id = dbo.clients_transports.client_id INNER JOIN
                         dbo.transport ON dbo.clients_transports.transport_id = dbo.transport.transport_id
GO
/****** Object:  Table [dbo].[roles]    Script Date: 25.03.2023 12:52:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roles](
	[role_id] [int] NOT NULL,
	[role_name] [varchar](50) NULL,
 CONSTRAINT [PK_roles] PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 25.03.2023 12:52:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[client_id] [int] NOT NULL,
	[login] [varchar](50) NULL,
	[password] [varchar](50) NULL,
	[role_id] [int] NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[client_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[clients] ([client_id], [name], [surname], [patronymic], [phone_number]) VALUES (1, N'Геннадий', N'Морозов', N'Валерьевич', N'9963433')
INSERT [dbo].[clients] ([client_id], [name], [surname], [patronymic], [phone_number]) VALUES (2, N'Илья', N'Седаков', N'Васильевич', N'1243953')
INSERT [dbo].[clients] ([client_id], [name], [surname], [patronymic], [phone_number]) VALUES (3, N'Филипп', N'Киркоров', N'Бедросович', N'2853912')
INSERT [dbo].[clients] ([client_id], [name], [surname], [patronymic], [phone_number]) VALUES (4, N'Дмитрий', N'Комаров', N'Николаевич', N'8866003')
INSERT [dbo].[clients] ([client_id], [name], [surname], [patronymic], [phone_number]) VALUES (5, N'Арина', N'Мартынович', N'Михайловна', N'1234567')
INSERT [dbo].[clients] ([client_id], [name], [surname], [patronymic], [phone_number]) VALUES (6, N'Исаак', N'Израилев', N'Моисеевич', N'5031232')
INSERT [dbo].[clients] ([client_id], [name], [surname], [patronymic], [phone_number]) VALUES (7, N'Борис', N'Сергеев', N'Николаевич', N'9531230')
INSERT [dbo].[clients] ([client_id], [name], [surname], [patronymic], [phone_number]) VALUES (8, N'Алиса', N'Климова', N'Александровна', N'4542341')
INSERT [dbo].[clients] ([client_id], [name], [surname], [patronymic], [phone_number]) VALUES (9, N'Владислав', N'Куликов', N'Даниилович', N'8663312')
INSERT [dbo].[clients] ([client_id], [name], [surname], [patronymic], [phone_number]) VALUES (10, N'Олег', N'Коротков', N'Матвеевич', N'9257843')
INSERT [dbo].[clients_transports] ([id], [client_id], [transport_id], [date_begin], [date_end], [begin_point], [end_point]) VALUES (1, 8, 5, CAST(N'2023-03-01T00:00:00.000' AS DateTime), CAST(N'2023-05-01T00:00:00.000' AS DateTime), N'1', N'1')
INSERT [dbo].[clients_transports] ([id], [client_id], [transport_id], [date_begin], [date_end], [begin_point], [end_point]) VALUES (2, 8, 4, CAST(N'2023-03-02T00:00:00.000' AS DateTime), CAST(N'2023-03-10T00:00:00.000' AS DateTime), N'1', N'1')
INSERT [dbo].[clients_transports] ([id], [client_id], [transport_id], [date_begin], [date_end], [begin_point], [end_point]) VALUES (3, 8, 4, CAST(N'2023-03-15T00:00:00.000' AS DateTime), CAST(N'2023-03-30T00:00:00.000' AS DateTime), N'2', NULL)
INSERT [dbo].[clients_transports] ([id], [client_id], [transport_id], [date_begin], [date_end], [begin_point], [end_point]) VALUES (4, 9, 5, CAST(N'2022-12-12T00:00:00.000' AS DateTime), CAST(N'2023-01-11T00:00:00.000' AS DateTime), N'3', N'3')
INSERT [dbo].[clients_transports] ([id], [client_id], [transport_id], [date_begin], [date_end], [begin_point], [end_point]) VALUES (5, 1, 10, CAST(N'2023-02-01T00:00:00.000' AS DateTime), CAST(N'2023-04-15T00:00:00.000' AS DateTime), N'4', NULL)
INSERT [dbo].[clients_transports] ([id], [client_id], [transport_id], [date_begin], [date_end], [begin_point], [end_point]) VALUES (6, 7, 6, CAST(N'2023-03-20T00:00:00.000' AS DateTime), CAST(N'2023-03-30T00:00:00.000' AS DateTime), N'2', NULL)
INSERT [dbo].[clients_transports] ([id], [client_id], [transport_id], [date_begin], [date_end], [begin_point], [end_point]) VALUES (7, 9, 8, CAST(N'2021-12-14T00:00:00.000' AS DateTime), CAST(N'2022-05-14T00:00:00.000' AS DateTime), N'1', N'3')
INSERT [dbo].[clients_transports] ([id], [client_id], [transport_id], [date_begin], [date_end], [begin_point], [end_point]) VALUES (8, 1, 7, CAST(N'2023-01-01T00:00:00.000' AS DateTime), CAST(N'2023-04-01T00:00:00.000' AS DateTime), N'2', NULL)
INSERT [dbo].[clients_transports] ([id], [client_id], [transport_id], [date_begin], [date_end], [begin_point], [end_point]) VALUES (9, 7, 3, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-15T00:00:00.000' AS DateTime), N'3', N'3')
INSERT [dbo].[clients_transports] ([id], [client_id], [transport_id], [date_begin], [date_end], [begin_point], [end_point]) VALUES (10, 7, 3, CAST(N'2022-06-01T00:00:00.000' AS DateTime), CAST(N'2022-07-01T00:00:00.000' AS DateTime), N'2', N'2')
INSERT [dbo].[clients_transports] ([id], [client_id], [transport_id], [date_begin], [date_end], [begin_point], [end_point]) VALUES (11, 9, 9, CAST(N'2019-08-07T00:00:00.000' AS DateTime), CAST(N'2019-08-08T00:00:00.000' AS DateTime), N'1', N'4')
INSERT [dbo].[clients_transports] ([id], [client_id], [transport_id], [date_begin], [date_end], [begin_point], [end_point]) VALUES (12, 8, 8, CAST(N'2020-09-19T00:00:00.000' AS DateTime), CAST(N'2020-10-19T00:00:00.000' AS DateTime), N'4', N'2')
INSERT [dbo].[roles] ([role_id], [role_name]) VALUES (1, N'Клиент')
INSERT [dbo].[roles] ([role_id], [role_name]) VALUES (2, N'Менеджер')
INSERT [dbo].[roles] ([role_id], [role_name]) VALUES (3, N'Администратор')
INSERT [dbo].[transport] ([transport_id], [transport_type_id], [transport_color], [transport_model], [transport_number], [transport_enabled], [current_point_location_number], [current_point_location_address], [price], [date_create]) VALUES (1, 1, N'Синий', N'MERIDA KALAHARI-500', N'XR430Z', N'Да', 1, N'ул. Мира 14', 500.0000, CAST(N'2010-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[transport] ([transport_id], [transport_type_id], [transport_color], [transport_model], [transport_number], [transport_enabled], [current_point_location_number], [current_point_location_address], [price], [date_create]) VALUES (2, 2, N'Синий', N'Suzuki RG200', N'АБ201В', N'Да', 2, N'ул. Победы 20', 1000.0000, CAST(N'2015-10-05T00:00:00.000' AS DateTime))
INSERT [dbo].[transport] ([transport_id], [transport_type_id], [transport_color], [transport_model], [transport_number], [transport_enabled], [current_point_location_number], [current_point_location_address], [price], [date_create]) VALUES (3, 1, N'Красный', N'STELS 730', N'ГГ311В', N'Да', 2, N'ул. Победы 20', 400.0000, CAST(N'2020-12-17T00:00:00.000' AS DateTime))
INSERT [dbo].[transport] ([transport_id], [transport_type_id], [transport_color], [transport_model], [transport_number], [transport_enabled], [current_point_location_number], [current_point_location_address], [price], [date_create]) VALUES (4, 3, N'Желтый', N'LADA VESTA', N'К341ТО', N'Нет', NULL, NULL, 2000.0000, CAST(N'2014-12-06T00:00:00.000' AS DateTime))
INSERT [dbo].[transport] ([transport_id], [transport_type_id], [transport_color], [transport_model], [transport_number], [transport_enabled], [current_point_location_number], [current_point_location_address], [price], [date_create]) VALUES (5, 3, N'Белый', N'LADA VESTA', N'У312ТН', N'Да', 3, N'п. Ленина 16', 2000.0000, CAST(N'2016-06-21T00:00:00.000' AS DateTime))
INSERT [dbo].[transport] ([transport_id], [transport_type_id], [transport_color], [transport_model], [transport_number], [transport_enabled], [current_point_location_number], [current_point_location_address], [price], [date_create]) VALUES (6, 3, N'Белый', N'Kia Rio', N'К312ОО', N'Нет', NULL, NULL, 3000.0000, CAST(N'2022-07-01T00:00:00.000' AS DateTime))
INSERT [dbo].[transport] ([transport_id], [transport_type_id], [transport_color], [transport_model], [transport_number], [transport_enabled], [current_point_location_number], [current_point_location_address], [price], [date_create]) VALUES (7, 1, N'Чёрный', N'MERIDA KALAHARI-500', N'ZC182V', N'Нет', NULL, NULL, 500.0000, CAST(N'2005-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[transport] ([transport_id], [transport_type_id], [transport_color], [transport_model], [transport_number], [transport_enabled], [current_point_location_number], [current_point_location_address], [price], [date_create]) VALUES (8, 4, N'Красный', N'Alpha RX-11', N'Г352ВС', N'Да', 2, N'ул. Победы 20', 900.0000, CAST(N'2021-05-05T00:00:00.000' AS DateTime))
INSERT [dbo].[transport] ([transport_id], [transport_type_id], [transport_color], [transport_model], [transport_number], [transport_enabled], [current_point_location_number], [current_point_location_address], [price], [date_create]) VALUES (9, 4, N'Красный', N'Alpha RX-15', N'А513ВВ', N'Да', 4, N'ул. Труда 8', 900.0000, CAST(N'2019-04-16T00:00:00.000' AS DateTime))
INSERT [dbo].[transport] ([transport_id], [transport_type_id], [transport_color], [transport_model], [transport_number], [transport_enabled], [current_point_location_number], [current_point_location_address], [price], [date_create]) VALUES (10, 2, N'Коричневый', N'Yamaha G800', N'У666СР', N'Нет', NULL, NULL, 1000.0000, CAST(N'2011-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[transport] ([transport_id], [transport_type_id], [transport_color], [transport_model], [transport_number], [transport_enabled], [current_point_location_number], [current_point_location_address], [price], [date_create]) VALUES (11, 3, N'Фиолетовый', N'Renault Sandero-II', N'C999ЕН', N'Да', 4, N'ул. Труда 8', 2500.0000, CAST(N'2012-11-10T00:00:00.000' AS DateTime))
INSERT [dbo].[transport] ([transport_id], [transport_type_id], [transport_color], [transport_model], [transport_number], [transport_enabled], [current_point_location_number], [current_point_location_address], [price], [date_create]) VALUES (12, 1, N'Белый', N'GT-50', N'XW121V', N'Да', 1, N'ул. Мира 14', 550.0000, CAST(N'2017-09-11T00:00:00.000' AS DateTime))
INSERT [dbo].[transport_type] ([transport_type_id], [transport_type]) VALUES (1, N'Велосипед')
INSERT [dbo].[transport_type] ([transport_type_id], [transport_type]) VALUES (2, N'Мотоцикл')
INSERT [dbo].[transport_type] ([transport_type_id], [transport_type]) VALUES (3, N'Автомобиль')
INSERT [dbo].[transport_type] ([transport_type_id], [transport_type]) VALUES (4, N'Мопед')
INSERT [dbo].[users] ([client_id], [login], [password], [role_id]) VALUES (1, N'7efwqtub80i5@outlook.com', N'54zxr3', 1)
INSERT [dbo].[users] ([client_id], [login], [password], [role_id]) VALUES (2, N'v718fhbjuq0p@mail.com', N'4d23as', 2)
INSERT [dbo].[users] ([client_id], [login], [password], [role_id]) VALUES (3, N'7vnrat4hmcz6@yahoo.com', N'zzz323', 3)
INSERT [dbo].[users] ([client_id], [login], [password], [role_id]) VALUES (4, N'v4mlcsi1bgnk@tutanota.com', N'6664ee', 3)
INSERT [dbo].[users] ([client_id], [login], [password], [role_id]) VALUES (5, N'2yx3tbqv4ndi@outlook.com', N'85fd4', 2)
INSERT [dbo].[users] ([client_id], [login], [password], [role_id]) VALUES (6, N'5bf1xdiq6zup@tutanota.com', N'99663w', 2)
INSERT [dbo].[users] ([client_id], [login], [password], [role_id]) VALUES (7, N'p7rviz42j6bh@outlook.com', N'hryus33', 1)
INSERT [dbo].[users] ([client_id], [login], [password], [role_id]) VALUES (8, N'g5nrmh1axwfl@outlook.com', N'watw2ain', 1)
INSERT [dbo].[users] ([client_id], [login], [password], [role_id]) VALUES (9, N'5knb4drlf2hj@tutanota.com', N'ZsdSDr', 1)
INSERT [dbo].[users] ([client_id], [login], [password], [role_id]) VALUES (10, N'pk90ratym8bo@yahoo.com', N'ZZZds2', 1)
ALTER TABLE [dbo].[clients_transports]  WITH CHECK ADD  CONSTRAINT [FK_clients_transports_clients] FOREIGN KEY([client_id])
REFERENCES [dbo].[clients] ([client_id])
GO
ALTER TABLE [dbo].[clients_transports] CHECK CONSTRAINT [FK_clients_transports_clients]
GO
ALTER TABLE [dbo].[clients_transports]  WITH CHECK ADD  CONSTRAINT [FK_clients_transports_transport] FOREIGN KEY([transport_id])
REFERENCES [dbo].[transport] ([transport_id])
GO
ALTER TABLE [dbo].[clients_transports] CHECK CONSTRAINT [FK_clients_transports_transport]
GO
ALTER TABLE [dbo].[roles]  WITH CHECK ADD  CONSTRAINT [FK_roles_roles] FOREIGN KEY([role_id])
REFERENCES [dbo].[roles] ([role_id])
GO
ALTER TABLE [dbo].[roles] CHECK CONSTRAINT [FK_roles_roles]
GO
ALTER TABLE [dbo].[transport]  WITH CHECK ADD  CONSTRAINT [FK_transport_transport_type] FOREIGN KEY([transport_type_id])
REFERENCES [dbo].[transport_type] ([transport_type_id])
GO
ALTER TABLE [dbo].[transport] CHECK CONSTRAINT [FK_transport_transport_type]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [FK_users_roles] FOREIGN KEY([role_id])
REFERENCES [dbo].[roles] ([role_id])
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [FK_users_roles]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "transport"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 293
            End
            DisplayFlags = 280
            TopColumn = 6
         End
         Begin Table = "transport_type"
            Begin Extent = 
               Top = 6
               Left = 331
               Bottom = 102
               Right = 511
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "clients"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 212
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "transport"
            Begin Extent = 
               Top = 6
               Left = 250
               Bottom = 136
               Right = 505
            End
            DisplayFlags = 280
            TopColumn = 6
         End
         Begin Table = "clients_transports"
            Begin Extent = 
               Top = 6
               Left = 543
               Bottom = 136
               Right = 717
            End
            DisplayFlags = 280
            TopColumn = 1
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'2'
GO
USE [master]
GO
ALTER DATABASE [DemoFrol] SET  READ_WRITE 
GO
