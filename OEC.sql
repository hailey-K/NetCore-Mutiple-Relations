USE [master]
GO
/****** Object:  Database [OEC]    Script Date: 2017-08-27 7:39:01 PM ******/
CREATE DATABASE [OEC]
GO
ALTER DATABASE [OEC] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OEC].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OEC] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OEC] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OEC] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OEC] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OEC] SET ARITHABORT OFF 
GO
ALTER DATABASE [OEC] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [OEC] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OEC] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OEC] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OEC] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OEC] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OEC] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OEC] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OEC] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OEC] SET  DISABLE_BROKER 
GO
ALTER DATABASE [OEC] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OEC] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OEC] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OEC] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OEC] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OEC] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OEC] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OEC] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [OEC] SET  MULTI_USER 
GO
ALTER DATABASE [OEC] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OEC] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OEC] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OEC] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [OEC] SET DELAYED_DURABILITY = DISABLED 
GO
USE [OEC]
GO
/****** Object:  User [fred]    Script Date: 2017-08-27 7:39:01 PM ******/
CREATE USER [fred] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [fred]
GO
/****** Object:  Table [dbo].[country]    Script Date: 2017-08-27 7:39:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[country](
	[countryCode] [nchar](2) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[postalPattern] [nvarchar](150) NULL,
	[phonePattern] [nvarchar](50) NULL,
 CONSTRAINT [PK_country] PRIMARY KEY CLUSTERED 
(
	[countryCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[crop]    Script Date: 2017-08-27 7:39:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[crop](
	[cropId] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[image] [nvarchar](30) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[farm]    Script Date: 2017-08-27 7:39:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[farm](
	[farmId] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[address] [varchar](50) NULL,
	[town] [varchar](50) NULL,
	[county] [varchar](50) NULL,
	[provinceCode] [nchar](2) NOT NULL,
	[postalCode] [nchar](7) NULL,
	[homePhone] [varchar](50) NULL,
	[cellPhone] [varchar](50) NULL,
	[email] [varchar](250) NULL,
	[directions] [varchar](max) NULL,
	[dateJoined] [datetime] NULL,
	[lastContactDate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[fertilizer]    Script Date: 2017-08-27 7:39:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fertilizer](
	[fertilizerName] [nvarchar](255) NOT NULL,
	[OECProduct] [bit] NOT NULL,
	[liquid] [bit] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[plot]    Script Date: 2017-08-27 7:39:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[plot](
	[plotId] [int] IDENTITY(1,1) NOT NULL,
	[farmId] [int] NULL,
	[varietyId] [int] NULL,
	[datePlanted] [datetime] NULL,
	[dateHarvested] [datetime] NULL,
	[plantingRate] [int] NULL,
	[plantingRateByPounds] [bit] NOT NULL,
	[rowWidth] [int] NULL,
	[patternRepeats] [int] NULL,
	[organicMatter] [float] NULL,
	[bicarbP] [float] NULL,
	[potassium] [float] NULL,
	[magnesium] [float] NULL,
	[calcium] [float] NULL,
	[pHSoil] [float] NULL,
	[pHBuffer] [float] NULL,
	[CEC] [float] NULL,
	[percentBaseSaturationK] [float] NULL,
	[percentBaseSaturationMg] [float] NULL,
	[percentBaseSaturationCa] [float] NULL,
	[percentBaseSaturationH] [float] NULL,
	[comments] [ntext] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[province]    Script Date: 2017-08-27 7:39:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[province](
	[provinceCode] [nchar](2) NOT NULL,
	[name] [nchar](30) NOT NULL,
	[countryCode] [nchar](2) NULL,
 CONSTRAINT [PK_province] PRIMARY KEY CLUSTERED 
(
	[provinceCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[treatment]    Script Date: 2017-08-27 7:39:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[treatment](
	[treatmentId] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](256) NULL,
	[plotId] [int] NOT NULL,
	[moisture] [real] NULL,
	[yield] [float] NULL,
	[weight] [float] NULL,
 CONSTRAINT [PK_treatment] PRIMARY KEY CLUSTERED 
(
	[treatmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[treatmentFertilizer]    Script Date: 2017-08-27 7:39:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[treatmentFertilizer](
	[treatmentFertilizerId] [int] IDENTITY(1,1) NOT NULL,
	[treatmentId] [int] NULL,
	[fertilizerName] [nvarchar](255) NULL,
	[ratePerAcre] [float] NULL,
	[rateMetric] [nvarchar](255) NULL,
 CONSTRAINT [PK_treatmentFertilizer] PRIMARY KEY CLUSTERED 
(
	[treatmentFertilizerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[variety]    Script Date: 2017-08-27 7:39:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[variety](
	[varietyId] [int] IDENTITY(1,1) NOT NULL,
	[cropId] [int] NULL,
	[name] [nvarchar](255) NULL
) ON [PRIMARY]

GO
INSERT [dbo].[country] ([countryCode], [name], [postalPattern], [phonePattern]) VALUES (N'CA', N'Canada', N'[ABCEGHJKLMNPRSTVXY]\d[ABCEGHJKLMNPRSTVWXYZ] ?\d[ABCEGHJKLMNPRSTVWXYZ]\d', N'\d{3}-\d{3}-\d{4}')
INSERT [dbo].[country] ([countryCode], [name], [postalPattern], [phonePattern]) VALUES (N'US', N'United States of America', N'\d{5}(-\d{4})?', N'\d{3}-\d{3}-\d{4}')
SET IDENTITY_INSERT [dbo].[crop] ON 

INSERT [dbo].[crop] ([cropId], [name], [image]) VALUES (1, N'corn', N'corn.bmp')
INSERT [dbo].[crop] ([cropId], [name], [image]) VALUES (2, N'wheat', N'wheat.jpg')
INSERT [dbo].[crop] ([cropId], [name], [image]) VALUES (3, N'soybean', N'soybean.jpg')
INSERT [dbo].[crop] ([cropId], [name], [image]) VALUES (4, N'canola', N'canola.jpg')
INSERT [dbo].[crop] ([cropId], [name], [image]) VALUES (5, N'peas', N'peas.bmp')
INSERT [dbo].[crop] ([cropId], [name], [image]) VALUES (6, N'barley', N'barley.jpg')
INSERT [dbo].[crop] ([cropId], [name], [image]) VALUES (7, N'barley, winter', N'winterBarley.jpg')
INSERT [dbo].[crop] ([cropId], [name], [image]) VALUES (9, N'wheat, durum', N'durumWheat.jpg')
SET IDENTITY_INSERT [dbo].[crop] OFF
SET IDENTITY_INSERT [dbo].[farm] ON 

INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (1, N'Goldman, Ken', N'299 Doon Valley Drive', NULL, N'Lambton', N'ON', N'N2G 4M4', N'519-748-5220', NULL, N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (2, N'Thompson Farms', N'299 Doon Valley Drive', N'Harrietsville', NULL, N'ON', N'N2G 4M4', N'519-748-5220', N'519-748-5220', N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (3, N'Cook, Thomas', N'299 Doon Valley Drive', NULL, N'Huron', N'ON', N'N2G 4M4', NULL, N'519-748-5220', N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (5, N'Kilcarney, Tracey', N'299 Doon Valley Drive', N'Woodstock', NULL, N'ON', N'N2G 4M4', NULL, N'519-748-5220', N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (7, N'Jenks, Bill', N'299 Doon Valley Drive', N'Harmony', NULL, N'ON', N'N2G 4M4', NULL, N'519-748-5220', N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (8, N'Kilting, Milton', N'299 Doon Valley Drive', N'Sparta', NULL, N'ON', N'N2G 4M4', NULL, N'519-748-5220', N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (9, N'Zoomer, Harold', N'299 Doon Valley Drive', N'Alma', NULL, N'ON', N'N2G 4M4', N'519-748-5220', NULL, N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (10, N'Mary-Lou Farms', N'299 Doon Valley Drive', N'Harley', NULL, N'ON', N'N2G 4M4', N'519-748-5220', NULL, N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (11, N'OReily, Dougald', N'299 Doon Valley Drive', NULL, N'Lambton', N'ON', N'N2G 4M4', N'519-748-5220', NULL, N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (12, N'Rutherford, Rob', N'299 Doon Valley Drive', NULL, N'West Elgin', N'ON', N'N2G 4M4', N'519-748-5220', NULL, N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (13, N'Turkey, Dave', N'299 Doon Valley Drive', N'Simcoe', NULL, N'ON', N'N2G 4M4', N'519-748-5220', N'519-748-5220', N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (14, N'Cloverdale Farms', N'299 Doon Valley Drive', N'Mossley', NULL, N'ON', N'N2G 4M4', NULL, N'519-748-5220', N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (15, N'Kent, Tony', N'299 Doon Valley Drive', N'Monkton', NULL, N'ON', N'N2G 4M4', NULL, N'519-748-5220', N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (16, N'Yellowfield Farms', N'299 Doon Valley Drive', N'Guelph', NULL, N'ON', N'N2G 4M4', NULL, N'519-748-5220', N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (17, N'Weber, Larry', N'299 Doon Valley Drive', NULL, N'Perth', N'ON', N'N2G 4M4', NULL, N'519-748-5220', N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (18, N'Chesterfield Dairy', N'299 Doon Valley Drive', N'Port Stanley', NULL, N'ON', N'N2G 4M4', NULL, N'519-748-5220', N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (19, N'Desoto, Eric', N'299 Doon Valley Drive', N'Lucan', NULL, N'ON', N'N2G 4M4', NULL, N'519-748-5220', N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (21, N'Concarne, Keith', N'299 Doon Valley Drive', NULL, N'Lambton', N'ON', N'N2G 4M4', N'519-748-5220', NULL, N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (22, N'Gunther, Adrian', N'299 Doon Valley Drive', NULL, N'Lambton', N'ON', N'N2G 4M4', N'519-748-5220', NULL, N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (23, N'Ursulas Farms', N'299 Doon Valley Drive', NULL, N'Elgin', N'ON', N'N2G 4M4', N'519-748-5220', NULL, N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (24, N'Maple, John', N'299 Doon Valley Drive', N'Moorefield', NULL, N'ON', N'N2G 4M4', N'519-748-5220', NULL, N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (25, N'Oak, Paul', N'299 Doon Valley Drive', N'Glencoe', NULL, N'ON', N'N2G 4M4', N'519-748-5220', NULL, N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (26, N'Les Hogs', N'299 Doon Valley Drive', N'Ayr', NULL, N'ON', N'N2G 4M4', NULL, N'519-748-5220', N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (27, N'Riverside Farms', N'299 Doon Valley Drive', N'Dresden', NULL, N'ON', N'N2G 4M4', NULL, N'519-748-5220', N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (28, N'Trenton, Doug', N'299 Doon Valley Drive', N'Thorndale', NULL, N'ON', N'N2G 4M4', NULL, N'519-748-5220', N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (30, N'BBQ Hog Farms', N'299 Doon Valley Drive', NULL, N'Huron', N'ON', N'N2G 4M4', NULL, N'519-748-5220', N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (31, N'Tackle, Brad', N'299 Doon Valley Drive', NULL, N'Lambton', N'ON', N'N2G 4M4', NULL, N'519-748-5220', N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (33, N'Hawthorn, Lyle', N'299 Doon Valley Drive', N'Seaforth', NULL, N'ON', N'N2G 4M4', NULL, N'519-748-5220', N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (34, N'Thompson Farms', N'299 Doon Valley Drive', NULL, N'Kent', N'ON', N'N2G 4M4', N'519-748-5220', NULL, N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (35, N'Brubacher, Tony', N'299 Doon Valley Drive', N'Rodney', NULL, N'ON', N'N2G 4M4', N'519-748-5220', NULL, N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (36, N'Thompson, Larry', N'299 Doon Valley Drive', NULL, N'Essex', N'ON', N'N2G 4M4', N'519-748-5220', NULL, N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (37, N'Allan, Woody', N'299 Doon Valley Drive', N'Ilderton', NULL, N'ON', N'N2G 4M4', N'519-748-5220', NULL, N'dturton@conestogac.on.ca', NULL, CAST(N'2016-05-04T00:00:00.000' AS DateTime), CAST(N'2017-06-06T00:00:00.000' AS DateTime))
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (38, N'Williams Acres', NULL, N'St. Mary''s', NULL, N'ON', N'N2G 4M4', N'519-748-5220', NULL, N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (39, N'Miller, Brad', NULL, N'Camlachie', NULL, N'ON', N'N2G 4M4', N'519-748-5220', NULL, N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (40, N'Hathaway Mills', NULL, N'Blyth', NULL, N'ON', N'N2G 4M4', N'519-748-5220', NULL, N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (41, N'Xavier, Murray', NULL, N'Tavistock', NULL, N'ON', N'N2G 4M4', N'519-748-5220', NULL, N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (42, N'Plating, Steve', NULL, N'Formosa', NULL, N'ON', N'N2G 4M4', NULL, NULL, N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (44, N'Waterloo Brothers', NULL, N'Tavistock', NULL, N'ON', N'N2G 4M4', NULL, NULL, N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (45, N'Wilkins, John', NULL, N'Union', NULL, N'ON', N'N2G 4M4', NULL, NULL, N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (46, N'Burnaby, Lochart', NULL, N'Campden', NULL, N'ON', N'N2G 4M4', NULL, NULL, N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (47, N'Farquar, Howard', NULL, NULL, N'Perth', N'ON', N'N2G 4M4', NULL, NULL, N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (48, N'Clovers, Don', NULL, N'Mossley', NULL, N'ON', NULL, NULL, NULL, N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (51, N'Fat, Albert', NULL, N'Teviotdale', NULL, N'ON', NULL, NULL, NULL, N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (52, N'Higgins, Murray', NULL, N'Durham', NULL, N'ON', NULL, NULL, NULL, N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (53, N'Holder, Alex', NULL, N'Grand Valley', NULL, N'ON', NULL, NULL, NULL, N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (54, N'Angus Farm', NULL, N'Kincardine', NULL, N'ON', NULL, NULL, NULL, N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (55, N'Bush, Bill', NULL, N'Highgate', NULL, N'ON', NULL, NULL, NULL, N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (56, N'Walker, Al', NULL, N'Ayr', NULL, N'ON', NULL, NULL, NULL, N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (57, N'Groven, Achim', NULL, N'Carlow', NULL, N'ON', NULL, N'519-748-5220', NULL, N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (58, N'Haveacare Farms', NULL, N'Boston', NULL, N'ON', NULL, N'519-748-5220', NULL, N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (59, N'Hathaway, Larry', NULL, N'Campden', NULL, N'ON', NULL, N'519-748-5220', NULL, N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (60, N'Toujour Farms', NULL, N'Tillsonburg', NULL, N'ON', NULL, N'519-748-5220', NULL, N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (61, N'West, Randy', NULL, N'Binbrook', NULL, N'ON', NULL, N'519-748-5220', NULL, N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (62, N'Kilpatric, Fred', NULL, N'Dunnville', NULL, N'ON', NULL, N'519-748-5220', NULL, N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (63, N'Patra, Dan', NULL, N'Port Rowan', NULL, N'ON', NULL, N'519-748-5220', NULL, N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (64, N'Stacey, Hermas', NULL, NULL, N'Essex', N'ON', NULL, NULL, NULL, N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (65, N'Horton, Brent', NULL, N'Strathroy', NULL, N'ON', NULL, NULL, NULL, N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (66, N'Cuthgart, Matt', NULL, N'Glencoe', NULL, N'ON', NULL, NULL, NULL, N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (67, N'Longfellow, Henry', NULL, N'Port Rowan', NULL, N'ON', NULL, NULL, NULL, N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (68, N'Yurt, Jason', NULL, N'Waterford', NULL, N'ON', NULL, NULL, NULL, N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (69, N'Yellow, Al', NULL, N'Brigden', NULL, N'ON', NULL, NULL, NULL, N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (70, N'East, Mary', NULL, NULL, N'Dundas', N'ON', NULL, NULL, NULL, N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (71, N'Three Cows', NULL, NULL, NULL, N'QC', NULL, NULL, NULL, N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (72, N'Gonfishin Farms', NULL, NULL, N'Elgin', N'ON', NULL, NULL, NULL, N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (73, N'Greening, Keith', NULL, N'West Lorne', NULL, N'ON', NULL, N'519-748-5220', NULL, N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (74, N'Bottoms, Doug', NULL, NULL, N'Huron', N'ON', NULL, N'519-748-5220', NULL, N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (75, N'Quicy, Robert', NULL, NULL, N'Elgin', N'ON', NULL, N'519-748-5220', NULL, N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (76, N'Dunhill, John', NULL, N'Auburn', NULL, N'ON', NULL, N'519-748-5220', NULL, N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (77, N'Charlies Farms', NULL, N'Palmerston', NULL, N'ON', NULL, N'519-748-5220', NULL, N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (78, N'Lons, Tom', NULL, N'Embro', NULL, N'ON', NULL, N'519-748-5220', NULL, N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (79, N'Charles, Larry', NULL, N'Brussels', NULL, N'ON', NULL, N'519-748-5220', NULL, N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (80, N'Silver, Steve', NULL, N'Teeswater', NULL, N'ON', NULL, N'519-748-5220', NULL, N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (81, N'Beachnut, Don', NULL, N'Dutton', NULL, N'ON', NULL, N'519-748-5220', NULL, N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (82, N'Kitchener Farms', NULL, N'Monkton', NULL, N'ON', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (83, N'Gonner, Doug', NULL, N'Bright', NULL, N'ON', NULL, NULL, NULL, N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (84, N'Fred Penner', NULL, N'Milton', NULL, N'ON', NULL, N'519-748-5220', NULL, N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (85, N'Waltz, Bob', NULL, N'Lucknow', NULL, N'ON', NULL, N'519-748-5220', NULL, N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (86, N'Landin Acres', NULL, N'St. Thomas', NULL, N'ON', NULL, N'519-748-5220', NULL, N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (87, N'London, Paul', NULL, N'Merlin', NULL, N'ON', NULL, N'519-748-5220', NULL, N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (88, N'Hathaway, Steve', NULL, NULL, N'Waterloo', N'ON', NULL, N'519-748-5220', NULL, N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (89, N'Tanuan, Murray', NULL, NULL, N'Oxford', N'ON', NULL, N'519-748-5220', NULL, N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (90, N'Upside, Ross', NULL, NULL, N'Oxford', N'ON', NULL, N'519-748-5220', NULL, N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (91, N'Easte, Brad', NULL, N'Teviotdale', NULL, N'ON', NULL, N'519-748-5220', NULL, N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (92, N'King, Claire', NULL, N'Ilderton', NULL, N'ON', NULL, N'519-748-5220', NULL, N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (93, N'McKay, Murray', NULL, N'Tavistock', NULL, N'ON', NULL, N'519-748-5220', NULL, N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (94, N'Yellowwood, Robert', NULL, N'Kincardine', NULL, N'ON', NULL, N'519-748-5220', NULL, N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (96, N'Toujou, Larry', NULL, N'Hagersville', NULL, N'ON', NULL, N'519-748-5220', NULL, N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (97, N'North, Robert', NULL, N'Bayfield', NULL, N'ON', NULL, N'519-748-5220', NULL, N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (98, N'Tessyville, Achim', NULL, NULL, N'Huron', N'ON', NULL, N'519-748-5220', NULL, N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (99, N'Gordon, Andy', NULL, N'Port Colbourne', NULL, N'ON', NULL, N'519-748-5220', NULL, N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (100, N'TolmanSweet, Bob', NULL, N'Lambeth', NULL, N'ON', NULL, N'519-748-5220', NULL, N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (101, N'Turton, David', NULL, N'Wellesley', NULL, N'ON', NULL, N'519-748-5220', NULL, N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (102, N'Faart, Jim', NULL, N'Komoka', NULL, N'ON', NULL, N'519-748-5220', NULL, N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (103, N'Blues Brothers', NULL, N'Ilderton', NULL, N'ON', NULL, N'519-748-5220', NULL, N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (104, N'Durham Farms', NULL, N'Durham', NULL, N'ON', NULL, N'519-748-5220', NULL, N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (105, N'Komotose, Ken', NULL, N'Komoka', NULL, N'ON', NULL, N'519-748-5220', NULL, N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (106, N'Gourd, Cleon', NULL, N'Drayton', NULL, N'ON', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (107, N'Tracey, Dick', NULL, N'Ridgetown', NULL, N'ON', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (108, N'Meyer, Oscar', NULL, N'Listowel', NULL, N'ON', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (109, N'Spy, Paul', NULL, N'Alvinston', NULL, N'ON', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (110, N'Grist Farms', NULL, N'Cargill', NULL, N'ON', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (111, N'Thompson Farm Supplies', NULL, N'Belmont', NULL, N'ON', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (112, N'Groves, Dennis', NULL, NULL, N'Prince Edward', N'ON', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (113, N'Charlais, Tom', NULL, N'Brucefield', NULL, N'ON', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (114, N'Lambeth, Hermas', NULL, NULL, N'Kent', N'ON', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (116, N'Cliff View Farms', NULL, N'Dunnville', NULL, N'ON', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (117, N'Twain, Ken', NULL, N'Brigden', NULL, N'ON', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (118, N'Thomas, Matt', NULL, N'Mount Forest', NULL, N'ON', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (119, N'Juniper, Peter', NULL, N'Embro', NULL, N'ON', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (120, N'Ottawa, Stan', NULL, NULL, N'Middlesex', N'ON', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (121, N'Oreily, Hermas', NULL, N'St. Joachim', NULL, N'ON', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (122, N'Drako, Howard', NULL, N'Harrietsville', NULL, N'ON', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (123, N'Bowen, Marcell', NULL, N'Mt. Forest', NULL, N'ON', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (124, N'Jones, Wayne', NULL, N'Burgessville', NULL, N'ON', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (126, N'Banarai, Paul', NULL, N'Floradale', NULL, N'ON', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (127, N'Toro, Tom', NULL, NULL, N'Lambton', N'ON', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (128, N'South, Jim', NULL, N'Palmerston', NULL, N'ON', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (131, N'Waverly Farms', NULL, N'Port Hope', NULL, N'ON', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (132, N'Trevor Research', NULL, NULL, N'Brant', N'ON', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (133, N'Jenks, Peter', NULL, N'Dunnville', NULL, N'ON', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (134, N'Glenbriar Acres', NULL, NULL, N'Oxford', N'ON', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (135, N'Menace, Dennis', NULL, NULL, N'Lambton', N'ON', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (136, N'King, Westley', NULL, N'Melbourne', NULL, N'ON', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (137, N'Queens Acres', NULL, N'Ilderton', NULL, N'ON', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (138, N'Cooper, George', NULL, N'Strathroy', NULL, N'ON', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (139, N'Gother Farms', NULL, NULL, N'Elgin', N'ON', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (140, N'Pumpkin, Brian', NULL, N'Drayton', NULL, N'ON', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (141, N'Manaheim, Harry', NULL, N'Rodney', NULL, N'ON', NULL, N'519-748-5220', NULL, N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (142, N'Watertell, Kent', NULL, NULL, N'Perth', N'ON', NULL, N'519-748-5220', NULL, N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (143, N'Wesley Farms', NULL, N'New Hamburg', NULL, N'ON', NULL, N'519-748-5220', NULL, N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (144, N'Huppur, Tony', NULL, NULL, N'West Elgin', N'ON', NULL, N'519-748-5220', NULL, N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (145, N'Milton, Bill', NULL, N'Ethel', NULL, N'ON', NULL, N'519-748-5220', NULL, N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (146, N'Descarts, Jules', NULL, N'St. Lambert de Lotbiniere', NULL, N'QC', NULL, N'519-748-5220', NULL, N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (147, N'Gord and Sons', NULL, N'St. Nazaire', NULL, N'QC', NULL, N'519-748-5220', NULL, N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (148, N'Justin, Gilles', NULL, N'Ste. Helene', NULL, N'QC', NULL, N'519-748-5220', NULL, N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (149, N'Juice, Allans', NULL, NULL, N'Essex', N'ON', NULL, N'519-748-5220', NULL, N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (150, N'Othello, Mark', NULL, N'Cambridge', NULL, N'ON', NULL, N'519-748-5220', NULL, N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (151, N'Clifford, Clarence', NULL, N'Dunnville', NULL, N'ON', NULL, N'519-748-5220', NULL, N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (152, N'Millside, Allan', NULL, N'Wallaceburg', NULL, N'ON', NULL, N'519-748-5220', NULL, N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (153, N'Unharted, Carl', NULL, N'Rodney', NULL, N'ON', NULL, N'519-748-5220', NULL, N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (154, N'Rainie, Larry', NULL, NULL, N'Huron', N'ON', NULL, N'519-748-5220', NULL, N'dturton@conestogac.on.ca', NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (155, N'Lilac, Tony', NULL, NULL, N'Essex', N'ON', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (156, N'Cangrow Farms', NULL, N'Woodstock', NULL, N'ON', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (157, N'Gordon Brothers', NULL, N'Waterloo', NULL, N'ON', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (158, N'Barborosa, Alex', NULL, NULL, N'Perth', N'ON', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (159, N'Lambeth, Andy', NULL, N'Rodney', NULL, N'ON', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (160, N'Peascher, Ed', NULL, N'Waterloo', NULL, N'ON', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (161, N'Squash, Brian', NULL, NULL, N'Wellington', N'ON', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (162, N'Loraglen Farms', NULL, N'Dover Centre', NULL, N'ON', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (163, N'Pecan, Ken', NULL, N'Teeswater', NULL, N'ON', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (164, N'Chestnut, Art', NULL, N'Kintail', NULL, N'ON', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (165, N'Douglas, Bert', NULL, N'Rodney', NULL, N'ON', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (166, N'Lindsay, Arnold', NULL, NULL, N'Huron', N'ON', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (167, N'Carth, Joe', NULL, N'Dunnville', NULL, N'ON', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (168, N'Innis Brothers', NULL, NULL, N'Huron', N'ON', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (169, N'Carter Farm', NULL, NULL, N'Waterloo', N'ON', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (170, N'Robot, Bender', NULL, NULL, N'Waterloo', N'ON', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (171, N'Thompson, Frank', NULL, N'Rodney', NULL, N'ON', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (172, N'Frans, Hilmer', NULL, N'Hickson', NULL, N'ON', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (173, N'Dover Flour', NULL, N'Blyth', NULL, N'ON', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (175, N'Parks Farms', NULL, N'Wellesley', NULL, N'ON', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (176, N'Applestand Farms', NULL, N'Wellesley', NULL, N'ON', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (177, N'Rankin, Glen', NULL, NULL, N'Huron', N'ON', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (178, N'Borderline Farms', N'230 Forest Lane', N'Charlotte', NULL, N'MI', N'12345  ', N'123-123-1234', N'123-123-2345', N'dturton@conestogac.on.ca', N'2nd lane after first tree', CAST(N'2016-06-23T00:00:00.000' AS DateTime), CAST(N'2016-06-24T00:00:00.000' AS DateTime))
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (179, N'Cooker Acres', NULL, N'Vermontville', NULL, N'MI', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (180, N'RetireEasy Homes', NULL, N'Mason', NULL, N'MI', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (181, N'Orchard, Maurice', NULL, N'Gaines', NULL, N'MI', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (182, N'Miller, Barry', NULL, N'Waterford', NULL, N'ON', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (183, N'Valencia, Ernst', NULL, NULL, N'Elgin', N'ON', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (184, N'Kozak, Murray', NULL, NULL, N'Oxford', N'ON', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (185, N'Black, Rob', NULL, N'Mt. Elgin', NULL, N'ON', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (186, N'AppleView Farms', NULL, NULL, N'Kent', N'ON', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (187, N'Holstein, Al', NULL, N'Exeter', NULL, N'ON', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (188, N'Frazier, Gord', NULL, N'Highgate', NULL, N'ON', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (189, N'Goodyear, Jim', NULL, N'Port Stanley', NULL, N'ON', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (190, N'Chevvy Retirement', NULL, N'Rodney', NULL, N'ON', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (191, N'Green, Jamie', NULL, N'Wallace', NULL, N'ON', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (192, N'Diefenbaker, Larry', NULL, N'Vienna', NULL, N'ON', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (193, N'Gordon, Dan', NULL, N'Bayfield', NULL, N'ON', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (194, N'Larelwood, Don', NULL, N'Ilderton', NULL, N'ON', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (195, N'Voltaire, Gary', NULL, N'Tavistock', NULL, N'ON', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (196, N'Bolder, Howard', NULL, N'Milverton', NULL, N'ON', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (198, N'Greens, Allan', NULL, N'Ilderton', NULL, N'ON', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (199, N'Shania Co-Op', NULL, N'Simcoe', NULL, N'ON', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (200, N'Kentucky, Casey', NULL, NULL, N'Perth', N'ON', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (201, N'Farley Farms', NULL, NULL, N'Oxford', N'ON', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (202, N'Van Der Haven, Leon', NULL, NULL, N'Kent', N'ON', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (203, N'Chamberlain, Wilf', NULL, NULL, N'Kent', N'ON', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (204, N'Klivven, Ralph', NULL, N'Napanee', NULL, N'ON', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (205, N'Fatherland Acres', NULL, N'Waterford', NULL, N'ON', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (206, N'Marly, Steve', NULL, NULL, N'Elgin', N'ON', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (207, N'Laundry, George', NULL, NULL, NULL, N'QC', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (208, N'Farther, Gilbert', NULL, NULL, N'Oxford', N'ON', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (209, N'Innis, Yves', NULL, NULL, NULL, N'QC', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (210, N'OEC Incorporated', NULL, N'Aberdeen', NULL, N'SK', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (211, N'Sweet William Farms', NULL, N'Foam Lake', NULL, N'SK', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (212, N'HoneyDue', NULL, N'Frontier', NULL, N'SK', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (213, N'Engeland, Murray', NULL, N'Rosetown', NULL, N'SK', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (214, N'Running Farms', NULL, N'Yellow Grass', NULL, N'SK', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (215, N'Terrance, Fred', NULL, N'Melville', NULL, N'SK', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (216, N'Laverly, Dave', NULL, N'Swift Current', NULL, N'SK', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (217, N'Beyond, Barry', NULL, NULL, N'Niagara Region', N'ON', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farm] ([farmId], [name], [address], [town], [county], [provinceCode], [postalCode], [homePhone], [cellPhone], [email], [directions], [dateJoined], [lastContactDate]) VALUES (218, N'Washington, Bill', NULL, N'Rodney', NULL, N'ON', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[farm] OFF
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'0-0-12', 0, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'0-0-25-17', 0, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'0-0-30', 0, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'0-0-60', 0, 0)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'0-23-30', 0, 0)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'0-46-0', 0, 0)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'10-0-0-12-16', 0, 0)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'10-34-0', 0, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'10-37-6', 0, 0)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'11-0-7', 0, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'11-52-0 Dry', 0, 0)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'11-52-0 MAP', 0, 0)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'11-53-0 Dry', 0, 0)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'12-0-0-26', 0, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'12-0-0-26 Thio-sul', 0, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'12-18-4', 0, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'12-39-12', 0, 0)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'13.8-17.6-5-3.8 Mg-1.2 Zn', 0, 0)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'14-26-0-1 s', 0, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'14-8-5', 0, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'15-15-12', 0, 0)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'17-40-50-10 Mg - 3 Zn', 0, 0)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'18-13-13', 0, 0)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'19-19-19', 0, 0)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'20-52-24-12 S-3.5 Mg', 0, 0)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'28% Nitrogen', 0, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'28-0-0', 0, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'3% Calcium EDTA', 1, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'30-30-50', 0, 0)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'3-0-9-6S', 1, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'3-15-3', 0, 0)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'3-18-18', 0, 0)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'4-16-4', 0, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'4-20-28', 0, 0)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'4-6-16', 1, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'5-0-17-11S', 1, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'5-15-15', 0, 0)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'6-20-10', 0, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'6-20-22 Dry', 0, 0)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'6-20-24', 0, 0)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'6-24-24 Dry', 0, 0)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'6-24-6 Competition', 0, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'6-27-9', 0, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'7-22-15', 0, 0)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'7-36-14', 0, 0)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'8-0-0-0-9 AMS', 0, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'8-0-0-8', 0, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'8-15-5', 0, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'8-25-3', 0, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'8-32-16', 0, 0)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'9-18-9 White', 0, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'9-23-30', 0, 0)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'ABC', 0, 0)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'Achieve', 0, 0)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'Actina', 0, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'Affix', 0, 0)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'Ag Spectrum 8-19-3', 0, 0)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'Agro', 0, 0)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'Agro Culture 5-9-5 w/micros', 0, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'All Plant', 0, 0)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'All Plant 5-15-15', 0, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'Arouse', 0, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'Avail', 0, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'Awaken', 0, 0)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'AX-1', 0, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'AX-2', 0, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'AX-3', 0, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'banded Phosphate', 0, 0)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'Bio-A Exp', 0, 0)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'BTN', 0, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'Buctril M', 0, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'Cangrow', 0, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'Cargill 6-24-6', 0, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'Cell Tech', 0, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'Clark''s 6-24-6', 0, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'Compost Starter', 0, 0)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'Co-Op Liquid', 0, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'Dry Phosphate', 0, 0)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'E', 0, 0)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'ECO', 0, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'Evergreen 5-20-5', 0, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'Evergreen 9-18-9', 0, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'Ex U7', 0, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'Exhaust', 0, 0)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'Exp 1', 0, 0)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'Exp 10', 0, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'Exp 16-8-4', 0, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'Exp 2', 0, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'Exp 7', 0, 0)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'Exp AM', 0, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'Exp AM 1', 0, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'Exp AM 1.5', 0, 0)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'Exp AM 2', 0, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'Exp Bioactor', 0, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'Exp GS', 0, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'Exp HQ', 0, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'Exp HR', 0, 0)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'Exp JS', 0, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'Exp KelmicEx', 0, 0)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'Exp M1', 0, 0)
GO
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'Exp M2', 0, 0)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'Exp Nog', 0, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'Exp Oscar', 0, 0)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'Exp T-22', 0, 0)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'Exp TM21', 0, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'Exp U7', 0, 0)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'Exp WR', 0, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'Exp WR/HR', 0, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'Exp X1', 0, 0)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'Exp X2', 0, 0)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'Exp X3', 0, 0)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'FFP 3-18.5-17.5', 0, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'FFP 3-18-18', 0, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'Floratine Zinc', 0, 0)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'FNA 7-27-3', 0, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'Foliar Nog', 0, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'Folicur', 0, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'FPG', 0, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'Greenville 9-18-9', 0, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'Growers 10-20-10', 0, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'Humic 7-21-0', 0, 0)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'Humika', 0, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'Iron', 0, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'Kelmic', 0, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'Kickoff', 0, 0)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'K-Thio', 0, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'Launcher (Cargil)', 0, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'Liqui-Cal', 0, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'Liquid Ammonium Sulphate', 0, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'Magnesium', 1, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'Manganese', 0, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'Micros (Zn+Mn+Mg)', 1, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'Mini-Map', 0, 0)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'Nachurs 6-24-6', 0, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'NFG 6-24-6-2%Zn', 0, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'N-Sure', 0, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'Nutra Flow', 0, 0)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'Nutrite 5 Star', 0, 0)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'OEC 0-0-12', 0, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'OEC 10-10-10 Enhanced', 1, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'OEC 2-20-18', 1, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'OEC 3-18-18', 1, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'OEC 6-24-6', 1, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'OEC 6-24-6 Enhanced', 1, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'OEC 7-22-4', 1, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'OEC 9-18-9', 1, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'OEC BTN', 1, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'OEC Copper 7.5%', 1, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'OEC Foliar', 1, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'OEC TMR', 1, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'Perc', 0, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'Pholex Manganese 7%', 0, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'Potassium Acetate', 0, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'Pro-Germinator 9-24-3', 0, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'Remedy', 0, 0)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'Riser', 0, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'Riser 7-17-3', 0, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'Rite Calcium', 0, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'Round-Up', 0, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'Stroh Experimental', 0, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'Sure-K', 0, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'Synagri 8-25-3', 0, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'Thio-Sul', 0, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'Thompsons', 0, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'TM Biological', 0, 0)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'Ultra Gro 7-29-5 H', 0, 0)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'Water', 0, 1)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'X-1', 0, 0)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'X-2', 0, 0)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'X-3', 0, 0)
INSERT [dbo].[fertilizer] ([fertilizerName], [OECProduct], [liquid]) VALUES (N'zinc', 0, 1)
SET IDENTITY_INSERT [dbo].[plot] ON 

INSERT [dbo].[plot] ([plotId], [farmId], [varietyId], [datePlanted], [dateHarvested], [plantingRate], [plantingRateByPounds], [rowWidth], [patternRepeats], [organicMatter], [bicarbP], [potassium], [magnesium], [calcium], [pHSoil], [pHBuffer], [CEC], [percentBaseSaturationK], [percentBaseSaturationMg], [percentBaseSaturationCa], [percentBaseSaturationH], [comments]) VALUES (4, 196, 240, CAST(N'1994-05-07T00:00:00.000' AS DateTime), CAST(N'1994-11-15T00:00:00.000' AS DateTime), 29900, 0, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'loam soil
broadcast urea')
INSERT [dbo].[plot] ([plotId], [farmId], [varietyId], [datePlanted], [dateHarvested], [plantingRate], [plantingRateByPounds], [rowWidth], [patternRepeats], [organicMatter], [bicarbP], [potassium], [magnesium], [calcium], [pHSoil], [pHBuffer], [CEC], [percentBaseSaturationK], [percentBaseSaturationMg], [percentBaseSaturationCa], [percentBaseSaturationH], [comments]) VALUES (5, 134, 241, CAST(N'1994-05-23T00:00:00.000' AS DateTime), CAST(N'1994-10-29T00:00:00.000' AS DateTime), 29900, 0, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'clay loam soil
conventional tillage
weighed by Pioneer Hybrid')
INSERT [dbo].[plot] ([plotId], [farmId], [varietyId], [datePlanted], [dateHarvested], [plantingRate], [plantingRateByPounds], [rowWidth], [patternRepeats], [organicMatter], [bicarbP], [potassium], [magnesium], [calcium], [pHSoil], [pHBuffer], [CEC], [percentBaseSaturationK], [percentBaseSaturationMg], [percentBaseSaturationCa], [percentBaseSaturationH], [comments]) VALUES (6, 135, 104, CAST(N'1994-05-19T00:00:00.000' AS DateTime), CAST(N'1994-11-03T00:00:00.000' AS DateTime), 29900, 0, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'10 gal 28%N sidedressed at planting time 2x2 on both treatments

100 lb 0-0-60 sidedressed at planting time 2x2 on both treatments

balance of N sidedressed when corn was knee high

clay loam soil')
INSERT [dbo].[plot] ([plotId], [farmId], [varietyId], [datePlanted], [dateHarvested], [plantingRate], [plantingRateByPounds], [rowWidth], [patternRepeats], [organicMatter], [bicarbP], [potassium], [magnesium], [calcium], [pHSoil], [pHBuffer], [CEC], [percentBaseSaturationK], [percentBaseSaturationMg], [percentBaseSaturationCa], [percentBaseSaturationH], [comments]) VALUES (7, 3, 242, CAST(N'1994-05-20T00:00:00.000' AS DateTime), CAST(N'1994-10-28T00:00:00.000' AS DateTime), 29900, 0, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'loam soil
broadcast urea')
INSERT [dbo].[plot] ([plotId], [farmId], [varietyId], [datePlanted], [dateHarvested], [plantingRate], [plantingRateByPounds], [rowWidth], [patternRepeats], [organicMatter], [bicarbP], [potassium], [magnesium], [calcium], [pHSoil], [pHBuffer], [CEC], [percentBaseSaturationK], [percentBaseSaturationMg], [percentBaseSaturationCa], [percentBaseSaturationH], [comments]) VALUES (8, 136, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[plot] ([plotId], [farmId], [varietyId], [datePlanted], [dateHarvested], [plantingRate], [plantingRateByPounds], [rowWidth], [patternRepeats], [organicMatter], [bicarbP], [potassium], [magnesium], [calcium], [pHSoil], [pHBuffer], [CEC], [percentBaseSaturationK], [percentBaseSaturationMg], [percentBaseSaturationCa], [percentBaseSaturationH], [comments]) VALUES (9, 136, 116, CAST(N'1994-05-23T00:00:00.000' AS DateTime), CAST(N'1994-11-17T00:00:00.000' AS DateTime), 29900, 0, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'uneven conditions
should have had 4 replications')
INSERT [dbo].[plot] ([plotId], [farmId], [varietyId], [datePlanted], [dateHarvested], [plantingRate], [plantingRateByPounds], [rowWidth], [patternRepeats], [organicMatter], [bicarbP], [potassium], [magnesium], [calcium], [pHSoil], [pHBuffer], [CEC], [percentBaseSaturationK], [percentBaseSaturationMg], [percentBaseSaturationCa], [percentBaseSaturationH], [comments]) VALUES (10, 133, 240, CAST(N'1994-05-07T00:00:00.000' AS DateTime), CAST(N'1994-11-15T00:00:00.000' AS DateTime), 29900, 0, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[plot] ([plotId], [farmId], [varietyId], [datePlanted], [dateHarvested], [plantingRate], [plantingRateByPounds], [rowWidth], [patternRepeats], [organicMatter], [bicarbP], [potassium], [magnesium], [calcium], [pHSoil], [pHBuffer], [CEC], [percentBaseSaturationK], [percentBaseSaturationMg], [percentBaseSaturationCa], [percentBaseSaturationH], [comments]) VALUES (11, 3, 242, CAST(N'1994-05-20T00:00:00.000' AS DateTime), CAST(N'1994-10-28T00:00:00.000' AS DateTime), 29900, 0, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'loam soil
broadcast urea')
INSERT [dbo].[plot] ([plotId], [farmId], [varietyId], [datePlanted], [dateHarvested], [plantingRate], [plantingRateByPounds], [rowWidth], [patternRepeats], [organicMatter], [bicarbP], [potassium], [magnesium], [calcium], [pHSoil], [pHBuffer], [CEC], [percentBaseSaturationK], [percentBaseSaturationMg], [percentBaseSaturationCa], [percentBaseSaturationH], [comments]) VALUES (12, 137, 107, CAST(N'1994-05-14T00:00:00.000' AS DateTime), CAST(N'1994-10-01T00:00:00.000' AS DateTime), 29900, 0, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'loam soil
conventional tillage')
INSERT [dbo].[plot] ([plotId], [farmId], [varietyId], [datePlanted], [dateHarvested], [plantingRate], [plantingRateByPounds], [rowWidth], [patternRepeats], [organicMatter], [bicarbP], [potassium], [magnesium], [calcium], [pHSoil], [pHBuffer], [CEC], [percentBaseSaturationK], [percentBaseSaturationMg], [percentBaseSaturationCa], [percentBaseSaturationH], [comments]) VALUES (13, 138, 118, CAST(N'1994-05-21T00:00:00.000' AS DateTime), CAST(N'1994-10-24T00:00:00.000' AS DateTime), 29900, 0, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'conventional tillage')
INSERT [dbo].[plot] ([plotId], [farmId], [varietyId], [datePlanted], [dateHarvested], [plantingRate], [plantingRateByPounds], [rowWidth], [patternRepeats], [organicMatter], [bicarbP], [potassium], [magnesium], [calcium], [pHSoil], [pHBuffer], [CEC], [percentBaseSaturationK], [percentBaseSaturationMg], [percentBaseSaturationCa], [percentBaseSaturationH], [comments]) VALUES (14, 217, 108, CAST(N'1994-05-07T00:00:00.000' AS DateTime), CAST(N'1994-11-08T00:00:00.000' AS DateTime), 29900, 0, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'nitrogen source - preplant
no response to any starter treatment over the control
hard to show differences between products when there is no response to starter fertilizer')
INSERT [dbo].[plot] ([plotId], [farmId], [varietyId], [datePlanted], [dateHarvested], [plantingRate], [plantingRateByPounds], [rowWidth], [patternRepeats], [organicMatter], [bicarbP], [potassium], [magnesium], [calcium], [pHSoil], [pHBuffer], [CEC], [percentBaseSaturationK], [percentBaseSaturationMg], [percentBaseSaturationCa], [percentBaseSaturationH], [comments]) VALUES (15, 196, 110, CAST(N'1994-05-30T00:00:00.000' AS DateTime), CAST(N'1994-10-01T00:00:00.000' AS DateTime), 29900, 0, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'loam soil')
INSERT [dbo].[plot] ([plotId], [farmId], [varietyId], [datePlanted], [dateHarvested], [plantingRate], [plantingRateByPounds], [rowWidth], [patternRepeats], [organicMatter], [bicarbP], [potassium], [magnesium], [calcium], [pHSoil], [pHBuffer], [CEC], [percentBaseSaturationK], [percentBaseSaturationMg], [percentBaseSaturationCa], [percentBaseSaturationH], [comments]) VALUES (16, 86, 111, CAST(N'1994-05-23T00:00:00.000' AS DateTime), CAST(N'1994-11-16T00:00:00.000' AS DateTime), 29900, 0, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[plot] ([plotId], [farmId], [varietyId], [datePlanted], [dateHarvested], [plantingRate], [plantingRateByPounds], [rowWidth], [patternRepeats], [organicMatter], [bicarbP], [potassium], [magnesium], [calcium], [pHSoil], [pHBuffer], [CEC], [percentBaseSaturationK], [percentBaseSaturationMg], [percentBaseSaturationCa], [percentBaseSaturationH], [comments]) VALUES (17, 161, 112, CAST(N'1994-05-24T00:00:00.000' AS DateTime), CAST(N'1994-10-31T00:00:00.000' AS DateTime), 29900, 0, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'clay loam soil
conventional tillage')
INSERT [dbo].[plot] ([plotId], [farmId], [varietyId], [datePlanted], [dateHarvested], [plantingRate], [plantingRateByPounds], [rowWidth], [patternRepeats], [organicMatter], [bicarbP], [potassium], [magnesium], [calcium], [pHSoil], [pHBuffer], [CEC], [percentBaseSaturationK], [percentBaseSaturationMg], [percentBaseSaturationCa], [percentBaseSaturationH], [comments]) VALUES (18, 144, 102, CAST(N'1994-05-11T00:00:00.000' AS DateTime), CAST(N'1994-10-01T00:00:00.000' AS DateTime), 29900, 0, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'sandy soil
11-52-0 - $28/A
Alpine 6-24-6 + 28% Nitrogen - $18/A
10-34-0 - $19/A')
INSERT [dbo].[plot] ([plotId], [farmId], [varietyId], [datePlanted], [dateHarvested], [plantingRate], [plantingRateByPounds], [rowWidth], [patternRepeats], [organicMatter], [bicarbP], [potassium], [magnesium], [calcium], [pHSoil], [pHBuffer], [CEC], [percentBaseSaturationK], [percentBaseSaturationMg], [percentBaseSaturationCa], [percentBaseSaturationH], [comments]) VALUES (19, 142, 107, CAST(N'1994-05-20T00:00:00.000' AS DateTime), CAST(N'1994-10-28T00:00:00.000' AS DateTime), 29900, 0, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'clay loam
urea broadcase - replant')
INSERT [dbo].[plot] ([plotId], [farmId], [varietyId], [datePlanted], [dateHarvested], [plantingRate], [plantingRateByPounds], [rowWidth], [patternRepeats], [organicMatter], [bicarbP], [potassium], [magnesium], [calcium], [pHSoil], [pHBuffer], [CEC], [percentBaseSaturationK], [percentBaseSaturationMg], [percentBaseSaturationCa], [percentBaseSaturationH], [comments]) VALUES (20, 143, 114, CAST(N'1994-05-25T00:00:00.000' AS DateTime), CAST(N'1994-11-02T00:00:00.000' AS DateTime), 29900, 0, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[plot] ([plotId], [farmId], [varietyId], [datePlanted], [dateHarvested], [plantingRate], [plantingRateByPounds], [rowWidth], [patternRepeats], [organicMatter], [bicarbP], [potassium], [magnesium], [calcium], [pHSoil], [pHBuffer], [CEC], [percentBaseSaturationK], [percentBaseSaturationMg], [percentBaseSaturationCa], [percentBaseSaturationH], [comments]) VALUES (21, 80, 115, CAST(N'1994-05-20T00:00:00.000' AS DateTime), CAST(N'1994-11-11T00:00:00.000' AS DateTime), 29900, 0, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'clay loam soil
nitrogen sidedressed')
INSERT [dbo].[plot] ([plotId], [farmId], [varietyId], [datePlanted], [dateHarvested], [plantingRate], [plantingRateByPounds], [rowWidth], [patternRepeats], [organicMatter], [bicarbP], [potassium], [magnesium], [calcium], [pHSoil], [pHBuffer], [CEC], [percentBaseSaturationK], [percentBaseSaturationMg], [percentBaseSaturationCa], [percentBaseSaturationH], [comments]) VALUES (22, 134, 140, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[plot] ([plotId], [farmId], [varietyId], [datePlanted], [dateHarvested], [plantingRate], [plantingRateByPounds], [rowWidth], [patternRepeats], [organicMatter], [bicarbP], [potassium], [magnesium], [calcium], [pHSoil], [pHBuffer], [CEC], [percentBaseSaturationK], [percentBaseSaturationMg], [percentBaseSaturationCa], [percentBaseSaturationH], [comments]) VALUES (23, 26, 107, CAST(N'1994-05-05T00:00:00.000' AS DateTime), CAST(N'1994-10-26T00:00:00.000' AS DateTime), 29900, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'sandy loam soil
nitrogen sidedressed 130 lb
conventional tillage')
INSERT [dbo].[plot] ([plotId], [farmId], [varietyId], [datePlanted], [dateHarvested], [plantingRate], [plantingRateByPounds], [rowWidth], [patternRepeats], [organicMatter], [bicarbP], [potassium], [magnesium], [calcium], [pHSoil], [pHBuffer], [CEC], [percentBaseSaturationK], [percentBaseSaturationMg], [percentBaseSaturationCa], [percentBaseSaturationH], [comments]) VALUES (24, 65, 116, CAST(N'1994-05-19T00:00:00.000' AS DateTime), CAST(N'1994-10-20T00:00:00.000' AS DateTime), 29900, 0, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'sandy soil
nitrogen sidedressed')
INSERT [dbo].[plot] ([plotId], [farmId], [varietyId], [datePlanted], [dateHarvested], [plantingRate], [plantingRateByPounds], [rowWidth], [patternRepeats], [organicMatter], [bicarbP], [potassium], [magnesium], [calcium], [pHSoil], [pHBuffer], [CEC], [percentBaseSaturationK], [percentBaseSaturationMg], [percentBaseSaturationCa], [percentBaseSaturationH], [comments]) VALUES (25, 141, 102, CAST(N'1994-05-11T00:00:00.000' AS DateTime), CAST(N'1994-10-25T00:00:00.000' AS DateTime), 29900, 0, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'sandy soil
conventional tillage
nitrogen 1/3 pre-plant balance sidedressed
11-52-0 dry program $28/A - $325/tonne
10-34-0 program $20/A - $300/tonne
Alpine program $11.70/A - $ .65/L')
INSERT [dbo].[plot] ([plotId], [farmId], [varietyId], [datePlanted], [dateHarvested], [plantingRate], [plantingRateByPounds], [rowWidth], [patternRepeats], [organicMatter], [bicarbP], [potassium], [magnesium], [calcium], [pHSoil], [pHBuffer], [CEC], [percentBaseSaturationK], [percentBaseSaturationMg], [percentBaseSaturationCa], [percentBaseSaturationH], [comments]) VALUES (26, 218, 109, CAST(N'1994-05-11T00:00:00.000' AS DateTime), CAST(N'1994-10-25T00:00:00.000' AS DateTime), 29900, 0, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'sandy soil
nitrogen sideband
conventional tillage
dry program $28/A - $235/tonne
10-34-0 program $20/A - $300/tonne
Alpine program $11.70/A - $ .65/L')
INSERT [dbo].[plot] ([plotId], [farmId], [varietyId], [datePlanted], [dateHarvested], [plantingRate], [plantingRateByPounds], [rowWidth], [patternRepeats], [organicMatter], [bicarbP], [potassium], [magnesium], [calcium], [pHSoil], [pHBuffer], [CEC], [percentBaseSaturationK], [percentBaseSaturationMg], [percentBaseSaturationCa], [percentBaseSaturationH], [comments]) VALUES (27, 145, 119, CAST(N'1994-05-18T00:00:00.000' AS DateTime), CAST(N'1994-10-01T00:00:00.000' AS DateTime), NULL, 0, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'loam soil
conventional tillage
no response to starter fertilizer
hard to show differences between products when the filed didn''t respond to starter')
INSERT [dbo].[plot] ([plotId], [farmId], [varietyId], [datePlanted], [dateHarvested], [plantingRate], [plantingRateByPounds], [rowWidth], [patternRepeats], [organicMatter], [bicarbP], [potassium], [magnesium], [calcium], [pHSoil], [pHBuffer], [CEC], [percentBaseSaturationK], [percentBaseSaturationMg], [percentBaseSaturationCa], [percentBaseSaturationH], [comments]) VALUES (28, 78, 107, CAST(N'1994-05-19T00:00:00.000' AS DateTime), CAST(N'1994-10-27T00:00:00.000' AS DateTime), 29900, 0, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'loam soil
conventional tillage')
INSERT [dbo].[plot] ([plotId], [farmId], [varietyId], [datePlanted], [dateHarvested], [plantingRate], [plantingRateByPounds], [rowWidth], [patternRepeats], [organicMatter], [bicarbP], [potassium], [magnesium], [calcium], [pHSoil], [pHBuffer], [CEC], [percentBaseSaturationK], [percentBaseSaturationMg], [percentBaseSaturationCa], [percentBaseSaturationH], [comments]) VALUES (29, 146, 120, CAST(N'1994-05-08T00:00:00.000' AS DateTime), CAST(N'1994-10-12T00:00:00.000' AS DateTime), 30100, 0, 30, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'3 replications checked by hand 3 times/replication
cattle manure applied before planting')
INSERT [dbo].[plot] ([plotId], [farmId], [varietyId], [datePlanted], [dateHarvested], [plantingRate], [plantingRateByPounds], [rowWidth], [patternRepeats], [organicMatter], [bicarbP], [potassium], [magnesium], [calcium], [pHSoil], [pHBuffer], [CEC], [percentBaseSaturationK], [percentBaseSaturationMg], [percentBaseSaturationCa], [percentBaseSaturationH], [comments]) VALUES (30, 147, 119, CAST(N'1994-05-13T00:00:00.000' AS DateTime), CAST(N'1994-10-19T00:00:00.000' AS DateTime), 30100, 0, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[plot] ([plotId], [farmId], [varietyId], [datePlanted], [dateHarvested], [plantingRate], [plantingRateByPounds], [rowWidth], [patternRepeats], [organicMatter], [bicarbP], [potassium], [magnesium], [calcium], [pHSoil], [pHBuffer], [CEC], [percentBaseSaturationK], [percentBaseSaturationMg], [percentBaseSaturationCa], [percentBaseSaturationH], [comments]) VALUES (31, 148, 119, CAST(N'1994-05-18T00:00:00.000' AS DateTime), CAST(N'1994-11-16T00:00:00.000' AS DateTime), 30100, 0, 30, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[plot] ([plotId], [farmId], [varietyId], [datePlanted], [dateHarvested], [plantingRate], [plantingRateByPounds], [rowWidth], [patternRepeats], [organicMatter], [bicarbP], [potassium], [magnesium], [calcium], [pHSoil], [pHBuffer], [CEC], [percentBaseSaturationK], [percentBaseSaturationMg], [percentBaseSaturationCa], [percentBaseSaturationH], [comments]) VALUES (32, 149, 121, CAST(N'1995-05-18T00:00:00.000' AS DateTime), CAST(N'1995-10-26T00:00:00.000' AS DateTime), 30000, 0, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'clay soil
excellent stand
medium fertility')
INSERT [dbo].[plot] ([plotId], [farmId], [varietyId], [datePlanted], [dateHarvested], [plantingRate], [plantingRateByPounds], [rowWidth], [patternRepeats], [organicMatter], [bicarbP], [potassium], [magnesium], [calcium], [pHSoil], [pHBuffer], [CEC], [percentBaseSaturationK], [percentBaseSaturationMg], [percentBaseSaturationCa], [percentBaseSaturationH], [comments]) VALUES (33, 21, 122, CAST(N'1995-05-20T00:00:00.000' AS DateTime), CAST(N'1995-10-16T00:00:00.000' AS DateTime), 30000, 0, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'clay loam soil
good growing conditions')
INSERT [dbo].[plot] ([plotId], [farmId], [varietyId], [datePlanted], [dateHarvested], [plantingRate], [plantingRateByPounds], [rowWidth], [patternRepeats], [organicMatter], [bicarbP], [potassium], [magnesium], [calcium], [pHSoil], [pHBuffer], [CEC], [percentBaseSaturationK], [percentBaseSaturationMg], [percentBaseSaturationCa], [percentBaseSaturationH], [comments]) VALUES (34, 150, 123, CAST(N'1995-05-08T00:00:00.000' AS DateTime), CAST(N'1995-11-03T00:00:00.000' AS DateTime), 30000, 0, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'sandy loam soil
high phos levels')
INSERT [dbo].[plot] ([plotId], [farmId], [varietyId], [datePlanted], [dateHarvested], [plantingRate], [plantingRateByPounds], [rowWidth], [patternRepeats], [organicMatter], [bicarbP], [potassium], [magnesium], [calcium], [pHSoil], [pHBuffer], [CEC], [percentBaseSaturationK], [percentBaseSaturationMg], [percentBaseSaturationCa], [percentBaseSaturationH], [comments]) VALUES (35, 151, 107, CAST(N'1995-05-09T00:00:00.000' AS DateTime), CAST(N'1995-10-27T00:00:00.000' AS DateTime), 30000, 0, 30, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'clay-loam soil
sprayer damage on Alpine & No Starter strips
36" sprayer used to spray 30" rows')
INSERT [dbo].[plot] ([plotId], [farmId], [varietyId], [datePlanted], [dateHarvested], [plantingRate], [plantingRateByPounds], [rowWidth], [patternRepeats], [organicMatter], [bicarbP], [potassium], [magnesium], [calcium], [pHSoil], [pHBuffer], [CEC], [percentBaseSaturationK], [percentBaseSaturationMg], [percentBaseSaturationCa], [percentBaseSaturationH], [comments]) VALUES (36, 152, 125, CAST(N'1995-05-20T00:00:00.000' AS DateTime), NULL, 30000, 0, 30, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[plot] ([plotId], [farmId], [varietyId], [datePlanted], [dateHarvested], [plantingRate], [plantingRateByPounds], [rowWidth], [patternRepeats], [organicMatter], [bicarbP], [potassium], [magnesium], [calcium], [pHSoil], [pHBuffer], [CEC], [percentBaseSaturationK], [percentBaseSaturationMg], [percentBaseSaturationCa], [percentBaseSaturationH], [comments]) VALUES (37, 153, 102, CAST(N'1995-05-13T00:00:00.000' AS DateTime), CAST(N'1995-11-10T00:00:00.000' AS DateTime), 30000, 0, 30, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'sandy soil
dry summer')
INSERT [dbo].[plot] ([plotId], [farmId], [varietyId], [datePlanted], [dateHarvested], [plantingRate], [plantingRateByPounds], [rowWidth], [patternRepeats], [organicMatter], [bicarbP], [potassium], [magnesium], [calcium], [pHSoil], [pHBuffer], [CEC], [percentBaseSaturationK], [percentBaseSaturationMg], [percentBaseSaturationCa], [percentBaseSaturationH], [comments]) VALUES (38, 140, 126, CAST(N'1995-05-15T00:00:00.000' AS DateTime), CAST(N'1995-10-23T00:00:00.000' AS DateTime), 30000, 0, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'loam soil
old pasture field
excellent growing conditions')
INSERT [dbo].[plot] ([plotId], [farmId], [varietyId], [datePlanted], [dateHarvested], [plantingRate], [plantingRateByPounds], [rowWidth], [patternRepeats], [organicMatter], [bicarbP], [potassium], [magnesium], [calcium], [pHSoil], [pHBuffer], [CEC], [percentBaseSaturationK], [percentBaseSaturationMg], [percentBaseSaturationCa], [percentBaseSaturationH], [comments]) VALUES (39, 144, 127, CAST(N'1995-05-12T00:00:00.000' AS DateTime), CAST(N'1995-10-18T00:00:00.000' AS DateTime), 30000, 0, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'sandy soil
high phosphorus level
excellent growing season
a little dry')
INSERT [dbo].[plot] ([plotId], [farmId], [varietyId], [datePlanted], [dateHarvested], [plantingRate], [plantingRateByPounds], [rowWidth], [patternRepeats], [organicMatter], [bicarbP], [potassium], [magnesium], [calcium], [pHSoil], [pHBuffer], [CEC], [percentBaseSaturationK], [percentBaseSaturationMg], [percentBaseSaturationCa], [percentBaseSaturationH], [comments]) VALUES (40, 42, 128, CAST(N'1995-05-16T00:00:00.000' AS DateTime), CAST(N'1995-10-19T00:00:00.000' AS DateTime), 29900, 0, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'loam soil
excellent growing conditions
medium fertility')
INSERT [dbo].[plot] ([plotId], [farmId], [varietyId], [datePlanted], [dateHarvested], [plantingRate], [plantingRateByPounds], [rowWidth], [patternRepeats], [organicMatter], [bicarbP], [potassium], [magnesium], [calcium], [pHSoil], [pHBuffer], [CEC], [percentBaseSaturationK], [percentBaseSaturationMg], [percentBaseSaturationCa], [percentBaseSaturationH], [comments]) VALUES (41, 161, 126, CAST(N'1995-05-15T00:00:00.000' AS DateTime), CAST(N'1995-10-23T00:00:00.000' AS DateTime), 30000, 0, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[plot] ([plotId], [farmId], [varietyId], [datePlanted], [dateHarvested], [plantingRate], [plantingRateByPounds], [rowWidth], [patternRepeats], [organicMatter], [bicarbP], [potassium], [magnesium], [calcium], [pHSoil], [pHBuffer], [CEC], [percentBaseSaturationK], [percentBaseSaturationMg], [percentBaseSaturationCa], [percentBaseSaturationH], [comments]) VALUES (42, 36, 151, CAST(N'1995-05-18T00:00:00.000' AS DateTime), CAST(N'1995-10-26T00:00:00.000' AS DateTime), 30000, 0, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'clay loam soil
heavy rain early in season')
INSERT [dbo].[plot] ([plotId], [farmId], [varietyId], [datePlanted], [dateHarvested], [plantingRate], [plantingRateByPounds], [rowWidth], [patternRepeats], [organicMatter], [bicarbP], [potassium], [magnesium], [calcium], [pHSoil], [pHBuffer], [CEC], [percentBaseSaturationK], [percentBaseSaturationMg], [percentBaseSaturationCa], [percentBaseSaturationH], [comments]) VALUES (43, 65, 116, CAST(N'1995-05-08T00:00:00.000' AS DateTime), CAST(N'1995-10-12T00:00:00.000' AS DateTime), 30000, 0, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'sandy loam soil
medium fertility
excellent growing conditions')
INSERT [dbo].[plot] ([plotId], [farmId], [varietyId], [datePlanted], [dateHarvested], [plantingRate], [plantingRateByPounds], [rowWidth], [patternRepeats], [organicMatter], [bicarbP], [potassium], [magnesium], [calcium], [pHSoil], [pHBuffer], [CEC], [percentBaseSaturationK], [percentBaseSaturationMg], [percentBaseSaturationCa], [percentBaseSaturationH], [comments]) VALUES (44, 154, 130, CAST(N'1995-05-19T00:00:00.000' AS DateTime), CAST(N'1995-10-24T00:00:00.000' AS DateTime), 30000, 0, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'loam soil
very uneven ground conditions at planting time')
INSERT [dbo].[plot] ([plotId], [farmId], [varietyId], [datePlanted], [dateHarvested], [plantingRate], [plantingRateByPounds], [rowWidth], [patternRepeats], [organicMatter], [bicarbP], [potassium], [magnesium], [calcium], [pHSoil], [pHBuffer], [CEC], [percentBaseSaturationK], [percentBaseSaturationMg], [percentBaseSaturationCa], [percentBaseSaturationH], [comments]) VALUES (45, 155, 130, CAST(N'1995-05-18T00:00:00.000' AS DateTime), CAST(N'1995-10-26T00:00:00.000' AS DateTime), 30000, 0, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'heavy clay soil
early rains gave poor stand')
INSERT [dbo].[plot] ([plotId], [farmId], [varietyId], [datePlanted], [dateHarvested], [plantingRate], [plantingRateByPounds], [rowWidth], [patternRepeats], [organicMatter], [bicarbP], [potassium], [magnesium], [calcium], [pHSoil], [pHBuffer], [CEC], [percentBaseSaturationK], [percentBaseSaturationMg], [percentBaseSaturationCa], [percentBaseSaturationH], [comments]) VALUES (46, 28, 107, CAST(N'1995-05-19T00:00:00.000' AS DateTime), CAST(N'1995-10-11T00:00:00.000' AS DateTime), 30000, 0, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'loam soil
excellent ground
medium fertility')
INSERT [dbo].[plot] ([plotId], [farmId], [varietyId], [datePlanted], [dateHarvested], [plantingRate], [plantingRateByPounds], [rowWidth], [patternRepeats], [organicMatter], [bicarbP], [potassium], [magnesium], [calcium], [pHSoil], [pHBuffer], [CEC], [percentBaseSaturationK], [percentBaseSaturationMg], [percentBaseSaturationCa], [percentBaseSaturationH], [comments]) VALUES (47, 37, 111, CAST(N'1995-05-06T00:00:00.000' AS DateTime), CAST(N'1995-10-17T00:00:00.000' AS DateTime), 30000, 0, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'clay loam soil
dry summer
good stand')
INSERT [dbo].[plot] ([plotId], [farmId], [varietyId], [datePlanted], [dateHarvested], [plantingRate], [plantingRateByPounds], [rowWidth], [patternRepeats], [organicMatter], [bicarbP], [potassium], [magnesium], [calcium], [pHSoil], [pHBuffer], [CEC], [percentBaseSaturationK], [percentBaseSaturationMg], [percentBaseSaturationCa], [percentBaseSaturationH], [comments]) VALUES (48, 156, 107, CAST(N'1996-05-28T00:00:00.000' AS DateTime), CAST(N'1996-11-27T00:00:00.000' AS DateTime), 27700, 0, NULL, 3, 2.0999999046325684, 28, 98, 109, 624, 6.1999998092651367, 6.9000000953674316, 5.5, 4.5999999046325684, 16.600000381469727, 56.900001525878906, 21.899999618530273, NULL)
INSERT [dbo].[plot] ([plotId], [farmId], [varietyId], [datePlanted], [dateHarvested], [plantingRate], [plantingRateByPounds], [rowWidth], [patternRepeats], [organicMatter], [bicarbP], [potassium], [magnesium], [calcium], [pHSoil], [pHBuffer], [CEC], [percentBaseSaturationK], [percentBaseSaturationMg], [percentBaseSaturationCa], [percentBaseSaturationH], [comments]) VALUES (49, 156, 107, CAST(N'1996-05-28T00:00:00.000' AS DateTime), CAST(N'1996-11-27T00:00:00.000' AS DateTime), 27700, 0, NULL, 3, 31, 16, 116, 254, 2042, 7.3000001907348633, NULL, 12.600000381469727, 2.4000000953674316, 16.799999237060547, 80.9000015258789, NULL, NULL)
INSERT [dbo].[plot] ([plotId], [farmId], [varietyId], [datePlanted], [dateHarvested], [plantingRate], [plantingRateByPounds], [rowWidth], [patternRepeats], [organicMatter], [bicarbP], [potassium], [magnesium], [calcium], [pHSoil], [pHBuffer], [CEC], [percentBaseSaturationK], [percentBaseSaturationMg], [percentBaseSaturationCa], [percentBaseSaturationH], [comments]) VALUES (50, 157, NULL, CAST(N'1996-05-14T00:00:00.000' AS DateTime), CAST(N'1996-11-01T00:00:00.000' AS DateTime), 28000, 0, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'plot initially planted w/6 reps but last rep ran out of seed - disregard that rep in both the hybrid trial & the fertilizer trial.')
INSERT [dbo].[plot] ([plotId], [farmId], [varietyId], [datePlanted], [dateHarvested], [plantingRate], [plantingRateByPounds], [rowWidth], [patternRepeats], [organicMatter], [bicarbP], [potassium], [magnesium], [calcium], [pHSoil], [pHBuffer], [CEC], [percentBaseSaturationK], [percentBaseSaturationMg], [percentBaseSaturationCa], [percentBaseSaturationH], [comments]) VALUES (51, 158, 134, CAST(N'1996-05-28T00:00:00.000' AS DateTime), CAST(N'1996-11-27T00:00:00.000' AS DateTime), 27700, 0, NULL, 3, 3.0999999046325684, 34, 122, 303, 2430, 7.6999998092651367, NULL, 15, 2.0999999046325684, 16.799999237060547, 81.0999984741211, NULL, NULL)
INSERT [dbo].[plot] ([plotId], [farmId], [varietyId], [datePlanted], [dateHarvested], [plantingRate], [plantingRateByPounds], [rowWidth], [patternRepeats], [organicMatter], [bicarbP], [potassium], [magnesium], [calcium], [pHSoil], [pHBuffer], [CEC], [percentBaseSaturationK], [percentBaseSaturationMg], [percentBaseSaturationCa], [percentBaseSaturationH], [comments]) VALUES (52, 75, 102, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[plot] ([plotId], [farmId], [varietyId], [datePlanted], [dateHarvested], [plantingRate], [plantingRateByPounds], [rowWidth], [patternRepeats], [organicMatter], [bicarbP], [potassium], [magnesium], [calcium], [pHSoil], [pHBuffer], [CEC], [percentBaseSaturationK], [percentBaseSaturationMg], [percentBaseSaturationCa], [percentBaseSaturationH], [comments]) VALUES (53, 159, 135, CAST(N'1996-05-20T00:00:00.000' AS DateTime), NULL, 29900, 0, NULL, 3, 2.4000000953674316, 22, 93, 90, 803, 5.1999998092651367, 6.8000001907348633, 7.4000000953674316, 3.2000000476837158, 10.100000381469727, 54.200000762939453, 32.400001525878906, NULL)
INSERT [dbo].[plot] ([plotId], [farmId], [varietyId], [datePlanted], [dateHarvested], [plantingRate], [plantingRateByPounds], [rowWidth], [patternRepeats], [organicMatter], [bicarbP], [potassium], [magnesium], [calcium], [pHSoil], [pHBuffer], [CEC], [percentBaseSaturationK], [percentBaseSaturationMg], [percentBaseSaturationCa], [percentBaseSaturationH], [comments]) VALUES (54, 159, 135, CAST(N'1996-05-20T00:00:00.000' AS DateTime), NULL, 29900, 0, NULL, 3, 2.4000000953674316, 22, 93, 90, 803, 5.1999998092651367, 6.8000001907348633, 7.4000000953674316, 3.2000000476837158, 10.100000381469727, 54.200000762939453, 32.400001525878906, NULL)
INSERT [dbo].[plot] ([plotId], [farmId], [varietyId], [datePlanted], [dateHarvested], [plantingRate], [plantingRateByPounds], [rowWidth], [patternRepeats], [organicMatter], [bicarbP], [potassium], [magnesium], [calcium], [pHSoil], [pHBuffer], [CEC], [percentBaseSaturationK], [percentBaseSaturationMg], [percentBaseSaturationCa], [percentBaseSaturationH], [comments]) VALUES (55, 140, 136, CAST(N'1996-05-27T00:00:00.000' AS DateTime), CAST(N'1996-11-06T00:00:00.000' AS DateTime), 27700, 0, NULL, 3, 2.7000000476837158, 26, 85, 381, 1940, 7.6999998092651367, NULL, 13, 1.7000000476837158, 24.200000762939453, 74.0999984741211, NULL, NULL)
INSERT [dbo].[plot] ([plotId], [farmId], [varietyId], [datePlanted], [dateHarvested], [plantingRate], [plantingRateByPounds], [rowWidth], [patternRepeats], [organicMatter], [bicarbP], [potassium], [magnesium], [calcium], [pHSoil], [pHBuffer], [CEC], [percentBaseSaturationK], [percentBaseSaturationMg], [percentBaseSaturationCa], [percentBaseSaturationH], [comments]) VALUES (56, 42, 133, CAST(N'1996-05-14T00:00:00.000' AS DateTime), NULL, 29900, 0, NULL, 3, 3.2000000476837158, 66, 221, 351, 1648, 7.0999999046325684, NULL, 12.899999618530273, 4.4000000953674316, 22.600000381469727, 63.700000762939453, 9.3000001907348633, NULL)
INSERT [dbo].[plot] ([plotId], [farmId], [varietyId], [datePlanted], [dateHarvested], [plantingRate], [plantingRateByPounds], [rowWidth], [patternRepeats], [organicMatter], [bicarbP], [potassium], [magnesium], [calcium], [pHSoil], [pHBuffer], [CEC], [percentBaseSaturationK], [percentBaseSaturationMg], [percentBaseSaturationCa], [percentBaseSaturationH], [comments]) VALUES (57, 65, 138, CAST(N'1996-05-08T00:00:00.000' AS DateTime), CAST(N'1996-10-25T00:00:00.000' AS DateTime), 29900, 0, NULL, 3, 1.8999999761581421, 94, 134, 68, 1397, 6.8000001907348633, 6.9000000953674316, 9.5, 3.5999999046325684, 6, 73.5999984741211, 16.899999618530273, NULL)
INSERT [dbo].[plot] ([plotId], [farmId], [varietyId], [datePlanted], [dateHarvested], [plantingRate], [plantingRateByPounds], [rowWidth], [patternRepeats], [organicMatter], [bicarbP], [potassium], [magnesium], [calcium], [pHSoil], [pHBuffer], [CEC], [percentBaseSaturationK], [percentBaseSaturationMg], [percentBaseSaturationCa], [percentBaseSaturationH], [comments]) VALUES (58, 162, 130, CAST(N'1996-05-25T00:00:00.000' AS DateTime), CAST(N'1996-10-16T00:00:00.000' AS DateTime), 27700, 0, NULL, NULL, 2.7000000476837158, 44, 169, 303, 2291, 6.5, 6.9000000953674316, 18.399999618530273, 2.4000000953674316, 13.699999809265137, 62.200000762939453, 21.700000762939453, N'wet spring/dry summer
planted in same direction as the tile runs - lots of variation
repeat in 1997')
INSERT [dbo].[plot] ([plotId], [farmId], [varietyId], [datePlanted], [dateHarvested], [plantingRate], [plantingRateByPounds], [rowWidth], [patternRepeats], [organicMatter], [bicarbP], [potassium], [magnesium], [calcium], [pHSoil], [pHBuffer], [CEC], [percentBaseSaturationK], [percentBaseSaturationMg], [percentBaseSaturationCa], [percentBaseSaturationH], [comments]) VALUES (59, 163, 139, CAST(N'1996-05-14T00:00:00.000' AS DateTime), CAST(N'1996-11-28T00:00:00.000' AS DateTime), 29900, 0, NULL, 3, 3.4000000953674316, 54, 214, 479, 1895, 7.3000001907348633, NULL, 14, 3.9000000953674316, 28.5, 67.5999984741211, NULL, NULL)
INSERT [dbo].[plot] ([plotId], [farmId], [varietyId], [datePlanted], [dateHarvested], [plantingRate], [plantingRateByPounds], [rowWidth], [patternRepeats], [organicMatter], [bicarbP], [potassium], [magnesium], [calcium], [pHSoil], [pHBuffer], [CEC], [percentBaseSaturationK], [percentBaseSaturationMg], [percentBaseSaturationCa], [percentBaseSaturationH], [comments]) VALUES (60, 164, 103, CAST(N'1996-05-17T00:00:00.000' AS DateTime), CAST(N'1996-11-06T00:00:00.000' AS DateTime), 27700, 0, NULL, 3, 4.4000000953674316, 8, 115, 356, 3163, 7.8000001907348633, NULL, 19.100000381469727, 1.5, 15.600000381469727, 82.9000015258789, NULL, NULL)
INSERT [dbo].[plot] ([plotId], [farmId], [varietyId], [datePlanted], [dateHarvested], [plantingRate], [plantingRateByPounds], [rowWidth], [patternRepeats], [organicMatter], [bicarbP], [potassium], [magnesium], [calcium], [pHSoil], [pHBuffer], [CEC], [percentBaseSaturationK], [percentBaseSaturationMg], [percentBaseSaturationCa], [percentBaseSaturationH], [comments]) VALUES (61, 14, 141, CAST(N'1996-05-20T00:00:00.000' AS DateTime), CAST(N'1996-11-05T00:00:00.000' AS DateTime), 29900, 0, NULL, 3, 2.7000000476837158, 26, 133, 123, 1848, 7.5999999046325684, NULL, 10.600000381469727, 3.2000000476837158, 9.6999998092651367, 87.0999984741211, NULL, NULL)
INSERT [dbo].[plot] ([plotId], [farmId], [varietyId], [datePlanted], [dateHarvested], [plantingRate], [plantingRateByPounds], [rowWidth], [patternRepeats], [organicMatter], [bicarbP], [potassium], [magnesium], [calcium], [pHSoil], [pHBuffer], [CEC], [percentBaseSaturationK], [percentBaseSaturationMg], [percentBaseSaturationCa], [percentBaseSaturationH], [comments]) VALUES (62, 91, NULL, CAST(N'1996-05-17T00:00:00.000' AS DateTime), NULL, 29900, 0, NULL, 2, 3.4000000953674316, 20, 47, 454, 2197, 7.5999999046325684, NULL, 14.899999618530273, 0.800000011920929, 25.399999618530273, 73.800003051757812, NULL, NULL)
INSERT [dbo].[plot] ([plotId], [farmId], [varietyId], [datePlanted], [dateHarvested], [plantingRate], [plantingRateByPounds], [rowWidth], [patternRepeats], [organicMatter], [bicarbP], [potassium], [magnesium], [calcium], [pHSoil], [pHBuffer], [CEC], [percentBaseSaturationK], [percentBaseSaturationMg], [percentBaseSaturationCa], [percentBaseSaturationH], [comments]) VALUES (63, 165, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[plot] ([plotId], [farmId], [varietyId], [datePlanted], [dateHarvested], [plantingRate], [plantingRateByPounds], [rowWidth], [patternRepeats], [organicMatter], [bicarbP], [potassium], [magnesium], [calcium], [pHSoil], [pHBuffer], [CEC], [percentBaseSaturationK], [percentBaseSaturationMg], [percentBaseSaturationCa], [percentBaseSaturationH], [comments]) VALUES (64, 165, 142, CAST(N'1996-05-20T00:00:00.000' AS DateTime), NULL, 29900, 0, NULL, 3, 2.5999999046325684, 42, 114, 84, 409, 5.8000001907348633, 6.6999998092651367, 6.5999999046325684, 4.4000000953674316, 10.5, 30, 54.200000762939453, N'nitrogren applied as sidedress
extra nitrogen in 10-34-0 gave more yield response than phosphate.
Other plots have shown that sidebanded 28% Nitrogen + Alpine on seed consitently yield better than sidebanded 10-34-0.')
INSERT [dbo].[plot] ([plotId], [farmId], [varietyId], [datePlanted], [dateHarvested], [plantingRate], [plantingRateByPounds], [rowWidth], [patternRepeats], [organicMatter], [bicarbP], [potassium], [magnesium], [calcium], [pHSoil], [pHBuffer], [CEC], [percentBaseSaturationK], [percentBaseSaturationMg], [percentBaseSaturationCa], [percentBaseSaturationH], [comments]) VALUES (65, 166, 109, CAST(N'1996-05-18T00:00:00.000' AS DateTime), NULL, 29900, 0, NULL, 3, 2.5999999046325684, 36, 161, 328, 2523, 7.6999998092651367, NULL, 15.800000190734863, 2.5999999046325684, 17.299999237060547, 80, NULL, NULL)
INSERT [dbo].[plot] ([plotId], [farmId], [varietyId], [datePlanted], [dateHarvested], [plantingRate], [plantingRateByPounds], [rowWidth], [patternRepeats], [organicMatter], [bicarbP], [potassium], [magnesium], [calcium], [pHSoil], [pHBuffer], [CEC], [percentBaseSaturationK], [percentBaseSaturationMg], [percentBaseSaturationCa], [percentBaseSaturationH], [comments]) VALUES (66, 83, 123, CAST(N'1996-06-01T00:00:00.000' AS DateTime), NULL, 26100, 0, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[plot] ([plotId], [farmId], [varietyId], [datePlanted], [dateHarvested], [plantingRate], [plantingRateByPounds], [rowWidth], [patternRepeats], [organicMatter], [bicarbP], [potassium], [magnesium], [calcium], [pHSoil], [pHBuffer], [CEC], [percentBaseSaturationK], [percentBaseSaturationMg], [percentBaseSaturationCa], [percentBaseSaturationH], [comments]) VALUES (67, 167, 143, CAST(N'1996-06-05T00:00:00.000' AS DateTime), CAST(N'1996-12-03T00:00:00.000' AS DateTime), 27700, 0, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[plot] ([plotId], [farmId], [varietyId], [datePlanted], [dateHarvested], [plantingRate], [plantingRateByPounds], [rowWidth], [patternRepeats], [organicMatter], [bicarbP], [potassium], [magnesium], [calcium], [pHSoil], [pHBuffer], [CEC], [percentBaseSaturationK], [percentBaseSaturationMg], [percentBaseSaturationCa], [percentBaseSaturationH], [comments]) VALUES (68, 168, 132, CAST(N'1996-05-13T00:00:00.000' AS DateTime), CAST(N'1996-10-28T00:00:00.000' AS DateTime), 29900, 0, NULL, 3, 2.5999999046325684, 52, 181, 184, 3652, 8, NULL, 20.299999237060547, 2.2999999523162842, 7.5999999046325684, 90.0999984741211, NULL, NULL)
INSERT [dbo].[plot] ([plotId], [farmId], [varietyId], [datePlanted], [dateHarvested], [plantingRate], [plantingRateByPounds], [rowWidth], [patternRepeats], [organicMatter], [bicarbP], [potassium], [magnesium], [calcium], [pHSoil], [pHBuffer], [CEC], [percentBaseSaturationK], [percentBaseSaturationMg], [percentBaseSaturationCa], [percentBaseSaturationH], [comments]) VALUES (69, 168, 132, CAST(N'1996-05-13T00:00:00.000' AS DateTime), CAST(N'1996-10-28T00:00:00.000' AS DateTime), 29900, 0, NULL, 3, 2.5999999046325684, 52, 181, 184, 3652, 8, NULL, 20.299999237060547, 2.2999999523162842, 7.5999999046325684, 90.0999984741211, NULL, NULL)
INSERT [dbo].[plot] ([plotId], [farmId], [varietyId], [datePlanted], [dateHarvested], [plantingRate], [plantingRateByPounds], [rowWidth], [patternRepeats], [organicMatter], [bicarbP], [potassium], [magnesium], [calcium], [pHSoil], [pHBuffer], [CEC], [percentBaseSaturationK], [percentBaseSaturationMg], [percentBaseSaturationCa], [percentBaseSaturationH], [comments]) VALUES (71, 37, 144, CAST(N'1996-05-31T00:00:00.000' AS DateTime), CAST(N'1996-11-13T00:00:00.000' AS DateTime), 27700, 0, NULL, 3, 3.2000000476837158, 36, 142, 159, 3951, 8, NULL, 21.399999618530273, 1.7000000476837158, 6.1999998092651367, 92.0999984741211, NULL, NULL)
INSERT [dbo].[plot] ([plotId], [farmId], [varietyId], [datePlanted], [dateHarvested], [plantingRate], [plantingRateByPounds], [rowWidth], [patternRepeats], [organicMatter], [bicarbP], [potassium], [magnesium], [calcium], [pHSoil], [pHBuffer], [CEC], [percentBaseSaturationK], [percentBaseSaturationMg], [percentBaseSaturationCa], [percentBaseSaturationH], [comments]) VALUES (72, 169, 145, CAST(N'1996-05-13T00:00:00.000' AS DateTime), CAST(N'1996-10-25T00:00:00.000' AS DateTime), 29900, 0, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[plot] ([plotId], [farmId], [varietyId], [datePlanted], [dateHarvested], [plantingRate], [plantingRateByPounds], [rowWidth], [patternRepeats], [organicMatter], [bicarbP], [potassium], [magnesium], [calcium], [pHSoil], [pHBuffer], [CEC], [percentBaseSaturationK], [percentBaseSaturationMg], [percentBaseSaturationCa], [percentBaseSaturationH], [comments]) VALUES (73, 26, 132, CAST(N'1996-05-18T00:00:00.000' AS DateTime), CAST(N'1996-10-01T00:00:00.000' AS DateTime), 29900, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[plot] ([plotId], [farmId], [varietyId], [datePlanted], [dateHarvested], [plantingRate], [plantingRateByPounds], [rowWidth], [patternRepeats], [organicMatter], [bicarbP], [potassium], [magnesium], [calcium], [pHSoil], [pHBuffer], [CEC], [percentBaseSaturationK], [percentBaseSaturationMg], [percentBaseSaturationCa], [percentBaseSaturationH], [comments]) VALUES (74, 26, 144, CAST(N'1997-05-27T00:00:00.000' AS DateTime), CAST(N'1997-11-10T00:00:00.000' AS DateTime), 29900, 0, NULL, 2, 1.7000000476837158, 10, 63, 189, 1388, 7.4000000953674316, NULL, 8.6999998092651367, 1.8999999761581421, 18.200000762939453, 80, NULL, NULL)
INSERT [dbo].[plot] ([plotId], [farmId], [varietyId], [datePlanted], [dateHarvested], [plantingRate], [plantingRateByPounds], [rowWidth], [patternRepeats], [organicMatter], [bicarbP], [potassium], [magnesium], [calcium], [pHSoil], [pHBuffer], [CEC], [percentBaseSaturationK], [percentBaseSaturationMg], [percentBaseSaturationCa], [percentBaseSaturationH], [comments]) VALUES (75, 14, 132, CAST(N'1997-05-27T00:00:00.000' AS DateTime), CAST(N'1997-11-11T00:00:00.000' AS DateTime), 29900, 0, NULL, 3, 2.7000000476837158, 38, 92, 173, 2232, 7.3000001907348633, NULL, 12.800000190734863, 1.7999999523162842, 11.199999809265137, 86.9000015258789, NULL, NULL)
INSERT [dbo].[plot] ([plotId], [farmId], [varietyId], [datePlanted], [dateHarvested], [plantingRate], [plantingRateByPounds], [rowWidth], [patternRepeats], [organicMatter], [bicarbP], [potassium], [magnesium], [calcium], [pHSoil], [pHBuffer], [CEC], [percentBaseSaturationK], [percentBaseSaturationMg], [percentBaseSaturationCa], [percentBaseSaturationH], [comments]) VALUES (76, 37, 146, CAST(N'1997-05-29T00:00:00.000' AS DateTime), CAST(N'1997-11-12T00:00:00.000' AS DateTime), 29900, 0, NULL, 3, 2.2000000476837158, 28, 130, 143, 2070, 7.4000000953674316, NULL, 11.899999618530273, 2.7999999523162842, 10, 87.199996948242188, NULL, NULL)
INSERT [dbo].[plot] ([plotId], [farmId], [varietyId], [datePlanted], [dateHarvested], [plantingRate], [plantingRateByPounds], [rowWidth], [patternRepeats], [organicMatter], [bicarbP], [potassium], [magnesium], [calcium], [pHSoil], [pHBuffer], [CEC], [percentBaseSaturationK], [percentBaseSaturationMg], [percentBaseSaturationCa], [percentBaseSaturationH], [comments]) VALUES (77, 37, 146, CAST(N'1997-05-29T00:00:00.000' AS DateTime), CAST(N'1997-11-12T00:00:00.000' AS DateTime), 29900, 0, NULL, 3, 2.2000000476837158, 28, 130, 143, 2070, 7.4000000953674316, NULL, 11.899999618530273, 2.7999999523162842, 10, 87.199996948242188, NULL, NULL)
INSERT [dbo].[plot] ([plotId], [farmId], [varietyId], [datePlanted], [dateHarvested], [plantingRate], [plantingRateByPounds], [rowWidth], [patternRepeats], [organicMatter], [bicarbP], [potassium], [magnesium], [calcium], [pHSoil], [pHBuffer], [CEC], [percentBaseSaturationK], [percentBaseSaturationMg], [percentBaseSaturationCa], [percentBaseSaturationH], [comments]) VALUES (78, 26, 144, CAST(N'1997-05-27T00:00:00.000' AS DateTime), CAST(N'1997-11-10T00:00:00.000' AS DateTime), 29900, 0, NULL, 2, 1.7000000476837158, 10, 63, 189, 1388, 7.4000000953674316, NULL, 8.6999998092651367, 1.8999999761581421, 18.200000762939453, 80, NULL, NULL)
INSERT [dbo].[plot] ([plotId], [farmId], [varietyId], [datePlanted], [dateHarvested], [plantingRate], [plantingRateByPounds], [rowWidth], [patternRepeats], [organicMatter], [bicarbP], [potassium], [magnesium], [calcium], [pHSoil], [pHBuffer], [CEC], [percentBaseSaturationK], [percentBaseSaturationMg], [percentBaseSaturationCa], [percentBaseSaturationH], [comments]) VALUES (79, 170, 144, CAST(N'1997-05-24T00:00:00.000' AS DateTime), CAST(N'1997-10-23T00:00:00.000' AS DateTime), 29900, 0, NULL, 3, 3.2999999523162842, 88, 225, 171, 1630, 5.9000000953674316, 6.9000000953674316, 11.399999618530273, 5.0999999046325684, 12.600000381469727, 71.800003051757812, 10.600000381469727, NULL)
SET IDENTITY_INSERT [dbo].[plot] OFF
INSERT [dbo].[province] ([provinceCode], [name], [countryCode]) VALUES (N'AB', N'Alberta                       ', N'CA')
INSERT [dbo].[province] ([provinceCode], [name], [countryCode]) VALUES (N'BC', N'British Columbia              ', N'CA')
INSERT [dbo].[province] ([provinceCode], [name], [countryCode]) VALUES (N'MB', N'Manitoba                      ', N'CA')
INSERT [dbo].[province] ([provinceCode], [name], [countryCode]) VALUES (N'MI', N'Michigan                      ', N'US')
INSERT [dbo].[province] ([provinceCode], [name], [countryCode]) VALUES (N'NB', N'New Brunswick                 ', N'CA')
INSERT [dbo].[province] ([provinceCode], [name], [countryCode]) VALUES (N'NL', N'Newfoundland and Labrador     ', N'CA')
INSERT [dbo].[province] ([provinceCode], [name], [countryCode]) VALUES (N'NS', N'Nova Scotia                   ', N'CA')
INSERT [dbo].[province] ([provinceCode], [name], [countryCode]) VALUES (N'NT', N'Northwest Territories         ', N'CA')
INSERT [dbo].[province] ([provinceCode], [name], [countryCode]) VALUES (N'NU', N'Nunavut                       ', N'CA')
INSERT [dbo].[province] ([provinceCode], [name], [countryCode]) VALUES (N'ON', N'Ontario                       ', N'CA')
INSERT [dbo].[province] ([provinceCode], [name], [countryCode]) VALUES (N'PI', N'Prince Edward Island          ', N'CA')
INSERT [dbo].[province] ([provinceCode], [name], [countryCode]) VALUES (N'QC', N'Quebec                        ', N'CA')
INSERT [dbo].[province] ([provinceCode], [name], [countryCode]) VALUES (N'SK', N'Saskatchewan                  ', N'CA')
INSERT [dbo].[province] ([provinceCode], [name], [countryCode]) VALUES (N'YT', N'Yukon                         ', N'CA')
SET IDENTITY_INSERT [dbo].[treatment] ON 

INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (10, N'OEC 6-24-6', 5, 0.191, 131.60000610351563, 58.200000762939453)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (11, N'11-52-0 Dry + OEC 6-24-6', 5, 0.192, 131, 57.900001525878906)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (12, N'no fertilizer', 5, 0.195, 128, 57)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (13, N'11-52-0 Dry', 5, 0.197, 123.69999694824219, 57.400001525878906)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (15, N'OEC 6-24-6', 6, 0.229, 160.39999389648438, 56.400001525878906)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (16, N'8-25-3', 6, 0.241, 153.30000305175781, 56.400001525878906)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (18, N'Cangrow', 9, 0.196, 127.40000152587891, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (19, N'10-34-0', 9, 0.197, 127.19999694824219, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (20, N'OEC 6-24-6', 9, 0.199, 125.80000305175781, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (21, N'11-53-0 Dry', 9, 0.199, 121.5, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (22, N'OEC 2-20-18', 10, 0.199, 15.399999618530273, 58.700000762939453)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (26, N'OEC 6-24-6', 10, 0.201, 150.69999694824219, 59.5)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (28, N'0-46-0', 10, 0.204, 143.39999389648438, 58.700000762939453)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (29, N'10-34-0', 7, 0.264, 170.30000305175781, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (30, N'11-53-0 Dry', 7, 0.264, 168.30000305175781, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (31, N'Cargill 6-24-6', 7, 0.256, 167.30000305175781, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (32, N'OEC 6-24-6 + zinc', 7, 0.255, 163.80000305175781, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (33, N'OEC 6-24-6', 7, 0.264, 162.80000305175781, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (35, N'OEC 6-24-6', 12, 0.222, 165, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (36, N'11-52-0 Dry', 12, 0.215, 164.69999694824219, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (37, N'11-52-0 Dry + OEC 6-24-6', 12, 0.225, 164.5, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (38, N'no fertilizer', 12, 0.222, 163.19999694824219, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (39, N'11-52-0 Dry', 13, 0.258, 147.60000610351563, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (40, N'Cargill 6-24-6', 13, 0.247, 147.30000305175781, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (41, N'OEC 2-20-18', 13, 0.25, 147, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (42, N'10-34-0', 13, 0.242, 146.19999694824219, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (43, N'OEC 6-24-6', 13, 0.234, 145.80000305175781, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (44, N'All Plant', 13, 0.252, 145.69999694824219, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (45, N'0-0-60 + OEC 6-24-6', 14, 0.203, 171, 56.599998474121094)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (47, N'9-23-30', 14, 0.203, 170.19999694824219, 55.700000762939453)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (48, N'no fertilizer', 14, 0.201, 164.30000305175781, 55.400001525878906)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (49, N'28-0-0 + OEC 6-24-6', 16, 0.211, 160.80000305175781, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (50, N'10-34-0', 16, 0.201, 159.80000305175781, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (51, N'OEC 6-24-6', 16, 0.211, 159, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (52, N'OEC 6-24-6', 17, 0.258, 121.5, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (53, N'11-52-0 Dry', 17, 0.272, 110.5, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (54, N'no fertilizer', 17, 0.286, 106.69999694824219, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (60, N'11-52-0 Dry', 18, 0.203, 134.89999389648438, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (61, N'OEC 6-24-6', 18, 0.206, 122.19999694824219, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (62, N'28% Nitrogen + OEC 6-24-6', 18, 0.205, 132.10000610351563, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (63, N'10-34-0', 18, 0.209, 130.80000305175781, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (64, N'no fertilizer', 18, 0.207, 115.5, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (65, N'28% Nitrogen + OEC 6-24-6', 19, 0.281, 145.39999389648438, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (66, N'OEC 6-24-6', 19, 0.288, 139, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (67, N'OEC 6-24-6 + zinc', 19, 0.292, 138.39999389648438, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (68, N'12-39-12', 19, 0.305, 135.5, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (69, N'no fertilizer', 19, 0.331, 123.30000305175781, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (70, N'OEC 2-20-18', 20, 0.243, 144.89999389648438, 53.700000762939453)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (71, N'Manganese + OEC 6-24-6, zinc', 20, 0.243, 142.5, 53.700000762939453)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (72, N'6-20-24 + Nutrite 5 Star', 20, 0.249, 140.89999389648438, 53.700000762939453)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (73, N'OEC 6-24-6', 20, 0.247, 140.39999389648438, 53.700000762939453)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (74, N'no fertilizer', 20, 0.252, 134.19999694824219, 53)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (75, N'OEC 6-24-6', 21, NULL, NULL, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (76, N'11-52-0 Dry', 21, 0.229, 106, 53.099998474121094)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (77, N'no fertilizer', 21, 0.24, 100.90000152587891, 52.599998474121094)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (78, N'10-34-0', 21, 0.225, 100.30000305175781, 53.5)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (79, N'no fertilizer', 10, 0.201, 144.19999694824219, 58)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (80, N'no fertilizer', 7, 0.268, 157.69999694824219, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (81, N'no fertilizer', 13, 0.255, 147, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (82, N'OEC 6-24-6 + zinc', 15, 0.222, 129.89999389648438, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (83, N'OEC 6-24-6', 15, 0.238, 126.69999694824219, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (84, N'no fertilizer', 15, 0.24, 116.5, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (85, N'10-34-0', 15, 0.244, 116.5, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (86, N'no fertilizer', 16, 0.211, 160.89999389648438, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (87, N'11-52-0 Dry', 23, 0.194, 125.5, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (88, N'10-34-0', 23, NULL, NULL, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (89, N'10-34-0', 23, 0.187, 122.09999847412109, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (90, N'no fertilizer', 23, 0.201, 121.90000152587891, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (91, N'OEC 6-24-6', 23, 0.189, 121.59999847412109, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (92, N'11-52-0 Dry', 24, 0.235, 162.19999694824219, 54)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (93, N'OEC 6-24-6', 24, 0.234, 159.5, 54.200000762939453)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (94, N'10-34-0', 24, 0.238, 158.69999694824219, 53.5)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (95, N'11-52-0 Dry', 25, 0.216, 129, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (96, N'OEC 6-24-6', 25, 0.213, 128.89999389648438, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (97, N'28% Nitrogen + OEC 6-24-6', 25, 0.21, 126.09999847412109, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (98, N'10-34-0', 25, 0.209, 123.19999694824219, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (99, N'no fertilizer', 25, 0.215, 121.69999694824219, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (100, N'11-52-0 Dry', 26, 0.211, 154.5, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (101, N'10-34-0', 26, 0.207, 150.10000610351563, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (102, N'OEC 6-24-6', 26, 0.209, 149.5, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (103, N'28% Nitrogen + OEC 6-24-6', 26, 0.209, 147.39999389648438, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (104, N'no fertilizer', 26, 0.215, 138.69999694824219, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (105, N'no fertilizer', 27, 0.248, 149.89999389648438, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (106, N'OEC 6-24-6', 27, 0.255, 147.89999389648438, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (107, N'10-34-0', 27, 0.252, 147, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (108, N'9-18-9 White', 27, 0.272, 141, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (109, N'OEC 6-24-6', 28, 0.259, 158.69999694824219, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (110, N'10-34-0', 28, 0.258, 155.30000305175781, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (111, N'8-25-3', 28, 0.26, 154.39999389648438, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (112, N'11-53-0 Dry', 28, 0.266, 153, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (113, N'18-13-13 + 28% Nitrogen', 29, 0.288, 124.59999847412109, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (114, N'28% Nitrogen + OEC 6-24-6', 29, 0.288, 124.09999847412109, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (115, N'no fertilizer', 29, 0.288, 115.37999725341797, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (116, N'28% Nitrogen + OEC 6-24-6', 30, 0.286, 124.90000152587891, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (117, N'15-15-12', 30, 0.307, 118.09999847412109, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (118, N'28% Nitrogen + OEC 6-24-6', 31, 0.206, 131.10000610351563, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (119, N'7-22-15 + Magnesium', 31, 0.209, 128.39999389648438, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (120, N'8-25-3 + OEC 6-24-6', 32, 0.14, 160.39999389648438, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (121, N'8-25-3', 32, 0.14, 158.30000305175781, NULL)
GO
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (122, N'28% Nitrogen + OEC 6-24-6', 32, 0.14, 157.19999694824219, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (123, N'no fertilizer', 32, 0.14, 156.39999389648438, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (124, N'11-53-0 Dry', 32, 0.14, 154.80000305175781, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (125, N'11-53-0 Dry', 33, 0.22, 139.89999389648438, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (126, N'OEC 6-24-6', 33, 0.224, 140.60000610351563, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (127, N'0-0-12 + OEC 6-24-6', 33, 0.225, 137.69999694824219, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (128, N'no fertilizer', 33, 0.23, 135.19999694824219, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (129, N'10-34-0', 33, 0.222, 132.19999694824219, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (130, N'no fertilizer', 34, 0.175, 92.699996948242188, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (131, N'11-53-0 Dry', 34, 0.172, 91.699996948242188, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (132, N'OEC 6-24-6', 34, 0.168, 91.300003051757812, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (133, N'Liqui-Cal +OEC 6-24-6, Thio-Sul', 34, 0.173, 85.300003051757812, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (134, N'11-53-0 Dry', 35, 0.182, 115.19999694824219, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (135, N'11-53-0 Dry + OEC 6-24-6', 35, 0.183, 114.40000152587891, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (136, N'OEC 6-24-6', 35, 0.178, 109.09999847412109, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (137, N'no fertilizer', 35, 0.192, 101.19999694824219, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (138, N'no fertilizer', 36, 0.217, 129, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (139, N'OEC 6-24-6', 36, 0.213, 142, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (140, N'11-53-0 Dry', 36, 0.215, 135.10000610351563, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (141, N'OEC 6-24-6', 37, 0.173, 158.5, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (142, N'28% Nitrogen + OEC 6-24-6', 37, 0.177, 154.10000610351563, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (143, N'10-34-0', 37, 0.175, 150.69999694824219, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (144, N'11-53-0 Dry', 37, 0.173, 144.60000610351563, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (145, N'10-34-0', 37, 0.174, 142.89999389648438, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (146, N'OEC 6-24-6', 38, 0.248, 143.89999389648438, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (147, N'no fertilizer', 38, 0.259, 141.5, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (148, N'11-53-0 Dry', 38, 0.259, 141.19999694824219, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (149, N'10-34-0', 38, 0.251, 141, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (150, N'OEC 6-24-6', 40, 0.225, 144.80000305175781, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (151, N'11-0-7 + OEC 6-24-6', 40, 0.228, 136.30000305175781, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (152, N'10-34-0', 40, 0.23, 135.89999389648438, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (153, N'11-53-0 Dry', 40, 0.234, 134.39999389648438, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (154, N'no fertilizer', 40, 0.23, 129.5, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (155, N'28% Nitrogen + OEC 6-24-6', 42, 0.168, 139.60000610351563, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (156, N'11-53-0 Dry', 42, 0.182, 133.39999389648438, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (157, N'8-25-3 + OEC 6-24-6', 42, 0.183, 126.40000152587891, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (158, N'8-25-3', 42, 0.191, 123.59999847412109, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (159, N'no fertilizer', 42, 0.184, 115.59999847412109, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (160, N'11-53-0 Dry', 43, 0.22, 158.19999694824219, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (161, N'OEC 6-24-6', 43, 0.225, 156.80000305175781, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (162, N'no fertilizer', 43, 0.243, 153.30000305175781, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (163, N'10-34-0', 43, 0.232, 153.10000610351563, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (164, N'0-0-12 + 28% Nitrogen + OEC 6-24-6', 44, 0.193, 146.60000610351563, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (165, N'10-34-0 + 28% Nitrogen', 44, 0.191, 145.19999694824219, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (166, N'28% Nitrogen', 44, 0.192, 139, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (167, N'28% Nitrogen + OEC 6-24-6', 44, 0.192, 136.19999694824219, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (168, N'28% Nitrogen + OEC 6-24-6', 45, 0.149, 117.5, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (169, N'8-25-3', 45, 0.151, 116.69999694824219, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (170, N'11-53-0 Dry', 45, 0.149, 116, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (171, N'8-25-3 + OEC 6-24-6', 45, 0.149, 112.90000152587891, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (172, N'no fertilizer', 45, 0.15, 110.69999694824219, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (173, N'11-53-0 Dry + OEC 6-24-6', 46, 0.249, 144.69999694824219, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (174, N'OEC 6-24-6', 46, 0.252, 142, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (175, N'11-53-0 Dry', 46, 0.248, 141.39999389648438, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (176, N'no fertilizer', 46, 0.264, 140.30000305175781, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (177, N'10-34-0', 46, 0.255, 138.60000610351563, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (178, N'OEC 6-24-6', 47, 0.179, 123.69999694824219, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (179, N'11-53-0 Dry', 47, 0.187, 121, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (180, N'no fertilizer', 47, 0.188, 118.09999847412109, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (181, N'10-34-0', 47, 0.185, 116.5, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (182, N'4-20-28 + OEC 6-24-6', 48, 0.256, 105.5, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (183, N'0-0-60 + OEC 6-24-6', 48, 0.27, 102.30000305175781, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (184, N'0-0-60', 48, 0.269, 99.4000015258789, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (185, N'0-0-60 + OEC 6-24-6', 49, 0.27, 143.69999694824219, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (186, N'0-0-60', 49, 0.283, 141.10000610351563, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (187, N'4-20-28 + OEC 6-24-6', 49, 0.271, 140.10000610351563, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (188, N'Micros (Zn+Mn+Mg) + OEC 6-24-6', 50, 0.25, 129.80000305175781, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (189, N'no fertilizer', 50, 0.26, 127.69999694824219, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (190, N'10-37-6 + Micros (Zn+Mn+Mg)', 50, 0.256, 126.30000305175781, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (191, N'OEC 6-24-6', 51, 0.289, 112.90000152587891, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (193, N'3-18-18', 51, 0.293, 112.5, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (194, N'Exp HQ', 51, 0.293, 110.40000152587891, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (195, N'no fertilizer', 51, 0.293, 106.19999694824219, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (196, N'OEC 6-24-6', 54, 0.269, 129.89999389648438, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (197, N'Exp M1', 54, 0.269, 129.30000305175781, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (198, N'Exp U7', 54, 0.271, 129.30000305175781, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (199, N'Exp M2', 54, 0.269, 128.80000305175781, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (200, N'no fertilizer', 54, 0.297, 119.59999847412109, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (201, N'OEC 6-24-6', 55, 0.268, 112.30000305175781, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (202, N'3-15-3', 55, NULL, NULL, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (203, N'no fertilizer', 55, 0.288, 104.69999694824219, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (204, N'OEC 6-24-6', 56, NULL, NULL, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (205, N'OEC 6-24-6, zinc', 56, 0.317, 110.09999847412109, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (206, N'3-18-18', 56, 0.314, 100.69999694824219, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (207, N'no fertilizer', 56, 0.312, 100.69999694824219, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (208, N'OEC 6-24-6', 57, 0.2287, 130.42999267578125, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (209, N'10-34-0', 57, 0.2413, 126.56999969482422, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (210, N'11-53-0 Dry', 57, 0.2417, 132.27000427246094, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (211, N'Exp U7', 57, 0.2427, 129.52999877929688, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (212, N'no fertilizer', 57, 0.2413, 132.02999877929688, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (213, N'Exp M2', 58, 0.223, 173.5, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (214, N'OEC 9-18-9', 58, 0.223, 171.30000305175781, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (215, N'OEC 6-24-6', 58, 0.224, 161.19999694824219, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (216, N'no fertilizer', 58, 0.226, 160.89999389648438, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (217, N'10-34-0', 58, 0.224, 160.30000305175781, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (218, N'OEC 6-24-6', 59, 0.267, 111.30000305175781, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (219, N'10-34-0', 59, 0.277, 109.19999694824219, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (220, N'no fertilizer', 59, 0.268, 105.69999694824219, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (221, N'3-18-18', 59, 0.272, 103.90000152587891, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (222, N'OEC 6-24-6', 60, 0.203, 103.40000152587891, NULL)
GO
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (223, N'no fertilizer', 60, 0.209, 101.5, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (224, N'Exp 7', 60, 0.199, 100.90000152587891, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (225, N'10-34-0', 60, 0.199, 98.9000015258789, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (226, N'3-18-18', 60, 0.201, 91.699996948242188, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (227, N'Exp AM 2', 61, 0.286, 139.5, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (228, N'OEC 6-24-6', 61, 0.293, 134.60000610351563, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (229, N'Exp AM 1.5', 61, 0.294, 133.89999389648438, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (230, N'Exp AM 1', 61, 0.295, 132.89999389648438, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (231, N'no fertilizer', 61, 0.331, 128.60000610351563, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (232, N'Exp M2', 62, 0.262, 105, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (233, N'OEC 6-24-6', 62, 0.255, 103.09999847412109, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (234, N'11-53-0 Dry', 62, 0.273, 105.30000305175781, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (235, N'Exp M1', 62, 0.254, 103.30000305175781, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (236, N'no fertilizer', 62, 0.29, 87, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (237, N'10-34-0', 64, 0.253, 118.69999694824219, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (238, N'OEC 6-24-6', 64, 0.267, 113.5, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (239, N'Exp AM 2', 64, 0.262, 112.59999847412109, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (240, N'Exp AM 2', 64, 0.264, 111.30000305175781, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (241, N'no fertilizer', 64, 0.272, 106.40000152587891, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (243, N'11-53-0 Dry', 65, 0.305, 120.80000305175781, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (244, N'OEC 6-24-6', 65, 0.298, 119.80000305175781, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (245, N'no fertilizer', 65, 0.299, 118.40000152587891, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (246, N'Thompsons', 65, 0.305, 113.80000305175781, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (247, N'OEC 6-24-6', 66, 0.3, 125.56999969482422, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (248, N'X-1', 66, 0.3017, 127.83000183105469, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (249, N'X-2', 66, 0.2987, 122.16999816894531, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (250, N'X-3', 66, 0.3067, 125.37000274658203, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (251, N'OEC 6-24-6', 67, 0.201, 99.800003051757812, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (252, N'10-34-0', 67, 0.213, 94.300003051757812, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (253, N'11-52-0 Dry', 67, 0.215, 92.0999984741211, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (254, N'no fertilizer', 67, 0.215, 84.4000015258789, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (255, N'OEC 6-24-6', 68, 0.2497, 143.42999267578125, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (256, N'Launcher (Cargil)', 68, 0.2487, 139.5, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (257, N'Mini-Map', 68, 0.2507, 133.6300048828125, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (258, N'Ex U7', 68, 0.254, 131.30000305175781, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (259, N'no fertilizer', 68, 0.2487, 141.47000122070313, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (260, N'OEC 6-24-6', 71, 0.246, 112.69999694824219, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (261, N'11-53-0 Dry', 71, 0.245, 112.19999694824219, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (262, N'10-34-0', 71, 0.247, 109, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (263, N'Mini-Map', 71, 0.257, 108.19999694824219, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (264, N'no fertilizer', 71, 0.247, 108.19999694824219, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (265, N'OEC 6-24-6', 72, 0.321, NULL, 1288)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (266, N'X-1', 72, 0.308, NULL, 1293)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (267, N'X-2', 72, 0.3183, NULL, 1307)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (268, N'X-3', 72, 0.3143, NULL, 1322)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (269, N'OEC 6-24-6', 73, 0.252, NULL, 1320)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (270, N'X-1', 73, 0.2527, NULL, 1330)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (271, N'X-2', 73, 0.2547, NULL, 1320)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (272, N'X-3', 73, 0.2527, NULL, 1320)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (273, N'Exp X3 + OEC 6-24-6', 74, 0.236, 131, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (274, N'Exp X2 + OEC 6-24-6', 74, 0.228, 128.39999389648438, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (275, N'Exp X1 + OEC 6-24-6', 74, 0.234, 129.30000305175781, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (276, N'OEC 6-24-6', 74, 0.23, 129.30000305175781, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (277, N'no fertilizer', 74, 0.234, 125.80000305175781, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (278, N'Exp X3 + OEC 6-24-6', 75, 0.248, 150.10000610351563, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (279, N'Exp X2 + OEC 6-24-6', 75, 0.255, 143.39999389648438, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (280, N'Exp X1 + OEC 6-24-6', 75, 0.254, 143.39999389648438, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (281, N'OEC 6-24-6', 75, 0.257, 143, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (282, N'no fertilizer', 75, 0.257, 141.69999694824219, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (283, N'Exp X2 + OEC 6-24-6', 76, 0.276, 140.5, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (284, N'Exp X1 + OEC 6-24-6', 76, 0.273, 139.89999389648438, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (285, N'OEC 6-24-6', 76, 0.273, 139.10000610351563, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (286, N'Exp X3 + OEC 6-24-6', 76, 0.271, 139, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (287, N'OEC 6-24-6', 77, 0.271, 143, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (288, N'10-34-0', 77, 0.278, 140.69999694824219, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (289, N'Nachurs 6-24-6', 77, 0.278, 140.60000610351563, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (290, N'no fertilizer', 77, 0.283, 139.10000610351563, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (291, N'0-0-30 + OEC 6-24-6', 78, 0.223, 139.89999389648438, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (292, N'OEC 6-24-6', 78, 0.235, 135.30000305175781, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (293, N'8-0-0-8 + OEC 6-24-6', 78, 0.232, 135.19999694824219, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (294, N'11-52-0 Dry', 78, 0.235, 134.39999389648438, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (295, N'no fertilizer', 78, 0.235, 128.39999389648438, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (296, N'OEC 6-24-6', 79, 0.265, 149.80000305175781, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (297, N'11-52-0 Dry', 79, 0.286, 147.30000305175781, NULL)
INSERT [dbo].[treatment] ([treatmentId], [name], [plotId], [moisture], [yield], [weight]) VALUES (298, N'no fertilizer', 79, 0.287, 142.5, NULL)
SET IDENTITY_INSERT [dbo].[treatment] OFF
SET IDENTITY_INSERT [dbo].[treatmentFertilizer] ON 

INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (18, 10, N'OEC 6-24-6', 4.5, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (19, 11, N'OEC 6-24-6', 4.5, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (20, 11, N'11-52-0 Dry', 115, N'LB')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (22, 13, N'11-52-0 Dry', 115, N'LB')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (23, 15, N'OEC 6-24-6', 4, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (24, 16, N'8-25-3', 4, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (25, 18, N'Cangrow', 7, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (29, 19, N'10-34-0', 4, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (30, 20, N'OEC 6-24-6', 4, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (31, 21, N'11-53-0 Dry', 95, N'LB')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (35, 22, N'OEC 2-20-18', 5, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (36, 26, N'OEC 6-24-6', 5, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (39, 28, N'0-46-0', 90, N'LB')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (40, 29, N'10-34-0', 4, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (41, 30, N'11-53-0 Dry', 90, N'LB')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (42, 31, N'Cargill 6-24-6', 4, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (43, 32, N'OEC 6-24-6', 4, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (44, 32, N'zinc', 1, N'L')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (45, 33, N'OEC 6-24-6', 4, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (47, 35, N'OEC 6-24-6', 5, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (48, 36, N'11-52-0 Dry', 90, N'LB')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (49, 37, N'OEC 6-24-6', 5, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (50, 37, N'11-52-0 Dry', 90, N'LB')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (52, 39, N'11-52-0 Dry', 90, N'LB')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (53, 40, N'Cargill 6-24-6', 4, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (54, 41, N'OEC 2-20-18', 4, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (55, 42, N'10-34-0', 4, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (56, 43, N'OEC 6-24-6', 4, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (57, 44, N'All Plant', 4, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (58, 45, N'OEC 6-24-6', 4, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (60, 47, N'9-23-30', 200, N'LB')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (61, 45, N'0-0-60', 100, N'LB')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (63, 49, N'OEC 6-24-6', 5, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (64, 49, N'28-0-0', 5, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (65, 50, N'10-34-0', 0, NULL)
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (66, 51, N'OEC 6-24-6', 0, NULL)
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (67, 52, N'OEC 6-24-6', 4, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (69, 53, N'11-52-0 Dry', 90, N'LB')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (78, 60, N'11-52-0 Dry', 190, N'LB')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (79, 61, N'OEC 6-24-6', 4, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (80, 62, N'OEC 6-24-6', 4, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (81, 62, N'28% Nitrogen', 7, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (82, 63, N'10-34-0', 10, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (84, 65, N'OEC 6-24-6', 4, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (85, 65, N'28% Nitrogen', 5, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (86, 66, N'OEC 6-24-6', 4, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (87, 67, N'OEC 6-24-6', 4, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (88, 67, N'zinc', 1, N'L')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (89, 68, N'12-39-12', 188, N'LB')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (91, 70, N'OEC 2-20-18', 4, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (92, 71, N'OEC 6-24-6', 4, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (93, 71, N'zinc', 0.5, N'L')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (94, 71, N'Manganese', 0.5, N'L')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (95, 72, N'6-20-24', 140, N'LB')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (96, 72, N'Nutrite 5 Star', 0, NULL)
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (97, 73, N'OEC 6-24-6', 4, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (99, 75, N'OEC 6-24-6', 4, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (100, 76, N'11-52-0 Dry', 90, N'LB')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (102, 78, N'10-34-0', 4, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (107, 82, N'OEC 6-24-6', 4, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (108, 82, N'zinc', 1, N'L')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (109, 83, N'OEC 6-24-6', 4, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (111, 85, N'10-34-0', 4, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (113, 87, N'11-52-0 Dry', 90, N'LB')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (114, 88, N'10-34-0', 8, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (116, 89, N'10-34-0', 4, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (118, 91, N'OEC 6-24-6', 4, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (119, 92, N'11-52-0 Dry', 90, N'LB')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (120, 93, N'OEC 6-24-6', 4, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (121, 94, N'10-34-0', 4, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (122, 95, N'11-52-0 Dry', 190, N'LB')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (123, 96, N'OEC 6-24-6', 4, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (124, 97, N'OEC 6-24-6', 4, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (125, 97, N'28% Nitrogen', 7, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (126, 98, N'10-34-0', 10, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (128, 100, N'11-52-0 Dry', 190, N'LB')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (129, 101, N'10-34-0', 10, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (130, 102, N'OEC 6-24-6', 4, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (131, 103, N'OEC 6-24-6', 4, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (132, 103, N'28% Nitrogen', 7, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (135, 106, N'OEC 6-24-6', 4, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (136, 107, N'10-34-0', 4, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (137, 108, N'9-18-9 White', 4, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (138, 109, N'OEC 6-24-6', 5, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (139, 110, N'10-34-0', 5, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (140, 111, N'8-25-3', 5, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (141, 112, N'11-53-0 Dry', 90, N'LB')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (143, 113, N'18-13-13', 142, N'LB')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (144, 113, N'28% Nitrogen', 6, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (145, 114, N'OEC 6-24-6', 5, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (146, 114, N'28% Nitrogen', 6, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (148, 116, N'OEC 6-24-6', 5, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (149, 116, N'28% Nitrogen', 11, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (152, 117, N'15-15-12', 285, N'LB')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (153, 118, N'OEC 6-24-6', 5, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (154, 118, N'28% Nitrogen', 3.5, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (156, 119, N'7-22-15', 230, N'L')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (157, 119, N'Magnesium', 230, N'L')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (158, 120, N'OEC 6-24-6', 4, N'Gal')
GO
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (159, 120, N'8-25-3', 16, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (160, 121, N'8-25-3', 16, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (161, 122, N'OEC 6-24-6', 4, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (162, 122, N'28% Nitrogen', 5, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (164, 124, N'11-53-0 Dry', 170, N'LB')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (165, 125, N'11-53-0 Dry', 90, N'LB')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (166, 126, N'OEC 6-24-6', 4.5, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (167, 127, N'OEC 6-24-6', 4.5, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (168, 127, N'0-0-12', 16, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (170, 129, N'10-34-0', 3, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (172, 131, N'11-53-0 Dry', 90, N'LB')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (173, 132, N'OEC 6-24-6', 4, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (174, 133, N'OEC 6-24-6', 4, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (175, 133, N'Liqui-Cal', 3, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (176, 133, N'Thio-Sul', 1.5, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (177, 134, N'11-53-0 Dry', 140, N'LB')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (178, 135, N'OEC 6-24-6', 4, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (179, 135, N'11-53-0 Dry', 140, N'LB')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (180, 136, N'OEC 6-24-6', 4, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (184, 139, N'OEC 6-24-6', 5, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (185, 140, N'11-53-0 Dry', 90, N'LB')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (186, 141, N'OEC 6-24-6', 4, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (187, 142, N'OEC 6-24-6', 4, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (188, 142, N'28% Nitrogen', 5, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (189, 143, N'10-34-0', 4, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (190, 144, N'11-53-0 Dry', 175, N'LB')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (191, 145, N'10-34-0', 12, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (192, 146, N'OEC 6-24-6', 4, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (194, 148, N'11-53-0 Dry', 90, N'LB')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (195, 149, N'10-34-0', 4, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (196, 150, N'OEC 6-24-6', 4.5, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (197, 151, N'OEC 6-24-6', 4.5, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (199, 151, N'11-0-7', 15, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (200, 152, N'10-34-0', 4.5, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (201, 153, N'11-53-0 Dry', 90, N'LB')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (203, 155, N'OEC 6-24-6', 4, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (204, 155, N'28% Nitrogen', 5, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (205, 156, N'11-53-0 Dry', 170, N'LB')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (206, 157, N'OEC 6-24-6', 4, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (207, 157, N'8-25-3', 16, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (208, 158, N'8-25-3', 16, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (210, 160, N'11-53-0 Dry', 90, N'LB')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (211, 161, N'OEC 6-24-6', 4, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (213, 163, N'10-34-0', 4, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (214, 164, N'OEC 6-24-6', 4.5, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (215, 164, N'28% Nitrogen', 8, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (216, 164, N'0-0-12', 8, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (217, 165, N'10-34-0', 3, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (218, 165, N'28% Nitrogen', 8, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (219, 166, N'28% Nitrogen', 8, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (220, 167, N'OEC 6-24-6', 4.5, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (221, 167, N'28% Nitrogen', 8, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (222, 168, N'OEC 6-24-6', 4, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (223, 168, N'28% Nitrogen', 5, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (224, 169, N'8-25-3', 16, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (225, 170, N'11-53-0 Dry', 170, N'LB')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (226, 171, N'OEC 6-24-6', 4, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (227, 171, N'8-25-3', 16, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (229, 173, N'OEC 6-24-6', 4, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (230, 173, N'11-53-0 Dry', 90, N'LB')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (231, 174, N'OEC 6-24-6', 4, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (232, 175, N'11-53-0 Dry', 90, N'LB')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (234, 177, N'10-34-0', 4, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (235, 178, N'OEC 6-24-6', 4.5, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (236, 179, N'11-53-0 Dry', 30, N'LB')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (238, 181, N'10-34-0', 3, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (239, 182, N'OEC 6-24-6', 4, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (240, 182, N'4-20-28', 115, N'LB')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (241, 183, N'OEC 6-24-6', 4, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (242, 183, N'0-0-60', 90, N'LB')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (246, 184, N'0-0-60', 90, N'LB')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (247, 185, N'0-0-60', 90, N'LB')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (248, 185, N'OEC 6-24-6', 4, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (249, 186, N'0-0-60', 90, N'LB')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (250, 187, N'OEC 6-24-6', 4, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (251, 187, N'4-20-28', 115, N'LB')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (252, 188, N'OEC 6-24-6', 5, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (253, 188, N'Micros (Zn+Mn+Mg)', 0, NULL)
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (255, 190, N'10-37-6', 100, N'LB')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (256, 190, N'Micros (Zn+Mn+Mg)', 0, NULL)
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (257, 191, N'OEC 6-24-6', 4.5, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (262, 193, N'3-18-18', 4.5, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (263, 194, N'Exp HQ', 0, NULL)
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (265, 196, N'OEC 6-24-6', 4, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (266, 197, N'Exp M1', 0, NULL)
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (267, 198, N'Exp U7', 0, NULL)
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (268, 199, N'Exp M2', 0, NULL)
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (270, 201, N'OEC 6-24-6', 5, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (273, 202, N'3-15-3', 140, N'LB')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (275, 204, N'OEC 6-24-6', 4.5, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (276, 205, N'OEC 6-24-6', 4.5, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (279, 205, N'zinc', 1, N'L')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (280, 206, N'3-18-18', 4.5, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (282, 208, N'OEC 6-24-6', 4, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (283, 209, N'10-34-0', 0, NULL)
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (284, 210, N'11-53-0 Dry', 0, NULL)
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (285, 211, N'Exp U7', 0, NULL)
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (287, 213, N'Exp M2', 0, NULL)
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (288, 214, N'OEC 9-18-9', 5, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (289, 215, N'OEC 6-24-6', 5, N'Gal')
GO
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (291, 217, N'10-34-0', 5, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (292, 218, N'OEC 6-24-6', 4.5, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (293, 219, N'10-34-0', 4.5, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (295, 221, N'3-18-18', 4.5, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (296, 222, N'OEC 6-24-6', 5, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (298, 224, N'Exp 7', 0, NULL)
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (299, 225, N'10-34-0', 5, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (300, 226, N'3-18-18', 5, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (302, 227, N'Exp AM 2', 0, NULL)
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (303, 228, N'OEC 6-24-6', 5, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (304, 229, N'Exp AM 1.5', 0, NULL)
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (305, 230, N'Exp AM 1', 0, NULL)
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (307, 232, N'Exp M2', 0, NULL)
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (308, 233, N'OEC 6-24-6', 4.5, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (309, 234, N'11-53-0 Dry', 90, N'LB')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (310, 235, N'Exp M1', 0, NULL)
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (312, 237, N'10-34-0', 8, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (313, 238, N'OEC 6-24-6', 5, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (314, 239, N'Exp AM 2', 0, NULL)
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (315, 240, N'Exp AM 2', 0, NULL)
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (317, 243, N'11-53-0 Dry', 90, N'LB')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (318, 244, N'OEC 6-24-6', 5, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (320, 246, N'Thompsons', 5, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (321, 247, N'OEC 6-24-6', 0, NULL)
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (322, 248, N'X-1', 0, NULL)
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (323, 249, N'X-2', 0, NULL)
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (324, 250, N'X-3', 0, NULL)
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (325, 251, N'OEC 6-24-6', 4, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (327, 252, N'10-34-0', 4, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (328, 253, N'11-52-0 Dry', 113, N'LB')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (331, 255, N'OEC 6-24-6', 5, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (332, 256, N'Launcher (Cargil)', 5, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (333, 257, N'Mini-Map', 26, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (334, 258, N'Ex U7', 0, NULL)
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (336, 260, N'OEC 6-24-6', 4.5, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (337, 261, N'11-53-0 Dry', 95, N'LB')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (338, 262, N'10-34-0', 3.5, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (339, 263, N'Mini-Map', 26, N'LB')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (341, 265, N'OEC 6-24-6', 0, NULL)
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (342, 266, N'X-1', 0, NULL)
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (343, 267, N'X-2', 0, NULL)
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (344, 268, N'X-3', 0, NULL)
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (345, 269, N'OEC 6-24-6', 0, NULL)
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (346, 270, N'X-1', 0, NULL)
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (347, 271, N'X-2', 0, NULL)
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (348, 272, N'X-3', 0, NULL)
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (349, 273, N'OEC 6-24-6', 4.5, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (350, 273, N'Exp X3', 0, NULL)
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (351, 274, N'OEC 6-24-6', 4.5, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (352, 274, N'Exp X2', 0, NULL)
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (353, 275, N'OEC 6-24-6', 4.5, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (354, 275, N'Exp X1', 0, NULL)
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (355, 276, N'OEC 6-24-6', 4.5, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (357, 278, N'OEC 6-24-6', 4.5, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (358, 278, N'Exp X3', 0, NULL)
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (359, 279, N'OEC 6-24-6', 4.5, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (360, 279, N'Exp X2', 0, NULL)
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (361, 280, N'OEC 6-24-6', 4.5, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (362, 280, N'Exp X1', 0, NULL)
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (363, 281, N'OEC 6-24-6', 4.5, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (365, 283, N'OEC 6-24-6', 4.5, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (366, 283, N'Exp X2', 0, NULL)
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (367, 284, N'OEC 6-24-6', 4.5, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (368, 284, N'Exp X1', 0, NULL)
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (369, 285, N'OEC 6-24-6', 4.5, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (370, 286, N'OEC 6-24-6', 4.5, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (371, 286, N'Exp X3', 0, NULL)
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (372, 287, N'OEC 6-24-6', 4.5, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (373, 288, N'10-34-0', 4.5, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (375, 289, N'Nachurs 6-24-6', 4.5, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (377, 291, N'OEC 6-24-6', 4.5, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (378, 291, N'0-0-30', 4, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (379, 292, N'OEC 6-24-6', 4.5, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (380, 293, N'OEC 6-24-6', 4.5, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (381, 293, N'8-0-0-8', 3, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (382, 294, N'11-52-0 Dry', 90, N'LB')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (384, 296, N'OEC 6-24-6', 4.5, N'Gal')
INSERT [dbo].[treatmentFertilizer] ([treatmentFertilizerId], [treatmentId], [fertilizerName], [ratePerAcre], [rateMetric]) VALUES (385, 297, N'11-52-0 Dry', 142, N'LB')
SET IDENTITY_INSERT [dbo].[treatmentFertilizer] OFF
SET IDENTITY_INSERT [dbo].[variety] ON 

INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (1, 3, NULL)
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (2, 3, N'Pioneer 97M70')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (3, 3, N'OAC Shine')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (4, 3, N'Marathon')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (5, 3, N'NK S20-20')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (6, 3, N'KG 60')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (7, 3, N'AP 1347')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (8, 3, N'Firstline Bravor')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (9, 3, N'Asgrow')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (10, 3, N'Harounton')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (11, 3, N'Pioneer')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (12, 3, N'Pioneer 9202')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (13, 3, N'Bin Run')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (14, 3, N'AC Bravor')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (15, 3, N'NK 1990')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (16, 3, N'Secord')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (17, 3, N'41')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (18, 3, N'Renk R52394')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (19, 3, N'Asgrow 1662')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (20, 3, N'NK 5066')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (21, 3, N'Advantage DB1926')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (22, 3, N'Pioneer 9132')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (23, 3, N'Korada')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (24, 3, N'First Line Brant')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (25, 3, N'Bayfield')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (26, 3, N'Elgin 87')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (27, 3, N'Common')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (29, 3, N'NK 500-66')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (30, 3, N'Exeter')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (31, 3, N'KG 41')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (32, 3, N'Kenwood')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (33, 3, N'Corruna')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (34, 3, N'Pioneer 90B31')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (35, 3, N'Pioneer 9061')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (36, 3, N'Atwoods')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (37, 3, N'Hyland Enterprize')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (38, 3, N'92B46 Seed Beans')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (39, 3, N'Pride PS 50')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (40, 3, N'Bobcats')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (41, 3, N'S08-80')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (43, 3, N'Hyland Crystal')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (44, 3, N'Pioneer 9163')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (45, 3, N'Pioneer 92B61')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (46, 3, N'NK S23-03')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (47, 3, N'First Line')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (48, 3, N'Hyland Renwick')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (49, 3, N'Pioneer 90B44')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (50, 3, N'Pioneer 3905')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (51, 3, N'NK 823-03')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (52, 3, N'NK 20F8')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (53, 3, N'Pioneer 91B31')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (54, 3, N'Pioneer 91B33')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (55, 3, N'Hyland Chatham')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (56, 3, N'PS 46 RR')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (57, 3, N'Pioneer 92B38')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (58, 3, N'First Line 31-04R')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (59, 3, N'Hyland RR Razor')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (60, 3, N'CF2603RN')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (61, 3, N'Pioneer 90M60')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (62, 3, N'Pioneer 97M81')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (63, 2, N'Rebecca')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (64, 2, N'Pioneer 2737 SW')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (65, 2, N'Pioneer 2510 SR')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (66, 2, N'Karena')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (67, 2, N'Harus')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (68, 2, N'Zavitz')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (70, 2, N'Fundelea')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (71, 2, N'Acron')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (72, 2, N'A.C. Ron')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (73, 2, N'Pioneer 2737W')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (74, 2, N'Freedom')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (75, 2, N'AC-Ron')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (76, 2, N'2510')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (77, 2, N'Pioneer 2510')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (78, 2, N'Huron')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (79, 2, N'Pioneer 2540')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (80, 2, N'Pioneer (Red Soft)')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (81, 2, N'Pioneer 25W33')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (82, 2, N'Pioneer 25W60')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (83, 2, N'Hyland Wisdom')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (84, 2, N'Hyland Mendon')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (85, 2, N'Superior')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (86, 2, N'Hyland AC Morley')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (87, 2, N'Pioneer 24W60')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (88, 2, N'C & M Maxine')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (89, 2, N'Pioneer 25R26')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (90, 2, N'Pioneer 25R23')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (91, 2, N'Celtic')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (92, 2, N'Pioneer 25R49')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (93, 2, N'Pioneer R47')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (94, 2, N'Pioneer 25R47')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (95, 2, N'Vienna')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (96, 2, N'Maxine')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (97, 2, N'Harvard')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (98, 2, N'Pioneer 25R47')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (99, 2, N'Highland Emmit SRW')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (100, 2, N'Warthog')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (101, 2, N'Emmit')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (102, 1, N'Pioneer 3733')
GO
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (103, 1, N'Pioneer 3902')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (104, 1, N'Funks 4273')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (105, 1, N'Pioneer 3795')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (106, 1, N'Pioneer 3030')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (107, 1, N'Pioneer 3790')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (108, 1, N'Pioneer 3751')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (109, 1, N'Pioneer 3769')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (110, 1, N'Hyland 2262')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (111, 1, N'Pioneer 3787')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (112, 1, N'Dekalb 352')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (114, 1, N'Pioneer 3907')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (115, 1, N'Pride K127')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (116, 1, N'NK 3030')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (118, 1, N'Pioneer 3769')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (119, 1, N'Pioneer 3921')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (120, 1, N'Pioneer 3947')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (121, 1, N'Dekalb 493')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (122, 1, N'Dekalb 485')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (123, 1, N'Pioneer 3983')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (125, 1, N'Pioneer 3573')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (126, 1, N'Dekalb 343')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (127, 1, N'First Line Hades')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (128, 1, N'Pride 154')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (129, 1, N'Great Lakes')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (130, 1, N'Pioneer 3752')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (131, 1, N'Dekalb 385')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (132, 1, N'Pioneer 3893')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (133, 1, N'NK 2555')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (134, 1, N'Pioneer 3920')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (135, 1, N'Hyland 2521')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (136, 1, N'Pioneer 3936')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (137, 1, N'NK')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (138, 1, N'NK 4640')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (139, 1, N'Mycogen 2990')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (140, 1, N'Pioneer 3902')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (141, 1, N'Funks G4193')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (142, 1, N'Pioneer 3723')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (143, 1, N'Dekalb 446')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (144, 1, N'Pioneer 3905')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (145, 1, N'G4144')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (146, 1, N'Pioneer 3820')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (147, 1, N'Pioneer 3860')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (148, 1, N'Pioneer 3730')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (149, 1, N'NK 2555 BT')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (150, 1, N'Hyland 2202')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (151, 1, N'Great Lakes 5517')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (152, 1, N'NK 4640 BT')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (153, 1, N'Pride 196')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (154, 1, N'Pioneer 35N05')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (155, 1, N'CIBA 4285')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (156, 1, N'Novartis NK 4640 B+')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (157, 1, N'GARST 8771')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (158, 1, N'Hyland 2126')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (159, 1, N'Pioneer 37P37')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (160, 1, N'Pioneer 3515')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (161, 1, N'Dekalb 527')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (162, 1, N'NK 3030 BT')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (163, 1, N'Pride R108')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (164, 1, N'Pioneer 39F06')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (165, 1, N'Hyland 238T')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (166, 1, N'Pioneer 38W36')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (167, 1, N'Delilah 527')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (168, 1, N'NK Max 86')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (169, 1, N'Pioneer 37R71')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (170, 1, N'Dekalb 355')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (171, 1, N'Pioneer 36R11')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (172, 1, N'Pioneer 37R71')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (173, 1, N'Pioneer 38P05')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (174, 1, N'NK 88')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (175, 1, N'Pioneer 3904')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (176, 1, N'Hyland 2160')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (177, 1, N'Pioneer 3941')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (178, 1, N'Pioneer 39A64')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (179, 1, N'Pioneer 37B99')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (180, 1, N'Micogen 2395')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (181, 1, N'Hyland 2333')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (182, 1, N'Pioneer 38P06')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (183, 1, N'NK2555BT')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (184, 1, N'Pioneer 37R31')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (185, 1, N'Pioneer 36B08')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (186, 1, N'Pioneer 3941')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (187, 1, N'NK N45 A6')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (188, 1, N'Pickseed 2776BT')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (189, 1, N'Pride K378BT')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (190, 1, N'Mycogen 2652')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (191, 1, N'Dekalb')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (192, 1, N'Pioneer 38K06')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (193, 1, N'Pioneer 39P06')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (194, 1, N'Pioneer 37H27')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (195, 1, N'Pioneer 34H98')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (196, 1, N'Pioneer R71')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (197, 1, N'Pioneer P39K40')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (198, 1, N'N35 B8')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (199, 1, N'Garst 8464IT')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (200, 1, N'NX 3251 NK')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (201, 1, N'HL2260')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (202, 1, N'Pioneer 38A25')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (203, 1, N'Pioneer 39K41')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (204, 1, N'Hyland HLB282')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (205, 1, N'Poncho 250')
GO
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (206, 1, N'Hyland 2288')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (207, 1, N'AgVenture AV782')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (208, 1, N'NK NX2932NR')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (209, 1, N'Pioneer 38P04')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (210, 1, N'Pioneer 38A25')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (211, 1, N'Pioneer 38B85')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (213, 1, N'Fekete''s Dry Mix')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (214, 1, N'Pioneer 37R71-N004')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (215, 1, N'Mycogen 2P682')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (216, 1, N'Hyland HLR228')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (217, 1, N'DKC3308')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (218, 1, N'Hyland B64')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (219, 1, N'Hyland HLB33R')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (220, 1, N'DKC 37-08')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (221, 1, N'NK1029A2')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (222, 1, N'NK N25T5')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (223, 1, N'Pioneer 38N87')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (224, 1, N'Pioneer 37Y12')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (225, 1, N'Mycogen 2P174')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (226, 1, N'Pioneer 38M59')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (227, 1, N'Elite 20T16')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (228, 1, N'Pioneer 37F75')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (229, 1, N'Pioneer 37Y13')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (230, 1, N'Dekalb 26-79')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (231, 1, N'Mycogen 2P174')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (232, 4, N'WW1432')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (234, 6, N'Harrington')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (235, 4, N'Invigor 2663')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (236, 5, N'Grand')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (237, 9, N'Kyle')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (238, 9, N'Avonlea')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (239, 6, N'Copeland')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (240, 1, N'3733')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (241, 1, N'3902')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (242, 1, N'3795')
INSERT [dbo].[variety] ([varietyId], [cropId], [name]) VALUES (243, 1, N'3030')
SET IDENTITY_INSERT [dbo].[variety] OFF
/****** Object:  Index [aaaaacrop_PK]    Script Date: 2017-08-27 7:39:01 PM ******/
ALTER TABLE [dbo].[crop] ADD  CONSTRAINT [aaaaacrop_PK] PRIMARY KEY NONCLUSTERED 
(
	[cropId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [aaaaalocation_PK]    Script Date: 2017-08-27 7:39:01 PM ******/
ALTER TABLE [dbo].[farm] ADD  CONSTRAINT [aaaaalocation_PK] PRIMARY KEY NONCLUSTERED 
(
	[farmId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [province code]    Script Date: 2017-08-27 7:39:01 PM ******/
CREATE NONCLUSTERED INDEX [province code] ON [dbo].[farm]
(
	[provinceCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [aaaaafertilizer_PK]    Script Date: 2017-08-27 7:39:01 PM ******/
ALTER TABLE [dbo].[fertilizer] ADD  CONSTRAINT [aaaaafertilizer_PK] PRIMARY KEY NONCLUSTERED 
(
	[fertilizerName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [aaaaaplots_PK]    Script Date: 2017-08-27 7:39:01 PM ******/
ALTER TABLE [dbo].[plot] ADD  CONSTRAINT [aaaaaplots_PK] PRIMARY KEY NONCLUSTERED 
(
	[plotId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [{96B5DE9C-F24A-4463-AA8B-D336A2772DB2}]    Script Date: 2017-08-27 7:39:01 PM ******/
CREATE NONCLUSTERED INDEX [{96B5DE9C-F24A-4463-AA8B-D336A2772DB2}] ON [dbo].[plot]
(
	[farmId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [{A964DC02-5DBA-48C0-B1D3-8CA681DFF412}]    Script Date: 2017-08-27 7:39:01 PM ******/
CREATE NONCLUSTERED INDEX [{A964DC02-5DBA-48C0-B1D3-8CA681DFF412}] ON [dbo].[plot]
(
	[varietyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [cropID]    Script Date: 2017-08-27 7:39:01 PM ******/
CREATE NONCLUSTERED INDEX [cropID] ON [dbo].[plot]
(
	[varietyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [locationID]    Script Date: 2017-08-27 7:39:01 PM ******/
CREATE NONCLUSTERED INDEX [locationID] ON [dbo].[plot]
(
	[farmId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [aaaaacropVariety_PK]    Script Date: 2017-08-27 7:39:01 PM ******/
ALTER TABLE [dbo].[variety] ADD  CONSTRAINT [aaaaacropVariety_PK] PRIMARY KEY NONCLUSTERED 
(
	[varietyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [{448EF18D-D54D-4BBC-AFC1-B6A5C8651EC5}]    Script Date: 2017-08-27 7:39:01 PM ******/
CREATE NONCLUSTERED INDEX [{448EF18D-D54D-4BBC-AFC1-B6A5C8651EC5}] ON [dbo].[variety]
(
	[cropId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [cropID]    Script Date: 2017-08-27 7:39:01 PM ******/
CREATE NONCLUSTERED INDEX [cropID] ON [dbo].[variety]
(
	[cropId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[farm]  WITH CHECK ADD  CONSTRAINT [FK_farm_province] FOREIGN KEY([provinceCode])
REFERENCES [dbo].[province] ([provinceCode])
GO
ALTER TABLE [dbo].[farm] CHECK CONSTRAINT [FK_farm_province]
GO
ALTER TABLE [dbo].[plot]  WITH CHECK ADD  CONSTRAINT [plots_FK00] FOREIGN KEY([farmId])
REFERENCES [dbo].[farm] ([farmId])
GO
ALTER TABLE [dbo].[plot] CHECK CONSTRAINT [plots_FK00]
GO
ALTER TABLE [dbo].[plot]  WITH CHECK ADD  CONSTRAINT [plots_FK01] FOREIGN KEY([varietyId])
REFERENCES [dbo].[variety] ([varietyId])
GO
ALTER TABLE [dbo].[plot] CHECK CONSTRAINT [plots_FK01]
GO
ALTER TABLE [dbo].[province]  WITH CHECK ADD  CONSTRAINT [FK_province_country] FOREIGN KEY([countryCode])
REFERENCES [dbo].[country] ([countryCode])
GO
ALTER TABLE [dbo].[province] CHECK CONSTRAINT [FK_province_country]
GO
ALTER TABLE [dbo].[treatment]  WITH CHECK ADD  CONSTRAINT [FK_treatment_plot] FOREIGN KEY([plotId])
REFERENCES [dbo].[plot] ([plotId])
GO
ALTER TABLE [dbo].[treatment] CHECK CONSTRAINT [FK_treatment_plot]
GO
ALTER TABLE [dbo].[treatmentFertilizer]  WITH CHECK ADD  CONSTRAINT [FK_treatmentFertilizer_fertilizer] FOREIGN KEY([fertilizerName])
REFERENCES [dbo].[fertilizer] ([fertilizerName])
GO
ALTER TABLE [dbo].[treatmentFertilizer] CHECK CONSTRAINT [FK_treatmentFertilizer_fertilizer]
GO
ALTER TABLE [dbo].[treatmentFertilizer]  WITH CHECK ADD  CONSTRAINT [FK_treatmentFertilizer_treatment] FOREIGN KEY([treatmentId])
REFERENCES [dbo].[treatment] ([treatmentId])
GO
ALTER TABLE [dbo].[treatmentFertilizer] CHECK CONSTRAINT [FK_treatmentFertilizer_treatment]
GO
ALTER TABLE [dbo].[variety]  WITH CHECK ADD  CONSTRAINT [cropVariety_FK00] FOREIGN KEY([cropId])
REFERENCES [dbo].[crop] ([cropId])
GO
ALTER TABLE [dbo].[variety] CHECK CONSTRAINT [cropVariety_FK00]
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'crop', @level2type=N'COLUMN',@level2name=N'cropId'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'crop', @level2type=N'COLUMN',@level2name=N'cropId'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'crop', @level2type=N'COLUMN',@level2name=N'cropId'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'17' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'crop', @level2type=N'COLUMN',@level2name=N'cropId'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'crop', @level2type=N'COLUMN',@level2name=N'cropId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'crop', @level2type=N'COLUMN',@level2name=N'cropId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'crop', @level2type=N'COLUMN',@level2name=N'cropId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'crop', @level2type=N'COLUMN',@level2name=N'cropId'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'crop', @level2type=N'COLUMN',@level2name=N'cropId'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'????????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'crop', @level2type=N'COLUMN',@level2name=N'cropId'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'cropID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'crop', @level2type=N'COLUMN',@level2name=N'cropId'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'crop', @level2type=N'COLUMN',@level2name=N'cropId'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'crop', @level2type=N'COLUMN',@level2name=N'cropId'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'crop', @level2type=N'COLUMN',@level2name=N'cropId'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'cropID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'crop', @level2type=N'COLUMN',@level2name=N'cropId'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'crop' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'crop', @level2type=N'COLUMN',@level2name=N'cropId'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'crop', @level2type=N'COLUMN',@level2name=N'cropId'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'crop', @level2type=N'COLUMN',@level2name=N'cropId'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'crop', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'crop', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'crop', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'crop', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'crop', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'crop', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'crop', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'crop', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'crop', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'????????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'crop', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'generic crop planted' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'crop', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'crop', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'crop', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'crop', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'cropName' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'crop', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'crop', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'crop', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'crop', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'cropName' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'crop', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'crop' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'crop', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'crop', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'crop', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'crop', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'crop', @level2type=N'COLUMN',@level2name=N'image'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'crop', @level2type=N'COLUMN',@level2name=N'image'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'crop', @level2type=N'COLUMN',@level2name=N'image'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'crop', @level2type=N'COLUMN',@level2name=N'image'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'crop', @level2type=N'COLUMN',@level2name=N'image'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'crop', @level2type=N'COLUMN',@level2name=N'image'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'crop', @level2type=N'COLUMN',@level2name=N'image'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'crop', @level2type=N'COLUMN',@level2name=N'image'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'crop', @level2type=N'COLUMN',@level2name=N'image'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'????????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'crop', @level2type=N'COLUMN',@level2name=N'image'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'picture file-name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'crop', @level2type=N'COLUMN',@level2name=N'image'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'crop', @level2type=N'COLUMN',@level2name=N'image'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'crop', @level2type=N'COLUMN',@level2name=N'image'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'crop', @level2type=N'COLUMN',@level2name=N'image'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'image' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'crop', @level2type=N'COLUMN',@level2name=N'image'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'crop', @level2type=N'COLUMN',@level2name=N'image'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'crop', @level2type=N'COLUMN',@level2name=N'image'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'30' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'crop', @level2type=N'COLUMN',@level2name=N'image'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'image' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'crop', @level2type=N'COLUMN',@level2name=N'image'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'crop' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'crop', @level2type=N'COLUMN',@level2name=N'image'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'crop', @level2type=N'COLUMN',@level2name=N'image'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'crop', @level2type=N'COLUMN',@level2name=N'image'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'crop', @level2type=N'COLUMN',@level2name=N'image'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'crop'
GO
EXEC sys.sp_addextendedproperty @name=N'DateCreated', @value=N'04/05/2009 8:31:26 AM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'crop'
GO
EXEC sys.sp_addextendedproperty @name=N'DisplayViewsOnSharePointSite', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'crop'
GO
EXEC sys.sp_addextendedproperty @name=N'FilterOnLoad', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'crop'
GO
EXEC sys.sp_addextendedproperty @name=N'HideNewField', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'crop'
GO
EXEC sys.sp_addextendedproperty @name=N'LastUpdated', @value=N'23/08/2009 4:41:42 PM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'crop'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'crop'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'crop'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'crop'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'crop' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'crop'
GO
EXEC sys.sp_addextendedproperty @name=N'OrderByOnLoad', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'crop'
GO
EXEC sys.sp_addextendedproperty @name=N'RecordCount', @value=N'8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'crop'
GO
EXEC sys.sp_addextendedproperty @name=N'TotalsRow', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'crop'
GO
EXEC sys.sp_addextendedproperty @name=N'Updatable', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'crop'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'farmId'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'farmId'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'farmId'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'17' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'farmId'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'farmId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'farmId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'farmId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'510' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'farmId'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'farmId'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'????????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'farmId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'unique for particular farm or location' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'farmId'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'locationID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'farmId'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'farmId'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'farmId'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'farmId'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'locationID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'farmId'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'location' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'farmId'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'farmId'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'farmId'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'2220' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'????????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'name of farm' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'locationName' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'locationName' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'location' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'town'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'town'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'town'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'town'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'town'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'town'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'town'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'1620' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'town'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'town'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'????????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'town'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'nearest town' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'town'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'town'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'town'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'town'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'town' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'town'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'town'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'town'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'town'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'town' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'town'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'location' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'town'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'town'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'town'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'town'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'county'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'county'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'county'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'county'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'county'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'county'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'county'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'1215' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'county'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'county'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'????????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'county'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'county location' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'county'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'county'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'county'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'county'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'county' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'county'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'county'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'county'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'county'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'county' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'county'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'location' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'county'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'county'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'county'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'county'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'615' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'??R?????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'2 digit province/state' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'provinceCode' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'provinceCode' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'location' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm'
GO
EXEC sys.sp_addextendedproperty @name=N'DateCreated', @value=N'04/05/2009 8:31:27 AM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm'
GO
EXEC sys.sp_addextendedproperty @name=N'DisplayViewsOnSharePointSite', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm'
GO
EXEC sys.sp_addextendedproperty @name=N'FilterOnLoad', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm'
GO
EXEC sys.sp_addextendedproperty @name=N'HideNewField', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm'
GO
EXEC sys.sp_addextendedproperty @name=N'LastUpdated', @value=N'23/08/2009 4:41:42 PM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderBy', @value=N'[location].[locationName], [location].[locationID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'location' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm'
GO
EXEC sys.sp_addextendedproperty @name=N'OrderByOnLoad', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm'
GO
EXEC sys.sp_addextendedproperty @name=N'RecordCount', @value=N'204' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm'
GO
EXEC sys.sp_addextendedproperty @name=N'TotalsRow', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm'
GO
EXEC sys.sp_addextendedproperty @name=N'Updatable', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'farm'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fertilizer', @level2type=N'COLUMN',@level2name=N'fertilizerName'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fertilizer', @level2type=N'COLUMN',@level2name=N'fertilizerName'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fertilizer', @level2type=N'COLUMN',@level2name=N'fertilizerName'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fertilizer', @level2type=N'COLUMN',@level2name=N'fertilizerName'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fertilizer', @level2type=N'COLUMN',@level2name=N'fertilizerName'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fertilizer', @level2type=N'COLUMN',@level2name=N'fertilizerName'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fertilizer', @level2type=N'COLUMN',@level2name=N'fertilizerName'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'2385' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fertilizer', @level2type=N'COLUMN',@level2name=N'fertilizerName'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fertilizer', @level2type=N'COLUMN',@level2name=N'fertilizerName'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'????????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fertilizer', @level2type=N'COLUMN',@level2name=N'fertilizerName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'name of fertilizer product - OEC 6-24-6/Potassium Acetate/N-Sure/No Starter' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fertilizer', @level2type=N'COLUMN',@level2name=N'fertilizerName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fertilizer', @level2type=N'COLUMN',@level2name=N'fertilizerName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fertilizer', @level2type=N'COLUMN',@level2name=N'fertilizerName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fertilizer', @level2type=N'COLUMN',@level2name=N'fertilizerName'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'fertilizerName' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fertilizer', @level2type=N'COLUMN',@level2name=N'fertilizerName'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fertilizer', @level2type=N'COLUMN',@level2name=N'fertilizerName'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fertilizer', @level2type=N'COLUMN',@level2name=N'fertilizerName'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fertilizer', @level2type=N'COLUMN',@level2name=N'fertilizerName'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'fertilizerName' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fertilizer', @level2type=N'COLUMN',@level2name=N'fertilizerName'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'fertilizer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fertilizer', @level2type=N'COLUMN',@level2name=N'fertilizerName'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fertilizer', @level2type=N'COLUMN',@level2name=N'fertilizerName'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fertilizer', @level2type=N'COLUMN',@level2name=N'fertilizerName'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fertilizer', @level2type=N'COLUMN',@level2name=N'fertilizerName'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fertilizer', @level2type=N'COLUMN',@level2name=N'OECProduct'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fertilizer', @level2type=N'COLUMN',@level2name=N'OECProduct'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fertilizer', @level2type=N'COLUMN',@level2name=N'OECProduct'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fertilizer', @level2type=N'COLUMN',@level2name=N'OECProduct'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fertilizer', @level2type=N'COLUMN',@level2name=N'OECProduct'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fertilizer', @level2type=N'COLUMN',@level2name=N'OECProduct'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fertilizer', @level2type=N'COLUMN',@level2name=N'OECProduct'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'750' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fertilizer', @level2type=N'COLUMN',@level2name=N'OECProduct'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fertilizer', @level2type=N'COLUMN',@level2name=N'OECProduct'
GO
EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fertilizer', @level2type=N'COLUMN',@level2name=N'OECProduct'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'??R?????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fertilizer', @level2type=N'COLUMN',@level2name=N'OECProduct'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'yes if OEC product, no otherwise' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fertilizer', @level2type=N'COLUMN',@level2name=N'OECProduct'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'106' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fertilizer', @level2type=N'COLUMN',@level2name=N'OECProduct'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'Yes/No' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fertilizer', @level2type=N'COLUMN',@level2name=N'OECProduct'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'OECProduct' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fertilizer', @level2type=N'COLUMN',@level2name=N'OECProduct'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fertilizer', @level2type=N'COLUMN',@level2name=N'OECProduct'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fertilizer', @level2type=N'COLUMN',@level2name=N'OECProduct'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fertilizer', @level2type=N'COLUMN',@level2name=N'OECProduct'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'OECProduct' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fertilizer', @level2type=N'COLUMN',@level2name=N'OECProduct'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'fertilizer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fertilizer', @level2type=N'COLUMN',@level2name=N'OECProduct'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fertilizer', @level2type=N'COLUMN',@level2name=N'OECProduct'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fertilizer', @level2type=N'COLUMN',@level2name=N'OECProduct'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fertilizer', @level2type=N'COLUMN',@level2name=N'liquid'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fertilizer', @level2type=N'COLUMN',@level2name=N'liquid'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fertilizer', @level2type=N'COLUMN',@level2name=N'liquid'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fertilizer', @level2type=N'COLUMN',@level2name=N'liquid'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fertilizer', @level2type=N'COLUMN',@level2name=N'liquid'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fertilizer', @level2type=N'COLUMN',@level2name=N'liquid'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fertilizer', @level2type=N'COLUMN',@level2name=N'liquid'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fertilizer', @level2type=N'COLUMN',@level2name=N'liquid'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fertilizer', @level2type=N'COLUMN',@level2name=N'liquid'
GO
EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fertilizer', @level2type=N'COLUMN',@level2name=N'liquid'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'????????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fertilizer', @level2type=N'COLUMN',@level2name=N'liquid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'yes if liquid, no if dry/other' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fertilizer', @level2type=N'COLUMN',@level2name=N'liquid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'106' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fertilizer', @level2type=N'COLUMN',@level2name=N'liquid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'Yes/No' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fertilizer', @level2type=N'COLUMN',@level2name=N'liquid'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'liquid' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fertilizer', @level2type=N'COLUMN',@level2name=N'liquid'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fertilizer', @level2type=N'COLUMN',@level2name=N'liquid'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fertilizer', @level2type=N'COLUMN',@level2name=N'liquid'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fertilizer', @level2type=N'COLUMN',@level2name=N'liquid'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'liquid' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fertilizer', @level2type=N'COLUMN',@level2name=N'liquid'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'fertilizer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fertilizer', @level2type=N'COLUMN',@level2name=N'liquid'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fertilizer', @level2type=N'COLUMN',@level2name=N'liquid'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fertilizer', @level2type=N'COLUMN',@level2name=N'liquid'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fertilizer'
GO
EXEC sys.sp_addextendedproperty @name=N'DateCreated', @value=N'04/05/2009 8:31:27 AM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fertilizer'
GO
EXEC sys.sp_addextendedproperty @name=N'DisplayViewsOnSharePointSite', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fertilizer'
GO
EXEC sys.sp_addextendedproperty @name=N'FilterOnLoad', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fertilizer'
GO
EXEC sys.sp_addextendedproperty @name=N'HideNewField', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fertilizer'
GO
EXEC sys.sp_addextendedproperty @name=N'LastUpdated', @value=N'23/08/2009 4:41:42 PM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fertilizer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fertilizer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderBy', @value=N'[fertilizer].[fertilizerName]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fertilizer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fertilizer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fertilizer'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'fertilizer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fertilizer'
GO
EXEC sys.sp_addextendedproperty @name=N'OrderByOnLoad', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fertilizer'
GO
EXEC sys.sp_addextendedproperty @name=N'RecordCount', @value=N'172' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fertilizer'
GO
EXEC sys.sp_addextendedproperty @name=N'TotalsRow', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fertilizer'
GO
EXEC sys.sp_addextendedproperty @name=N'Updatable', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fertilizer'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'plotId'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'plotId'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'plotId'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'17' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'plotId'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'plotId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'plotId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'plotId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'plotId'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'plotId'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'????????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'plotId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'sequential key identifying a plot w/multiple treatments' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'plotId'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'plotID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'plotId'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'plotId'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'plotId'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'plotId'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'plotID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'plotId'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'plots' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'plotId'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'plotId'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'plotId'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'farmId'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowMultipleValues', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'farmId'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowValueListEdits', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'farmId'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'farmId'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'farmId'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'farmId'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'farmId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'farmId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'farmId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'2190' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'farmId'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'farmId'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'????????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'farmId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_BoundColumn', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'farmId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnCount', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'farmId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHeads', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'farmId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidths', @value=N'0;1440' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'farmId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'farmId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'link to LOCATION table' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'farmId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'farmId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_LimitToList', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'farmId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ListRows', @value=N'16' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'farmId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ListWidth', @value=N'0twip' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'farmId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_RowSource', @value=N'SELECT location.locationID, location.locationName
FROM location
ORDER BY location.locationName' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'farmId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_RowSourceType', @value=N'Table/View/StoredProc' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'farmId'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'locationID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'farmId'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'farmId'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'farmId'
GO
EXEC sys.sp_addextendedproperty @name=N'ShowOnlyRowSourceValues', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'farmId'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'farmId'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'locationID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'farmId'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'plots' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'farmId'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'farmId'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'farmId'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'varietyId'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowMultipleValues', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'varietyId'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowValueListEdits', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'varietyId'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'varietyId'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'varietyId'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'varietyId'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'varietyId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'varietyId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'varietyId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'3030' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'varietyId'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'varietyId'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'????????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'varietyId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_BoundColumn', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'varietyId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnCount', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'varietyId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHeads', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'varietyId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidths', @value=N'2880;0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'varietyId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'varietyId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'planted variety of crop' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'varietyId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'111' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'varietyId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_LimitToList', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'varietyId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ListRows', @value=N'16' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'varietyId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ListWidth', @value=N'0twip' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'varietyId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_RowSource', @value=N'cropAndVariety' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'varietyId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_RowSourceType', @value=N'Table/View/StoredProc' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'varietyId'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'cropVarietyID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'varietyId'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'varietyId'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'varietyId'
GO
EXEC sys.sp_addextendedproperty @name=N'ShowOnlyRowSourceValues', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'varietyId'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'varietyId'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'cropVarietyID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'varietyId'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'plots' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'varietyId'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'varietyId'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'varietyId'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'datePlanted'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'datePlanted'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'datePlanted'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'datePlanted'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'datePlanted'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'datePlanted'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'datePlanted'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'datePlanted'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'datePlanted'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'????????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'datePlanted'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'date crop was planted' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'datePlanted'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'Medium Date' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'datePlanted'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'datePlanted'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'datePlanted'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'datePlanted' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'datePlanted'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'datePlanted'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'datePlanted'
GO
EXEC sys.sp_addextendedproperty @name=N'ShowDatePicker', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'datePlanted'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'datePlanted'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'datePlanted' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'datePlanted'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'plots' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'datePlanted'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'datePlanted'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'datePlanted'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'dateHarvested'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'dateHarvested'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'dateHarvested'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'dateHarvested'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'dateHarvested'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'dateHarvested'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'dateHarvested'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'dateHarvested'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'dateHarvested'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'????????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'dateHarvested'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'date crop was harvested' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'dateHarvested'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'dateHarvested'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'dateHarvested'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'dateHarvested' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'dateHarvested'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'dateHarvested'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'dateHarvested'
GO
EXEC sys.sp_addextendedproperty @name=N'ShowDatePicker', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'dateHarvested'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'dateHarvested'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'dateHarvested' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'dateHarvested'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'plots' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'dateHarvested'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'dateHarvested'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'dateHarvested'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'plantingRate'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'plantingRate'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'plantingRate'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'plantingRate'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'plantingRate'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'plantingRate'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'plantingRate'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'plantingRate'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'plantingRate'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'????????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'plantingRate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'plantingRate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'seeds/pounds per acre' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'plantingRate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'plantingRate'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'plantingRate' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'plantingRate'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'5' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'plantingRate'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'plantingRate'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'plantingRate'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'plantingRate' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'plantingRate'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'plots' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'plantingRate'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'plantingRate'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'plantingRate'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'plantingRateByPounds'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'plantingRateByPounds'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'plantingRateByPounds'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'plantingRateByPounds'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'plantingRateByPounds'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'plantingRateByPounds'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'plantingRateByPounds'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'plantingRateByPounds'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'plantingRateByPounds'
GO
EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'plantingRateByPounds'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'????????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'plantingRateByPounds'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'yes by pounds, no by seed count' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'plantingRateByPounds'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'106' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'plantingRateByPounds'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'Yes/No' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'plantingRateByPounds'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'plantingRateByPounds' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'plantingRateByPounds'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'6' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'plantingRateByPounds'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'plantingRateByPounds'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'plantingRateByPounds'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'plantingRateByPounds' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'plantingRateByPounds'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'plots' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'plantingRateByPounds'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'plantingRateByPounds'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'plantingRateByPounds'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'rowWidth'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'rowWidth'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'rowWidth'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'rowWidth'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'rowWidth'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'rowWidth'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'rowWidth'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'rowWidth'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'rowWidth'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'????????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'rowWidth'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'rowWidth'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'width between rows in inches' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'rowWidth'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'rowWidth'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'rowWidth' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'rowWidth'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'7' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'rowWidth'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'rowWidth'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'rowWidth'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'rowWidth' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'rowWidth'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'plots' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'rowWidth'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'rowWidth'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'rowWidth'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'patternRepeats'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'patternRepeats'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'patternRepeats'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'patternRepeats'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'patternRepeats'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'patternRepeats'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'patternRepeats'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'patternRepeats'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'patternRepeats'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'????????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'patternRepeats'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'patternRepeats'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'number of applications of fertilizer types' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'patternRepeats'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'patternRepeats'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'replication' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'patternRepeats'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'patternRepeats'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'patternRepeats'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'patternRepeats'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'replication' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'patternRepeats'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'plots' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'patternRepeats'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'patternRepeats'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'patternRepeats'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'organicMatter'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'organicMatter'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'organicMatter'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'organicMatter'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'organicMatter'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'organicMatter'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'organicMatter'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'organicMatter'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'organicMatter'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'????????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'organicMatter'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'organicMatter'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'% of organic matter in soil' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'organicMatter'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'organicMatter'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'organicMatter' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'organicMatter'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'9' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'organicMatter'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'organicMatter'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'organicMatter'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'organicMatter' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'organicMatter'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'plots' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'organicMatter'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'organicMatter'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'6' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'organicMatter'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'bicarbP'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'bicarbP'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'bicarbP'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'bicarbP'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'bicarbP'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'bicarbP'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'bicarbP'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'bicarbP'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'bicarbP'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'????????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'bicarbP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'bicarbP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ppm Bicarb (P)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'bicarbP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'bicarbP'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'bicarbP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'bicarbP'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'bicarbP'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'bicarbP'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'bicarbP'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'bicarbP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'bicarbP'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'plots' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'bicarbP'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'bicarbP'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'6' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'bicarbP'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'potassium'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'potassium'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'potassium'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'potassium'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'potassium'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'potassium'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'potassium'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'potassium'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'potassium'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'????????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'potassium'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'potassium'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ppm Potassium (K)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'potassium'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'potassium'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'potassium' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'potassium'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'11' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'potassium'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'potassium'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'potassium'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'potassium' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'potassium'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'plots' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'potassium'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'potassium'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'6' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'potassium'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'magnesium'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'magnesium'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'magnesium'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'magnesium'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'magnesium'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'magnesium'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'magnesium'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'magnesium'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'magnesium'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'????????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'magnesium'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'magnesium'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ppm Magnesium (Mg)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'magnesium'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'magnesium'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'magnesium' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'magnesium'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'12' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'magnesium'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'magnesium'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'magnesium'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'magnesium' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'magnesium'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'plots' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'magnesium'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'magnesium'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'6' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'magnesium'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'calcium'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'calcium'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'calcium'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'calcium'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'calcium'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'calcium'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'calcium'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'calcium'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'calcium'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'????????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'calcium'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'calcium'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ppm Calcium (Ca)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'calcium'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'calcium'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'calcium' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'calcium'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'13' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'calcium'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'calcium'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'calcium'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'calcium' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'calcium'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'plots' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'calcium'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'calcium'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'6' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'calcium'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'pHSoil'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'pHSoil'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'pHSoil'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'pHSoil'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'pHSoil'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'pHSoil'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'pHSoil'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'pHSoil'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'pHSoil'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'????????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'pHSoil'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'pHSoil'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'acidity of soil' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'pHSoil'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'pHSoil'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'pHSoil' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'pHSoil'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'14' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'pHSoil'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'pHSoil'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'pHSoil'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'pHSoil' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'pHSoil'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'plots' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'pHSoil'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'pHSoil'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'6' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'pHSoil'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'pHBuffer'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'pHBuffer'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'pHBuffer'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'pHBuffer'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'pHBuffer'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'pHBuffer'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'pHBuffer'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'pHBuffer'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'pHBuffer'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'????????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'pHBuffer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'pHBuffer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'buffer of soil' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'pHBuffer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'pHBuffer'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'pHBuffer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'pHBuffer'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'15' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'pHBuffer'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'pHBuffer'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'pHBuffer'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'pHBuffer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'pHBuffer'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'plots' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'pHBuffer'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'pHBuffer'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'6' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'pHBuffer'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'CEC'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'CEC'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'CEC'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'CEC'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'CEC'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'CEC'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'CEC'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'CEC'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'CEC'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'????????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'CEC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'CEC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'catIon exchange capacity lower: sand higher: clay' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'CEC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'CEC'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'CEC' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'CEC'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'16' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'CEC'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'CEC'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'CEC'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'CEC' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'CEC'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'plots' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'CEC'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'CEC'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'6' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'CEC'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'percentBaseSaturationK'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'percentBaseSaturationK'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'percentBaseSaturationK'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'percentBaseSaturationK'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'percentBaseSaturationK'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'percentBaseSaturationK'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'percentBaseSaturationK'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'percentBaseSaturationK'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'percentBaseSaturationK'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'????????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'percentBaseSaturationK'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'percentBaseSaturationK'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'% of K' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'percentBaseSaturationK'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'percentBaseSaturationK'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'percentBaseSaturationK' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'percentBaseSaturationK'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'17' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'percentBaseSaturationK'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'percentBaseSaturationK'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'percentBaseSaturationK'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'percentBaseSaturationK' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'percentBaseSaturationK'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'plots' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'percentBaseSaturationK'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'percentBaseSaturationK'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'6' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'percentBaseSaturationK'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'percentBaseSaturationMg'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'percentBaseSaturationMg'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'percentBaseSaturationMg'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'percentBaseSaturationMg'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'percentBaseSaturationMg'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'percentBaseSaturationMg'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'percentBaseSaturationMg'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'percentBaseSaturationMg'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'percentBaseSaturationMg'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'????????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'percentBaseSaturationMg'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'percentBaseSaturationMg'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'% of Mg' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'percentBaseSaturationMg'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'percentBaseSaturationMg'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'percentBaseSaturationMg' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'percentBaseSaturationMg'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'18' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'percentBaseSaturationMg'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'percentBaseSaturationMg'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'percentBaseSaturationMg'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'percentBaseSaturationMg' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'percentBaseSaturationMg'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'plots' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'percentBaseSaturationMg'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'percentBaseSaturationMg'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'6' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'percentBaseSaturationMg'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'percentBaseSaturationCa'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'percentBaseSaturationCa'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'percentBaseSaturationCa'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'percentBaseSaturationCa'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'percentBaseSaturationCa'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'percentBaseSaturationCa'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'percentBaseSaturationCa'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'percentBaseSaturationCa'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'percentBaseSaturationCa'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'????????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'percentBaseSaturationCa'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'percentBaseSaturationCa'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'% of Ca' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'percentBaseSaturationCa'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'percentBaseSaturationCa'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'percentBaseSaturationCa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'percentBaseSaturationCa'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'19' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'percentBaseSaturationCa'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'percentBaseSaturationCa'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'percentBaseSaturationCa'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'percentBaseSaturationCa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'percentBaseSaturationCa'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'plots' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'percentBaseSaturationCa'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'percentBaseSaturationCa'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'6' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'percentBaseSaturationCa'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'percentBaseSaturationH'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'percentBaseSaturationH'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'percentBaseSaturationH'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'percentBaseSaturationH'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'percentBaseSaturationH'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'percentBaseSaturationH'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'percentBaseSaturationH'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'percentBaseSaturationH'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'percentBaseSaturationH'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'????????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'percentBaseSaturationH'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'percentBaseSaturationH'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'% of Hydrogen (H) higher: more acid' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'percentBaseSaturationH'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'percentBaseSaturationH'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'percentBaseSaturationH' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'percentBaseSaturationH'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'20' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'percentBaseSaturationH'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'percentBaseSaturationH'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'percentBaseSaturationH'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'percentBaseSaturationH' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'percentBaseSaturationH'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'plots' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'percentBaseSaturationH'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'percentBaseSaturationH'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'6' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'percentBaseSaturationH'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'comments'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'comments'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'comments'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'comments'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'comments'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'comments'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'comments'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'comments'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'comments'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'????????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'comments'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'comments on plot - tillage, soil composition' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'comments'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'comments'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'comments'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'comments' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'comments'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'21' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'comments'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'comments'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'comments'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'comments' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'comments'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'plots' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'comments'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'comments'
GO
EXEC sys.sp_addextendedproperty @name=N'TextFormat', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'comments'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'12' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'comments'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'COLUMN',@level2name=N'comments'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot'
GO
EXEC sys.sp_addextendedproperty @name=N'DateCreated', @value=N'04/05/2009 8:31:27 AM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot'
GO
EXEC sys.sp_addextendedproperty @name=N'DisplayViewsOnSharePointSite', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot'
GO
EXEC sys.sp_addextendedproperty @name=N'FilterOnLoad', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot'
GO
EXEC sys.sp_addextendedproperty @name=N'HideNewField', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot'
GO
EXEC sys.sp_addextendedproperty @name=N'LastUpdated', @value=N'23/08/2009 4:41:42 PM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'plots' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot'
GO
EXEC sys.sp_addextendedproperty @name=N'OrderByOnLoad', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot'
GO
EXEC sys.sp_addextendedproperty @name=N'RecordCount', @value=N'75' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot'
GO
EXEC sys.sp_addextendedproperty @name=N'TotalsRow', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot'
GO
EXEC sys.sp_addextendedproperty @name=N'Updatable', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ConstraintText', @value=N'You cannot add, change, or delete this record because of the relationship restriction between the tables ''cropVariety'' and ''plots''.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'plot', @level2type=N'CONSTRAINT',@level2name=N'plots_FK01'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'2-byte province or state name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'full name of the state or province' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variety', @level2type=N'COLUMN',@level2name=N'varietyId'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variety', @level2type=N'COLUMN',@level2name=N'varietyId'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variety', @level2type=N'COLUMN',@level2name=N'varietyId'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'17' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variety', @level2type=N'COLUMN',@level2name=N'varietyId'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variety', @level2type=N'COLUMN',@level2name=N'varietyId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variety', @level2type=N'COLUMN',@level2name=N'varietyId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variety', @level2type=N'COLUMN',@level2name=N'varietyId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'735' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variety', @level2type=N'COLUMN',@level2name=N'varietyId'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variety', @level2type=N'COLUMN',@level2name=N'varietyId'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'????????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variety', @level2type=N'COLUMN',@level2name=N'varietyId'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'cropVarietyID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variety', @level2type=N'COLUMN',@level2name=N'varietyId'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variety', @level2type=N'COLUMN',@level2name=N'varietyId'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variety', @level2type=N'COLUMN',@level2name=N'varietyId'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variety', @level2type=N'COLUMN',@level2name=N'varietyId'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'cropVarietyID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variety', @level2type=N'COLUMN',@level2name=N'varietyId'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'cropVariety' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variety', @level2type=N'COLUMN',@level2name=N'varietyId'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variety', @level2type=N'COLUMN',@level2name=N'varietyId'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variety', @level2type=N'COLUMN',@level2name=N'varietyId'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variety', @level2type=N'COLUMN',@level2name=N'cropId'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowMultipleValues', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variety', @level2type=N'COLUMN',@level2name=N'cropId'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowValueListEdits', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variety', @level2type=N'COLUMN',@level2name=N'cropId'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variety', @level2type=N'COLUMN',@level2name=N'cropId'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variety', @level2type=N'COLUMN',@level2name=N'cropId'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variety', @level2type=N'COLUMN',@level2name=N'cropId'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variety', @level2type=N'COLUMN',@level2name=N'cropId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variety', @level2type=N'COLUMN',@level2name=N'cropId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variety', @level2type=N'COLUMN',@level2name=N'cropId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variety', @level2type=N'COLUMN',@level2name=N'cropId'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variety', @level2type=N'COLUMN',@level2name=N'cropId'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'????????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variety', @level2type=N'COLUMN',@level2name=N'cropId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_BoundColumn', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variety', @level2type=N'COLUMN',@level2name=N'cropId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnCount', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variety', @level2type=N'COLUMN',@level2name=N'cropId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHeads', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variety', @level2type=N'COLUMN',@level2name=N'cropId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidths', @value=N'0;1440' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variety', @level2type=N'COLUMN',@level2name=N'cropId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variety', @level2type=N'COLUMN',@level2name=N'cropId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'link to generic crop table' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variety', @level2type=N'COLUMN',@level2name=N'cropId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variety', @level2type=N'COLUMN',@level2name=N'cropId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_LimitToList', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variety', @level2type=N'COLUMN',@level2name=N'cropId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ListRows', @value=N'16' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variety', @level2type=N'COLUMN',@level2name=N'cropId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ListWidth', @value=N'0twip' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variety', @level2type=N'COLUMN',@level2name=N'cropId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_RowSource', @value=N'crop' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variety', @level2type=N'COLUMN',@level2name=N'cropId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_RowSourceType', @value=N'Table/View/StoredProc' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variety', @level2type=N'COLUMN',@level2name=N'cropId'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'cropID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variety', @level2type=N'COLUMN',@level2name=N'cropId'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variety', @level2type=N'COLUMN',@level2name=N'cropId'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variety', @level2type=N'COLUMN',@level2name=N'cropId'
GO
EXEC sys.sp_addextendedproperty @name=N'ShowOnlyRowSourceValues', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variety', @level2type=N'COLUMN',@level2name=N'cropId'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variety', @level2type=N'COLUMN',@level2name=N'cropId'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'cropID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variety', @level2type=N'COLUMN',@level2name=N'cropId'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'cropVariety' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variety', @level2type=N'COLUMN',@level2name=N'cropId'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variety', @level2type=N'COLUMN',@level2name=N'cropId'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variety', @level2type=N'COLUMN',@level2name=N'cropId'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variety', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variety', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variety', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variety', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variety', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variety', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variety', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'1710' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variety', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variety', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'????????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variety', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'variety name of crop planted' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variety', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variety', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variety', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variety', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'varietyName' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variety', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variety', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variety', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variety', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'varietyName' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variety', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'cropVariety' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variety', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variety', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variety', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variety', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variety'
GO
EXEC sys.sp_addextendedproperty @name=N'DateCreated', @value=N'04/05/2009 8:31:27 AM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variety'
GO
EXEC sys.sp_addextendedproperty @name=N'DisplayViewsOnSharePointSite', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variety'
GO
EXEC sys.sp_addextendedproperty @name=N'FilterOnLoad', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variety'
GO
EXEC sys.sp_addextendedproperty @name=N'HideNewField', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variety'
GO
EXEC sys.sp_addextendedproperty @name=N'LastUpdated', @value=N'23/08/2009 4:41:42 PM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variety'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variety'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variety'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variety'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'cropVariety' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variety'
GO
EXEC sys.sp_addextendedproperty @name=N'OrderByOnLoad', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variety'
GO
EXEC sys.sp_addextendedproperty @name=N'RecordCount', @value=N'236' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variety'
GO
EXEC sys.sp_addextendedproperty @name=N'TotalsRow', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variety'
GO
EXEC sys.sp_addextendedproperty @name=N'Updatable', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variety'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ConstraintText', @value=N'You cannot add, change, or delete this record because of the relationship restriction between the tables ''crop'' and ''cropVariety''.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variety', @level2type=N'CONSTRAINT',@level2name=N'cropVariety_FK00'
GO
USE [master]
GO
ALTER DATABASE [OEC] SET  READ_WRITE 
GO
