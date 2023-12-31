USE [master]
GO
/****** Object:  Database [TaskManagerDB]    Script Date: 23.11.2023 22:55:01 ******/
CREATE DATABASE [TaskManagerDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TaskManagerDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\TaskManagerDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TaskManagerDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\TaskManagerDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TaskManagerDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TaskManagerDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TaskManagerDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TaskManagerDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TaskManagerDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TaskManagerDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [TaskManagerDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TaskManagerDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TaskManagerDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TaskManagerDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TaskManagerDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TaskManagerDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TaskManagerDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TaskManagerDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TaskManagerDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TaskManagerDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TaskManagerDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TaskManagerDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TaskManagerDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TaskManagerDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TaskManagerDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TaskManagerDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TaskManagerDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TaskManagerDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TaskManagerDB] SET  MULTI_USER 
GO
ALTER DATABASE [TaskManagerDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TaskManagerDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TaskManagerDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TaskManagerDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TaskManagerDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TaskManagerDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [TaskManagerDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [TaskManagerDB]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 23.11.2023 22:55:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SName] [varchar](50) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Position] [varchar](50) NOT NULL,
	[Login] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Step]    Script Date: 23.11.2023 22:55:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Step](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
	[Day] [nchar](10) NULL,
	[Status] [bit] NULL,
	[IDTask] [int] NOT NULL,
 CONSTRAINT [PK_Step] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StepEmp]    Script Date: 23.11.2023 22:55:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StepEmp](
	[IDEmp] [int] NOT NULL,
	[IDStep] [int] NOT NULL,
 CONSTRAINT [PK_StepEmp] PRIMARY KEY CLUSTERED 
(
	[IDEmp] ASC,
	[IDStep] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Task]    Script Date: 23.11.2023 22:55:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Task](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Status] [varchar](50) NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
 CONSTRAINT [PK_Task] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([ID], [SName], [Name], [Position], [Login], [Password]) VALUES (1, N'Горбунов', N'Дмитрий', N'Тестировщик', N'1', N'1')
INSERT [dbo].[Employee] ([ID], [SName], [Name], [Position], [Login], [Password]) VALUES (2, N'Сапогов', N'Анатолий', N'Верстальщик', N'2', N'2')
INSERT [dbo].[Employee] ([ID], [SName], [Name], [Position], [Login], [Password]) VALUES (3, N'Ладошкина', N'Надежда', N'Разработчик', N'3', N'3')
INSERT [dbo].[Employee] ([ID], [SName], [Name], [Position], [Login], [Password]) VALUES (5, N'Ручкина', N'Вера', N'Разработчик', N'4', N'4')
INSERT [dbo].[Employee] ([ID], [SName], [Name], [Position], [Login], [Password]) VALUES (6, N'Жижкин', N'Антон', N'Аналитик', N'5', N'5')
INSERT [dbo].[Employee] ([ID], [SName], [Name], [Position], [Login], [Password]) VALUES (8, N'Монеткин', N'Евгений', N'Менеджер', N'7', N'7')
INSERT [dbo].[Employee] ([ID], [SName], [Name], [Position], [Login], [Password]) VALUES (9, N'Мышкина', N'Настасья', N'Администратор', N'8', N'8')
INSERT [dbo].[Employee] ([ID], [SName], [Name], [Position], [Login], [Password]) VALUES (12, N'jh', N'uj', N'jj', N'q', N'q')
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[Step] ON 

INSERT [dbo].[Step] ([ID], [Name], [Day], [Status], [IDTask]) VALUES (2, N'Написать ТЗ ', N'7         ', 1, 1)
INSERT [dbo].[Step] ([ID], [Name], [Day], [Status], [IDTask]) VALUES (4, N'Разрабтать интерфейс', N'3         ', 1, 1)
INSERT [dbo].[Step] ([ID], [Name], [Day], [Status], [IDTask]) VALUES (5, N'Разработать функции', N'5         ', 0, 1)
INSERT [dbo].[Step] ([ID], [Name], [Day], [Status], [IDTask]) VALUES (6, N'Написать ТЗ', N'4         ', 1, 2)
INSERT [dbo].[Step] ([ID], [Name], [Day], [Status], [IDTask]) VALUES (7, N'Разработать API', N'8         ', 1, 2)
INSERT [dbo].[Step] ([ID], [Name], [Day], [Status], [IDTask]) VALUES (8, N'Сверстать', N'5         ', 1, 2)
INSERT [dbo].[Step] ([ID], [Name], [Day], [Status], [IDTask]) VALUES (9, N'Тестировать', N'8         ', 0, 2)
INSERT [dbo].[Step] ([ID], [Name], [Day], [Status], [IDTask]) VALUES (10, N'Подключить', N'1         ', 1, 3)
INSERT [dbo].[Step] ([ID], [Name], [Day], [Status], [IDTask]) VALUES (11, N'Разработать бизнесс-логику', N'9         ', 1, 3)
INSERT [dbo].[Step] ([ID], [Name], [Day], [Status], [IDTask]) VALUES (12, N'Разработать интерфейс', N'5         ', 1, 3)
INSERT [dbo].[Step] ([ID], [Name], [Day], [Status], [IDTask]) VALUES (14, N'Тестировать модули', N'8         ', 1, 3)
INSERT [dbo].[Step] ([ID], [Name], [Day], [Status], [IDTask]) VALUES (15, N'Разработать структуру', N'6         ', 1, 4)
INSERT [dbo].[Step] ([ID], [Name], [Day], [Status], [IDTask]) VALUES (16, N'Построить диаграммы', N'3         ', 1, 4)
INSERT [dbo].[Step] ([ID], [Name], [Day], [Status], [IDTask]) VALUES (17, N'Реализовать функции', N'8         ', 0, 4)
INSERT [dbo].[Step] ([ID], [Name], [Day], [Status], [IDTask]) VALUES (18, N'Разработать интерфейс', N'5         ', 1, 5)
INSERT [dbo].[Step] ([ID], [Name], [Day], [Status], [IDTask]) VALUES (19, N'Создать БД', N'4         ', 0, 5)
INSERT [dbo].[Step] ([ID], [Name], [Day], [Status], [IDTask]) VALUES (20, N'Внедрить модули', N'5         ', 0, 5)
INSERT [dbo].[Step] ([ID], [Name], [Day], [Status], [IDTask]) VALUES (24, N'sg', N'3         ', 0, 6)
INSERT [dbo].[Step] ([ID], [Name], [Day], [Status], [IDTask]) VALUES (25, N'aaa', N'3         ', 0, 1)
SET IDENTITY_INSERT [dbo].[Step] OFF
GO
INSERT [dbo].[StepEmp] ([IDEmp], [IDStep]) VALUES (1, 2)
INSERT [dbo].[StepEmp] ([IDEmp], [IDStep]) VALUES (1, 5)
INSERT [dbo].[StepEmp] ([IDEmp], [IDStep]) VALUES (1, 7)
INSERT [dbo].[StepEmp] ([IDEmp], [IDStep]) VALUES (1, 8)
INSERT [dbo].[StepEmp] ([IDEmp], [IDStep]) VALUES (1, 14)
INSERT [dbo].[StepEmp] ([IDEmp], [IDStep]) VALUES (2, 4)
INSERT [dbo].[StepEmp] ([IDEmp], [IDStep]) VALUES (2, 15)
INSERT [dbo].[StepEmp] ([IDEmp], [IDStep]) VALUES (2, 17)
INSERT [dbo].[StepEmp] ([IDEmp], [IDStep]) VALUES (2, 18)
INSERT [dbo].[StepEmp] ([IDEmp], [IDStep]) VALUES (2, 20)
INSERT [dbo].[StepEmp] ([IDEmp], [IDStep]) VALUES (3, 6)
INSERT [dbo].[StepEmp] ([IDEmp], [IDStep]) VALUES (3, 7)
INSERT [dbo].[StepEmp] ([IDEmp], [IDStep]) VALUES (3, 9)
INSERT [dbo].[StepEmp] ([IDEmp], [IDStep]) VALUES (5, 5)
INSERT [dbo].[StepEmp] ([IDEmp], [IDStep]) VALUES (5, 8)
INSERT [dbo].[StepEmp] ([IDEmp], [IDStep]) VALUES (5, 10)
INSERT [dbo].[StepEmp] ([IDEmp], [IDStep]) VALUES (5, 11)
INSERT [dbo].[StepEmp] ([IDEmp], [IDStep]) VALUES (5, 12)
INSERT [dbo].[StepEmp] ([IDEmp], [IDStep]) VALUES (6, 17)
INSERT [dbo].[StepEmp] ([IDEmp], [IDStep]) VALUES (6, 19)
INSERT [dbo].[StepEmp] ([IDEmp], [IDStep]) VALUES (8, 25)
GO
SET IDENTITY_INSERT [dbo].[Task] ON 

INSERT [dbo].[Task] ([ID], [Name], [Status], [StartDate], [EndDate]) VALUES (1, N'Сайт для кого-то', N'В разработке', CAST(N'2023-10-21' AS Date), CAST(N'2023-11-21' AS Date))
INSERT [dbo].[Task] ([ID], [Name], [Status], [StartDate], [EndDate]) VALUES (2, N'Мобильный банк', N'Принят', CAST(N'2023-11-05' AS Date), CAST(N'2023-12-22' AS Date))
INSERT [dbo].[Task] ([ID], [Name], [Status], [StartDate], [EndDate]) VALUES (3, N'Онлайн-калькулятор', N'Завершен', CAST(N'2023-08-21' AS Date), CAST(N'2023-10-20' AS Date))
INSERT [dbo].[Task] ([ID], [Name], [Status], [StartDate], [EndDate]) VALUES (4, N'Программа для заметок', N'В разработке', CAST(N'2023-01-11' AS Date), CAST(N'2024-05-12' AS Date))
INSERT [dbo].[Task] ([ID], [Name], [Status], [StartDate], [EndDate]) VALUES (5, N'Онлайн-конвертр', N'В разработке', CAST(N'2023-10-05' AS Date), CAST(N'2024-02-13' AS Date))
INSERT [dbo].[Task] ([ID], [Name], [Status], [StartDate], [EndDate]) VALUES (6, N'Сайт для администрации', N'В разработке', CAST(N'2023-09-08' AS Date), CAST(N'2024-03-05' AS Date))
SET IDENTITY_INSERT [dbo].[Task] OFF
GO
ALTER TABLE [dbo].[Step]  WITH CHECK ADD  CONSTRAINT [FK_Step_Task] FOREIGN KEY([IDTask])
REFERENCES [dbo].[Task] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Step] CHECK CONSTRAINT [FK_Step_Task]
GO
ALTER TABLE [dbo].[StepEmp]  WITH CHECK ADD  CONSTRAINT [FK_StepEmp_Employee] FOREIGN KEY([IDEmp])
REFERENCES [dbo].[Employee] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StepEmp] CHECK CONSTRAINT [FK_StepEmp_Employee]
GO
ALTER TABLE [dbo].[StepEmp]  WITH CHECK ADD  CONSTRAINT [FK_StepEmp_Step] FOREIGN KEY([IDStep])
REFERENCES [dbo].[Step] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StepEmp] CHECK CONSTRAINT [FK_StepEmp_Step]
GO
USE [master]
GO
ALTER DATABASE [TaskManagerDB] SET  READ_WRITE 
GO
