USE [master]
GO
/****** Object:  Database [Tennis]    Script Date: 11.04.2022 17:52:02 ******/
CREATE DATABASE [Tennis]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Tennis', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Tennis.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Tennis_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Tennis_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Tennis] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Tennis].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Tennis] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Tennis] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Tennis] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Tennis] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Tennis] SET ARITHABORT OFF 
GO
ALTER DATABASE [Tennis] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Tennis] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Tennis] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Tennis] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Tennis] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Tennis] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Tennis] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Tennis] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Tennis] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Tennis] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Tennis] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Tennis] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Tennis] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Tennis] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Tennis] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Tennis] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Tennis] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Tennis] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Tennis] SET  MULTI_USER 
GO
ALTER DATABASE [Tennis] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Tennis] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Tennis] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Tennis] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Tennis] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Tennis] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Tennis] SET QUERY_STORE = OFF
GO
USE [Tennis]
GO
/****** Object:  Table [dbo].[Tennis]    Script Date: 11.04.2022 17:52:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tennis](
	[Number] [int] NOT NULL,
	[Surname] [nchar](50) NOT NULL,
	[Name] [nchar](10) NOT NULL,
	[Patronymic] [nchar](50) NOT NULL,
	[Gender] [nchar](10) NOT NULL,
	[YearOfBirth] [int] NOT NULL,
	[SurnameTrainer] [nchar](50) NULL,
	[NameTrainer] [nchar](10) NULL,
	[PatronymicTrainer] [nchar](50) NULL,
	[Country] [nchar](50) NULL,
	[Rating1] [int] NOT NULL,
	[Rating2] [int] NULL,
	[Rating3] [int] NULL,
	[Rating4] [int] NULL,
	[Rating5] [int] NULL,
 CONSTRAINT [PK_УчетРейтингаТеннисистовЗа5лет] PRIMARY KEY CLUSTERED 
(
	[Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Tennis] ([Number], [Surname], [Name], [Patronymic], [Gender], [YearOfBirth], [SurnameTrainer], [NameTrainer], [PatronymicTrainer], [Country], [Rating1], [Rating2], [Rating3], [Rating4], [Rating5]) VALUES (1, N'Иванов                                            ', N'Иван      ', N'Максимович                                        ', N'Муж       ', 2000, N'Гудилин                                           ', N'Максим    ', N'Иванович                                          ', N'Россия                                            ', 64, 54, 50, 50, 50)
INSERT [dbo].[Tennis] ([Number], [Surname], [Name], [Patronymic], [Gender], [YearOfBirth], [SurnameTrainer], [NameTrainer], [PatronymicTrainer], [Country], [Rating1], [Rating2], [Rating3], [Rating4], [Rating5]) VALUES (2, N'Рудкова                                           ', N'Ирина     ', N'Егоровна                                          ', N'Жен       ', 2003, NULL, NULL, NULL, N'Россия                                            ', 36, 36, 36, 37, 40)
INSERT [dbo].[Tennis] ([Number], [Surname], [Name], [Patronymic], [Gender], [YearOfBirth], [SurnameTrainer], [NameTrainer], [PatronymicTrainer], [Country], [Rating1], [Rating2], [Rating3], [Rating4], [Rating5]) VALUES (3, N'Калион                                            ', N'Екатерина ', N'Максимовна                                        ', N'Жен       ', 2003, NULL, NULL, NULL, NULL, 45, 60, 61, 60, 60)
INSERT [dbo].[Tennis] ([Number], [Surname], [Name], [Patronymic], [Gender], [YearOfBirth], [SurnameTrainer], [NameTrainer], [PatronymicTrainer], [Country], [Rating1], [Rating2], [Rating3], [Rating4], [Rating5]) VALUES (4, N'Ярычкин                                           ', N'Алексей   ', N'Петрович                                          ', N'Муж       ', 1999, NULL, NULL, NULL, N'Россия                                            ', 80, 81, 80, 82, 80)
INSERT [dbo].[Tennis] ([Number], [Surname], [Name], [Patronymic], [Gender], [YearOfBirth], [SurnameTrainer], [NameTrainer], [PatronymicTrainer], [Country], [Rating1], [Rating2], [Rating3], [Rating4], [Rating5]) VALUES (5, N'Чумаченко                                         ', N'Анастасия ', N'Викторовна                                        ', N'Жен       ', 2000, N'Иванков                                           ', N'Петр      ', N'Сергеевич                                         ', N'Россия                                            ', 80, 87, 87, 87, NULL)
INSERT [dbo].[Tennis] ([Number], [Surname], [Name], [Patronymic], [Gender], [YearOfBirth], [SurnameTrainer], [NameTrainer], [PatronymicTrainer], [Country], [Rating1], [Rating2], [Rating3], [Rating4], [Rating5]) VALUES (6, N'Мунько                                            ', N'Давид     ', N'Денисович                                         ', N'Муж       ', 2001, NULL, NULL, NULL, N'Германия                                          ', 92, 91, 60, 50, 50)
INSERT [dbo].[Tennis] ([Number], [Surname], [Name], [Patronymic], [Gender], [YearOfBirth], [SurnameTrainer], [NameTrainer], [PatronymicTrainer], [Country], [Rating1], [Rating2], [Rating3], [Rating4], [Rating5]) VALUES (7, N'Борзаков                                          ', N'Петр      ', N'Иванович                                          ', N'Муж       ', 1990, NULL, NULL, NULL, N'Россия                                            ', 90, 90, 8, 81, 81)
INSERT [dbo].[Tennis] ([Number], [Surname], [Name], [Patronymic], [Gender], [YearOfBirth], [SurnameTrainer], [NameTrainer], [PatronymicTrainer], [Country], [Rating1], [Rating2], [Rating3], [Rating4], [Rating5]) VALUES (8, N'Мельник                                           ', N'Ирина     ', N'Петровна                                          ', N'Жен       ', 2000, N'Гудилин                                           ', N'Максим    ', N'Иванович                                          ', N'Россия                                            ', 97, 98, 90, 96, 94)
INSERT [dbo].[Tennis] ([Number], [Surname], [Name], [Patronymic], [Gender], [YearOfBirth], [SurnameTrainer], [NameTrainer], [PatronymicTrainer], [Country], [Rating1], [Rating2], [Rating3], [Rating4], [Rating5]) VALUES (9, N'Митрохина                                         ', N'Ксения    ', N'Михайловна                                        ', N'Жен       ', 2003, NULL, NULL, NULL, N'Россия                                            ', 98, 98, 99, 100, 100)
INSERT [dbo].[Tennis] ([Number], [Surname], [Name], [Patronymic], [Gender], [YearOfBirth], [SurnameTrainer], [NameTrainer], [PatronymicTrainer], [Country], [Rating1], [Rating2], [Rating3], [Rating4], [Rating5]) VALUES (10, N'Фисенко                                           ', N'Михайл    ', N'Александрович                                     ', N'Муж       ', 1999, NULL, NULL, NULL, N'Польша                                            ', 58, 58, 60, 40, 30)
GO
USE [master]
GO
ALTER DATABASE [Tennis] SET  READ_WRITE 
GO
