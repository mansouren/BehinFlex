USE [master]
GO
CREATE DATABASE [BehinFaraz_New]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BehinFaraz_New', FILENAME = N'C:\SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BehinFaraz_New.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BehinFaraz_New_log', FILENAME = N'C:\SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BehinFaraz_New_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BehinFaraz_New].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BehinFaraz_New] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BehinFaraz_New] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BehinFaraz_New] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BehinFaraz_New] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BehinFaraz_New] SET ARITHABORT OFF 
GO
ALTER DATABASE [BehinFaraz_New] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BehinFaraz_New] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BehinFaraz_New] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BehinFaraz_New] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BehinFaraz_New] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BehinFaraz_New] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BehinFaraz_New] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BehinFaraz_New] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BehinFaraz_New] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BehinFaraz_New] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BehinFaraz_New] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BehinFaraz_New] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BehinFaraz_New] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BehinFaraz_New] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BehinFaraz_New] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BehinFaraz_New] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BehinFaraz_New] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BehinFaraz_New] SET RECOVERY FULL 
GO
ALTER DATABASE [BehinFaraz_New] SET  MULTI_USER 
GO
ALTER DATABASE [BehinFaraz_New] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BehinFaraz_New] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BehinFaraz_New] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BehinFaraz_New] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BehinFaraz_New] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'BehinFaraz_New', N'ON'
GO
ALTER DATABASE [BehinFaraz_New] SET QUERY_STORE = OFF
GO
USE [BehinFaraz_New]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Bonuses](
	[BonusId] [int] IDENTITY(1,1) NOT NULL,
	[Bonus] [int] NOT NULL,
	[RefID] [int] NULL,
	[UserId] [int] NULL,
	[OrderId] [int] NULL,
 CONSTRAINT [PK_Bonuses] PRIMARY KEY CLUSTERED 
(
	[BonusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Comments](
	[CommentID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[CommentText] [ntext] NOT NULL,
	[IsApproved] [bit] NOT NULL,
	[CommentDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[CommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CustomerType](
	[CustomerTypeID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerTypeTitle] [nvarchar](50) NOT NULL,
	[CustomerTypeName] [varchar](50) NULL,
 CONSTRAINT [PK_CustomerType] PRIMARY KEY CLUSTERED 
(
	[CustomerTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DiscountCodes](
	[DiscountCodeID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[DiscountCodeTitle] [nvarchar](50) NOT NULL,
	[DiscountCode] [nvarchar](20) NOT NULL,
	[DiscountCodeExpireDate] [datetime] NOT NULL,
	[DiscountPercent] [int] NOT NULL,
	[DiscountMaxAmount] [int] NOT NULL,
	[DiscountCodeUsageCount] [int] NOT NULL,
 CONSTRAINT [PK_DiscountCodes] PRIMARY KEY CLUSTERED 
(
	[DiscountCodeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Discounts](
	[DiscountID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[ProductID] [int] NULL,
	[DiscountCode] [nvarchar](150) NULL,
	[DiscountPercent] [int] NOT NULL,
	[UsableCount] [int] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
 CONSTRAINT [PK_Discounts] PRIMARY KEY CLUSTERED 
(
	[DiscountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Images](
	[ImageID] [int] IDENTITY(1,1) NOT NULL,
	[ImageTitle] [nvarchar](200) NOT NULL,
	[ImageUrl] [nvarchar](200) NOT NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [PK_Images] PRIMARY KEY CLUSTERED 
(
	[ImageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [News](
	[NewsID] [int] IDENTITY(1,1) NOT NULL,
	[NewsTitle] [nvarchar](200) NOT NULL,
	[NewsDescription] [ntext] NOT NULL,
	[NewsImageUrl] [varchar](250) NULL,
	[NewsVideoUrl] [nvarchar](250) NULL,
	[CreateDate] [datetime] NOT NULL,
	[IsSeminar] [bit] NOT NULL,
 CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
(
	[NewsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [OrderDetails](
	[DetailId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[ProductCount] [int] NOT NULL,
	[ProductPrice] [int] NULL,
	[Sum] [int] NULL,
	[SumWithDiscount] [int] NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[DetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Orders](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[DiscountCodeID] [int] NULL,
	[OrderDate] [datetime] NOT NULL,
	[IsFinally] [bit] NOT NULL,
	[OrderTotalSum] [int] NULL,
	[OrderTotalSumWithDiscount] [int] NULL,
	[OrderTotalAfterDiscountCodeApply] [int] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [OrganizationChart](
	[OrgChartID] [int] IDENTITY(1,1) NOT NULL,
	[OrgChartPost] [nvarchar](100) NOT NULL,
	[OrgChartFullName] [nvarchar](100) NOT NULL,
	[OrgChartPhone] [varchar](50) NULL,
	[OrgChartEmail] [varchar](250) NULL,
	[OrgChartTelegramID] [nvarchar](50) NULL,
 CONSTRAINT [PK_OrganizationChart] PRIMARY KEY CLUSTERED 
(
	[OrgChartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ProductBrand](
	[ProductBrandID] [int] IDENTITY(1,1) NOT NULL,
	[ProductBrandTitle] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_ProductBrand] PRIMARY KEY CLUSTERED 
(
	[ProductBrandID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ProductGalleries](
	[GalleryID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NULL,
	[ImageName] [nvarchar](200) NULL,
 CONSTRAINT [PK_ProductGalleries] PRIMARY KEY CLUSTERED 
(
	[GalleryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ProductGroup](
	[ProductGroupID] [int] IDENTITY(1,1) NOT NULL,
	[ProductBrandID] [int] NOT NULL,
	[ProductGroupTitle] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_ProductGroup] PRIMARY KEY CLUSTERED 
(
	[ProductGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductSubGroupID] [int] NOT NULL,
	[ProductTitle] [nvarchar](200) NOT NULL,
	[ProductEnTitle] [nvarchar](200) NULL,
	[ProductDetails] [nvarchar](1500) NULL,
	[Size] [nvarchar](150) NULL,
	[ProductDescription] [ntext] NOT NULL,
	[ProductPrice] [int] NOT NULL,
	[ProductImageUrl] [varchar](250) NULL,
	[CreateDate] [datetime] NULL,
	[IsSpecial] [bit] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ProductSubGroup](
	[ProductSubGroupID] [int] IDENTITY(1,1) NOT NULL,
	[ProductGroupID] [int] NOT NULL,
	[ProductSubGroupTitle] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_ProductSubGroup-1] PRIMARY KEY CLUSTERED 
(
	[ProductSubGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Projects](
	[ProjectID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectTitle] [nvarchar](150) NOT NULL,
	[ProjectDescription] [ntext] NULL,
	[ProjectImageUrl] [nvarchar](200) NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Projects] PRIMARY KEY CLUSTERED 
(
	[ProjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RefCode](
	[RefID] [int] IDENTITY(1,1) NOT NULL,
	[Ref_Code] [nvarchar](50) NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_RefCode] PRIMARY KEY CLUSTERED 
(
	[RefID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Roles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](50) NULL,
	[RoleTitle] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Seminarparticipants](
	[SeminarID] [int] IDENTITY(1,1) NOT NULL,
	[NewsID] [int] NOT NULL,
	[FullName] [nvarchar](50) NULL,
	[Phone] [varchar](20) NULL,
	[Email] [varchar](250) NULL,
 CONSTRAINT [PK_Seminarparticipants] PRIMARY KEY CLUSTERED 
(
	[SeminarID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[RoleID] [int] NOT NULL,
	[CustomerTypeID] [int] NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[Email] [varchar](250) NOT NULL,
	[Phone] [varchar](20) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Videos](
	[VideoID] [int] IDENTITY(1,1) NOT NULL,
	[VideoTitle] [nvarchar](200) NOT NULL,
	[VideoUrl] [nvarchar](200) NOT NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [PK_Videos] PRIMARY KEY CLUSTERED 
(
	[VideoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Bonuses] ON 

INSERT [Bonuses] ([BonusId], [Bonus], [RefID], [UserId], [OrderId]) VALUES (1, 10, 1, 2, NULL)
INSERT [Bonuses] ([BonusId], [Bonus], [RefID], [UserId], [OrderId]) VALUES (14, 95, NULL, 2, 52)
INSERT [Bonuses] ([BonusId], [Bonus], [RefID], [UserId], [OrderId]) VALUES (15, 0, NULL, 2, 55)
INSERT [Bonuses] ([BonusId], [Bonus], [RefID], [UserId], [OrderId]) VALUES (19, 5, NULL, 2, NULL)
SET IDENTITY_INSERT [Bonuses] OFF
GO
SET IDENTITY_INSERT [Comments] ON 

INSERT [Comments] ([CommentID], [ProductID], [UserID], [CommentText], [IsApproved], [CommentDate]) VALUES (1, 1051, 2, N'این عایق بسیار عالی میباشد .', 1, CAST(N'2020-05-21T11:47:50.697' AS DateTime))
SET IDENTITY_INSERT [Comments] OFF
GO
SET IDENTITY_INSERT [CustomerType] ON 

INSERT [CustomerType] ([CustomerTypeID], [CustomerTypeTitle], [CustomerTypeName]) VALUES (1, N'طلایی', N'Gold')
INSERT [CustomerType] ([CustomerTypeID], [CustomerTypeTitle], [CustomerTypeName]) VALUES (2, N'نقره ای', N'Silver')
INSERT [CustomerType] ([CustomerTypeID], [CustomerTypeTitle], [CustomerTypeName]) VALUES (3, N'برنز', N'Bronze')
SET IDENTITY_INSERT [CustomerType] OFF
GO
SET IDENTITY_INSERT [DiscountCodes] ON 

INSERT [DiscountCodes] ([DiscountCodeID], [UserID], [DiscountCodeTitle], [DiscountCode], [DiscountCodeExpireDate], [DiscountPercent], [DiscountMaxAmount], [DiscountCodeUsageCount]) VALUES (1, 5, N'کد تخفیف تست 1', N'Alaki', CAST(N'2020-06-09T00:00:00.000' AS DateTime), 10, 1000000, 5)
SET IDENTITY_INSERT [DiscountCodes] OFF
GO
SET IDENTITY_INSERT [Discounts] ON 

INSERT [Discounts] ([DiscountID], [UserID], [ProductID], [DiscountCode], [DiscountPercent], [UsableCount], [StartDate], [EndDate]) VALUES (38, NULL, 1029, NULL, 50, NULL, NULL, NULL)
INSERT [Discounts] ([DiscountID], [UserID], [ProductID], [DiscountCode], [DiscountPercent], [UsableCount], [StartDate], [EndDate]) VALUES (39, NULL, 1030, NULL, 40, NULL, NULL, NULL)
INSERT [Discounts] ([DiscountID], [UserID], [ProductID], [DiscountCode], [DiscountPercent], [UsableCount], [StartDate], [EndDate]) VALUES (40, NULL, 1047, NULL, 80, NULL, NULL, NULL)
INSERT [Discounts] ([DiscountID], [UserID], [ProductID], [DiscountCode], [DiscountPercent], [UsableCount], [StartDate], [EndDate]) VALUES (43, 5, NULL, N'NewDiscount', 4, 1, CAST(N'2020-05-20T00:00:00.000' AS DateTime), CAST(N'2020-06-02T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [Discounts] OFF
GO
SET IDENTITY_INSERT [Images] ON 

INSERT [Images] ([ImageID], [ImageTitle], [ImageUrl], [CreateDate]) VALUES (1, N'حضور مدیران در سمینار', N'6b3cc23dc1ad4f61af8ae0a9b0bc0549.jpg', CAST(N'2018-04-24T12:34:29.000' AS DateTime))
INSERT [Images] ([ImageID], [ImageTitle], [ImageUrl], [CreateDate]) VALUES (2, N'شرح محصولات ایزوپایپ', N'9d78c098063e431faea3d4cde8c540b0.jpg', CAST(N'2018-04-24T12:36:03.827' AS DateTime))
INSERT [Images] ([ImageID], [ImageTitle], [ImageUrl], [CreateDate]) VALUES (3, N'محصولات ایزوپایپ', N'ce94d83d5afd4b83bc7321f411155a3b.jpg', CAST(N'2018-04-24T12:38:29.400' AS DateTime))
INSERT [Images] ([ImageID], [ImageTitle], [ImageUrl], [CreateDate]) VALUES (4, N'ایزو رول ها', N'b30123e6e4e6441a92b4aa95feb83636.jpg', CAST(N'2018-04-24T12:39:40.957' AS DateTime))
INSERT [Images] ([ImageID], [ImageTitle], [ImageUrl], [CreateDate]) VALUES (5, N'نمودار', N'85493331e9cd4e9f8c707fd7d2119960.jpg', CAST(N'2018-04-24T12:41:13.190' AS DateTime))
INSERT [Images] ([ImageID], [ImageTitle], [ImageUrl], [CreateDate]) VALUES (6, N'سمینار دی ماه', N'83f3c198b7584efc93b3599f679f75a2.jpg', CAST(N'2018-04-24T12:42:37.000' AS DateTime))
INSERT [Images] ([ImageID], [ImageTitle], [ImageUrl], [CreateDate]) VALUES (7, N'گواهینامه ها', N'1d88f2ae0d94484c90c0c562ba5e4624.jpg', CAST(N'2018-04-24T12:43:43.843' AS DateTime))
INSERT [Images] ([ImageID], [ImageTitle], [ImageUrl], [CreateDate]) VALUES (8, N'مدعوین', N'193a34962d58432795b12fd3a2249188.jpg', CAST(N'2018-04-24T13:22:16.367' AS DateTime))
INSERT [Images] ([ImageID], [ImageTitle], [ImageUrl], [CreateDate]) VALUES (9, N'پذیرایی', N'de21f0f6804743a7be8cbffb6d395266.jpg', CAST(N'2018-04-24T13:22:43.960' AS DateTime))
SET IDENTITY_INSERT [Images] OFF
GO
SET IDENTITY_INSERT [News] ON 

INSERT [News] ([NewsID], [NewsTitle], [NewsDescription], [NewsImageUrl], [NewsVideoUrl], [CreateDate], [IsSeminar]) VALUES (26, N'سمینار مشترک شرکت ایزوپایپ یونان و نماینده انحصاری آنها در ایران', N'<p>سمینار مشترک شرکت ایزوپایپ یونان و نماینده انحصاری آنها ( شرکت بهین فلکس ) در ایران در تاریخ 96/10/5 با موفقیت برگزار گردید و سبد محصولات شرکت ایزوپایپ با حضور مدیر کارخانه و اعضای هیئت مدیره آن شرکت به مدعوین معرفی گردید.</p>
', N'8cd885572f374524909228036f9aa8f4.jpg', N'no-video.jpg', CAST(N'2017-12-26T00:00:00.000' AS DateTime), 0)
INSERT [News] ([NewsID], [NewsTitle], [NewsDescription], [NewsImageUrl], [NewsVideoUrl], [CreateDate], [IsSeminar]) VALUES (27, N'تخفیف ویژه برای اعضای سایت', N'<p>شرکت بهین فلکس در نظر دارد برای مشتریان عزیز خود که در سایت عضو گردند تخفیفات ویژه ای در نظر بگیرد .</p>
', N'no-photo.jpg', N'no-video.jpg', CAST(N'2018-02-11T12:19:50.313' AS DateTime), 0)
INSERT [News] ([NewsID], [NewsTitle], [NewsDescription], [NewsImageUrl], [NewsVideoUrl], [CreateDate], [IsSeminar]) VALUES (28, N'همکاری با گروه صنعتی یزد لوله', N'<p>شرکت بهین فلکس افتخار همکاری با گروه صنعتی یزد لوله را دارد .</p>

<p>این همکاری از سال 97 آغاز شده و همواره ادامه دار&nbsp; است .</p>

<p>&nbsp;</p>
', N'e7a251655cd64b8aae374cc6382f4c5e.jpeg', NULL, CAST(N'2020-01-15T13:21:23.047' AS DateTime), 0)
INSERT [News] ([NewsID], [NewsTitle], [NewsDescription], [NewsImageUrl], [NewsVideoUrl], [CreateDate], [IsSeminar]) VALUES (30, N'نمایندگی فروش گروه صنعتی یزد لوله', N'<p>شرکت بهین فلکس افتخار نمایندگی فروش مستقیم گروه صنعتی یزد لوله ( پوش فیت.تک لایه و پنچ لایه) در چهار راه گلوبندک (بازار) می باشد .</p>
', N'110fb86dc400481cbbe94b5eae74fbd6.jpeg', NULL, CAST(N'2020-01-15T00:00:00.000' AS DateTime), 0)
INSERT [News] ([NewsID], [NewsTitle], [NewsDescription], [NewsImageUrl], [NewsVideoUrl], [CreateDate], [IsSeminar]) VALUES (31, N'روز مادر', N'<p><span style="color:rgb(38, 38, 38); font-family:-apple-system,blinkmacsystemfont,segoe ui,roboto,helvetica,arial,sans-serif; font-size:14px">ولادت با سعادت حضرت فاطمه(س)و همچنین روز مادر بر تمامی مادران سرزمین مبارک باد.</span></p>
', N'40ec76787a454129aeda47c7e183d5f6.jpg', NULL, CAST(N'2020-02-15T15:29:12.617' AS DateTime), 0)
INSERT [News] ([NewsID], [NewsTitle], [NewsDescription], [NewsImageUrl], [NewsVideoUrl], [CreateDate], [IsSeminar]) VALUES (32, N'فرارسیدن سال 1399', N'<p>فرا رسیدن سال نو همیشه نوید بخش افکار نو،</p>

<p>کردار نو و تصمیم های نو برای آینده است،</p>

<p>آینده ای که همه امید داریم بهتر از گذشته باشد.</p>

<p>در سال نو، 365 روز سلامتی، شادی، پیروزی، مهر و دوستی و عشق را برای شما آرزومندیم ...</p>

<p>سال نو مبارک .&zwnj;&zwnj;..</p>
', N'0e7b2c62a3ec4673aece54b2b780a695.jpg', NULL, CAST(N'2020-03-21T17:35:12.663' AS DateTime), 0)
SET IDENTITY_INSERT [News] OFF
GO
SET IDENTITY_INSERT [OrderDetails] ON 

INSERT [OrderDetails] ([DetailId], [OrderId], [ProductId], [ProductCount], [ProductPrice], [Sum], [SumWithDiscount]) VALUES (105, 52, 1029, 2, 18000, 36000, 34200)
INSERT [OrderDetails] ([DetailId], [OrderId], [ProductId], [ProductCount], [ProductPrice], [Sum], [SumWithDiscount]) VALUES (108, 55, 1029, 3, 18000, 54000, 51300)
INSERT [OrderDetails] ([DetailId], [OrderId], [ProductId], [ProductCount], [ProductPrice], [Sum], [SumWithDiscount]) VALUES (109, 55, 1030, 2, 10000, 20000, 17000)
INSERT [OrderDetails] ([DetailId], [OrderId], [ProductId], [ProductCount], [ProductPrice], [Sum], [SumWithDiscount]) VALUES (110, 56, 1050, 2, 10000, 20000, 20000)
INSERT [OrderDetails] ([DetailId], [OrderId], [ProductId], [ProductCount], [ProductPrice], [Sum], [SumWithDiscount]) VALUES (1110, 57, 1047, 1, 80000, 80000, 16000)
INSERT [OrderDetails] ([DetailId], [OrderId], [ProductId], [ProductCount], [ProductPrice], [Sum], [SumWithDiscount]) VALUES (1111, 57, 1048, 0, 58000, 0, 0)
INSERT [OrderDetails] ([DetailId], [OrderId], [ProductId], [ProductCount], [ProductPrice], [Sum], [SumWithDiscount]) VALUES (2110, 1057, 1047, 2, 80000, 160000, 32000)
INSERT [OrderDetails] ([DetailId], [OrderId], [ProductId], [ProductCount], [ProductPrice], [Sum], [SumWithDiscount]) VALUES (2111, 1058, 1047, 2, 80000, 160000, 32000)
INSERT [OrderDetails] ([DetailId], [OrderId], [ProductId], [ProductCount], [ProductPrice], [Sum], [SumWithDiscount]) VALUES (2112, 1058, 1048, 1, 58000, 58000, 58000)
SET IDENTITY_INSERT [OrderDetails] OFF
GO
SET IDENTITY_INSERT [Orders] ON 

INSERT [Orders] ([OrderId], [UserId], [DiscountCodeID], [OrderDate], [IsFinally], [OrderTotalSum], [OrderTotalSumWithDiscount], [OrderTotalAfterDiscountCodeApply]) VALUES (52, 2, NULL, CAST(N'2020-05-13T00:00:00.000' AS DateTime), 1, 36000, 34200, NULL)
INSERT [Orders] ([OrderId], [UserId], [DiscountCodeID], [OrderDate], [IsFinally], [OrderTotalSum], [OrderTotalSumWithDiscount], [OrderTotalAfterDiscountCodeApply]) VALUES (55, 2, NULL, CAST(N'2020-05-13T00:00:00.000' AS DateTime), 1, 74000, 34150, NULL)
INSERT [Orders] ([OrderId], [UserId], [DiscountCodeID], [OrderDate], [IsFinally], [OrderTotalSum], [OrderTotalSumWithDiscount], [OrderTotalAfterDiscountCodeApply]) VALUES (56, 2, NULL, CAST(N'2020-06-15T17:57:59.807' AS DateTime), 0, 20000, 20000, NULL)
INSERT [Orders] ([OrderId], [UserId], [DiscountCodeID], [OrderDate], [IsFinally], [OrderTotalSum], [OrderTotalSumWithDiscount], [OrderTotalAfterDiscountCodeApply]) VALUES (57, 2, NULL, CAST(N'2020-06-16T14:19:05.330' AS DateTime), 0, 80000, 16000, NULL)
INSERT [Orders] ([OrderId], [UserId], [DiscountCodeID], [OrderDate], [IsFinally], [OrderTotalSum], [OrderTotalSumWithDiscount], [OrderTotalAfterDiscountCodeApply]) VALUES (1057, 2, 1, CAST(N'2020-06-16T15:32:17.990' AS DateTime), 0, 160000, 32000, 28800)
INSERT [Orders] ([OrderId], [UserId], [DiscountCodeID], [OrderDate], [IsFinally], [OrderTotalSum], [OrderTotalSumWithDiscount], [OrderTotalAfterDiscountCodeApply]) VALUES (1058, 2, 1, CAST(N'2020-06-16T18:58:32.433' AS DateTime), 0, 218000, 90000, 81000)
SET IDENTITY_INSERT [Orders] OFF
GO
SET IDENTITY_INSERT [OrganizationChart] ON 

INSERT [OrganizationChart] ([OrgChartID], [OrgChartPost], [OrgChartFullName], [OrgChartPhone], [OrgChartEmail], [OrgChartTelegramID]) VALUES (1, N'ریِیس هیت مدیره', N'مهندس علیرضا زارعی', NULL, N'ceo@behinflex.com', NULL)
INSERT [OrganizationChart] ([OrgChartID], [OrgChartPost], [OrgChartFullName], [OrgChartPhone], [OrgChartEmail], [OrgChartTelegramID]) VALUES (2, N'مدیر عامل', N'مهندس محسن صدق زاده', NULL, N'cob@behinflex.com', NULL)
SET IDENTITY_INSERT [OrganizationChart] OFF
GO
SET IDENTITY_INSERT [ProductBrand] ON 

INSERT [ProductBrand] ([ProductBrandID], [ProductBrandTitle]) VALUES (1, N'ایزوپایپ')
INSERT [ProductBrand] ([ProductBrandID], [ProductBrandTitle]) VALUES (2, N'ماکروتکنیک')
INSERT [ProductBrand] ([ProductBrandID], [ProductBrandTitle]) VALUES (6, N'یزد لوله')
INSERT [ProductBrand] ([ProductBrandID], [ProductBrandTitle]) VALUES (7, N'سانا عایق(K-FLEX)')
INSERT [ProductBrand] ([ProductBrandID], [ProductBrandTitle]) VALUES (8, N'رادمن ')
SET IDENTITY_INSERT [ProductBrand] OFF
GO
SET IDENTITY_INSERT [ProductGalleries] ON 

INSERT [ProductGalleries] ([GalleryID], [ProductID], [ImageName]) VALUES (1, 1162, N'509559df5e48462cbc89d28150f25299.jpg')
INSERT [ProductGalleries] ([GalleryID], [ProductID], [ImageName]) VALUES (2, 1162, N'83324faa388f460a9417411e74106e45.jpg')
INSERT [ProductGalleries] ([GalleryID], [ProductID], [ImageName]) VALUES (3, 1162, N'072ee31aefad489b8f6858e456ff744e.jpg')
INSERT [ProductGalleries] ([GalleryID], [ProductID], [ImageName]) VALUES (4, 1163, N'e59e0c4951ba453890b83c7b16b2ae97.jpg')
INSERT [ProductGalleries] ([GalleryID], [ProductID], [ImageName]) VALUES (5, 1163, N'2f079a8e3521481cb779e037c8eb9003.jpg')
INSERT [ProductGalleries] ([GalleryID], [ProductID], [ImageName]) VALUES (6, 1163, N'2c4160fd70a845d294ac13bd14b8c6e4.jpg')
INSERT [ProductGalleries] ([GalleryID], [ProductID], [ImageName]) VALUES (7, 1163, N'fbcf43d500d149f6988fc28806738335.jpg')
INSERT [ProductGalleries] ([GalleryID], [ProductID], [ImageName]) VALUES (8, 1163, N'65652b7b812e49e182e4b9ef7c66148a.jpg')
INSERT [ProductGalleries] ([GalleryID], [ProductID], [ImageName]) VALUES (10, 1174, N'4d44222cdea34d12a262b439faec20a4.png')
SET IDENTITY_INSERT [ProductGalleries] OFF
GO
SET IDENTITY_INSERT [ProductGroup] ON 

INSERT [ProductGroup] ([ProductGroupID], [ProductBrandID], [ProductGroupTitle]) VALUES (6, 1, N'عایق حرارتی')
INSERT [ProductGroup] ([ProductGroupID], [ProductBrandID], [ProductGroupTitle]) VALUES (7, 1, N'عایق صوتی')
INSERT [ProductGroup] ([ProductGroupID], [ProductBrandID], [ProductGroupTitle]) VALUES (8, 2, N'عایق الاستومری')
INSERT [ProductGroup] ([ProductGroupID], [ProductBrandID], [ProductGroupTitle]) VALUES (9, 2, N'ساپورت')
INSERT [ProductGroup] ([ProductGroupID], [ProductBrandID], [ProductGroupTitle]) VALUES (13, 6, N'یزد پوش فیت')
INSERT [ProductGroup] ([ProductGroupID], [ProductBrandID], [ProductGroupTitle]) VALUES (14, 6, N'یزد پایپ (تک لایه)')
INSERT [ProductGroup] ([ProductGroupID], [ProductBrandID], [ProductGroupTitle]) VALUES (15, 6, N'یزد لوله (پنج لایه)')
INSERT [ProductGroup] ([ProductGroupID], [ProductBrandID], [ProductGroupTitle]) VALUES (16, 7, N'K-FLEX')
INSERT [ProductGroup] ([ProductGroupID], [ProductBrandID], [ProductGroupTitle]) VALUES (17, 7, N'SANA DUCT')
INSERT [ProductGroup] ([ProductGroupID], [ProductBrandID], [ProductGroupTitle]) VALUES (18, 8, N'چسب عایق')
SET IDENTITY_INSERT [ProductGroup] OFF
GO
SET IDENTITY_INSERT [Products] ON 

INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1029, 13, N'فلنج ماکروتکنیک', N'Macroteknik Corner', N'مشخصات فنی (تست)', N'50 * 60', N'<div>
<p style="text-align:justify"><span style="color:#008080"><span style="font-size:14px"><strong>فلنج&zwnj;های ماکروتکنیک</strong></span></span></p>

<p style="text-align:justify">&nbsp;&nbsp;&nbsp;&nbsp; فلنج&zwnj;های ماکروتکنیک مطابق با آخرین استانداردهای روز دنیا و به&zwnj;منظور جلوگیری از هدر رفت انرژی،&zwnj; کاهش زمان نصب همچنین تقویت مقاومت و پایداری هرچه بیشتر در اجرای کانال&zwnj;های هوا طراحی و تولید شده است. جنس این فلنج&zwnj;ها از فولاد گالوانیزه و استنلس استیل بوده و منطبق با استاندارد TSE820 در ابعاد <span style="font-size:16px">20&zwnj;، 25، 30، 35، و&nbsp;35+ </span>تولید می&zwnj;شود. ورق&zwnj;های بکار&zwnj; رفته در این محصولات از نوع GS (فولاد گالوانیزه) با ضخامت 0.6 میلیمتر می&zwnj;باشد که برحسب نیاز مشتریان و کلاسه&zwnj;های فشاری موجود قابلیت تولید با ضخامت 0.7 میلیمتر و بالاتر را نیز دارا می&zwnj;باشد.</p>
</div>

<p style="text-align:justify">&nbsp;</p>

<p style="text-align:justify">&nbsp; &nbsp;&nbsp; این فلنج&zwnj;ها به صورت شاخه&zwnj;ای و در شاخه&zwnj;های 4&zwnj; و&zwnj; 5 متری موجود می&zwnj;باشند. ورق&zwnj;های گالوانیزه 0.6 (در حالت کلی این سایز و در حالت سفارشی ضخامت&zwnj;های بالاتر موجود است) طی فرآیند خم&zwnj;کاری با ساختاری شیاردار که موجب پایداری بیشتر، و ساختار ساده که منجربه سهولت در نصب خواهد شد، ساخته و در همین میان ماستیکی جهت چفت کردن کانال&zwnj;ها به آن تزریق می&zwnj;شود. این محصول در 3 تایپ کلی کوچک، بزرگ و فوق بزرگ موجود است. فلنج&zwnj;های کوچک در دو تایپ 20.25 (هر دو دارای عرض 23 میلیمتر می&zwnj;باشد) و فلنج&zwnj;های بزرگ در دو تایپ 30.35 (دارای عرض 25 و 26 میلیمتر) تولید می&zwnj;شود. از سویی فلنج&zwnj;های فوق بزرگ در تایپ 35+ روانه بازار می&zwnj;گردد.</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p dir="ltr"><img alt="" src="/Upload/13970224-11024295.png" style="float:left; height:132px; width:408px" /></p>
', 18000, N'52662f7fa9c14154827707538d5a2e21.png', CAST(N'2018-05-14T11:10:07.000' AS DateTime), 1)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1030, 13, N'گوشه فلنج', N'Flange Corner', NULL, NULL, N'<p><span style="color:#008080"><span style="font-size:14px"><strong>&nbsp;&nbsp; گوشه فلنج یا کرنرهای ماکروتکنیک : </strong></span></span></p>

<p>&nbsp;</p>

<p style="text-align:justify">&nbsp;&nbsp; به منظور ایجاد قاب محکمی از فلنج&zwnj;ها و به منظور کاهش اثرات لرزه و همچنین پایداری سیستم داکت این کرنرها مورد استفاده قرار می&zwnj;گیرد. این کرنرها نیز منطبق بر فلنج&zwnj;ها در سه تایپ کوچک، بزرگ و فوق بزرگ و ابعاد <span style="font-size:16px">20&zwnj;-، 25، 30، 35، و&nbsp;35+</span> ساخته می&zwnj;شوند. استفاده از فولاد گالوانیزه و همچنین انطباق شیوه نصب بر اساس استانداردهای SMACNA از ویژگی&zwnj;های این محصولات است.</p>

<p>&nbsp;</p>
', 10000, N'eed14c2a05bd4d1fa1532d18a63ec3a0.png', CAST(N'2018-05-14T11:50:13.000' AS DateTime), 1)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1031, 13, N'اتصالات', NULL, NULL, NULL, N'<p><span style="color:#008080"><span style="font-size:14px"><strong>اتصالات فلنج&zwnj;ها (گیره&zwnj;ها-کلیپس&zwnj;ها) :</strong></span></span></p>

<p>&nbsp;</p>

<p>&nbsp;&nbsp;&nbsp; از این محصول به منظور تثبیت و چفت کردن دو فلنج در دو سر کانال استفاده میگردد. جنس این محصول از فولاد گالوانیزه بوده و بر اساس کلاسه فشاری در دو نوع کلون دار (برای کلاسه A,B فشاری) و کلیپس پیچ&zwnj;دار (برای کلاسه C,D فشاری) موجود می&zwnj;باشد.</p>

<p>&nbsp;</p>

<p>&nbsp; همچنین نوع اتصالات کانال هوا و روش&zwnj;های نصب اتصال فلنج منطبق با استاندارد DW144/EN1507 می&zwnj;باشد.</p>

<p>&nbsp;</p>
', 50000, N'3c8b0b7e4f8645aab404b4a7e52c6f1f.png', CAST(N'2018-05-14T11:57:02.000' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1032, 13, N'نوار عایق هوابند', NULL, NULL, NULL, N'<p><span style="color:#008080"><span style="font-size:14px"><strong>&nbsp;&nbsp; نوار عایق هوابند :</strong></span></span></p>

<p>&nbsp;</p>

<p style="text-align:justify">&nbsp;&nbsp; استفاده از این نوارها به منظور ایجاد هوابندی و مقاومت در برابر عوامل خارجی نظیر خاک، دود، روغن و حتی آب و از سویی دیگر کاهش نشت جریان هوا صورت می&zwnj;گیرد. این نوارها خود از دو نوع EPDM و Polietilen با ضخامت 5 میلیمتر و در عرض&zwnj;های 13.15.18.20 میلیمتر تولید می&zwnj;شود.</p>
', 10000, N'3caa4daa113345a597c7e630261b7db0.png', CAST(N'2018-05-14T12:52:09.000' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1033, 14, N'پروفیل نوع C', NULL, NULL, NULL, N'<p style="text-align:justify">&nbsp;&nbsp; ساپورت&zwnj;های ماکروتکنیک مکانیزمی است که بر طبق آن قابلیت نگهدارندگی سیستم&zwnj;های معلق اعم از تاسیسات مکانیکال و الکتریکال و سیستم&zwnj;های تقویت نیرو را فراهم می&zwnj;کند. تنوع این پروفیل در مدل&zwnj;های U,L,C با ابعاد و ضخامت&zwnj;های مختلف قابلیت ویژه&zwnj;ای را در تثبیت شبکه کانالکشی و مونتاژ سیستم لوله&zwnj;کشی افقی و عمودی و کلیه سیستم&zwnj;های معلق مهیا می&zwnj;کند. پروفیل&zwnj;های تثبیت کننده جایگزین که در سیستم&zwnj;های کانالکشی قابل استفاده است کاملاً منطبق بر استاندارد DW144 &ndash; TS EN1507 و SMACNA می باشد.</p>

<p style="text-align:justify">&nbsp;</p>

<p><span style="color:#008080"><span style="font-size:14px"><strong>&nbsp; پروفیل نوع C :</strong></span></span></p>

<p style="text-align:justify">&nbsp;&nbsp; ساپورت C شکل ماکروتکنیک به&zwnj;عنوان عنصر نگه&zwnj;دارنده و مونتاژ در سیستم&zwnj;های معلق نظیر کانال و لوله استفاده می&zwnj;شوند. این ساپورت&zwnj;ها به&zwnj;صورت تکی و یا متصل شده به قاب&zwnj;های دیگر قابل استفاده است. این ساپورت&zwnj;ها در 3 تایپ کوچک، متوسط و بزرگ به عنوان سیستم زیرسری و یا دستکی مورد استفاده قرار می&zwnj;گیرد.</p>

<p style="text-align:justify">&nbsp;</p>

<ul>
	<li style="text-align:justify">سایز کوچک یا همان C Framing 27/18 بوده و نمره پیچ آن M8 می&zwnj;باشد که تحمل بار&zwnj;های سبک را دارد.</li>
	<li style="text-align:justify">سایز متوسط مدل C Framing 30/28 بوده و نمره پیچ آن M8 می&zwnj;باشد که تحمل بار&zwnj;های سبک ومتوسط را دارد.</li>
	<li style="text-align:justify">سایز بزرگ یا همان C Framing 40/38 بوده و نمره پیچ آن M10 می&zwnj;باشد که تحمل بار&zwnj;های متوسط و سنگین را دارد.</li>
</ul>

<p>&nbsp;</p>

<p><img alt="" src="/Upload/13970327-18034396.png" style="float:left; height:197px; width:168px" /></p>
', 10000, N'a3aebca362ac447a91e7fa9599cbcaa5.png', CAST(N'2018-05-14T13:34:34.000' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1034, 14, N'پروفیل نوع L', NULL, NULL, NULL, N'<p><span style="color:#008080"><span style="font-size:14px"><strong>&nbsp;&nbsp; پروفیل نوع<span style="font-size:16px"> L</span> : </strong></span></span></p>

<p style="text-align:justify">&nbsp;&nbsp; ساپورت L شکل ماکروتکنیک دارای کاربرد&zwnj;های زیادی در صنایع گوناگون بوده و به&zwnj;عنوان عنصر نگه&zwnj;دارنده و مونتاژ در سیستم&zwnj;های معلق نظیر کانال و لوله استفاده می&zwnj;شوند. این محصول در ضخامت&zwnj; و اندازه&zwnj;های مختلف بوده و سوراخ&zwnj;های موجود روی ساپورت باعث سهولت در نصب می&zwnj;شود. طول هر شاخه آن 2 متر و فاصله طولی سوراخ&zwnj;های آن 40 میلیمتر می&zwnj;باشد که امکان دسترسی هرچه بهتر نصب را فراهم می&zwnj;کند.</p>
', 10000, N'6957947e83c44e43b1c44159db2c9e31.png', CAST(N'2018-05-14T13:40:55.000' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1035, 14, N'پروفیل نوع U', NULL, NULL, NULL, N'<p>&nbsp;<span style="color:#008080"><span style="font-size:14px"><strong>&nbsp; پروفیل نوع U :</strong></span></span></p>

<p>&nbsp;&nbsp; این ساپورت دارای کاربرد&zwnj;های زیادی در صنایع گوناگون بوده و به&zwnj;عنوان عنصر نگه&zwnj;دارنده و مونتاژ در سیستم&zwnj;های معلق نظیر کانال و لوله استفاده می&zwnj;شوند. تولید شده در ضخامت&zwnj; و اندازه&zwnj;های مختلف بوده و سوراخ&zwnj;های موجود روی ساپورت باعث سهولت در نصب می&zwnj;شود. از این پروفیل نیز می&zwnj;توان به عنوان عامل زیرسری یا دستکی استفاده نمود. طول هر شاخه آن 2 متر و فاصله طولی سوراخ&zwnj;های آن 40 میلیمتر می&zwnj;باشد که امکان دسترسی هرچه بهتر نصب را فراهم می&zwnj;کند. و با دو ضخامت 3 و 4 میلیمتر موجود می&zwnj;باشد.</p>
', 10000, N'b9289cd9032b45d896ad243a7c660b85.png', CAST(N'2018-05-14T18:57:17.513' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1036, 15, N'آویز', NULL, NULL, NULL, N'<p>&nbsp;&nbsp; <span style="color:#008080"><span style="font-size:14px"><strong>بست&zwnj;ها و نگهدارنده&zwnj;ها : </strong></span></span></p>

<p style="text-align:justify">&nbsp;&nbsp; به منظور ایجاد کیفیت و دقت هرچه بیشتر در نصب و توزیع شبکه مرکب از سیستم ساپورتینگ در مجموعه تاسیسات مکانیکال و الکتریکال، شرکت ماکروتکنیک سیستم&zwnj;های نگهدارنده شامل کلیه میل رادها (Rods)، انکربولت&zwnj;ها (Anchor)، رول&zwnj;بولت&zwnj;ها و انواع پیچ&zwnj;های خودکار و مهره&zwnj;ها و همچنین سیستم&zwnj;های بست&zwnj; لوله شامل انواع بست&zwnj;های لوله تسمه دار و بدون تسمه، بست&zwnj;های مهره&zwnj;دار، بست&zwnj;های لوله&zwnj;های سبک و سنگین، بست&zwnj;های سیستم آتش&zwnj;نشانی (اسپرینکلر)، بست&zwnj;های آویز و بست&zwnj;های لوله PVC را تهیه و روانه بازارهای منطقه&zwnj;ای و فرامنطقه&zwnj;ای نموده است. این محصولات دارای استانداردها و گواهینامه&zwnj;های فنی و کیفی از موسسات تحقیقاتی از کشور ترکیه بوده و در بازه&zwnj;ای از سایز&zwnj;ها و گونه&zwnj;های متنوع در دسترس است.</p>

<p style="text-align:justify">&nbsp;</p>

<p style="text-align:justify">&nbsp;&nbsp; بست فلزی لوله جهت اتصال انواع لوله&zwnj;ها با تنوع بسیار زیاد در سایز ، جنس ، استحکام ، کاربرد و .. تمامی حالات و شرایط ضروری نصب را پوشش داده و طراحی آن به گونه ای است که مصرف کننده به راحتی می تواند بنا به نوع نیاز یک بست کاملا مناسب را انتخاب نماید. بست&zwnj;های ماکروتکنیک دارای استحکام قابل توجهی بوده و جنس آنها عمدتا از استیل ضد زنگ با گریدهای مختلف ، ورق گالوانیزه گرم ، آلومینیوم و .. می باشد .این بست ها در محیط هایی که خوردگی و فرسودگی بالایی دارند مورد آزمایش قرار گرفته و به همین دلیل دارای تنوع زیاد طراحی و هماهنگی با استانداردهای بین المللی در این زمینه می باشد.</p>

<p style="text-align:justify">&nbsp;</p>

<p><img alt="" src="/Upload/13970226-17025793.png" style="float:left; height:195px; width:247px" /></p>
', 10000, N'4dd3f97ed3f84f1483e5595a6faf8207.png', CAST(N'2018-05-14T19:30:57.000' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1037, 15, N'اسپرینکلر', NULL, NULL, NULL, N'<p><span style="color:#008080"><span style="font-size:14px"><strong>&nbsp;&nbsp; اسپرینکلر :</strong></span></span></p>

<p><span style="font-family:tahoma,geneva,sans-serif"><span style="background-color:rgb(255, 255, 255); color:rgb(101, 101, 101); font-size:14px">&nbsp;&nbsp; از سال ۱۸۷۴میلادی که اسپرینکلر (آبفشان) توسط &ldquo;هنری پارملی&rdquo; اختراع شد، این وسیله نسبتاً ساده که گروهی از صاحبنظران آن را بعنوان بهترین و کارآمد ترین وسیله ایمنی ساخته شده تا به امروز می دانند، با استفاده از تجهیزات رایج در شبکه های لوله کشی نظیر شیرآلات ، لوله و اتصالات مربوطه با هدف حفظ جان و مال افراد در برابر حریق بکارگرفته شده است.</span></span></p>

<p>&nbsp;</p>

<p><span style="font-size:14px"><span style="font-family:tahoma,geneva,sans-serif">&nbsp;&nbsp; برای انتخاب بست و آویزهای اسپرینکلر، جنس و سایز لوله ،نوع مصالح ساختمان، احتمال وقوع زلزله ،.. از عواملی هستند که در انتخاب نوع بستها و فاصله بین آنها تأثیر می گذارند.</span></span></p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p><span style="font-size:14px"><span style="font-family:tahoma,geneva,sans-serif"><img alt="" src="/Upload/13970226-18023516.png" style="float:left; height:195px; width:247px" /></span></span></p>
', 10000, N'161ae36335a44776917c85230be027ec.png', CAST(N'2018-05-14T19:54:05.000' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1038, 16, N'Rod', NULL, NULL, NULL, N'<p style="text-align: justify;">به منظور ایجاد کیفیت و دقت هرچه بیشتر در نصب و توزیع شبکه مرکب از سیستم ساپورتینگ در مجموعه تاسیسات مکانیکال و الکتریکال، شرکت ماکروتکنیک سیستم&zwnj;های نگهدارنده شامل کلیه میل رادها (Rods)، انکربولت&zwnj;ها (Anchor)، رول&zwnj;بولت&zwnj;ها و انواع پیچ&zwnj;های خودکار و مهره&zwnj;ها و همچنین سیستم&zwnj;های بست&zwnj; لوله شامل انواع بست&zwnj;های لوله تسمه دار و بدون تسمه، بست&zwnj;های مهره&zwnj;دار، بست&zwnj;های لوله&zwnj;های سبک و سنگین، بست&zwnj;های سیستم آتش&zwnj;نشانی (اسپرینکلر)، بست&zwnj;های آویز و بست&zwnj;های لوله PVC را تهیه و روانه بازارهای منطقه&zwnj;ای و فرامنطقه&zwnj;ای نموده است. این محصولات دارای استانداردها و گواهینامه&zwnj;های فنی و کیفی از موسسات تحقیقاتی از کشور ترکیه بوده و در بازه&zwnj;ای از سایز&zwnj;ها و گونه&zwnj;های متنوع در دسترس است.</p>

<p>&nbsp;</p>
', 10000, N'9920ea044a734c8db92316e62e9cac8c.png', CAST(N'2018-05-16T18:28:20.000' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1039, 16, N'Anchor Bolt', NULL, NULL, NULL, N'<h2 style="font-style:normal; text-align:start"><span style="font-size:16px"><span style="color:rgb(0, 128, 128)"><strong>انکر بولت :</strong></span></span></h2>

<p style="text-align:start">در پروژه های ساختمانی، انکر بولت (&nbsp;<a href="http://behradin.com/anchor-bolt" style="box-sizing: border-box; border: 0px; font-family: inherit; font-size: 15px; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline; word-wrap: break-word; color: rgb(32, 194, 234); text-decoration: none; transition: all 0.3s ease-in-out;"><span style="color:rgb(105, 105, 105)">رول بولت</span></a>&nbsp;) ها به منظور نصب صفحه (&nbsp;Plate ) های فلزی با ابعاد و ضخامت های مختلف به سطوح (&nbsp;Base Material )&nbsp;از جنس&nbsp;بتن سخت شده، سنگ، آجر و &hellip;&nbsp;مورد استفاده قرار می گیرند.</p>

<p style="text-align:start">این صفحه ها امکان اتصال و جوشکاری قطعات فلزی مختلف به سازه بتنی به منظور اجرای انواع نماهای خشک و کامپوزیت، اجرای ساپورت های تأسیسات مکانیکی و الکتریکی، نصب تجهیزات و ماشین آلات و &hellip; را فراهم می کند. اما آن چه در این میان اهمیت دارد، انتخاب انکر بولت (Anchor Bolt) مناسب با توجه به نوع عملکرد، سایز، ظرفیت باربری و محدودیت های نصب می باشد.</p>

<p style="text-align:start">انکر بولت از لحاظ&nbsp;نوع و&nbsp;عملکرد به دو دسته&nbsp;مکانیکی و شیمیایی طبقه بندی می شود.</p>

<p style="text-align:start">&nbsp;</p>

<p style="text-align:start">&nbsp;</p>

<p style="text-align:start"><img alt="" src="/Upload/13970226-19025528.png" style="float:left; height:195px; width:660px" /></p>

<p style="text-align:start">&nbsp;</p>

<p style="text-align:start">&nbsp;</p>

<p style="text-align:start">&nbsp;</p>

<p style="text-align:start">&nbsp;</p>

<p style="text-align:start">&nbsp;</p>

<p style="text-align:start">&nbsp;</p>
', 10000, N'3ed46286558e4e2294a1a1fc2124ee40.png', CAST(N'2018-05-16T19:03:26.000' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1040, 16, N'رول بولت', NULL, NULL, NULL, N'<p style="text-align: justify;"><span dir="rtl"><span style="background-color:rgb(252, 252, 252); color:rgb(0, 0, 0)">رول بولت وسیله یا ابزاریست ازجنس فلز (معمولا<span style="font-size:16px">&nbsp;</span></span><span style="font-size:16px"><a href="https://fa.wikipedia.org/wiki/%D8%A2%D9%87%D9%86" rel="noopener noreferrer" style="margin: 0px; padding: 0px; border: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: 400; font-stretch: inherit; font-size: 13px; line-height: inherit; font-family: bigtheme-Naskh, Arial, Tahoma, sans-serif; vertical-align: baseline; text-decoration: none; outline: 0px; color: rgb(41, 145, 214); letter-spacing: normal; orphans: 2; text-align: justify; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(252, 252, 252);" target="_blank">آهنی</a></span><span style="background-color:rgb(252, 252, 252); color:rgb(0, 0, 0)">) مجموعا متشکل از یک عدد&nbsp;</span><a href="http://pgbolt.ir/?page_id=110" rel="noopener noreferrer" style="margin: 0px; padding: 0px; border: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: 400; font-stretch: inherit; font-size: 13px; line-height: inherit; font-family: bigtheme-Naskh, Arial, Tahoma, sans-serif; vertical-align: baseline; text-decoration: none; outline: 0px; color: rgb(41, 145, 214); letter-spacing: normal; orphans: 2; text-align: justify; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(252, 252, 252);" target="_blank">پیچ</a><span style="background-color:rgb(252, 252, 252); color:rgb(0, 0, 0)">&nbsp;(screw) عمدتا سر مخروطی شکل ، یک عدد لوله استوانه ای شکل چاک دار به همراه یک عدد&nbsp;</span><a href="http://pgbolt.ir/?page_id=105" rel="noopener noreferrer" style="margin: 0px; padding: 0px; border: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: 400; font-stretch: inherit; font-size: 13px; line-height: inherit; font-family: bigtheme-Naskh, Arial, Tahoma, sans-serif; vertical-align: baseline; text-decoration: none; outline: 0px; color: rgb(41, 145, 214); letter-spacing: normal; orphans: 2; text-align: justify; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(252, 252, 252);" target="_blank">مهره</a><span style="background-color:rgb(252, 252, 252); color:rgb(0, 0, 0)">&nbsp;و یک عدد&nbsp;</span><a href="http://pgbolt.ir/?page_id=291" rel="noopener noreferrer" style="margin: 0px; padding: 0px; border: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: 400; font-stretch: inherit; font-size: 13px; line-height: inherit; font-family: bigtheme-Naskh, Arial, Tahoma, sans-serif; vertical-align: baseline; text-decoration: none; outline: 0px; color: rgb(41, 145, 214); letter-spacing: normal; orphans: 2; text-align: justify; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(252, 252, 252);" target="_blank">واشر</a><span style="background-color:rgb(252, 252, 252); color:rgb(0, 0, 0)">.</span></span></p>

<p>&nbsp;</p>

<p style="text-align:justify"><span dir="rtl"><span style="color:rgb(0, 0, 0)">انکربولت بر حسب نیاز مصرف کننده و موقعیت و نوع مصالح محل مورد نظر جهت کاشت رول بولت ,دارای انواع و مدل های گوناگونی می باشد . </span></span></p>

<p style="text-align:justify">&nbsp;</p>

<p style="text-align:justify"><img alt="" src="/Upload/13970226-19025268.png" style="float:left; height:195px; width:700px" /></p>
', 10000, N'd3b511706fa346e5a8e64b16536c5047.png', CAST(N'2018-05-16T19:23:04.060' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1041, 16, N'پیچ خودکار', NULL, NULL, NULL, N'<p style="text-align:justify">شرکت بازرگانی بهین فراز پایدار با عنوان تجاری بهین فلکس، نماینده انحصاری محصولات ماکروتکنیک ترکیه مفتخر به ارا&zwnj;ئه خدمات متنوع از این تج&zwj;هیزات ، منجمله انواع پیچ خودکار می&zwnj;باشد.</p>

<p>&nbsp;</p>

<p><img alt="" src="/Upload/13970226-19021372.png" style="float:right; height:195px; width:247px" /></p>

<p>&nbsp;</p>
', 10000, N'eff76b69883f47ca88c9f77a5e40dcb9.png', CAST(N'2018-05-16T19:43:53.000' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1042, 16, N'پیچ و مهره', NULL, NULL, NULL, N'<p>شرکت بازرگانی بهین فراز پایدار با عنوان تجاری بهین فلکس، نماینده انحصاری محصولات ماکروتکنیک ترکیه مفتخر به ارا&zwnj;ئه خدمات متنوع از این تج&zwj;هیزات ، منجمله پیچ و مهره های این برند می&zwnj;باشد.</p>

<p>&nbsp;</p>
', 10000, N'75e90fd725a1488b93e37ee473620c5c.png', CAST(N'2018-05-16T20:15:49.620' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1043, 16, N'براکت', NULL, NULL, NULL, N'<p style="text-align:start"><strong><span style="color:#008080"><span style="font-size:16px">براکت ها</span></span></strong></p>

<p style="text-align: justify;"><span style="color:#008080"><strong>براکت</strong></span>&nbsp;یکی از عناصر معماری و عضوی از سازه&zwnj;ها است که ممکن است از چوب، سنگ یا فلز ساخته شده باشد و بر روی دیوار نصب می&zwnj;شود تا وزنی را پشتیبانی یا تحمل کند.</p>

<p style="text-align: justify;">براکت&zwnj;ها می&zwnj;توانند به عنوان تکیه&zwnj;گاه یک مجسمه، بالکن،&nbsp;<a class="mw-redirect" href="https://fa.wikipedia.org/wiki/%D8%AA%D8%A7%D9%82_%D9%82%D9%88%D8%B3%DB%8C" style="text-decoration: none; color: rgb(11, 0, 128); background: none;" title="تاق قوسی"><span style="color:#000000">تاق قوسی</span></a><span style="color:#000000">،&nbsp;</span><a href="https://fa.wikipedia.org/wiki/%DA%AF%D9%84%D8%B4%D9%86%D9%87" style="text-decoration: none; color: rgb(11, 0, 128); background: none;" title="گلشنه"><span style="color:#000000">گلشنه</span></a><span style="color:#000000">،&nbsp;</span><a href="https://fa.wikipedia.org/wiki/%D8%AA%D8%A7%D9%82%DA%86%D9%87" style="text-decoration: none; color: rgb(11, 0, 128); background: none;" title="تاقچه"><span style="color:#000000">تاقچه</span></a>&nbsp;و&hellip; استفاده شوند. همچنین به عنوان یک عنصر تزئینی یا برای تحمل وزن به کار روند. دو وجه براکت یک<span style="color:#000000">&nbsp;</span><a class="mw-redirect" href="https://fa.wikipedia.org/wiki/%D8%B2%D8%A7%D9%88%DB%8C%D9%87%D9%94_%D8%B1%D8%A7%D8%B3%D8%AA" style="text-decoration: none; color: rgb(11, 0, 128); background: none;" title="زاویهٔ راست"><span style="color:#000000">زاویهٔ راست</span></a>&nbsp;را تشکیل می&zwnj;دهند که یکی از آن&zwnj;ها به دیوار می&zwnj;چسبد و دیگری زیر سطح طرح&zwnj;ریزی&zwnj;شده جای می&zwnj;گیرد.</p>

<p style="text-align:start"><span style="color:#008080">انواع براکت های ماکروتکنیک :</span></p>

<ul>
	<li style="text-align:start">براکت L</li>
	<li style="text-align:start">براکت LSD</li>
	<li style="text-align:start">براکت Z</li>
	<li style="text-align:start">براکت ZSD</li>
	<li style="text-align:start">براکت VSD</li>
	<li style="text-align:start">براکت Beam Clamp</li>
</ul>

<p style="text-align:start">&nbsp;</p>

<p style="text-align:start"><img alt="" src="/Upload/13970229-11021271.png" style="height:195px; width:642px" /></p>

<p style="text-align:start">&nbsp;</p>

<p style="text-align:start">&nbsp;</p>

<p style="text-align:start"><img alt="" src="/Upload/13970229-11023247.png" style="height:195px; width:642px" /></p>

<p style="text-align:start">&nbsp;</p>

<p style="text-align:start">&nbsp;</p>

<p style="text-align:start">&nbsp;</p>
', 10000, N'd8d2aa5110194862a05803e424082527.png', CAST(N'2018-05-19T11:09:13.000' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1044, 16, N'ماستیک', NULL, NULL, NULL, N'<p><span style="color:#008080"><span style="font-size:16px">ماستیک :</span></span></p>

<p>ماستیک اکریلیک سیلیکونی ماکروتکنیک به منظور بهبود کیفیت عایق کاری در کانال های هوا ، محل اتصال فلنج ها ، گوشه فلنج ها و محل های مشابه بـا احتمال نشت هوا،&nbsp; قـابل استفاده است .</p>

<p>&nbsp;</p>

<p><span style="color:#008080"><span style="font-size:16px">مشخصات :</span></span></p>

<ul>
	<li>نصب آسان</li>
	<li>دارای خاصیت ضد آبی دایمی</li>
	<li>مقاوم در برابر شرایط بد آب و هوا</li>
	<li>حفظ حالت کشسانی بعد از گذر زمان</li>
	<li>اگر سطح آن به روغن آغشته نباشد قابل رنگ کردن است .</li>
</ul>

<p>&nbsp;</p>

<p><span style="color:#008080"><span style="font-size:16px">کاربرد :</span></span></p>

<p>برای عایق کردن اتصالات (مفاصل ) ، درزها ، انشعابات درها و قاب پنجره ها ، اجزای از پیش ساخته ، پله ها ، دودکش، کانال ، بام و همچنین برای عایق کردن ترک روی دیوار ، لازم به ذکر است این ماستیک ها به آجر، بتن ، گچ کاری ، چوب ، شیشه ، کاشی های سرامیکی ، فلز و PVC های سفت می چسبد .</p>

<p>&nbsp;</p>

<p><span style="color:#008080">بسته بندی :</span> کارتریج</p>

<p><span style="color:#008080">رنگ بندی </span>: سفید ، طوسی</p>

<p><span style="color:#008080">طول عمر :</span> در محل خشک و خنک ، در دمای بین 5 تا 25 سانتی گراد ، اگر بسته بندی آن باز نشود ، 12 ماه ماندگار است .</p>
', 10000, N'017d9175576142539828d866dc03baa5.png', CAST(N'2018-05-19T12:47:55.000' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1047, 5, N'ساده', NULL, NULL, NULL, N'<p><span style="color:#008080"><strong>&nbsp; &nbsp;عایقهای حرارتی ایزوپایپ ( الاستومری ) محصول مشترک یونان و اسپانیا</strong></span></p>

<p style="text-align:justify"><br />
&nbsp; &nbsp;عـایقهای حرارتی ایزوپایپ دارای 52 گواهی از بیش از 30 موسسه استاندارد جهانی و دارای 20 سال گارانتی می&zwnj;باشد.<br />
همچنین این عـایقهـا دارای مشخصات منحصربفردی چون عدم انتشار گازهای سمی در زمان حریق ،دارای خواص آنتی باکتریال ، آنتی میکروبال و ضد قارچ و همچنین دارای کمترین ضریب انتقال حرارتی در کل زمان طول عمر عایق است.<br />
<br />
&nbsp; &nbsp;عایقهـای حرارتـی ( الاستومری ) در دو نوع&nbsp; (NBR (nitrile butadiene rubber و<br />
&nbsp; &nbsp; (EPDM (ethylene propene diene methylene میباشد.<br />
<br />
تفاوت عمده میان این دو نوع بیشتر در بازه دمایی است. بدین معنا که بازه دمایی NBR&nbsp; بین 50- تا 110 درجه سانتیگـراد بوده و در ساختمانهایی بکار برده میشود که دارای سیستمهـای تهویه و گرمـازایی عـادی می باشند. اما EPDM دارای بازه دمایی 50- تا 135 درجه سانتیگـراد بوده و برای لولـه&zwnj;ها و مخازن بخار مورد مصرف دارد.</p>

<p style="text-align:justify">&nbsp;</p>

<p style="text-align:justify"><span style="color:#008080"><strong>عایق حرارتی برودتی رولی ساده</strong></span></p>

<p style="text-align:justify">&nbsp; &nbsp;این نوع عایقها برای عایق&zwnj;کاری کانالها و سطوح پهن مناسب بوده و همچنین می&zwnj;توان جهت استفاده برای لوله&zwnj;هایی با قطر بیش از 76 سانت به بالا برای صرفه&zwnj;جویی تا 40 درصد در هزینه استفاده کرد.</p>

<p>&nbsp;</p>
', 80000, N'cddc96ac1af5491fb1965e980e2c307c.png', CAST(N'2018-05-21T13:11:59.000' AS DateTime), 1)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1048, 5, N'پشت چسبدار ساده', NULL, NULL, NULL, N'<p><span style="color:#008080"><strong>روکش چسبدار ساده</strong></span></p>

<p style="text-align: justify;">&nbsp;عایقهای رولی برای عایق&zwnj;کاری کانالهـا و سطوح پهـن مناسب بوده و همچنین می&zwnj; توان جهت استفاده برای لوله&zwnj;هـایی با قطر بیش از 76 سانت و برای صرفه&zwnj;جویی تا 40 درصد در هزینه استفاده کرد. این عایقها دارای یک لایه چسب می باشد که این روکش چسب جهت نصب آسـان و صرفه جویی در زمان کـار بوده و دارای کیفیت چسبندگی&nbsp; بـالایـی در محل نصب می&zwnj; باشد.</p>

<p>&nbsp;</p>
', 58000, N'63e0bc197d254870824ad2cd3c492e9d.png', CAST(N'2018-05-21T13:31:18.000' AS DateTime), 1)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1049, 5, N'پشت چسبدار مسلح', NULL, NULL, NULL, N'<p><span style="color:#008080"><strong>روکش چسبدار مسلح</strong></span></p>

<p>این روکش جهت نصب آسان و صرفه جویی در زمان کـار بوده و دارای کیفیت بسیـار بالایی در محل چسباندن می&zwnj;بـاشد. همچنین الیـاف موجود در این روکش باعث استحکام هر چه بیشتر چسب می&zwnj;باشد.</p>

<p>&nbsp;</p>
', 10000, N'9b57ec2abf8b4a5d9e25cf019b6d0425.png', CAST(N'2018-05-21T18:30:33.000' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1050, 5, N'روکش آلومینیوم', NULL, NULL, NULL, N'<p><span style="color:#008080"><strong>&nbsp;&nbsp; عابق رولی با روکش آلومینیوم</strong></span></p>

<p style="text-align:justify">&nbsp;&nbsp; عابق رولی با روکش آلومیـنیوم برای استفاده از عـایق در فضای بیرونی مناسب بوده و از تـاثیر اشعه ماورای بنفش و همچنین آسیـبهای فیـزیکـی در برابر عایق محافظت میکند. همچنین این روکشها نیز دارای طول عمر بیشتر بوده و محصولات ایزو پـایـپ به بهترین روکشهـا بـا حداقل میزان سلفون غیرقابل اشتعال مجهز شده اند.</p>

<p style="text-align:justify">&nbsp;</p>

<p>&nbsp;&nbsp; ایـن عایقهـا دارای تنوع در روکشهـا به شرح ذیـل می&zwnj;باشد.</p>

<ul>
	<li>روکش آلومـینیـوم 130 میـکرون ( جهت فضـای خارجی )</li>
	<li>روکش آلومینیوم 170 میکرون مسلح ( جهت فصای خارجی )</li>
	<li>روکش آلومـینیـوم 240 میـکرون ( جهت فضـای خارجی )</li>
</ul>

<p>&nbsp;</p>

<p>&nbsp;</p>
', 10000, N'79d2064477dc4b08a283799c9c279322.png', CAST(N'2018-05-21T18:35:22.000' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1051, 5, N'روکش سولار', NULL, NULL, NULL, N'<p><big><span style="color:#008080"><strong>&nbsp;&nbsp; روکش سولار پروتکت ( انحصاراً برای ایـزوپـایپ )</strong></span></big></p>

<p style="text-align:justify"><br />
&nbsp;&nbsp; شرکت ایـزوپـایپ مخترع روکشهای سولار پروتکت بوده که بطور کامل مانع از برخورد اشعه UV و نفوذ رطوبت به عـایق می&zwnj;باشد. همچنیـن این روکشهـا دارای انعطاف بوده و برای نصب در محل خمش لوله&zwnj;هـا بسیـار منـاسب می&zwnj;بـاشد.</p>

<p>&nbsp;</p>
', 90000, N'01e5bd97ab6a4d359a2957f529a91b33.png', CAST(N'2018-05-21T18:46:19.000' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1052, 5, N'آلومینیم چسبدار', NULL, NULL, NULL, N'<p><span style="color:#008080"><strong>&nbsp;&nbsp; عایق حرارتی رولی یکطرف آلومینیم و یکطرف چسب</strong></span></p>

<p style="text-align:justify">&nbsp;&nbsp; این عایق هـا همزمان دارای روکش آلومینیـم جهت جلوگیری از اشعه ماوراء بنفش و چسب بـرای نصب سـریع و آسـان می بـاشد . ایـن عایقهـا در برابر آب و هوای بد ، نور خورشید و بخار آب مقاوم بوده وبه دلیل نقره ای بودن آلومینیم موجود در روکش ، نیـازی به رنگ کردن و پوشش ندارند .</p>

<p>&nbsp;</p>

<p style="text-align:justify">&nbsp; در ضمن شرکت ایـزو پـایـپ ایـن امکان را فـراهم نموده است که برحسب تقاضا و نیاز کارفرما ، اقدام به تولید عایقهای سفارشی نماید .</p>
', 10000, N'6131e901f33648bbb08cbb5ba13d468d.png', CAST(N'2018-05-21T19:01:35.000' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1053, 6, N'روکش آلومینیوم', NULL, NULL, NULL, N'<p style="text-align:start"><span style="color:rgb(0, 128, 128)"><strong>&nbsp;&nbsp; عـایق لوله ای بـا روکش آلومینیوم</strong></span></p>

<p style="text-align:justify">&nbsp;&nbsp; عـایق<strong> لوله ای</strong> بـا روکش آلومیـنیوم جهت عـایق&zwnj;کـاری لوله&zwnj;ها از قطر 5/8 تا 4 اینچ در ضخامتهای 9&nbsp; 13 و 19 بکار برده می&zwnj;شود و برای استفـاده از عـایق در فضـای بیرونی مناسب بوده و از تـاثیر اشعـه ماورای بنفش و همچنین آسیـبهای فیـزیکـی در برابر عـایق محافظت میکند. همچنین این روکشها نیز دارای طول عمر بیشتر بوده و محصولات ایزو پـایـپ به بهترین روکشهـا بـا حداقل میزان سلفون غیرقابل اشتعال مجهز شده اند.</p>

<p style="text-align:justify">&nbsp;</p>

<p style="text-align:start">&nbsp; &nbsp; &nbsp; ایـن عایقهـا دارای تنوع در روکشهـا به شرح ذیـل می&zwnj;باشد.</p>

<ul>
	<li>روکش آلومـینیـوم 130 میـکرون ( جهت فضـای خارجی )</li>
	<li>روکش آلومینیوم 170 میکرون مسلح ( جهت فصای خارجی )</li>
	<li>روکش آلومـینیـوم 240 میـکرون ( جهت فضـای خارجی )</li>
</ul>
', 78000, N'8cec5d163db444ea96e9751efe9882dc.png', CAST(N'2018-05-21T19:49:28.000' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1054, 6, N'شکافدار', NULL, NULL, NULL, N'<p><span style="color:#008080"><strong>عایق حرارتی لوله ای شکافدار</strong></span></p>

<p style="text-align: justify;">لوله هایی که در جهت طولشان قبـلا برش خورده اند و دارای نوار چسب و لبه ی همپوشانی چسبدار هستند. به طور چشمگیری زمان و هزینه کارگر برای نصب و اجرای عـایق را پـایین می آورد. محل اتصال لبـه های شکاف توسط نوار&nbsp;دو طرف چسبدار محکم ، کاملا به هم می چسبد . این عـایق ها برای سیستم هـای لولـه کشـی اجرا شده از قبل بهترین گزینه است .</p>

<p>&nbsp;</p>
', 10000, N'bea4172a5e374a1ca127ee69d637d0d1.png', CAST(N'2018-05-22T19:21:25.000' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1055, 6, N'روکش سولار', NULL, NULL, NULL, N'<p style="text-align:start"><big><span style="color:rgb(0, 128, 128)"><strong>روکش سولار پروتکت ( انحصاراً برای ایـزوپـایپ )</strong></span></big></p>

<p style="text-align:start">&nbsp;</p>

<p style="text-align:justify">&nbsp;&nbsp; جنس : پولیمر ویژه با غشا محافظ بیرونی که در برابر اشعه ماورا ء بنفش و عوامل جوی مقاوم است و در رنگ های نقره ای، مشکی و سفید موجود است .<br />
&nbsp;&nbsp;</p>

<p style="text-align:justify">&nbsp; &nbsp; SOLAR عایق های دو قلوی چسبدار و معمولی ما را امتحان کنید .</p>

<p style="text-align:start">ویژگیهای عایق</p>

<ul>
	<li style="text-align:start">مقاوم در برابر اشعه ماوراء بنفش و آب و هوای بد</li>
	<li style="text-align:start">مقاوم در برابر روغن و گریس</li>
	<li style="text-align:start">دارای لایه محافظ و مقاوم در&nbsp;برابر درجه حرارت تا دمای 80 &deg;C&nbsp;</li>
	<li style="text-align:start">عایق های&nbsp;ISOPIPE SOLAR نقره ای دارای مقدار کمی آ لومینیوم است.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
	<li style="text-align:start">نیازی به نوار، رنگ کردن و پوشش ندارد و به راحتی با الیاف مناسب تمیز می شود</li>
	<li style="text-align:start">ظاهر زیبا</li>
	<li style="text-align:start">نفوذپذیری : مقاومت بیشتر در برابر نفوذ بخار آب</li>
	<li style="text-align:start">مقاومت در برابر نور خورشید : بر خلاف دیگر محصولات ، عایق ایزوپایپ SOLAR تا چندین سال که در معرض مستقیم اشعه ما وراء بنفش قرار بگیرد ، ظاهر بی عیب خود را حفظ می کند .</li>
	<li style="text-align:start">انعطاف پذیری : عملکرد بلند مدت یک پارچه</li>
	<li style="text-align:start">طول عمر : بیش تر از 5 سال</li>
</ul>
', 10000, N'15cbc973201a48cf982b8ce6c0be532c.png', CAST(N'2018-05-22T19:27:09.000' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1056, 6, N'دوقلو', NULL, NULL, NULL, N'<p><span style="color:#008080"><strong>عایق دوقلو همراه سیم ارت (جهت پنل خورشیدی) :</strong></span></p>

<p>این عـایق شامل دو عـایق لولـه&zwnj;ایی بهم چسبیده کـه دارای روکش سـولار پروتکت می&zwnj;باشد که بهمراه سیم ارت موجود بهترین گزینه بـرای پنلهای خورشیـدی میباشد.</p>

<p>&nbsp;</p>
', 10000, N'9cc4930023c2482da100f6ccc637c1a0.png', CAST(N'2018-05-23T19:18:15.277' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1057, 7, N'ایزو چیپ', NULL, NULL, NULL, N'<p style="text-align:justify"><big><span style="color:rgb(0, 128, 128)"><strong>ISOCHIP ایزوچیپ</strong></span></big><br />
<br />
&nbsp;</p>

<p style="text-align:justify">ISOCHIP محصــول خلاقانــه ای از ISOPIPE بــا عملکــرد جــذب صــوت و حــرارت در کــف هــا اســت. ایــن عایــق بــه صــورت دانــه و خــرده لاســتیک هــای الاســتومریک ســلول بســته اســت . ISOCHIP بــه محصولــی کــه بــه راحتــی قابــل اســتفاده اســت تبدیــل شــده ، مناســب بــرای عایــق کــردن کــف هــای چوبــی اســت. بــا پــر کــردن فاصلــه بیــن بتــن و کــف ، خــرده هــای ISOCHIP یک عایــق صوتــی و حرارتــی خیلــی خــوب را بــه وجــود مــی آورنــد .ISOCHIP ترکیبی از عایــق صوتــی و حرارتــی است ، همچنین همزمان بـاعث ذخیـره انـرژی می شود .</p>

<p style="text-align:justify">&nbsp;</p>

<p style="text-align:justify">بــه موجــب ترکیــب خاصــش باعــث دفــع بیــد، موریانــه و حملــه هــر حشــره ای کــه مخـرب عایــق هــای ســنتی اســت ، مــی شــود .&nbsp; ISOCHIP ظرفیــت جــذب صــوت کــف را تــا درجــه Db ۶۵ افزایــش مــی دهــد.</p>

<p style="text-align:justify">&nbsp;</p>

<p style="text-align:justify">گرانولهای ISOCHIP جهت استفاده در زیر کفپوش&zwnj;های چوبی طراحی و ساخته شده و باعث عدم انتقال صدا و حرارت و عاری از CFC, HFC ,HCFC می&zwnj;باشد.</p>
', 10000, N'5f065929caac486585bacc07473e89ab.png', CAST(N'2018-05-23T19:20:58.000' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1058, 8, N'نوار درزگیر', NULL, NULL, NULL, N'<p><span style="color:#008080"><strong>نوار درزگیر&nbsp; ISOTAPE </strong></span></p>

<p>جهت بستن درز عایق برای افزایش کیفیت عایقکاری استفاده و دارای عملیات پشت چسبدار مسلح بوده که باعث استحکام بیشتر جهت درزگیری میشود.</p>

<p><br />
خصوصیات نوارهای درزگیر</p>

<ul>
	<li>نوارهای مقاوم و با دوام ، مناسب برای حفاظت و اتصالات عایق ها</li>
	<li>مقاوم در برابر نور خورشید به دلیل مقاومت در برابر UV</li>
	<li>اجرای سریع و راحت به دلیل عرض زیاد آن</li>
	<li>عمر طولانی</li>
	<li>موجود در رنگ های نقره ای ، مشکی و سفید</li>
</ul>
', 10000, N'e040748b8aa140d99db281fb663c087d.png', CAST(N'2018-05-23T19:46:36.100' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1059, 8, N'نوار درزگیر آلومینیم', NULL, NULL, NULL, N'<p><span style="color:#008080"><strong>نوار درزگیر آلومینیم</strong></span></p>

<p>جهت بستن درز عایق روکش آلومینیوم برای افزایش کیفیت عایقکاری استفاده و دارای دو نوع ساده و مسلح بوده که باعث استحکام بیشتر جهت درزگیری میشود.</p>

<p>مشخصات :</p>

<ul>
	<li>دارای چسب قوی و کارآمد به عرض 6 متر</li>
	<li>مناسب برای محدود کردن منطقه عایق کاری و مناسب برای سیستم های لوله کشی که در حال حاضر وجود دارند &nbsp;و در محیط هایی که عایق در معرض نور خورشید و یا عوامل فیزیکی قرار میگیرد .</li>
	<li>موجود در دو نوع UV PLUS&nbsp; وHD</li>
</ul>

<p>&nbsp;</p>
', 10000, N'fae875612c2b4e3490ab9326ef69025e.png', CAST(N'2018-05-24T20:16:42.000' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1060, 8, N'نوار عایق', NULL, NULL, NULL, N'<p><span style="color:#008080"><strong>نوار عایق</strong></span></p>

<ul>
	<li dir="rtl">نوار عایق با چسب قوی و کارآمد برای استفاده در جاهایی که عایق کاری&nbsp;دشوار است و یا برای عایق کردن فاصله ی بین دو عایق&nbsp;</li>
	<li>دارای نوار چسب خیلی قوی و مسلح</li>
	<li>نصب راحت و آسان</li>
	<li>دارای ساختار سلول بسته با ویژگی آنتی باکتریال</li>
</ul>
', 10000, N'e9af496c001743a6bcc0461669797fad.png', CAST(N'2018-05-24T20:27:31.000' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1061, 8, N'چسب مایع', NULL, NULL, NULL, N'<p><span style="color:#008080"><strong>چسب مایع</strong></span></p>

<p>چسب ایزوگلو با کیفیت اروپایی دارای دو بسته بندی در حجمهای 900 و 3000 گرمی میباشد. این چسب کاملا سازگار برای اتصال عایق های ایزو پایپ به یکدیگر است .</p>
', 10000, N'5ea55ae32c5942c693811b39b1f008d7.png', CAST(N'2018-05-24T20:36:46.953' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1062, 1013, N'عایق صوتی', NULL, NULL, NULL, N'<p style="text-align:start"><span style="font-size:14px"><span style="font-family:tahoma,geneva,sans-serif"><span style="color:rgb(0, 128, 128)"><strong><big>عایــق&nbsp; ISOSOUND</big></strong></span></span></span></p>

<p style="text-align:justify"><big><span style="font-size:14px"><span style="font-family:tahoma,geneva,sans-serif">&nbsp;&nbsp; عایــق&nbsp; ISOSOUND ، جــاذب جدیــد صــوت و عایــق صــدا بــا کارایــی بــالا کــه بــرای مصــارف مخصــوص تولیــد شــده اســت . ایــن عایــق از فــوم هــای الاســتومریک&nbsp; ســلول بــاز بــا پایــه لاســتیک هــای مصنوعــی ســاخته شــده اســت .</span></span></big></p>

<p style="text-align:justify"><br />
<big><span style="font-size:14px"><span style="font-family:tahoma,geneva,sans-serif">&nbsp;&nbsp; ایــن عایــق هــا جــاذب خیلــی خوبــی بــرای انــرژی صــوت هســتند(ضریــب جــذب آن تــا ٩8 درصــد&nbsp; اســت .) کــه محیــط آرام تــری فراهــم میکننــد.</span></span></big></p>

<p style="text-align:justify"><br />
<big><span style="font-size:14px"><span style="font-family:tahoma,geneva,sans-serif">&nbsp;ISOSOUND دارای مشــخصه هـای خیلــی خوبــی هماننــد شــاخص کاهــش صــوت سـنگین ، بـرای عایــق هــای صوتــی اســت.</span></span></big></p>

<p style="text-align:justify">&nbsp;</p>

<p style="text-align:justify"><big><span style="font-size:14px"><span style="font-family:tahoma,geneva,sans-serif"><span style="color:rgb(0, 128, 128)"><span style="background-color:rgb(255, 255, 255)">شرکت ایزوپایپ</span></span><span style="background-color:rgb(255, 255, 255)">&nbsp;تولید کننده برترین عایقهای صوتی در جهان است. این&nbsp;</span>عایــق هــا&nbsp;<span style="background-color:rgb(255, 255, 255)">با قابلیت جذب و برگشت&nbsp;</span>صــوت<span style="background-color:rgb(255, 255, 255)">&nbsp;بهترین و قویترین</span>عایــق<span style="background-color:rgb(255, 255, 255)">&nbsp;صوتی جهان بوده و علاوه بر عدم شعله</span><span style="background-color:rgb(255, 255, 255)">&nbsp;ور شدن دارای کیفیت کلاس 1 حریق نیز می باشد</span><span style="background-color:rgb(255, 255, 255)">.</span></span></span></big></p>

<p style="text-align:justify"><big><span style="font-size:14px"><span style="font-family:tahoma,geneva,sans-serif"><span style="background-color:rgb(255, 255, 255)">این&nbsp;</span>عایــق هــا<span style="background-color:rgb(255, 255, 255)">&nbsp;با دو چگالی تولید و عرضه</span><span style="background-color:rgb(255, 255, 255)">&nbsp;میگردد.</span></span></span></big></p>

<ul>
	<li style="text-align:justify"><big><span style="font-size:14px"><span style="font-family:tahoma,geneva,sans-serif"><span style="background-color:rgb(255, 255, 255)">چگالی 150 kg/m3</span></span></span></big></li>
	<li style="text-align:justify"><big><span style="font-size:14px"><span style="font-family:tahoma,geneva,sans-serif"><span style="background-color:rgb(255, 255, 255)">چگالی 250 kg/m3</span></span></span></big></li>
</ul>
', 10000, N'e157f61d89f74f3cb05c5abaee79c89e.png', CAST(N'2018-05-24T20:39:05.000' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1063, 9, N'ساده', NULL, NULL, NULL, N'<p><span style="color:#008080"><strong>&nbsp;&nbsp; عایق الاستومری</strong></span></p>

<p style="text-align:justify">&nbsp;&nbsp; عایــق هــای فومــی الاســتومریک مکروتکنیــک ، عایــق هــای حرارتــی بــا ســاختار ســلول بســته هســتند کــه در برابــر نفــوذ بخــار آب مقــاوم اســت. ایــن عایــق هــا عمومــا&quot; بــرای عایــق کاری ســطوحی بــا تراکــم بــالا اســتفاده مــی شــود .</p>

<p style="text-align:justify">&nbsp;&nbsp; عایــق هــای رولــی الاســتومریک مکــرو در ضخامــت و عــرض هــای مختــلف تولیــد مــی شــود . هدایــت گرمایــی پاییــن ، مقاومــت زیــاد در برابــر نفــوذ بخــار آب و مقاومــت در برابــر آتــش (B- s3 &ndash; d0 ) ایــن عایــق را بــه منتخــب عایــق هــا در تاسیســات مکانیکــی تبدیــل کــرده اســت<br />
در کنــار&nbsp; رول هــای اســتاندارد مکــرو ، رول هایــی بــا روکــش آلومینیــوم، آلومینیــوم / PVC و&nbsp; پشــت چســبدار بــرای حفاظــت در برابــر اشــعه مــاورا بنفــش و عایــق کاری بهتــر تولیــد مــی شــود.</p>

<p style="text-align:justify">&nbsp;</p>

<p style="text-align:justify">&nbsp;&nbsp; <span style="background-color:rgb(255, 255, 255); color:rgb(51, 51, 51); font-family:verdana,tahoma,sans-serif; font-size:14px">این نوع عایقها برای عایق&zwnj;کاری کانالها و سطوح پهن مناسب بوده و همچنین می&zwnj;توان جهت استفاده برای لوله&zwnj;هایی با قطر بیش از 76 سانت به بالا برای صرفه&zwnj;جویی تا 40 درصد در هزینه استفاده کرد.</span></p>
', 10000, N'fc888b1631fb4bcb8b1beec5f8afe6c5.png', CAST(N'2018-05-24T22:24:24.000' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1064, 9, N'پشت چسبدار ساده', NULL, NULL, NULL, N'<p style="text-align:start"><span style="color:rgb(0, 128, 128)"><strong>روکش چسبدار ساده</strong></span></p>

<p style="text-align:justify">&nbsp;عایقهای رولی برای عایق&zwnj;کاری کانالهـا و سطوح پهـن مناسب بوده و همچنین می&zwnj; توان جهت استفاده برای لوله&zwnj;هـایی با قطر بیش از 76 سانت و برای صرفه&zwnj;جویی تا 40 درصد در هزینه استفاده کرد. این عایقها دارای یک لایه چسب می باشد که این روکش چسب جهت نصب آسـان و صرفه جویی در زمان کـار بوده و دارای کیفیت چسبندگی&nbsp; بـالایـی در محل نصب می&zwnj; باشد.</p>

<p style="text-align:start">ایـن عـایقها بـا ســاختار ســلول بســتـه هســتند کــه در برابــر نفــوذ بخــار آب مقــاوم اســت. ایــن عایــق هــا عمومــا بــرای عایــق کاری ســطوحی بــا تراکــم بــالا اســتفاده مــی شــود</p>
', 10000, N'2ab8f5bc42c5418f968e826aba6b0353.png', CAST(N'2018-05-24T22:31:37.120' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1065, 9, N'پـشت چسبدار مـسلح', NULL, NULL, NULL, N'<p style="text-align:start"><span style="color:rgb(0, 128, 128)"><strong>عـایق ورقـه ای پـشت چسبـدار مـسـلح</strong></span></p>

<p style="text-align:start">این روکش جهت نصب آسان و صرفه جویی در زمان کـار بوده و دارای کیفیت بسیـار بالایی در محل چسباندن می&zwnj;بـاشد. همچنین الیـاف موجود در این روکش باعث استحکام هر چه بیشتر چسب و عـایق کاری بهتر میشود .</p>

<p style="text-align:start">&nbsp;</p>
', 10000, N'4e88700f32a94176a6a5e17c559470b9.png', CAST(N'2018-05-24T22:42:44.000' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1066, 9, N'روکش آلومینیوم', NULL, NULL, NULL, N'<p style="text-align:start"><span style="color:rgb(0, 128, 128)"><strong>عابق ورقه ای با روکش آلومینیوم</strong></span></p>

<p style="text-align:justify">&nbsp;&nbsp; عایق ورقه ای با روکش آلومیـنیوم برای استفاده از عـایق در فضای بیرونی مناسب بوده و از تـاثیر اشعه ماورای بنفش و همچنین آسیـبهای فیـزیکـی در برابر عایق محافظت میکند. همچنین این روکشها نیز دارای طول عمر بیشتر بوده و محصولات ماکروتکنیک به بهترین روکشهـا بـا حداقل میزان سلفون غیرقابل اشتعال مجهز شده اند.</p>

<p style="text-align:justify">&nbsp;</p>

<p style="text-align:start">&nbsp;&nbsp; ایـن عایقهـا دارای تنوع در روکشهـا به شرح ذیـل می&zwnj;باشد.</p>

<ul>
	<li>روکش آلومـینیـوم 130 میـکرون ( جهت فضـای خارجی )</li>
	<li>روکش آلومینیوم 170 میکرون مسلح ( جهت فصای خارجی )</li>
	<li>روکش آلومـینیـوم 240 میـکرون ( جهت فضـای خارجی )</li>
</ul>
', 10000, N'7c0159b1fe48465481512709d898b5a7.png', CAST(N'2018-05-24T22:46:58.463' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1067, 9, N'آلومینیم چسبدار', NULL, NULL, NULL, N'<p style="text-align:start"><span style="color:rgb(0, 128, 128)"><strong>عـایق حرارتی ورقـه ای یکطـرف آلـومینیم و یکطـرف چسب</strong></span></p>

<p style="text-align:justify">&nbsp;&nbsp; این عایق هـا همزمان دارای روکش آلومینیـم جهت جلوگیری از اشعه ماوراء بنفش و چسب بـرای نصب سـریع و آسـان می بـاشد . ایـن عایقهـا در برابر آب و هوای بد ، نور خورشید و بخار آب مقاوم بوده وبه دلیل نقره ای بودن آلومینیم موجود در روکش ، نیـازی به رنگ کردن و پوشش ندارند .</p>

<p style="text-align:start">&nbsp;</p>

<p style="text-align:justify">&nbsp;</p>
', 10000, N'b88352cc504f4687ab0dc0bd0baf59df.png', CAST(N'2018-05-24T22:50:17.000' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1068, 10, N'روکش آلومینیوم', NULL, NULL, NULL, N'<p style="text-align:start"><span style="color:rgb(0, 128, 128)"><strong>عـایق لوله ای بـا روکش آلومینیوم</strong></span></p>

<p style="text-align:justify">&nbsp;&nbsp; &nbsp;عایــق هــای لولــه ای الاســتومر یک مکــرو در ضخامــت&nbsp; و قطــر هــای مختلف برای کاربردهــای مختلــف تولیــد مــی شــود . عـلـاوه بــر ایــن لولــه هــا ی ISIDEM COOLFLEX ، اســتاندارد هــای حریــق BL - s2 &ndash; d0&nbsp; را تامیــن مــی کنــد. ایــن عایــق هــا در سیســتم هــای بــرودت ، لولــه کشــی هــای تهویــه مطبــوع و همچنیــن لولــه کشــی آب ســرد و گــرم اســتفاده مــی شــود</p>

<p style="text-align:justify">&nbsp;</p>

<p style="text-align:start">&nbsp; &nbsp; &nbsp; ســطح خارجــی عایــق هــا را روکــش آلومینیــوم مــی کشــند تــا مقاومــت آن در برابــر اثــرات خارجــی&nbsp; وهمچنیــن طــول عمــرش افزایــش یابــد .</p>

<p style="text-align:start"><br />
&nbsp;&nbsp;&nbsp; بســته بــه محــل نصــب و کاربــرد عایــق ،&nbsp; نــوع پلیمــر و ضخامــت روکــش آلومینیــوم مصرفــی مشــخص مــی شــود.</p>

<p style="text-align:justify"><br />
&nbsp;&nbsp;&nbsp; عایــق هــای لولــه ای بــا روکــش آلومینیــوم ، از نظــر زمــان و هزینــه بســیار مقــرون بــه صرفــه اســت. نصــب آن راحــت و آســان اســت. انعطــاف پذیــر اســت&nbsp; وهنــگام نصــب خــرد نمــی شــود . بــه دلیــل مقاومــت در برابــر&nbsp; اشــعه مــاورا بنفــش ، طــول عمــر آن هــا افزایــش مــی یابــد بــه ویــژه در فضــا هــای بــاز . بــا توجــه بــه آنکــه در فضاهــای بــاز عایــق بــه عنــوان یــک مانــع در برابــر بخــار آب اســتفاده مــی شــود ، ضریــب مقاومــت در برابــر بخــار آب در آن بســیار بیشــتر از عایــق هــای بــدون روکــش اســت . ایــن عایــق هــا بســیار مناســب بــرای سیســتم هــای برودتــی ، لولــه هــای آب گــرم و دیــگ هــای بخــار اســت.</p>

<p>&nbsp;</p>
', 10000, N'00f886fbe0ff4e8e8bbf7692299e5dea.png', CAST(N'2018-05-24T22:57:38.000' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1069, 10, N'شکافدار', NULL, NULL, NULL, N'<p style="text-align:start"><span style="color:rgb(0, 128, 128)"><strong>عایق حرارتی لوله ای شکافدار</strong></span></p>

<p style="text-align:justify">لوله هایی که در جهت طولشان قبـلا برش خورده اند و دارای نوار چسب و لبه ی همپوشانی چسبدار هستند. به طور چشمگیری زمان و هزینه کارگر برای نصب و اجرای عـایق را پـایین می آورد. محل اتصال لبـه های شکاف توسط نوار&nbsp;دو طرف چسبدار محکم ، کاملا به هم می چسبد . این عـایق ها برای سیستم هـای لولـه کشـی اجرا شده از قبل بهترین گزینه است .</p>
', 10000, N'efdb23753b67482985b3d0c4a7df915e.png', CAST(N'2018-05-24T23:02:40.770' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1070, 10, N'دوقلو', NULL, NULL, NULL, N'<p style="text-align:start"><span style="color:rgb(0, 128, 128)"><strong>عـایق دوقلو همـراه سیم ارت (جهت پنل خورشیدی) :</strong></span></p>

<p style="text-align:start">این عـایق شامل دو عـایق لولـه&zwnj;ایی بهم چسبیـده کـه دارای روکش سـولار پروتکت می&zwnj;باشد که بهمراه سیم ارت موجود بهترین گزینه بـرای پنلهای خورشیـدی میباشد.</p>

<p style="text-align:start">&nbsp;</p>
', 10000, N'81840710917c4734b35b7ab0acda4c08.png', CAST(N'2018-05-24T23:04:58.497' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1076, 1019, N'لوله', NULL, NULL, NULL, N'<table class="tbl_list" style="border-collapse:collapse; border:2px solid rgb(221, 221, 221); color:black; font-family:byekan,tahoma; margin:1px auto; padding:0px; text-align:justify; width:1053px">
	<tbody>
		<tr>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">ردیف</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">سایز</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">کد</th>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">20</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6100001</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">25</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6100002</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">3</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">32</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6100003</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">4</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">40</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6100004</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">5</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">50</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6100005</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">63</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6100007</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">75</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6100009</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">8</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">90</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6100010</td>
		</tr>
	</tbody>
</table>
', 10000, N'196eb8d32a9240ab93af30652e34bdd7.jpg', CAST(N'2020-01-05T11:18:09.810' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1077, 1019, N'بوشن', NULL, NULL, NULL, N'<table class="tbl_list" style="border-collapse:collapse; border:2px solid rgb(221, 221, 221); color:black; font-family:byekan,tahoma; margin:1px auto; padding:0px; text-align:justify; width:1053px">
	<tbody>
		<tr>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">ردیف</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">سایز</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">کد</th>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">20</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6180001</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">25</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6180002</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">3</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">32</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6180003</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">4</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">40</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6180004</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">5</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">50</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6180005</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">63</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6180006</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">75</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6180007</td>
		</tr>
	</tbody>
</table>
', 60000, N'8dfd66b980f640899b348b603f2375d0.jpg', CAST(N'2020-01-05T11:22:21.673' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1078, 1019, N'زانو 90 درجه', NULL, NULL, NULL, N'<table class="tbl_list" style="border-collapse:collapse; border:2px solid rgb(221, 221, 221); color:black; font-family:byekan,tahoma; margin:1px auto; padding:0px; text-align:justify; width:1053px">
	<tbody>
		<tr>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">ردیف</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">سایز</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">کد</th>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">20</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6060001</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">25</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6060002</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">3</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">32</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6060003</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">4</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">40</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6060004</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">5</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">50</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6060005</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">63</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6060006</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">75</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6060007</td>
		</tr>
	</tbody>
</table>
', 30000, N'7bb17ba4e4e940b3bfec15efe39305ad.jpg', CAST(N'2020-01-05T11:24:59.057' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1079, 1019, N'زانو تبدیل 90 درجه', NULL, NULL, NULL, N'<table class="tbl_list" style="border-collapse:collapse; border:2px solid rgb(221, 221, 221); color:black; font-family:byekan,tahoma; margin:1px auto; padding:0px; text-align:justify; width:1053px">
	<tbody>
		<tr>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">ردیف</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">سایز</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">کد</th>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">20 * 25</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6020001</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">25 * 32</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6020002</td>
		</tr>
	</tbody>
</table>
', 10000, N'd2230b79f5b04bb68d72e06768547cb8.jpg', CAST(N'2020-01-05T11:27:15.220' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1080, 1019, N'زانو 45 درجه ', NULL, NULL, NULL, N'<table class="tbl_list" style="border-collapse:collapse; border:2px solid rgb(221, 221, 221); color:black; font-family:byekan,tahoma; margin:1px auto; padding:0px; text-align:justify; width:1053px">
	<tbody>
		<tr>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">ردیف</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">سایز</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">کد</th>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">20</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6030001</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">25</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6030002</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">3</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">32</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6030003</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">4</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">40</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6030004</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">5</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">50</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6030005</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">63</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6030006</td>
		</tr>
	</tbody>
</table>
', 10000, N'7b21ef807bf84d168892cc99eddf7ff1.jpg', CAST(N'2020-01-05T11:31:56.937' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1081, 1019, N'سه راه ساده ', NULL, NULL, NULL, N'<table class="tbl_list" style="border-collapse:collapse; border:2px solid rgb(221, 221, 221); color:black; font-family:byekan,tahoma; margin:1px auto; padding:0px; text-align:justify; width:1053px">
	<tbody>
		<tr>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">ردیف</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">سایز</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">کد</th>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">20</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6210001</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">25</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6210002</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">3</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">32</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6210003</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">4</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">40</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6210004</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">5</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">50</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6210005</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">63</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6210006</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">75</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6210007</td>
		</tr>
	</tbody>
</table>
', 10000, N'3503c21f801c418dbd478caf4ce5996e.jpg', CAST(N'2020-01-05T11:34:26.180' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1082, 1019, N'سه راهی تبدیل ', NULL, NULL, NULL, N'<table class="tbl_list" style="border-collapse:collapse; border:2px solid rgb(221, 221, 221); color:black; font-family:byekan,tahoma; margin:1px auto; padding:0px; text-align:justify; width:1040px">
	<tbody>
		<tr>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">ردیف</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">سایز</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">کد</th>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">25 * 20 * 25</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6240001</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">20 * 20 * 25</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6240002</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">3</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">20 * 25 * 25</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6240003</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">4</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">20 * 20 * 32</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6240004</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">5</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">32 * 20 * 32</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6240005</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">25 * 20 * 32</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6240011</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">20 * 25 * 32</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6240006</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">8</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">32 * 25 * 32</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6240007</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">9</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">25 * 25 * 32</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6240008</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">10</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">20 * 32 * 32</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6240009</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">11</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">25 * 32 * 32</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6240010</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">12</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">40 * 20 * 40</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6240012</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">13</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">32 * 25 * 40</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6240013</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">14</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">40 * 25 * 40</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6240014</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">15</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">25 * 25 * 40</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6240015</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">16</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">40 * 32 * 40</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6240016</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">17</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">50 * 32 * 50</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6240017</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">18</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">50 * 40 * 50</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6240018</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">19</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">63 * 50 * 63</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6240019</td>
		</tr>
	</tbody>
</table>
', 10000, N'b75230a19efe41489fa53f63f07e1b4a.jpg', CAST(N'2020-01-05T11:37:01.763' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1083, 1019, N'تبدیل', NULL, NULL, NULL, N'<table class="tbl_list" style="border-collapse:collapse; border:2px solid rgb(221, 221, 221); color:black; font-family:byekan,tahoma; margin:1px auto; padding:0px; text-align:justify; width:1040px">
	<tbody>
		<tr>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">ردیف</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">سایز</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">کد</th>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">20 * 25</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6120001</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">20 * 32</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6120002</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">3</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">25 * 32</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6120003</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">4</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">20 * 40</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6120004</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">5</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">25 * 40</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6120005</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">32 * 40</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6120006</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">20 * 50</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6120007</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">8</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">25 * 50</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6120008</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">9</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">32 * 50</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6120009</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">10</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">40 * 50</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6120010</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">11</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">32 * 63</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6120011</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">12</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">40 * 63</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6120012</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">13</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">50 * 63</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6120013</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">14</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">40 * 75</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6120014</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">15</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">50 * 75</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6120015</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">16</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">63 * 75</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6120016</td>
		</tr>
	</tbody>
</table>
', 10000, N'7620c8589d1142c2bf25744d4d9454a3.jpg', CAST(N'2020-01-05T11:38:20.713' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1084, 1019, N'پل', NULL, NULL, NULL, N'<table class="tbl_list" style="border-collapse:collapse; border:2px solid rgb(221, 221, 221); color:black; font-family:byekan,tahoma; margin:1px auto; padding:0px; text-align:justify; width:1053px">
	<tbody>
		<tr>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">ردیف</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">سایز</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">کد</th>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">20</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6080001</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">25</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6080002</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">3</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">32</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6080003</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">4</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">40</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6080004</td>
		</tr>
	</tbody>
</table>
', 10000, N'5849780b18dc4abcae1c521e8b18f544.jpg', CAST(N'2020-01-05T11:39:19.257' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1085, 1019, N'پل کوتاه بوشن دار', NULL, NULL, NULL, N'<table class="tbl_list" style="border-collapse:collapse; border:2px solid rgb(221, 221, 221); color:black; font-family:byekan,tahoma; margin:1px auto; padding:0px; text-align:justify; width:1053px">
	<tbody>
		<tr>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">ردیف</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">سایز</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">کد</th>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">20</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6080005</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">25</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6080006</td>
		</tr>
	</tbody>
</table>
', 10000, N'e30dbd0885a54e6cb6fdc24cc2ef48ff.jpg', CAST(N'2020-01-05T11:41:19.203' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1086, 1019, N'اتصال بوشن فلزی ', NULL, NULL, NULL, N'<table class="tbl_list" style="border-collapse:collapse; border:2px solid rgb(221, 221, 221); color:black; font-family:byekan,tahoma; margin:1px auto; padding:0px; text-align:justify; width:1053px">
	<tbody>
		<tr>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">ردیف</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">سایز</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">کد</th>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1/2 * 20</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6140001</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1/2 * 25</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6140004</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">3</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">3/4 * 25</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6140003</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">4</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">&quot;1 * 32</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6140011</td>
		</tr>
	</tbody>
</table>
', 10000, N'5d48fc7381724d0b8488ca07e45fc6af.jpg', CAST(N'2020-01-05T11:42:53.353' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1087, 1019, N'بوشن فلزی آچارخور', NULL, NULL, NULL, N'<table class="tbl_list" style="border-collapse:collapse; border:2px solid rgb(221, 221, 221); color:black; font-family:byekan,tahoma; margin:1px auto; padding:0px; text-align:justify; width:1053px">
	<tbody>
		<tr>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">ردیف</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">سایز</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">کد</th>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">&quot;1 * 32</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6140005</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1/1/4 * 40</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6140006</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">3</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1/1/2 * 50</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6140007</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">4</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">&quot;2 * 63</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6140008</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">5</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2/1/2 * 75</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6140009</td>
		</tr>
	</tbody>
</table>
', 10000, N'50bcf45ddf2e48b88bbe798c63c48f3c.jpg', CAST(N'2020-01-05T11:45:20.377' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1088, 1019, N'اتصال مغزی دار با لایه پلیمری داخلی', NULL, NULL, NULL, N'<table class="tbl_list" style="border-collapse:collapse; border:2px solid rgb(221, 221, 221); color:black; font-family:byekan,tahoma; margin:1px auto; padding:0px; text-align:justify; width:1053px">
	<tbody>
		<tr>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">ردیف</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">سایز</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">کد</th>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1/2 * 20</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6170001</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1/2 * 25</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6170002</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">3</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">3/4 * 25</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6170003</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">4</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">&quot;1 * 32</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6170009</td>
		</tr>
	</tbody>
</table>
', 10000, N'fce6c442a4fa486a9420404fccb75fcb.jpg', CAST(N'2020-01-05T11:46:44.717' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1089, 1019, N'اتصال مغزی دار', NULL, NULL, NULL, N'<table class="tbl_list" style="border-collapse:collapse; border:2px solid rgb(221, 221, 221); color:black; font-family:byekan,tahoma; margin:1px auto; padding:0px; text-align:justify; width:1053px">
	<tbody>
		<tr>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">ردیف</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">سایز</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">کد</th>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1/2*20</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6170015</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">3/4*25</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6170017</td>
		</tr>
	</tbody>
</table>
', 10000, N'99198a3cf8d94275b6a77f6c4a2f9476.jpg', CAST(N'2020-01-05T11:48:50.770' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1090, 1019, N'اتصال مغزی دار آچارخور با لایه پلیمری داخلی', NULL, NULL, NULL, N'<table class="tbl_list" style="border-collapse:collapse; border:2px solid rgb(221, 221, 221); color:black; font-family:byekan,tahoma; margin:1px auto; padding:0px; text-align:justify; width:1053px">
	<tbody>
		<tr>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">ردیف</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">سایز</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">کد</th>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">&quot;1 * 32</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6170004</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1/1/4 * 40</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6170005</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">3</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1/1/2 * 50</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6170006</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">4</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">&quot;2 * 63</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6170007</td>
		</tr>
	</tbody>
</table>
', 10000, N'28ba236b58694f42a89e7fc36a7f28b1.jpg', CAST(N'2020-01-05T11:51:02.263' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1091, 1019, N'زانو بوشن دار', NULL, NULL, NULL, N'<table class="tbl_list" style="border-collapse:collapse; border:2px solid rgb(221, 221, 221); color:black; font-family:byekan,tahoma; margin:1px auto; padding:0px; text-align:justify; width:1053px">
	<tbody>
		<tr>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">ردیف</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">سایز</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">کد</th>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1/2 * 20</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6040001</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">3/4 * 20</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6040002</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">3</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1/2 * 25</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6040003</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">4</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">3/4 * 25</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6040004</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">5</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">3/4 * 32</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6040005</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">&quot;1 * 32</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6040012</td>
		</tr>
	</tbody>
</table>
', 10000, N'd562f966e57a4536ad0f1f4f676ceeed.jpg', CAST(N'2020-01-05T11:53:30.740' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1092, 1019, N'زانو بوشن دار آچار خور', NULL, NULL, NULL, N'<table class="tbl_list" style="border-collapse:collapse; border:2px solid rgb(221, 221, 221); color:black; font-family:byekan,tahoma; margin:1px auto; padding:0px; text-align:justify; width:1053px">
	<tbody>
		<tr>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">ردیف</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">سایز</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">کد</th>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">&quot;1 * 32</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6040006</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1/1/4 * 40</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6040007</td>
		</tr>
	</tbody>
</table>
', 10000, N'c1fa744289ed40fe80cbcdb57c8a10a1.jpg', CAST(N'2020-01-05T11:55:37.887' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1093, 1019, N'زانو بوشن دار بست دار', NULL, NULL, NULL, N'<table class="tbl_list" style="border-collapse:collapse; border:2px solid rgb(221, 221, 221); color:black; font-family:byekan,tahoma; margin:1px auto; padding:0px; text-align:justify; width:1053px">
	<tbody>
		<tr>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">ردیف</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">سایز</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">کد</th>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1/2 * 20</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6040008</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">3/4 * 20</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6040009</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">3</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1/2 * 25</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6040011</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">4</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">3/4 * 25</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6040010</td>
		</tr>
	</tbody>
</table>
', 10000, N'bd06bf6971944eaf986fbe7d1e7574d3.jpg', CAST(N'2020-01-05T11:57:01.790' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1094, 1019, N'زانو بوشن دار دوقلو', NULL, NULL, NULL, N'<table class="tbl_list" style="border-collapse:collapse; border:2px solid rgb(221, 221, 221); color:black; font-family:byekan,tahoma; margin:1px auto; padding:0px; text-align:justify; width:1053px">
	<tbody>
		<tr>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">ردیف</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">سایز</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">کد</th>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1/2 * 20</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6040013</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1/2 * 25</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6040014</td>
		</tr>
	</tbody>
</table>
', 10000, N'89064538047b4fe19fcade5814bb958e.jpg', CAST(N'2020-01-05T12:00:56.167' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1095, 1019, N'زانو مغزی بست دار با لایه پلیمری داخلی', NULL, NULL, NULL, N'<table class="tbl_list" style="border-collapse:collapse; border:2px solid rgb(221, 221, 221); color:black; font-family:byekan,tahoma; margin:1px auto; padding:0px; text-align:justify; width:1053px">
	<tbody>
		<tr>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">ردیف</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">سایز</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">کد</th>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1/2 * 20</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6050006</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">3/4 * 20</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6050007</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">3</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1/2 * 25</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6050008</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">4</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">3/4 * 25</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6050009</td>
		</tr>
	</tbody>
</table>
', 10000, N'6cf5e3ed4fd7435393e2fd591b7928ef.jpg', CAST(N'2020-01-05T12:02:07.690' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1096, 1019, N'زانو مغزی دار آچارخور', NULL, NULL, NULL, N'<table class="tbl_list" style="border-collapse:collapse; border:2px solid rgb(221, 221, 221); color:black; font-family:byekan,tahoma; margin:1px auto; padding:0px; text-align:justify; width:1053px">
	<tbody>
		<tr>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">ردیف</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">سایز</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">کد</th>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">&quot;1 * 32</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6050004</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">3/4 * 32</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6050005</td>
		</tr>
	</tbody>
</table>
', 10000, N'a5878a9df82b44bdb155133d0ac382c8.jpg', CAST(N'2020-01-05T12:05:25.427' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1097, 1019, N'سه راه بوشن دار', NULL, NULL, NULL, N'<table class="tbl_list" style="border-collapse:collapse; border:2px solid rgb(221, 221, 221); color:black; font-family:byekan,tahoma; margin:1px auto; padding:0px; text-align:justify; width:1053px">
	<tbody>
		<tr>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">ردیف</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">سایز</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">کد</th>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1/2 * 20</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6130001</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1/2 * 25</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6130003</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">3</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">3/4 * 25</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6130002</td>
		</tr>
	</tbody>
</table>
', 10000, N'99f5c70ebdfe4e3e95390b39c7efb212.jpg', CAST(N'2020-01-05T12:06:34.593' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1098, 1019, N'سه راه بوشن بست دار', NULL, NULL, NULL, N'<table class="tbl_list" style="border-collapse:collapse; border:2px solid rgb(221, 221, 221); color:black; font-family:byekan,tahoma; margin:1px auto; padding:0px; text-align:justify; width:1053px">
	<tbody>
		<tr>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">ردیف</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">سایز</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">کد</th>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1/2 * 20</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6130004</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1/2 * 25</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6130005</td>
		</tr>
	</tbody>
</table>
', 10000, N'599b92c12712491a91bf9d7714ae25da.jpg', CAST(N'2020-01-05T12:07:18.233' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1099, 1019, N'شیر تک ضرب', NULL, NULL, NULL, N'<table class="tbl_list" style="border-collapse:collapse; border:2px solid rgb(221, 221, 221); color:black; font-family:byekan,tahoma; margin:1px auto; padding:0px; text-align:justify; width:1053px">
	<tbody>
		<tr>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">ردیف</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">سایز</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">کد</th>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">20</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6150001</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">25</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6150002</td>
		</tr>
	</tbody>
</table>
', 10000, N'f81b4798e21e4e239d65935758eded54.jpg', CAST(N'2020-01-05T12:08:14.353' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1100, 1019, N'شیر کشویی', NULL, NULL, NULL, N'<table class="tbl_list" style="border-collapse:collapse; border:2px solid rgb(221, 221, 221); color:black; font-family:byekan,tahoma; margin:1px auto; padding:0px; text-align:justify; width:1053px">
	<tbody>
		<tr>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">ردیف</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">سایز</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">کد</th>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">20</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6160001</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">25</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6160002</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">3</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">32</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6160003</td>
		</tr>
	</tbody>
</table>
', 10000, N'89c15794b7d44666a18ef2de138e549a.jpg', CAST(N'2020-01-05T12:09:01.587' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1101, 1019, N'مهره ماسوره', NULL, NULL, NULL, N'<table class="tbl_list" style="border-collapse:collapse; border:2px solid rgb(221, 221, 221); color:black; font-family:byekan,tahoma; margin:1px auto; padding:0px; text-align:justify; width:1053px">
	<tbody>
		<tr>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">ردیف</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">سایز</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">کد</th>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1/2 * 20</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6090001</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">3/4 * 25</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6090002</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">3</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">&quot;1 * 32</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6090003</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">4</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1/1/4 * 40</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6090004</td>
		</tr>
	</tbody>
</table>
', 10000, N'30089d84aaea4c14b93ff9adb4dd0224.jpg', CAST(N'2020-01-05T12:10:11.473' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1102, 1019, N'مهره ماسوره پلیمری', NULL, NULL, NULL, N'<table class="tbl_list" style="border-collapse:collapse; border:2px solid rgb(221, 221, 221); color:black; font-family:byekan,tahoma; margin:1px auto; padding:0px; text-align:justify; width:1053px">
	<tbody>
		<tr>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">ردیف</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">سایز</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">کد</th>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">20</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6090009</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">25</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6090010</td>
		</tr>
	</tbody>
</table>
', 10000, N'1a9c63bc6c4e4435b4918d578e701efc.jpg', CAST(N'2020-01-05T12:11:14.203' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1103, 1019, N'مهره ماسوره مغزی دار', NULL, NULL, NULL, N'<table class="tbl_list" style="border-collapse:collapse; border:2px solid rgb(221, 221, 221); color:black; font-family:byekan,tahoma; margin:1px auto; padding:0px; text-align:justify; width:1053px">
	<tbody>
		<tr>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">ردیف</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">سایز</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">کد</th>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1/2 * 20</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6090007</td>
		</tr>
	</tbody>
</table>
', 10000, N'6d70eba1149c4d26bba47f7218cebef0.jpg', CAST(N'2020-01-05T12:13:28.000' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1104, 1019, N'کپ', NULL, NULL, NULL, N'<table class="tbl_list" style="border-collapse:collapse; border:2px solid rgb(221, 221, 221); color:black; font-family:byekan,tahoma; margin:1px auto; padding:0px; text-align:justify; width:1053px">
	<tbody>
		<tr>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">ردیف</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">سایز</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">کد</th>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">20</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6220001</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">25</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6220002</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">3</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">32</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6220003</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">4</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">40</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6220004</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">5</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">50</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6220005</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">63</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6220006</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">63</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6220006</td>
		</tr>
	</tbody>
</table>
', 10000, N'f31f9c19aa4c4804ad9e895aaa9a56fa.jpg', CAST(N'2020-01-05T12:14:21.020' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1105, 1019, N'بست دیواری ساده', NULL, NULL, NULL, N'<table class="tbl_list" style="border-collapse:collapse; border:2px solid rgb(221, 221, 221); color:black; font-family:byekan,tahoma; margin:1px auto; padding:0px; text-align:justify; width:1053px">
	<tbody>
		<tr>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">ردیف</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">سایز</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">کد</th>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">20</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6070001</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">25</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6070002</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">3</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">32</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6070003</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">4</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">40</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6070004</td>
		</tr>
	</tbody>
</table>
', 10000, N'1f22e6d3efcf40759e041ed0ee112a72.jpg', CAST(N'2020-01-05T12:15:15.190' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1106, 1019, N'بست دو قلو', NULL, NULL, NULL, N'<table class="tbl_list" style="border-collapse:collapse; border:2px solid rgb(221, 221, 221); color:black; font-family:byekan,tahoma; margin:1px auto; padding:0px; text-align:justify; width:1053px">
	<tbody>
		<tr>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">ردیف</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">سایز</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">کد</th>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">20</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6070005</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">25</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6070006</td>
		</tr>
	</tbody>
</table>
', 10000, N'3c74185d9ba2414c9b3fcf6168ad2e91.jpg', CAST(N'2020-01-05T12:16:15.233' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1107, 1019, N'بست دوتایی', NULL, NULL, NULL, N'<table class="tbl_list" style="border-collapse:collapse; border:2px solid rgb(221, 221, 221); color:black; font-family:byekan,tahoma; margin:1px auto; padding:0px; text-align:justify; width:1053px">
	<tbody>
		<tr>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">ردیف</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">سایز</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">کد</th>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">20</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6070007</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">25</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6070008</td>
		</tr>
	</tbody>
</table>
', 10000, N'7a305b949a694db0b2aaa862812cc0e9.jpg', CAST(N'2020-01-05T12:16:50.797' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1108, 1019, N'بست شیر مخلوط', NULL, NULL, NULL, N'<table class="tbl_list" style="border-collapse:collapse; border:2px solid rgb(221, 221, 221); color:black; font-family:byekan,tahoma; margin:1px auto; padding:0px; text-align:justify; width:1053px">
	<tbody>
		<tr>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">ردیف</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">سایز</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">کد</th>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">20</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6010001</td>
		</tr>
	</tbody>
</table>
', 10000, N'c338cef115b64a13922f5fc27d5bc769.jpg', CAST(N'2020-01-05T12:17:42.650' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1109, 1019, N'درپوش رزوه دار کوتاه', NULL, NULL, NULL, N'<table class="tbl_list" style="border-collapse:collapse; border:2px solid rgb(221, 221, 221); color:black; font-family:byekan,tahoma; margin:1px auto; padding:0px; text-align:justify; width:1053px">
	<tbody>
		<tr>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">ردیف</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">سایز</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">کد</th>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">20</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6190001</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">25</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6190002</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">3</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">32</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6190003</td>
		</tr>
	</tbody>
</table>
', 10000, N'e94a48bb976f4071afda4e4a2a36337b.jpg', CAST(N'2020-01-05T12:18:41.943' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1110, 1019, N'درپوش بلند کونیک دار', NULL, NULL, NULL, N'<table class="tbl_list" style="border-collapse:collapse; border:2px solid rgb(221, 221, 221); color:black; font-family:byekan,tahoma; margin:1px auto; padding:0px; text-align:justify; width:1053px">
	<tbody>
		<tr>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">ردیف</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">سایز</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">کد</th>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">20</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6190004</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">25</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6190005</td>
		</tr>
	</tbody>
</table>
', 10000, N'f361c4795a154fb7b0b5ace4a65e3859.jpg', CAST(N'2020-01-05T12:19:37.613' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1111, 1018, N'لوله یک سر سوکت', NULL, NULL, NULL, N'<p>&nbsp;</p>

<table class="tbl_list" style="border-collapse:collapse; border:2px solid rgb(221, 221, 221); color:black; font-family:byekan,tahoma; margin:1px auto; padding:0px; text-align:justify; width:500px">
	<tbody>
		<tr>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">ردیف</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">سایز</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">کد</th>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">50-150</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2010001</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">50-250</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2010002</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">3</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">50-500</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2010003</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">4</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">50-1000</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2010004</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">5</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">50-2000</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2010005</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">50-3000</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2010006</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">75-150</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2020001</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">8</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">75-250</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2020002</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">9</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">75-500</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2020003</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">10</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">75-1000</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2020004</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">11</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">75-2000</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2020005</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">12</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">75-3000</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2020006</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">13</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">110-150</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2030001</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">14</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">110-250</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2030002</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">15</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">110-500</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2030003</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">16</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">110-1000</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2030004</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">17</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">110-2000</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2030005</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">18</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">110-3000</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2030006</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">19</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">125-150</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2040001</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">20</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">125-250</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2040002</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">21</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">125-500</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2040003</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">22</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">125-1000</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2040004</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">23</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">125-2000</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2040005</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">24</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">125-3000</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2040006</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">25</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">160-150</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2050001</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">26</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">160-250</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2050002</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">27</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">160-500</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2050003</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">28</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">160-1000</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2050004</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">29</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">160-2000</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2050005</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">30</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">160-3000</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2050006</td>
		</tr>
	</tbody>
</table>

<p>&nbsp;</p>
', 10000, N'fa620cf22e4c4e7797f731f26926b94c.jpg', CAST(N'2020-01-05T12:23:15.000' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1112, 1018, N'لوله دو سر سوکت', NULL, NULL, NULL, N'<table class="tbl_list" style="border-collapse:collapse; border:2px solid rgb(221, 221, 221); color:black; font-family:byekan,tahoma; margin:1px auto; padding:0px; text-align:justify; width:600px">
	<tbody>
		<tr>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">ردیف</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">سایز</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">کد</th>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">50-500</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2110001</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">50-1000</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2110002</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">3</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">50-2000</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2110003</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">4</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">50-3000</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2110004</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">5</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">75-500</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2120001</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">75-1000</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2120002</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">75-2000</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2120003</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">8</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">75-3000</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2120004</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">9</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">110-500</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2130001</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">10</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">110-1000</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2130002</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">11</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">110-2000</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2130003</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">12</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">110-3000</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2130004</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">13</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">125-500</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2140001</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">14</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">125-1000</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2140002</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">15</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">125-2000</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2140003</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">16</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">125-3000</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2140004</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">17</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">160-500</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2150001</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">18</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">160-1000</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2150002</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">19</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">160-2000</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2150003</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">20</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">160-3000</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2150004</td>
		</tr>
	</tbody>
</table>
', 10000, N'91becaa1ba4243029bea5e0a5d15b310.jpg', CAST(N'2020-01-05T12:23:48.000' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1113, 5, N'سه راه تبدیل 45 درجه', NULL, NULL, NULL, N'<table class="tbl_list" style="border-collapse:collapse; border:2px solid rgb(221, 221, 221); color:black; font-family:byekan,tahoma; margin:1px auto; padding:0px; text-align:justify; width:600px">
	<tbody>
		<tr>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">ردیف</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">سایز</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">کد</th>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">50 * 75</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2230001</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">50 * 110</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2230002</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">3</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">75 * 110</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2230003</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">4</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">110 * 125</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2230004</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">5</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">110 * 160</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2230005</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">125 * 160</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2230006</td>
		</tr>
	</tbody>
</table>
', 10000, N'c3d8c2a749b04e6fbd40b9485e815188.jpg', CAST(N'2020-01-05T12:24:26.000' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1114, 1018, N'تبدیل', NULL, NULL, NULL, N'<table class="tbl_list" style="border-collapse:collapse; border:2px solid rgb(221, 221, 221); color:black; font-family:byekan,tahoma; margin:1px auto; padding:0px; text-align:justify; width:600px">
	<tbody>
		<tr>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">ردیف</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">سایز</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">کد</th>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">50 * 75</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2250001</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">50 * 110</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2250002</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">3</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">75 * 110</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2250003</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">4</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">110 * 125</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2250004</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">5</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">110 * 160</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2250005</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">125 * 160</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2250006</td>
		</tr>
	</tbody>
</table>
', 10000, N'f294f39adfd74862ac89862cbc0f55d6.jpg', CAST(N'2020-01-05T12:25:06.000' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1115, 1018, N'سه راه 45 درجه', NULL, NULL, NULL, N'<table class="tbl_list" style="border-collapse:collapse; border:2px solid rgb(221, 221, 221); color:black; font-family:byekan,tahoma; margin:1px auto; padding:0px; text-align:justify; width:1053px">
	<tbody>
		<tr>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">ردیف</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">سایز</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">کد</th>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">50</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2220001</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">75</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2220002</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">3</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">110</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2220003</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">4</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">125</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2220004</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">5</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">160</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2220005</td>
		</tr>
	</tbody>
</table>
', 10000, N'855c6fdf6de44e1795d563d242bc4060.jpg', CAST(N'2020-01-05T12:26:06.717' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1116, 1018, N'سه راه بازدید', NULL, NULL, NULL, N'<table class="tbl_list" style="border-collapse:collapse; border:2px solid rgb(221, 221, 221); color:black; font-family:byekan,tahoma; margin:1px auto; padding:0px; text-align:justify; width:1053px">
	<tbody>
		<tr>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">ردیف</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">سایز</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">کد</th>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">50</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2270001</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">75</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2270002</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">3</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">110</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2270003</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">4</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">125</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2270004</td>
		</tr>
	</tbody>
</table>
', 10000, N'a930fc9fa5744f2e9495b667b7ea751f.jpg', CAST(N'2020-01-05T12:27:59.007' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1117, 1018, N'بوشن', NULL, NULL, NULL, N'<table class="tbl_list" style="border-collapse:collapse; border:2px solid rgb(221, 221, 221); color:black; font-family:byekan,tahoma; margin:1px auto; padding:0px; text-align:justify; width:1053px">
	<tbody>
		<tr>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">ردیف</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">سایز</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">کد</th>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">50</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2240001</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">75</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2240002</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">3</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">110</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2240003</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">4</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">125</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2240004</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">5</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">160</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2240005</td>
		</tr>
	</tbody>
</table>
', 10000, N'2f69f1d7b7a14a16b6a7e85a7c321627.jpg', CAST(N'2020-01-05T12:28:55.817' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1118, 1018, N'درپوش تست', NULL, NULL, NULL, N'<table class="tbl_list" style="border-collapse:collapse; border:2px solid rgb(221, 221, 221); color:black; font-family:byekan,tahoma; margin:1px auto; padding:0px; text-align:justify; width:1066px">
	<tbody>
		<tr>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">ردیف</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">سایز</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">کد</th>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">50</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2280001</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">75</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2280002</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">3</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">110</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2280003</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">4</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">125</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2280004</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">5</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">160</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2280005</td>
		</tr>
	</tbody>
</table>
', 10000, N'06162cff439b4df38ad00f0aa6239c10.jpg', CAST(N'2020-01-05T12:29:38.580' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1119, 1018, N'سه راه 87 درجه', NULL, NULL, NULL, N'<table class="tbl_list" style="border-collapse:collapse; border:2px solid rgb(221, 221, 221); color:black; font-family:byekan,tahoma; margin:1px auto; padding:0px; text-align:justify; width:1066px">
	<tbody>
		<tr>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">ردیف</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">سایز</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">کد</th>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">50</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2220006</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">75</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2220007</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">3</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">110</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2220008</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">4</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">125</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2220009</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">5</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">160</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2220010</td>
		</tr>
	</tbody>
</table>
', 10000, N'a6888482e4934537a8ade8e63a0d5574.jpg', CAST(N'2020-01-05T12:30:21.670' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1120, 1018, N'سه راه تبدیل 87 درجه', NULL, NULL, NULL, N'<table class="tbl_list" style="border-collapse:collapse; border:2px solid rgb(221, 221, 221); color:black; font-family:byekan,tahoma; margin:1px auto; padding:0px; text-align:justify; width:1066px">
	<tbody>
		<tr>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">ردیف</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">سایز</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">کد</th>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">50 * 75</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2230007</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">50 * 110</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2230008</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">3</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">75 * 110</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2230009</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">4</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">110 * 125</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2230010</td>
		</tr>
	</tbody>
</table>
', 10000, N'bde5d003b0b0419e8ece5f671ae0fc07.jpg', CAST(N'2020-01-05T12:31:19.510' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1121, 1018, N'زانویی کوتاه 87 درجه', NULL, NULL, NULL, N'<table class="tbl_list" style="border-collapse:collapse; border:2px solid rgb(221, 221, 221); color:black; font-family:byekan,tahoma; margin:1px auto; padding:0px; text-align:justify; width:1066px">
	<tbody>
		<tr>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">ردیف</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">سایز</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">کد</th>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">50</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2210006</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">75</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2210007</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">3</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">110</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2210008</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">4</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">125</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2210009</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">5</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">160</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2210010</td>
		</tr>
	</tbody>
</table>
', 10000, N'c2e14bd0e1d64425a928e86e23f4eb98.jpg', CAST(N'2020-01-05T12:32:32.850' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1122, 1018, N'زانویی 45 درجه', NULL, NULL, NULL, N'<table class="tbl_list" style="border-collapse:collapse; border:2px solid rgb(221, 221, 221); color:black; font-family:byekan,tahoma; margin:1px auto; padding:0px; text-align:justify; width:1066px">
	<tbody>
		<tr>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">ردیف</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">سایز</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">کد</th>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">50</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2210001</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">75</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2210002</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">3</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">110</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2210003</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">4</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">125</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2210004</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">5</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">160</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2210005</td>
		</tr>
	</tbody>
</table>
', 10000, N'ea885520f0504d5dbf5706f88b3c3e21.jpg', CAST(N'2020-01-05T12:34:46.703' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1123, 1018, N'زانویی بلند 87 درجه', NULL, NULL, NULL, N'<table class="tbl_list" style="border-collapse:collapse; border:2px solid rgb(221, 221, 221); color:black; font-family:byekan,tahoma; margin:1px auto; padding:0px; text-align:justify; width:1066px">
	<tbody>
		<tr>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">ردیف</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">سایز</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">کد</th>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">110</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2210011</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">125</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2210012</td>
		</tr>
	</tbody>
</table>
', 10000, N'fa8442a77abd4432a8e6c405e2396ca0.jpg', CAST(N'2020-01-05T12:36:33.340' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1124, 1018, N'سیفون', NULL, NULL, NULL, N'<table class="tbl_list" style="border-collapse:collapse; border:2px solid rgb(221, 221, 221); color:black; font-family:byekan,tahoma; margin:1px auto; padding:0px; text-align:justify; width:1066px">
	<tbody>
		<tr>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">ردیف</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">سایز</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">کد</th>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">50</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2260001</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">75</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2260002</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">3</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">110*110</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2260004</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">4</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">110*125</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2260003</td>
		</tr>
	</tbody>
</table>
', 10000, N'f9df7cf1ef624433812faf3ccef07bf0.jpg', CAST(N'2020-01-05T12:38:25.037' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1125, 1018, N'سیفون بلند', NULL, NULL, NULL, N'<table class="tbl_list" style="border-collapse:collapse; border:2px solid rgb(221, 221, 221); color:black; font-family:byekan,tahoma; margin:1px auto; padding:0px; text-align:justify; width:1066px">
	<tbody>
		<tr>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">ردیف</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">سایز</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">کد</th>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">50 * 75</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2300003</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">75</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2300004</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">3</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">125*110</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2300005</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">4</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">125</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2300006</td>
		</tr>
	</tbody>
</table>
', 10000, N'0d499c3bb9c846d2b12f5473c82bd8f0.jpg', CAST(N'2020-01-05T12:40:08.077' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1126, 1018, N'سیفون یک تکه علم کوتاه', NULL, NULL, NULL, N'<table class="tbl_list" style="border-collapse:collapse; border:2px solid rgb(221, 221, 221); color:black; font-family:byekan,tahoma; margin:1px auto; padding:0px; text-align:justify; width:1066px">
	<tbody>
		<tr>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">ردیف</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">سایز</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">کد</th>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">50 * 75</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2290018</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">75</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2290016</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">3</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">110</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2290017</td>
		</tr>
	</tbody>
</table>
', 10000, N'd4e51257f3e84c51823e53ddd6fde473.jpg', CAST(N'2020-01-05T12:42:17.227' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1127, 1018, N'سیفون سوکت دار', NULL, NULL, NULL, N'<table class="tbl_list" style="border-collapse:collapse; border:2px solid rgb(221, 221, 221); color:black; font-family:byekan,tahoma; margin:1px auto; padding:0px; text-align:justify; width:1066px">
	<tbody>
		<tr>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">ردیف</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">سایز</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">کد</th>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">50</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2290001</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">75</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2290002</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">3</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">110</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2290003</td>
		</tr>
	</tbody>
</table>
', 10000, N'bfbea673d6f940f9b36b3f5257a97667.jpg', CAST(N'2020-01-05T12:43:37.410' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1128, 1018, N'رایزر سیفون پوش فیت', NULL, NULL, NULL, N'<table class="tbl_list" style="border-collapse:collapse; border:2px solid rgb(221, 221, 221); color:black; font-family:byekan,tahoma; margin:1px auto; padding:0px; text-align:justify; width:1066px">
	<tbody>
		<tr>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">ردیف</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">سایز</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">کد</th>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">50 * 75</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2300010</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">110 * 125</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2300012</td>
		</tr>
	</tbody>
</table>
', 10000, N'c7498def8e7c411b91270b0342dce61c.jpg', CAST(N'2020-01-05T12:44:30.390' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1129, 1018, N'دریچه بازدید', NULL, NULL, NULL, N'<table class="tbl_list" style="border-collapse:collapse; border:2px solid rgb(221, 221, 221); color:black; font-family:byekan,tahoma; margin:1px auto; padding:0px; text-align:justify; width:1066px">
	<tbody>
		<tr>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">ردیف</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">سایز</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">کد</th>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">50</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2310001</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">75</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2310002</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">3</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">110</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2310003</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">4</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">125</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2310004</td>
		</tr>
	</tbody>
</table>
', 10000, N'b213172aac26496687ac1f2ec89b4cb7.jpg', CAST(N'2020-01-05T12:45:14.577' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1130, 1018, N'عصایی پشت بام', NULL, NULL, NULL, N'<table class="tbl_list" style="border-collapse:collapse; border:2px solid rgb(221, 221, 221); color:black; font-family:byekan,tahoma; margin:1px auto; padding:0px; text-align:justify; width:1066px">
	<tbody>
		<tr>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">ردیف</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">سایز</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">کد</th>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">50</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">9320001</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">75</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">9320002</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">3</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">110</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">9320003</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">4</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">125</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">9320004</td>
		</tr>
	</tbody>
</table>
', 10000, N'56e156ebe6654685baa0bced54374f5b.jpg', CAST(N'2020-01-05T12:46:04.480' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1131, 1018, N'بست سقفی', NULL, NULL, NULL, N'<table class="tbl_list" style="border-collapse:collapse; border:2px solid rgb(221, 221, 221); color:black; font-family:byekan,tahoma; margin:1px auto; padding:0px; text-align:justify; width:1066px">
	<tbody>
		<tr>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">ردیف</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">سایز</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">کد</th>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">50</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">9330006</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">75</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">9330007</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">3</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">110</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">9330008</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">4</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">125</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">9330009</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">5</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">160</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">9330010</td>
		</tr>
	</tbody>
</table>
', 10000, N'e3c11149308b45c8b23f9fb08042883f.jpg', CAST(N'2020-01-05T12:46:54.400' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1132, 1018, N'بست دیواری', NULL, NULL, NULL, N'<table class="tbl_list" style="border-collapse:collapse; border:2px solid rgb(221, 221, 221); color:black; font-family:byekan,tahoma; margin:1px auto; padding:0px; text-align:justify; width:1066px">
	<tbody>
		<tr>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">ردیف</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">سایز</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">کد</th>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">50</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">9330001</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">75</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">9330002</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">3</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">110</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">9330003</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">4</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">125</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">9330004</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">5</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">160</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">9330005</td>
		</tr>
	</tbody>
</table>
', 10000, N'c95564c6e456462b9ad52bea564b31dd.jpg', CAST(N'2020-01-05T12:48:22.583' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1133, 1018, N'استاپر', NULL, NULL, NULL, N'<table class="tbl_list" style="border-collapse:collapse; border:2px solid rgb(221, 221, 221); color:black; font-family:byekan,tahoma; margin:1px auto; padding:0px; text-align:justify; width:1066px">
	<tbody>
		<tr>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">ردیف</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">سایز</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">کد</th>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">75</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">3130004</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">110</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">3130005</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">3</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">125</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">3130006</td>
		</tr>
	</tbody>
</table>
', 10000, N'7be077627e4e4e9bae584b4c402e44d0.jpg', CAST(N'2020-01-05T12:49:00.830' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1134, 1018, N'لوله بر و لوله پخ کن پایه دار', NULL, NULL, NULL, N'<table class="tbl_list" style="border-collapse:collapse; border:2px solid rgb(221, 221, 221); color:black; font-family:byekan,tahoma; margin:1px auto; padding:0px; text-align:justify; width:1066px">
	<tbody>
		<tr>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">ردیف</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">سایز</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">کد</th>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">----</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">3130002</td>
		</tr>
	</tbody>
</table>
', 10000, N'3659caa7644341c1a343f6d83e592e4e.jpg', CAST(N'2020-01-05T12:49:48.593' AS DateTime), 0)
GO
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1135, 1018, N'بست دیواری روکش دار', NULL, NULL, NULL, N'<table class="tbl_list" style="border-collapse:collapse; border:2px solid rgb(221, 221, 221); color:black; font-family:byekan,tahoma; margin:1px auto; padding:0px; text-align:justify; width:1066px">
	<tbody>
		<tr>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">ردیف</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">سایز</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">کد</th>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">50</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">9340001</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">75</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">9340002</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">3</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">110</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">9340003</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">4</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">125</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">9340004</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">5</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">160</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">9340005</td>
		</tr>
	</tbody>
</table>
', 10000, N'730322a54b9e4a66844e189a7829c558.jpg', CAST(N'2020-01-05T12:50:16.247' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1136, 1018, N'بست سقفی روکش دار', NULL, NULL, NULL, N'<table class="tbl_list" style="border-collapse:collapse; border:2px solid rgb(221, 221, 221); color:black; font-family:byekan,tahoma; margin:1px auto; padding:0px; text-align:justify; width:1066px">
	<tbody>
		<tr>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">ردیف</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">سایز</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">کد</th>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">50</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">9340006</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">75</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">9340007</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">3</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">110</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">9340008</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">4</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">125</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">9340009</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">5</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">160</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">9340010</td>
		</tr>
	</tbody>
</table>
', 10000, N'86c48fd536d548e5941b72bbe47bfe62.jpg', CAST(N'2020-01-05T12:50:54.730' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1137, 1018, N'بست سقفی (تی) ثابت روکش‏دار', NULL, NULL, NULL, N'<table class="tbl_list" style="border-collapse:collapse; border:2px solid rgb(221, 221, 221); color:black; font-family:byekan,tahoma; margin:1px auto; padding:0px; text-align:justify; width:1066px">
	<tbody>
		<tr>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">ردیف</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">سایز</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">کد</th>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">50</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">9340030</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">75</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">9340031</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">3</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">110</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">9340032</td>
		</tr>
	</tbody>
</table>
', 10000, N'13bb1f3c0ac341ec8a305fc3d4bff34b.jpg', CAST(N'2020-01-05T12:51:38.320' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1138, 1020, N'لوله پنج لایه', NULL, NULL, NULL, N'<table class="tbl_list" style="border-collapse:collapse; border:2px solid rgb(221, 221, 221); color:black; font-family:byekan,tahoma; margin:1px auto; padding:0px; text-align:justify; width:1066px">
	<tbody>
		<tr>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">ردیف</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">سایز</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">کد</th>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">16</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7100031</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">20</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7100032</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">3</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">25</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7100033</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">4</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">32</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7100034</td>
		</tr>
	</tbody>
</table>
', 10000, N'c6c0d74ff0204f32b934a8e68b51f9b1.jpg', CAST(N'2020-01-05T13:06:03.827' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1139, 1020, N'بوشن مساوی پرسی', NULL, NULL, NULL, N'<table class="tbl_list" style="border-collapse:collapse; border:2px solid rgb(221, 221, 221); color:black; font-family:byekan,tahoma; margin:1px auto; padding:0px; text-align:justify; width:1066px">
	<tbody>
		<tr>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">ردیف</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">سایز</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">کد</th>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">16</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7180001</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">20</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7180002</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">3</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">25</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7180003</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">4</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">32</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7180004</td>
		</tr>
	</tbody>
</table>
', 10000, N'3e71c592b4914f739a53a062cf0fa095.jpg', CAST(N'2020-01-05T13:06:57.730' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1140, 1020, N'بوشن تبدیل پرسی', NULL, NULL, NULL, N'<table class="tbl_list" style="border-collapse:collapse; border:2px solid rgb(221, 221, 221); color:black; font-family:byekan,tahoma; margin:1px auto; padding:0px; text-align:justify; width:1066px">
	<tbody>
		<tr>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">ردیف</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">سایز</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">کد</th>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">16 * 20</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7120001</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">16 * 25</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7120002</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">3</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">20 * 25</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7120003</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">4</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">16 * 32</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7120004</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">5</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">20 * 32</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7120005</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">25 * 32</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7120006</td>
		</tr>
	</tbody>
</table>
', 10000, N'5bea1a94ebe94e8e8f04db65afbd8261.jpg', CAST(N'2020-01-05T13:07:50.227' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1141, 1020, N'بوشن روپیچ پرسی', NULL, NULL, NULL, N'<table class="tbl_list" style="border-collapse:collapse; border:2px solid rgb(221, 221, 221); color:black; font-family:byekan,tahoma; margin:1px auto; padding:0px; text-align:justify; width:1066px">
	<tbody>
		<tr>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">ردیف</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">سایز</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">کد</th>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1/2 * 16</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7170001</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1/2 * 20</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7170002</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">3</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">3/4 * 20</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7170003</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">4</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">3/4 * 25</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7170004</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">5</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">&quot;1 * 25</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7170005</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">&quot;1 * 32</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7170006</td>
		</tr>
	</tbody>
</table>
', 10000, N'6726fe89e45647ea84d19d27b3f3d291.jpg', CAST(N'2020-01-05T13:08:50.833' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1142, 1020, N'بوشن توپیچ پرسی', NULL, NULL, NULL, N'<table class="tbl_list" style="border-collapse:collapse; border:2px solid rgb(221, 221, 221); color:black; font-family:byekan,tahoma; margin:1px auto; padding:0px; text-align:justify; width:1066px">
	<tbody>
		<tr>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">ردیف</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">سایز</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">کد</th>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1/2 * 16</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7140001</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1/2 * 20</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7140002</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">3</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">3/4 * 20</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7140003</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">4</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">3/4 * 25</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7140004</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">5</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">&quot;1 * 25</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7140005</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">&quot;1 * 32</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7140006</td>
		</tr>
	</tbody>
</table>
', 10000, N'2a5bc06fe7f846cbab4bcad3e21af25b.jpg', CAST(N'2020-01-05T13:09:28.473' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1143, 1020, N'زانو دیواری پرسی', NULL, NULL, NULL, N'<table class="tbl_list" style="border-collapse:collapse; border:2px solid rgb(221, 221, 221); color:black; font-family:byekan,tahoma; margin:1px auto; padding:0px; text-align:justify; width:1066px">
	<tbody>
		<tr>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">ردیف</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">سایز</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">کد</th>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1/2 * 16</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7040001</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1/2 * 20</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7040002</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">3</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">3/4 * 25</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7040010</td>
		</tr>
	</tbody>
</table>
', 10000, N'dce6491f7a804a2398ac843de1408b05.jpg', CAST(N'2020-01-05T13:10:03.877' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1144, 1020, N'زانو 90 مساوی پرسی', NULL, NULL, NULL, N'<table class="tbl_list" style="border-collapse:collapse; border:2px solid rgb(221, 221, 221); color:black; font-family:byekan,tahoma; margin:1px auto; padding:0px; text-align:justify; width:1066px">
	<tbody>
		<tr>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">ردیف</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">سایز</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">کد</th>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">16</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7060001</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">20</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7060002</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">3</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">25</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7060003</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">4</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">32</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7060004</td>
		</tr>
	</tbody>
</table>
', 10000, N'49771033dff44ac4acef5e57c9131c7f.jpg', CAST(N'2020-01-05T13:11:58.197' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1145, 1020, N'سه راه 90 دیواری پرسی', NULL, NULL, NULL, N'<table class="tbl_list" style="border-collapse:collapse; border:2px solid rgb(221, 221, 221); color:black; font-family:byekan,tahoma; margin:1px auto; padding:0px; text-align:justify; width:1066px">
	<tbody>
		<tr>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">ردیف</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">سایز</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">کد</th>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">16 * 1/2 * 16</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7130001</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">20 * 1/2 * 20</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7130002</td>
		</tr>
	</tbody>
</table>
', 10000, N'c7e17373eb1c4f129d4d53886fd55c82.jpg', CAST(N'2020-01-05T13:12:37.260' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1146, 1020, N'سه راه مساوی پرسی', NULL, NULL, NULL, N'<table class="tbl_list" style="border-collapse:collapse; border:2px solid rgb(221, 221, 221); color:black; font-family:byekan,tahoma; margin:1px auto; padding:0px; text-align:justify; width:1066px">
	<tbody>
		<tr>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">ردیف</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">سایز</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">کد</th>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">16</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7210001</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">20</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7210002</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">3</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">25</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7210003</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">4</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">32</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7210004</td>
		</tr>
	</tbody>
</table>
', 10000, N'a6614845f8934af1a588eb277d4d525b.jpg', CAST(N'2020-01-05T13:13:25.083' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1147, 1020, N'سه راه تبدیل پرسی', NULL, NULL, NULL, N'<table class="tbl_list" style="border-collapse:collapse; border:2px solid rgb(221, 221, 221); color:black; font-family:byekan,tahoma; margin:1px auto; padding:0px; text-align:justify; width:1053px">
	<tbody>
		<tr>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">ردیف</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">سایز</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">کد</th>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">16 * 20 * 16</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7240001</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">20 * 25 * 16</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7240015</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">3</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">16 * 16 * 20</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7240002</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">4</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">20 * 16 * 20</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7240003</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">5</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">16 * 20 * 20</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7240004</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">16 * 16 * 25</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7240005</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">20 * 16 * 25</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7240006</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">8</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">25 * 16 * 25</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7240007</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">9</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">20 * 20 * 25</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7240008</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">10</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">25 * 20 * 25</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7240009</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">11</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">16 * 20 * 25</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7240014</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">12</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">16 * 25 * 25</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7240016</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">13</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">20 * 25 * 25</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7240017</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">14</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">32 * 16 * 32</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7240010</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">15</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">32 * 20 * 32</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7240011</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">16</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">25 * 25 * 32</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7240012</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">17</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">32 * 25 * 32</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7240013</td>
		</tr>
	</tbody>
</table>
', 10000, N'0b07fc12404348748096dc7137326504.jpg', CAST(N'2020-01-05T13:14:35.160' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1148, 1020, N'مغزی و مغزی تبدیل', NULL, NULL, NULL, N'<table class="tbl_list" style="border-collapse:collapse; border:2px solid rgb(221, 221, 221); color:black; font-family:byekan,tahoma; margin:1px auto; padding:0px; text-align:justify; width:1066px">
	<tbody>
		<tr>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">ردیف</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">سایز</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">کد</th>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1/2</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7020001</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">3/4</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7020002</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">3</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">&quot;1</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7020003</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">4</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">3/4 * 1</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7030001</td>
		</tr>
	</tbody>
</table>
', 10000, N'1c3154c866f046c08d183537d270b664.jpg', CAST(N'2020-01-05T13:15:21.623' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1149, 1020, N'صفحه نصب', NULL, NULL, NULL, N'<table class="tbl_list" style="border-collapse:collapse; border:2px solid rgb(221, 221, 221); color:black; font-family:byekan,tahoma; margin:1px auto; padding:0px; text-align:justify; width:1066px">
	<tbody>
		<tr>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">ردیف</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">سایز</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">کد</th>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">تک</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7010001</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">دوبل</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7010002</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">3</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">280</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7010003</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">4</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">280 قوس دار</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7010005</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">5</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">500</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7010004</td>
		</tr>
	</tbody>
</table>
', 10000, N'da169a04cd2f4a9199df4125505ed3f4.jpg', CAST(N'2020-01-05T13:16:14.310' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1150, 1020, N'کلکتور نانو پات', NULL, NULL, NULL, N'<table class="tbl_list" style="border-collapse:collapse; border:2px solid rgb(221, 221, 221); color:black; font-family:byekan,tahoma; margin:1px auto; padding:0px; text-align:justify; width:1066px">
	<tbody>
		<tr>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">ردیف</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">سایز</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">کد</th>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2b</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7050013</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">3b</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7050014</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">3</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">4b</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7050015</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">4</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">5b</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7050016</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">5</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6b</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7050017</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7b</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7050018</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">8b</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7050019</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">8</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">9b</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7050020</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">9</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">10b</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7050021</td>
		</tr>
	</tbody>
</table>
', 10000, N'6eef5aad152f4a22bcafc1732e16d377.jpg', CAST(N'2020-01-05T13:17:02.243' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1151, 1020, N'جعبه کلکتور', NULL, NULL, NULL, N'<table class="tbl_list" style="border-collapse:collapse; border:2px solid rgb(221, 221, 221); color:black; font-family:byekan,tahoma; margin:1px auto; padding:0px; text-align:justify; width:1066px">
	<tbody>
		<tr>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">ردیف</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">سایز</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">کد</th>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">45 * 45</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7090001</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">45 * 65</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7090002</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">3</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">45 * 90</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7090003</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">4</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">بست و پایه</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7070001</td>
		</tr>
	</tbody>
</table>
', 10000, N'd5e7d4fa35064973ae7b6b7e822a6a75.jpg', CAST(N'2020-01-05T13:17:51.617' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1152, 1020, N'درپوش کلکتور', NULL, NULL, NULL, N'<table class="tbl_list" style="border-collapse:collapse; border:2px solid rgb(221, 221, 221); color:black; font-family:byekan,tahoma; margin:1px auto; padding:0px; text-align:justify; width:1066px">
	<tbody>
		<tr>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">ردیف</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">سایز</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">کد</th>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">&quot;1</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7190001</td>
		</tr>
	</tbody>
</table>
', 10000, N'5ef91a9092d34102ba1c6d91d2e82b74.jpg', CAST(N'2020-01-05T13:18:43.143' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1153, 1020, N'شیر کلکتور', NULL, NULL, NULL, N'<table class="tbl_list" style="border-collapse:collapse; border:2px solid rgb(221, 221, 221); color:black; font-family:byekan,tahoma; margin:1px auto; padding:0px; text-align:justify; width:1066px">
	<tbody>
		<tr>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">ردیف</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">سایز</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">کد</th>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1/2 * 16</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7160001</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1/2 * 20</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7160002</td>
		</tr>
	</tbody>
</table>
', 10000, N'acf3efb768f9416b8ec41eb513cc1c25.jpg', CAST(N'2020-01-05T13:19:27.330' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1154, 1020, N'حلقه استیل اتصالات پرسی', NULL, NULL, NULL, N'<table class="tbl_list" style="border-collapse:collapse; border:2px solid rgb(221, 221, 221); color:black; font-family:byekan,tahoma; margin:1px auto; padding:0px; text-align:justify; width:1066px">
	<tbody>
		<tr>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">ردیف</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">سایز</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">کد</th>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">16</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7080001</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">20</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7080002</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">3</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">25</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7080003</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">4</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">32</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7080004</td>
		</tr>
	</tbody>
</table>
', 10000, N'ccd0fce71a4e48c89750b79da854c349.jpg', CAST(N'2020-01-05T13:20:04.797' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1155, 1020, N'زانو چپقی پرسی', NULL, NULL, NULL, N'<table class="tbl_list" style="border-collapse:collapse; border:2px solid rgb(221, 221, 221); color:black; font-family:byekan,tahoma; margin:1px auto; padding:0px; text-align:justify; width:1066px">
	<tbody>
		<tr>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">ردیف</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">سایز</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">کد</th>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1/2 * 16</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7040003</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1/2 * 20</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7040004</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">3</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">3/4 * 20</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7040005</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">4</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">3/4 * 25</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7040006</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">5</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1 * 25</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7040007</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">6</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1 * 32</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7040008</td>
		</tr>
	</tbody>
</table>
', 10000, N'f35d50e1eccd4fe0af2196f1f90821ed.jpg', CAST(N'2020-01-05T13:21:08.997' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1156, 1020, N'سه راه 90 دیواری تبدیل پرسی', NULL, NULL, NULL, N'<table class="tbl_list" style="border-collapse:collapse; border:2px solid rgb(221, 221, 221); color:black; font-family:byekan,tahoma; margin:1px auto; padding:0px; text-align:justify; width:1066px">
	<tbody>
		<tr>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">ردیف</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">سایز</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">کد</th>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">20 * 1/2 * 16</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7130003</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">16 * 1/2 * 20</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7130004</td>
		</tr>
	</tbody>
</table>
', 10000, N'83c508884b204f04ae8dbf6841906b3b.jpg', CAST(N'2020-01-05T13:21:45.993' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1157, 1020, N'زانو صفحه دار توپیچ پرسی', NULL, NULL, NULL, N'<table class="tbl_list" style="border-collapse:collapse; border:2px solid rgb(221, 221, 221); color:black; font-family:byekan,tahoma; margin:1px auto; padding:0px; text-align:justify; width:1066px">
	<tbody>
		<tr>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">ردیف</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">سایز</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">کد</th>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1/2 * 16</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7040011</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1/2 * 20</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7040012</td>
		</tr>
	</tbody>
</table>
', 10000, N'351577d9282741aab56900f52e590b51.jpg', CAST(N'2020-01-05T13:22:21.820' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1158, 1020, N'زانو صفحه دار روپیچ پرسی', NULL, NULL, NULL, N'<table class="tbl_list" style="border-collapse:collapse; border:2px solid rgb(221, 221, 221); color:black; font-family:byekan,tahoma; margin:1px auto; padding:0px; text-align:justify; width:1066px">
	<tbody>
		<tr>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">ردیف</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">سایز</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">کد</th>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">3/4 * 16</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7040016</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">3/4 * 20</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7040017</td>
		</tr>
	</tbody>
</table>
', 10000, N'fa803e49356949a3b90b2e1455bb61cd.jpg', CAST(N'2020-01-05T13:23:17.957' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1159, 1020, N'شیر زانویی کوپلی', NULL, NULL, NULL, N'<table class="tbl_list" style="border-collapse:collapse; border:2px solid rgb(221, 221, 221); color:black; font-family:byekan,tahoma; margin:1px auto; padding:0px; text-align:justify; width:1066px">
	<tbody>
		<tr>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">ردیف</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">سایز</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">کد</th>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1 * 25</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7160014</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1 * 32</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7160015</td>
		</tr>
	</tbody>
</table>
', 10000, N'f78b41dcb8c6454885f2a3eb44abcecf.jpg', CAST(N'2020-01-05T13:23:56.940' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1160, 1020, N'شیر هواگیری', NULL, NULL, NULL, N'<table class="tbl_list" style="border-collapse:collapse; border:2px solid rgb(221, 221, 221); color:black; font-family:byekan,tahoma; margin:1px auto; padding:0px; text-align:justify; width:1066px">
	<tbody>
		<tr>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">ردیف</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">سایز</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">کد</th>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">---</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7160006</td>
		</tr>
	</tbody>
</table>
', 10000, N'23c5ed5d6b8c478f9195d605b3f4d2d7.jpg', CAST(N'2020-01-05T13:24:29.313' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1161, 1020, N'فوم لوله ای', NULL, NULL, NULL, N'<table class="tbl_list" style="border-collapse:collapse; border:2px solid rgb(221, 221, 221); color:black; font-family:byekan,tahoma; margin:1px auto; padding:0px; text-align:justify; width:1066px">
	<tbody>
		<tr>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">ردیف</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">سایز</th>
			<th style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">کد</th>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">1</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">16</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7220020</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">2</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">20</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7220021</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">3</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">25</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7220022</td>
		</tr>
		<tr>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">4</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">32</td>
			<td style="border-color:rgb(35, 31, 32) rgb(255, 255, 255); height:30px; text-align:center">7220023</td>
		</tr>
	</tbody>
</table>
', 10000, N'735ec8a4c2c445f28bf1976f224c1402.jpg', CAST(N'2020-01-05T13:25:02.797' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1162, 1021, N'رولی', NULL, NULL, NULL, N'<p dir="rtl" style="text-align:right">&nbsp;</p>

<p dir="rtl" style="text-align:right"><strong>عایق های فوم الاستومری K-FLEX</strong></p>

<p dir="rtl" style="text-align:right">عایق های رولی جهت عایق کاری کانال ها، مخازن، لوله های سایز بسیار بالا و اتصالات مورد استفاده قرار می گیرند. این عایق ها محصولی ایده آل برای جایگزینی با عایق های سنتی بوده و دارای کاربرد وسیعی در در صنایع مختلف از جمله: تهویه مطبوع (HVAC&amp;R) ساختمان، نفت، گاز، پتروشیمی غذایی،&nbsp; بهداشتی، دارویی، بیمارستانی، شیمیایی خودروسازی و ... می باشند. و نیز دارای تاییدیه ها و استاندارد های متعدد داخلی و خارجی می باشد.</p>

<p dir="rtl" style="text-align:right">&nbsp;</p>

<p dir="rtl" style="text-align:right">&nbsp;</p>

<p dir="rtl" style="text-align:center">&nbsp;جدول ضخامت ها</p>

<table border="10" style="border-collapse:collapse; border-color:rgb(10, 8, 120); border-spacing:0px; color:rgb(92, 92, 92); font-family:roboto,arial,sans-serif; font-size:15px; height:100px; margin:0px auto 10px; max-width:100%; width:430px">
	<tbody>
		<tr>
			<th scope="col" style="background-color:rgb(250, 248, 130); height:25.8438px; text-align:center; vertical-align:middle; width:266.016px">
			<p>ضخامت های رول&nbsp;</p>
			</th>
			<th scope="colgroup" style="background-color:rgb(201, 197, 197); width:132.266px">
			<p>عرض رول</p>
			</th>
		</tr>
		<tr>
			<th style="height:10px; text-align:center; vertical-align:bottom; width:266.016px">
			<p dir="ltr">6 - 9 - 13 - 16 - 19 - 25 - 32 - 40 - 50 mm</p>
			</th>
			<th style="background-color:rgb(201, 197, 197); width:132.266px">
			<p dir="ltr">1200/1000 mm</p>
			</th>
		</tr>
	</tbody>
</table>

<p dir="ltr" style="text-align:center">&nbsp;</p>

<p dir="rtl" style="text-align:right">&nbsp;</p>

<p dir="rtl" style="text-align:right">&nbsp;</p>

<p dir="rtl" style="text-align:center">&nbsp;جدول استانداردها</p>

<table border="10" cellpadding="5" cellspacing="5" style="border-collapse:collapse; border-color:rgb(189, 8, 56); border-spacing:0px; color:rgb(92, 92, 92); font-family:roboto,arial,sans-serif; font-size:15px; height:100px; margin:0px auto 10px; max-width:100%; width:835.2px">
	<tbody>
		<tr>
			<th style="vertical-align:middle; width:110px"><span style="color:rgb(51, 51, 153); font-family:arial,helvetica,sans-serif">INSO 16837&nbsp;</span></th>
			<th style="vertical-align:middle; width:110px"><span style="color:rgb(51, 51, 153); font-family:arial,helvetica,sans-serif">EN 14304&nbsp;</span></th>
			<th style="vertical-align:middle; width:112px"><span style="color:rgb(51, 51, 153); font-family:arial,helvetica,sans-serif">EN 13501&nbsp;</span></th>
			<th style="vertical-align:middle; width:108px"><span style="color:rgb(51, 51, 153); font-family:arial,helvetica,sans-serif">DIN 4102</span></th>
		</tr>
		<tr>
			<th style="vertical-align:middle; width:110px"><span style="color:rgb(51, 51, 153); font-family:arial,helvetica,sans-serif">ASTM E84&nbsp;</span></th>
			<th style="vertical-align:middle; width:110px"><span style="color:rgb(51, 51, 153); font-family:arial,helvetica,sans-serif">EN 12667</span></th>
			<th style="vertical-align:middle; width:112px"><span style="color:rgb(51, 51, 153); font-family:arial,helvetica,sans-serif">EN 12086</span></th>
			<th style="vertical-align:middle; width:108px"><span style="color:rgb(51, 51, 153); font-family:arial,helvetica,sans-serif">DIN 1988</span></th>
		</tr>
	</tbody>
</table>

<p dir="rtl" style="text-align:center"><br />
&nbsp;</p>

<p dir="rtl" style="text-align:justify">&nbsp;</p>

<p dir="rtl" style="text-align:right">&nbsp;<em><strong>&nbsp;انواع عایق های رول الاستومری:</strong></em></p>

<p dir="rtl" style="text-align:right">&nbsp;</p>

<p dir="rtl" style="text-align:justify"><span style="color:rgb(255, 0, 0)"><strong>1. عایق های رول K-FLEX SHEETS</strong></span></p>

<p dir="rtl" style="text-align:justify">&nbsp;</p>

<p dir="rtl" style="text-align:justify">این عایق ها، بهترین راه حل برای عایق کاری کانال ها،مخازن و لوله های سایز بالا و ... می باشند و نصب را بسیار آسان و سریع می کنند.</p>

<p dir="rtl" style="text-align:justify">&nbsp;</p>

<p dir="rtl" style="text-align:justify">ویژگی ها:</p>

<p dir="rtl" style="text-align:justify">- استفاده آسان و سریع</p>

<p dir="rtl" style="text-align:justify">- اقتصادی</p>

<p dir="rtl" style="text-align:justify">- انعطاف پذیری بالا</p>

<p dir="rtl" style="text-align:justify">&nbsp;</p>

<p dir="rtl" style="text-align:justify">&nbsp;</p>

<p dir="rtl" style="text-align:right"><span style="color:rgb(255, 0, 0)"><strong>&nbsp;2. عایق های روکش دار K-FLEX</strong></span></p>

<p dir="rtl" style="text-align:right"><br />
سیستم AL CLAD (روکش آلومینیومی) K-FLEX یک سیستم تکمیل شده عایق های الاستومری بوده که با روکش آلومینیوم چند لایه پوشش داده می شود.<br />
این عایق ها بواسطه ویژگی های فیزیکی خود در مقابل اشعه ماورا بنفش (UV) و ذرات ریز معلق در هوا و ضربات فیزیکی مقاوم می باشند.<br />
در عین حال، این عایق ها با داشتن اتصالات و ملزومات نصب پیش ساخته، نصب و نگهداری را بسیار آسان و&nbsp;سریع می نمایند.</p>

<p dir="rtl" style="text-align:right">&nbsp;</p>

<p dir="rtl" style="text-align:right">ویژگی ها:</p>

<p dir="rtl" style="text-align:justify">- تطبیق پذیر و قابل انعطاف</p>

<p dir="rtl" style="text-align:justify">- هزینه نصب و نگهداری اقتصادی</p>

<p dir="rtl" style="text-align:justify">- مقاوم در برابر UV و ضربات</p>

<p dir="rtl" style="text-align:justify">- دارای ظاهری مناسب و زیبا</p>

<p dir="rtl" style="text-align:justify">- افزایش طول عمر و کارآیی</p>

<p dir="rtl" style="text-align:right">&nbsp;</p>

<p dir="rtl" style="text-align:center">&nbsp;جدول&nbsp;سایز عایق های رول ساده و روکش دار مسلح</p>

<table border="10" cellpadding="5" cellspacing="5" style="border-collapse:collapse; border-color:rgb(8, 161, 74); border-spacing:0px; color:rgb(92, 92, 92); font-family:roboto,arial,sans-serif; font-size:15px; height:100px; margin:0px auto 10px; max-width:100%; width:835.2px">
	<tbody>
		<tr>
			<th style="vertical-align:middle; width:110px"><span style="color:rgb(51, 51, 153); font-family:arial,helvetica,sans-serif">130 ساده</span></th>
			<th style="vertical-align:middle; width:110px"><span style="color:rgb(0, 0, 128)">130 مسلح</span></th>
			<th rowspan="2" style="vertical-align:middle; width:112px"><span style="color:rgb(0, 0, 128)">400 میکرون</span></th>
		</tr>
		<tr dir="rtl">
			<th style="vertical-align:middle; width:110px"><span style="color:rgb(0, 0, 128); font-family:arial,helvetica,sans-serif">230 ساده</span></th>
			<th style="vertical-align:middle; width:110px"><span style="color:rgb(0, 0, 128); font-family:arial,helvetica,sans-serif">230 مسلح</span></th>
		</tr>
	</tbody>
</table>

<p dir="rtl" style="text-align:justify">&nbsp;</p>

<p dir="rtl" style="text-align:right">&nbsp;</p>

<p dir="rtl" style="text-align:right">&nbsp;</p>

<p dir="rtl" style="text-align:right"><span style="color:rgb(255, 0, 0)"><strong>3. عایق های چسبدار K-FLEX</strong></span></p>

<p dir="rtl" style="text-align:right"><br />
عایق های چسبدار بهترین گزینه برای عایقکاری کانال ها می باشند و موجب افزایش سرعت و سهولت نصب می گردند.</p>

<p dir="rtl" style="text-align:justify">- خود چسبدار ساده</p>

<p dir="rtl" style="text-align:justify">- خود چسبدار مسلح</p>
', 10000, N'6ebd8c29f5714b95810719d780f74a80.jpg', CAST(N'2020-01-07T15:02:02.823' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1163, 1021, N'لوله ای', NULL, NULL, NULL, N'<p dir="rtl" style="text-align:right">&nbsp;</p>

<p style="text-align:right">عایق های لوله ای جهت عایق کاری کلیه لوله های مسی، فولادی و پنج لایه با کاربرد وسیع و مورد استفاده در صنایع مختلف از جمله: تهویه مطبوع، ساختمان، نفت، گاز، پتروشیمی غذایی، بهداشتی، دارویی، بیمارستانی، شیمیایی، خودروسازی و ... می باشد..</p>

<p style="text-align:right">&nbsp;</p>

<p style="text-align:right">&nbsp;</p>

<p dir="rtl" style="text-align:center">&nbsp;&nbsp;جدول ضخامت ها</p>

<table border="10" style="border-collapse:collapse; border-color:rgb(10, 8, 120); border-spacing:0px; color:rgb(92, 92, 92); font-family:roboto,arial,sans-serif; font-size:15px; height:120px; margin:0px auto 10px; max-width:100%; width:510px">
	<tbody>
		<tr>
			<th scope="col" style="background-color:rgb(250, 248, 130); height:25.8438px; text-align:center; vertical-align:middle; width:152px">
			<p>قطر لوله</p>
			</th>
			<th scope="col" style="background-color:rgb(250, 248, 130); height:25.8438px; text-align:center; vertical-align:middle; width:238px">
			<p>ضخامت های لوله&nbsp;</p>
			</th>
			<th scope="col" style="background-color:rgb(250, 248, 130); height:25.8438px; text-align:center; vertical-align:middle; width:75px">
			<p>طول</p>
			</th>
		</tr>
		<tr>
			<th style="height:10px; text-align:center; vertical-align:bottom; width:152px">
			<p dir="ltr">6 to 114 mm</p>
			</th>
			<th style="height:10px; text-align:center; vertical-align:bottom; width:238px">
			<p dir="ltr">6 - 9 - 13 - 16 - 19 - 25 - 32 - 40 - 50 mm</p>
			</th>
			<th style="height:10px; text-align:center; vertical-align:bottom; width:75px">
			<p dir="ltr">2 m</p>
			</th>
		</tr>
	</tbody>
</table>

<p dir="rtl" style="text-align:center">&nbsp;</p>

<p style="text-align:right">&nbsp;</p>

<p style="text-align:center">جدول استانداردها&nbsp;</p>

<table border="10" cellpadding="5" cellspacing="5" style="border-collapse:collapse; border-color:rgb(189, 8, 56); border-spacing:0px; color:rgb(92, 92, 92); font-family:roboto,arial,sans-serif; font-size:15px; height:100px; margin:0px auto 10px; max-width:100%; width:835.2px">
	<tbody>
		<tr>
			<th style="vertical-align:middle; width:110px"><span style="color:rgb(51, 51, 153); font-family:arial,helvetica,sans-serif">INSO 16837&nbsp;</span></th>
			<th style="vertical-align:middle; width:110px"><span style="color:rgb(51, 51, 153); font-family:arial,helvetica,sans-serif">EN 14304&nbsp;</span></th>
			<th style="vertical-align:middle; width:112px"><span style="color:rgb(51, 51, 153); font-family:arial,helvetica,sans-serif">EN 13501&nbsp;</span></th>
			<th style="vertical-align:middle; width:108px"><span style="color:rgb(51, 51, 153); font-family:arial,helvetica,sans-serif">DIN 4102</span></th>
		</tr>
		<tr>
			<th style="vertical-align:middle; width:110px"><span style="color:rgb(51, 51, 153); font-family:arial,helvetica,sans-serif">ASTM E84&nbsp;</span></th>
			<th style="vertical-align:middle; width:110px"><span style="color:rgb(51, 51, 153); font-family:arial,helvetica,sans-serif">EN 12667</span></th>
			<th style="vertical-align:middle; width:112px"><span style="color:rgb(51, 51, 153); font-family:arial,helvetica,sans-serif">EN 12086</span></th>
			<th style="vertical-align:middle; width:108px"><span style="color:rgb(51, 51, 153); font-family:arial,helvetica,sans-serif">DIN 1988</span></th>
		</tr>
	</tbody>
</table>

<p dir="rtl" style="text-align:center"><br />
&nbsp;</p>

<p dir="rtl" style="text-align:justify">&nbsp;</p>

<p style="text-align:right">&nbsp;</p>

<p dir="rtl" style="text-align:justify"><strong>انواع عایق های لوله ای:</strong></p>

<p dir="rtl" style="text-align:justify">1. ساده</p>

<p dir="rtl" style="text-align:justify">2. چاکدار</p>

<p dir="rtl" style="text-align:justify">3. روکش دار</p>

<p dir="rtl" style="text-align:justify">4. چاکدار چسبدار</p>

<p dir="rtl" style="text-align:justify">5. روکش دار چاکدار چسبدار&nbsp;</p>
', 10000, N'4e23f7df885d4425802b146ec9651fb2.jpg', CAST(N'2020-01-07T15:05:43.263' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1164, 1022, N'شانه تخم مرغی', NULL, NULL, NULL, N'<p><span style="color:rgb(71, 71, 71); font-family:iran; font-size:14px">این عایق ها که از جنس عایق های فوم الاستومری می باشند، به عنوان جاذب صوت در انواع دیواره ها، سقف ها، لوله ها، تجهیزات و ماشین آلات صنعتی و... مورد استفاده قرار می گیرند. این عایق ها به منظور سهولت در نصب به صورت خود چسبدار نیز قابل ارائه می باشد.</span></p>
', 10000, N'ad160fc8e7d14a36b58bc856d83269dd.jpg', CAST(N'2020-01-07T15:07:25.197' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1165, 1023, N'ملزومات نصب', NULL, NULL, NULL, N'<p dir="rtl" style="text-align:right"><strong>1. روکش آلومینیوم (AL CLAD) چسبدار و بدون چسب</strong></p>

<p dir="rtl" style="text-align:right">تمامی این روکش ها برای مصارف داخلی و خارجی جهت مقاومت&nbsp;در برابر&nbsp;رطوبت، ضربات قیزیکی و شرایط جوی قابل استفاده&nbsp;می باشند.</p>

<p dir="rtl" style="text-align:right">&nbsp;</p>

<p dir="rtl" style="text-align:right"><strong>2. چسب مخصوص عایق K-FLEX</strong></p>

<p dir="rtl" style="text-align:justify">این چسب با فرمولی مخصوص جهت نصب عایق های الاستومری ساخته شده است.</p>

<p dir="rtl" style="text-align:justify">قابل عرضه بصورت 1 و 3 کیلوگرمی</p>

<p dir="rtl" style="text-align:justify">&nbsp;</p>

<p dir="rtl" style="text-align:right"><strong>3. نوار درزگیر چسبدار K-FLEX</strong></p>

<p dir="rtl" style="text-align:right"><br />
نوار درزگیر چسبدار K-FLEX از جنس عایق و به صورت چسبدار می باشد. این نوارهای درزگیر جهت اطمینان از عدم نفوذ گرد و غبار و بخار آب، تقویت&nbsp;اتصال درز عایق ها، جلوگیری از اتلاف انرژی از محل درزها مورد استفاده قرار می گیرند. قابل ارائه در عرض های 2، 3، 5، 7، 10 سانتیمتر.</p>

<p dir="rtl" style="text-align:right">&nbsp;</p>

<p dir="rtl" style="text-align:right"><strong>4. نوار درزگیر چسبدار آلومینیومی</strong></p>

<p dir="rtl" style="text-align:right"><br />
جهت درزبندی و اطمینان از عدم نفوذ غبار و بخار آب برای درز عایق هایی که دارای روکش آلومینیومی هستند مورد استفاده قرار می گیرد و برای هر نوع روکش آلومینیومی نوار درزگیر از همان نوع ارائه می گردد. نوار درزگیر آلومینیومی ساده/مسلح قابل ارائه در عرض های 2، 3، 5، 7، 10&nbsp;سانتیمتر.</p>

<p dir="rtl" style="text-align:right">&nbsp;</p>

<p dir="rtl" style="text-align:right"><strong>5. نوار درزگیر برزنتی / پلیمری</strong></p>

<p dir="rtl" style="text-align:right"><br />
این نوار درزگیر چسبدار از جنس پلیمر می باشد و جهت محکم نمودن عایق دور زانوها،اتصالات و ... قابل استفاده می باشد. قابل ارائه در عرض های 3،5،7 و 10 سانتیمتر.</p>
', 10000, N'0df19d97f6a54815b45197692293387a.jpg', CAST(N'2020-01-07T15:16:20.063' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1166, 1024, N'کانال خرطومی آلومینیومی', NULL, NULL, NULL, N'<p dir="rtl" style="text-align:justify">ساخته شده از دو لایه فویل آلومینیوم لمینیت شده که توسط مفتول فنری فولادی مستحکم شده و قایل استفاده در سیستم های غبارگیر صنعتی، تهویه مطبوع، اگزاست فن ها و هود ها می باشند.</p>

<p dir="rtl" style="text-align:justify">&nbsp;</p>

<p dir="rtl" style="text-align:justify">&nbsp;</p>

<p dir="rtl" style="text-align:justify">&nbsp;</p>

<p dir="rtl" style="text-align:justify"><img src="https://www.sanaig.ir/images/Sana-Duct/duct1-info.jpg" style="border:0px; box-sizing:border-box; height:auto; margin-bottom:0px; max-width:100%; vertical-align:middle; width:600px" /></p>
', 10000, N'21431fc2da514a17982ecdb79d163b6c.jpg', CAST(N'2020-01-07T15:19:32.853' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1167, 1024, N'کانال خرطومی PVC', NULL, NULL, NULL, N'<p dir="rtl" style="text-align:justify">ساخته شده از فیلم پی وی سی با مفتول فنری فولادی که به منظور استفاده در سیستم های غبارگیر در مکان های صنعتی با فشارهای پایین و متوسط و همچنین استفاده در سیستم سرمایش و گرمایش، تهویه مطبوع هوا و خطوط انتقال مواد طراحی شده اند که به دو صورت عایق دار و بدون عایق، قابل ارائه می باشند.</p>

<p dir="rtl" style="text-align:justify">&nbsp;</p>

<p dir="rtl" style="text-align:justify">&nbsp;</p>

<p dir="rtl" style="text-align:justify">&nbsp;</p>

<p dir="rtl" style="text-align:justify"><img src="https://www.sanaig.ir/images/Sana-Duct/duct2-info.jpg" style="border:0px; box-sizing:border-box; height:auto; margin-bottom:0px; max-width:100%; vertical-align:middle; width:600px" /></p>

<p dir="rtl" style="text-align:justify">&nbsp;</p>
', 10000, N'853ed6547f324122bb53ed0797977ccd.jpg', CAST(N'2020-01-07T15:20:56.333' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1168, 1024, N'کانال خرطومی کومبی', NULL, NULL, NULL, N'<p dir="rtl" style="text-align:justify">ساخته شده از&nbsp;آلومینیوم لمینیت شده به همراه یک لایه پوشش پی وی سی که با مفتول فنری فولادی تقویت شده است.</p>

<p dir="rtl" style="text-align:justify">کانال خرطومی کومبی جهت مصارف صنعتی، سیستم های جابجایی و تخلیه هوا، سیستم های سرمایش و گرمایش، تهویه مطبوع، کانال کشی داکت اسپلیت و کانال کشی فن کوئل در مجتمع های تجاری، مسکونی، هتل ها، بیمارستان ها و آزمایشگاه ها مورد استفاده قرار می گیرد.</p>

<p dir="rtl" style="text-align:justify">این محصول انعطاف پذیری و الاستیسیته بالایی دارد، براحتی می تواند به اتصالات مدور یا مستطیلی متصل شود. همچنین به این علت به آسانی قایل حمل و نقل و انبار کردن می باشد. این کانال ها به دلیل تقویت با مفتول فنری فولدی مقاومت زیادی در برابر تغییر شکل دارند.</p>

<p dir="rtl" style="text-align:justify">&nbsp;</p>

<p dir="rtl" style="text-align:justify">&nbsp;</p>

<p dir="rtl" style="text-align:justify">&nbsp;</p>

<p dir="rtl" style="text-align:justify"><img src="https://www.sanaig.ir/images/Sana-Duct/duct3-info.jpg" style="border:0px; box-sizing:border-box; height:auto; margin-bottom:0px; max-width:100%; vertical-align:middle; width:600px" /></p>
', 10000, N'f9887c53a76c40a99861688afec1cf3e.jpg', CAST(N'2020-01-07T15:22:28.017' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1169, 1024, N'کانال خرطومی با عایق الاستومری', NULL, NULL, NULL, N'<p dir="rtl" style="text-align:justify">ساخته شده از یک لایه آلومینیوم لمینیت شده به&nbsp;عنوان لایه داخلی، یک لایه میانی عایق فوم الاستومری K-FLEX به عنوان عایق و یک لایه خارجی آلومینیوم لمینیت شده به همراه مفتول فنری فولادی.</p>

<p dir="rtl" style="text-align:justify">بهترین عایق جهت کانال های خرطومی عایق الاستومری می باشد که در سیستم های صنعتی، انتقال و تخلیه هوا و در سیستم گرمایش و سرمایش، تهویه مطبوع در مجتمع های تجاری و خانگی، هتل ها و بیمارستان ها و آزمایشگاه ها مورد استفاده قرار می گیرد.</p>

<p dir="rtl" style="text-align:justify">&nbsp;</p>

<p dir="rtl" style="text-align:justify">&nbsp;</p>

<p dir="rtl" style="text-align:justify">&nbsp;</p>

<p dir="rtl" style="text-align:justify"><img src="https://www.sanaig.ir/images/Sana-Duct/duct4-info.jpg" style="border:0px; box-sizing:border-box; height:auto; margin-bottom:0px; max-width:100%; vertical-align:middle; width:600px" /></p>
', 10000, N'5348cf81bc8a40808fd18ac0d02d7995.jpg', CAST(N'2020-01-07T15:23:16.530' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1170, 1024, N'کانال خرطومی با عایق پلی استر', NULL, NULL, NULL, N'<p dir="rtl" style="text-align:justify">ساخته شده از یک لایه آلومینیوم لمینیت شده&nbsp;و تقویت شده با&nbsp;مفتول فنری فولادی به عنوان لایه زیرین و رویین و یک لایه از الیاف پلی استر به عنوان عایق.<br />
<br />
این محصول مناسب برای تهویه مطبوع محیط های بهداشتی، انتقال هوای فشار پایین و استخراج سوخت جهت مترو و ساختمان ها بوده و با محیط زیست سازگار است.</p>

<p dir="rtl" style="text-align:justify">&nbsp;</p>

<p dir="rtl" style="text-align:justify">&nbsp;</p>

<p dir="rtl" style="text-align:justify">&nbsp;</p>

<p dir="rtl" style="text-align:justify"><img src="https://www.sanaig.ir/images/Sana-Duct/duct5-info.jpg" style="border:0px; box-sizing:border-box; height:auto; margin-bottom:0px; max-width:100%; vertical-align:middle; width:800px" /></p>

<p dir="rtl" style="text-align:justify">&nbsp;</p>
', 10000, N'f9ea40a0b8944e218c1a90b5ccb60d0b.jpg', CAST(N'2020-01-07T15:23:58.420' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1172, 1026, N'چسب ۳ کیلویی (s62)', NULL, NULL, NULL, N'<p><span style="font-size:14px"><strong>چسب قدرتمند S62 رادمن ارائه شده در دبه</strong></span></p>

<p><strong><a href="/pdf/s62.pdf">کاتالوگ محصول</a></strong><br />
<br />
پلی پروپیلن به ظرفیت 3 لیتر ، چسبی تخصصی<br />
برای مصارف صنعتی می باشد، از جمله نصب<br />
عایق های فومی الاستومریک ، پلی اتیلن،<br />
اتیلن وینیل استات ، EPDM ,NBR/PVC ، روکش<br />
فویل، روکش PVC,PET, POLYAMIDE بر روی کانال<br />
(انتقال هوا) داکت.</p>

<p>استفاده از این چسب به وسیله قلم مو یا<br />
غلتک یا کاردک می باشد .<br />
این محصول حاوی حلال های نفتی و آتشزا است و<br />
دارای کاربری تخصصی و صنعتی میباشد و کاربر، مجاز<br />
به استفاده و نگهداری بدون آموزش نمی باشد.برای<br />
آموزش باما درتماس باشید.</p>

<p>&nbsp;</p>
', 10000, N'1519a30d079b4f4994659b3ac8b8ca85.png', CAST(N'2020-02-19T15:52:35.000' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1173, 1026, N'چسب ۳ کیلویی (s63+100)', NULL, NULL, NULL, N'<p><strong>چسب قدرتمند S63 رادمن ارائه شده در دبه</strong></p>

<p><a href="/pdf/s63.pdf"><strong>دانلود کاتالوگ</strong></a></p>

<p><br />
پلی پروپیلن به ظرفیت 3 لیتر ،چسبی تخصصی<br />
برای مصارف صنعتی می باشد، از جمله نصب<br />
عایق های فومی الاستومریک ، پلی اتیلن<br />
،اتیلن وینیل استات ، EPDM,NBR/PVC ،روکش<br />
فویل،روکش PVC,PET,POLYAMIDE بر روی<br />
0 درجه سانتیگراد . تاسیسات با دمای بیش از 7<br />
استفاده از این چسب به وسیله قلم مو یا<br />
غلتک یا کاردک می باشد .<br />
این محصول حاوی حلال های نفتی و آتشزا است و<br />
دارای کاربری تخصصی و صنعتی میباشد و کاربر، مجاز<br />
به استفاده و نگهداری بدون آموزش نمی باشد.برای<br />
آموزش با ما درتماس باشید.</p>
', 10000, N'0a22247a32544fb99f3b6f318b9395b0.png', CAST(N'2020-02-19T15:55:12.000' AS DateTime), 0)
INSERT [Products] ([ProductID], [ProductSubGroupID], [ProductTitle], [ProductEnTitle], [ProductDetails], [Size], [ProductDescription], [ProductPrice], [ProductImageUrl], [CreateDate], [IsSpecial]) VALUES (1174, 1025, N'چسب کپسولی 11 کیلویی', NULL, NULL, NULL, N'<p><strong>چسب قدرتمند S61 رادمن پر شده در<br />
1 لیتر کپسول تحت فشار به ظرفیت 1</strong></p>

<p><a href="/pdf/s61.pdf"><strong>دانلود کاتالوگ</strong></a></p>

<p><br />
،چسبی تخصصی برای مصارف صنعتی<br />
می باشد. از جمله نصب عایق های<br />
فومی الاستومریک ، پلی اتیلن ، اتیلن<br />
وینیل استات ، EPDM,NBR/PVC ، روکش<br />
فویل،روکش PVC ,PET ,POLYAMIDE بر روی<br />
کانال انتقال هوا(داکت).<br />
استفاده از این چسب به روش پاشش<br />
می باشد و نیاز به پیستوله مخصوص به<br />
همراه منبع تامین هوای فشرده است .<br />
این محصول آتشزا است و تحت فشار پر شده<br />
و دارای کاربری تخصصی و صنعتی میباشد و<br />
کاربر، مجاز به استفاده و نگهداری بدون آموزش<br />
نمی باشد.برای آموزش با ما<br />
درتماس باشید.<br />
&nbsp;</p>
', 50000, N'31ed6819cc6044319500f5ec4695e8b7.png', CAST(N'2020-02-19T17:00:37.000' AS DateTime), 1)
SET IDENTITY_INSERT [Products] OFF
GO
SET IDENTITY_INSERT [ProductSubGroup] ON 

INSERT [ProductSubGroup] ([ProductSubGroupID], [ProductGroupID], [ProductSubGroupTitle]) VALUES (5, 6, N'رولی')
INSERT [ProductSubGroup] ([ProductSubGroupID], [ProductGroupID], [ProductSubGroupTitle]) VALUES (6, 6, N'لوله ای')
INSERT [ProductSubGroup] ([ProductSubGroupID], [ProductGroupID], [ProductSubGroupTitle]) VALUES (7, 6, N'ISO Chip')
INSERT [ProductSubGroup] ([ProductSubGroupID], [ProductGroupID], [ProductSubGroupTitle]) VALUES (8, 6, N'تجهیزات')
INSERT [ProductSubGroup] ([ProductSubGroupID], [ProductGroupID], [ProductSubGroupTitle]) VALUES (9, 8, N'ورقه ای')
INSERT [ProductSubGroup] ([ProductSubGroupID], [ProductGroupID], [ProductSubGroupTitle]) VALUES (10, 8, N'لوله ای')
INSERT [ProductSubGroup] ([ProductSubGroupID], [ProductGroupID], [ProductSubGroupTitle]) VALUES (13, 9, N'فلنچ نصب کانال')
INSERT [ProductSubGroup] ([ProductSubGroupID], [ProductGroupID], [ProductSubGroupTitle]) VALUES (14, 9, N'پروفیل')
INSERT [ProductSubGroup] ([ProductSubGroupID], [ProductGroupID], [ProductSubGroupTitle]) VALUES (15, 9, N'بست')
INSERT [ProductSubGroup] ([ProductSubGroupID], [ProductGroupID], [ProductSubGroupTitle]) VALUES (16, 9, N'تجهیزات جانبی')
INSERT [ProductSubGroup] ([ProductSubGroupID], [ProductGroupID], [ProductSubGroupTitle]) VALUES (1013, 7, N'ISOSOUND')
INSERT [ProductSubGroup] ([ProductSubGroupID], [ProductGroupID], [ProductSubGroupTitle]) VALUES (1018, 13, N'یزد پوش فیت')
INSERT [ProductSubGroup] ([ProductSubGroupID], [ProductGroupID], [ProductSubGroupTitle]) VALUES (1019, 14, N'تک لایه')
INSERT [ProductSubGroup] ([ProductSubGroupID], [ProductGroupID], [ProductSubGroupTitle]) VALUES (1020, 15, N'پنج لایه')
INSERT [ProductSubGroup] ([ProductSubGroupID], [ProductGroupID], [ProductSubGroupTitle]) VALUES (1021, 16, N'عایق حرارتی')
INSERT [ProductSubGroup] ([ProductSubGroupID], [ProductGroupID], [ProductSubGroupTitle]) VALUES (1022, 16, N'عایق صوتی')
INSERT [ProductSubGroup] ([ProductSubGroupID], [ProductGroupID], [ProductSubGroupTitle]) VALUES (1023, 16, N'تجهیزات جانبی')
INSERT [ProductSubGroup] ([ProductSubGroupID], [ProductGroupID], [ProductSubGroupTitle]) VALUES (1024, 17, N'کانال ها')
INSERT [ProductSubGroup] ([ProductSubGroupID], [ProductGroupID], [ProductSubGroupTitle]) VALUES (1025, 18, N'کپسولی')
INSERT [ProductSubGroup] ([ProductSubGroupID], [ProductGroupID], [ProductSubGroupTitle]) VALUES (1026, 18, N'گالونی')
SET IDENTITY_INSERT [ProductSubGroup] OFF
GO
SET IDENTITY_INSERT [Projects] ON 

INSERT [Projects] ([ProjectID], [ProjectTitle], [ProjectDescription], [ProjectImageUrl], [CreateDate]) VALUES (1, N'صحن مطهر حضرت زهرا', N'<p>این پروژه از سال 1394 آغاز گردیده و هنوز در حال انجام است و شرکت ما با افتخار در این پروژه حضور دارد .</p>
', N'0a3a4db17183492fb4fc9accfde776d2.png', CAST(N'2018-01-18T00:00:00.000' AS DateTime))
INSERT [Projects] ([ProjectID], [ProjectTitle], [ProjectDescription], [ProjectImageUrl], [CreateDate]) VALUES (8, N'صحن مطهر امام خمینی', N'<p>این پروژه از سال 1394 آغاز گردیده و هنوز در حال انجام است و شرکت ما با افتخار در این پروژه حضور دارد .</p>
', N'33d425a4bc5b4c788703dbede38ad642.jpg', CAST(N'2018-01-29T00:00:00.000' AS DateTime))
INSERT [Projects] ([ProjectID], [ProjectTitle], [ProjectDescription], [ProjectImageUrl], [CreateDate]) VALUES (9, N'صحن مطهر حضرت زهرا', N'<p>این پروژه از سال 1394 آغاز گردیده و هنوز در حال انجام است و شرکت ما با افتخار در این پروژه حضور دارد .</p>
', N'25e9f88651ba4b83a1c39fb0c6e79792.png', CAST(N'2017-12-30T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [Projects] OFF
GO
SET IDENTITY_INSERT [RefCode] ON 

INSERT [RefCode] ([RefID], [Ref_Code], [UserId]) VALUES (1, N'B-1419596505-f2', 2)
SET IDENTITY_INSERT [RefCode] OFF
GO
SET IDENTITY_INSERT [Roles] ON 

INSERT [Roles] ([RoleID], [RoleName], [RoleTitle]) VALUES (1, N'Admin', N'مدیر سایت')
INSERT [Roles] ([RoleID], [RoleName], [RoleTitle]) VALUES (2, N'User', N'کاربر عادی')
SET IDENTITY_INSERT [Roles] OFF
GO
SET IDENTITY_INSERT [Users] ON 

INSERT [Users] ([UserID], [RoleID], [CustomerTypeID], [UserName], [Password], [FullName], [Email], [Phone], [CreateDate]) VALUES (2, 1, 1, N'admin', N'123456', N'admin', N'M@gmail.com', N'012353535', CAST(N'2018-01-01T16:44:50.000' AS DateTime))
INSERT [Users] ([UserID], [RoleID], [CustomerTypeID], [UserName], [Password], [FullName], [Email], [Phone], [CreateDate]) VALUES (5, 2, 2, N'شرکت عمران سریر', N'123456', N'شرکت عمران سریر', N'M@gmail.com', N'09124444444', CAST(N'2018-01-03T19:31:25.000' AS DateTime))
SET IDENTITY_INSERT [Users] OFF
GO
SET IDENTITY_INSERT [Videos] ON 

INSERT [Videos] ([VideoID], [VideoTitle], [VideoUrl], [CreateDate]) VALUES (1, N'test', N'a6123ed1849c4cab9e687befe176a165.mp4', CAST(N'2020-05-17T16:50:06.110' AS DateTime))
SET IDENTITY_INSERT [Videos] OFF
GO
ALTER TABLE [OrderDetails] ADD  CONSTRAINT [DF_OrderDetails_ProductCount]  DEFAULT ((0)) FOR [ProductCount]
GO
ALTER TABLE [OrderDetails] ADD  CONSTRAINT [DF_OrderDetails_ProductPrice]  DEFAULT ((0)) FOR [ProductPrice]
GO
ALTER TABLE [OrderDetails] ADD  CONSTRAINT [DF_OrderDetails_Sum]  DEFAULT ((0)) FOR [Sum]
GO
ALTER TABLE [OrderDetails] ADD  CONSTRAINT [DF_OrderDetails_SumWithDiscount]  DEFAULT ((0)) FOR [SumWithDiscount]
GO
ALTER TABLE [Orders] ADD  CONSTRAINT [DF_Orders_IsFinally]  DEFAULT ((0)) FOR [IsFinally]
GO
ALTER TABLE [Orders] ADD  CONSTRAINT [DF_Orders_OrderTotalSum]  DEFAULT ((0)) FOR [OrderTotalSum]
GO
ALTER TABLE [Orders] ADD  CONSTRAINT [DF_Orders_OrderTotalSumWithDiscount]  DEFAULT ((0)) FOR [OrderTotalSumWithDiscount]
GO
ALTER TABLE [Products] ADD  CONSTRAINT [DF_Products_ProductPrice]  DEFAULT ((0)) FOR [ProductPrice]
GO
ALTER TABLE [Products] ADD  CONSTRAINT [DF_Products_IsSpecial]  DEFAULT ((0)) FOR [IsSpecial]
GO
ALTER TABLE [Bonuses]  WITH CHECK ADD  CONSTRAINT [FK_Bonuses_Orders] FOREIGN KEY([OrderId])
REFERENCES [Orders] ([OrderId])
GO
ALTER TABLE [Bonuses] CHECK CONSTRAINT [FK_Bonuses_Orders]
GO
ALTER TABLE [Bonuses]  WITH CHECK ADD  CONSTRAINT [FK_Bonuses_RefCode] FOREIGN KEY([RefID])
REFERENCES [RefCode] ([RefID])
GO
ALTER TABLE [Bonuses] CHECK CONSTRAINT [FK_Bonuses_RefCode]
GO
ALTER TABLE [Bonuses]  WITH CHECK ADD  CONSTRAINT [FK_Bonuses_Users1] FOREIGN KEY([UserId])
REFERENCES [Users] ([UserID])
GO
ALTER TABLE [Bonuses] CHECK CONSTRAINT [FK_Bonuses_Users1]
GO
ALTER TABLE [Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Products] FOREIGN KEY([ProductID])
REFERENCES [Products] ([ProductID])
GO
ALTER TABLE [Comments] CHECK CONSTRAINT [FK_Comments_Products]
GO
ALTER TABLE [Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Users] FOREIGN KEY([UserID])
REFERENCES [Users] ([UserID])
GO
ALTER TABLE [Comments] CHECK CONSTRAINT [FK_Comments_Users]
GO
ALTER TABLE [DiscountCodes]  WITH CHECK ADD  CONSTRAINT [FK_DiscountCodes_Users] FOREIGN KEY([UserID])
REFERENCES [Users] ([UserID])
GO
ALTER TABLE [DiscountCodes] CHECK CONSTRAINT [FK_DiscountCodes_Users]
GO
ALTER TABLE [Discounts]  WITH CHECK ADD  CONSTRAINT [FK_Discounts_Products] FOREIGN KEY([ProductID])
REFERENCES [Products] ([ProductID])
GO
ALTER TABLE [Discounts] CHECK CONSTRAINT [FK_Discounts_Products]
GO
ALTER TABLE [Discounts]  WITH CHECK ADD  CONSTRAINT [FK_Discounts_Users] FOREIGN KEY([UserID])
REFERENCES [Users] ([UserID])
GO
ALTER TABLE [Discounts] CHECK CONSTRAINT [FK_Discounts_Users]
GO
ALTER TABLE [OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([OrderId])
REFERENCES [Orders] ([OrderId])
GO
ALTER TABLE [OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([ProductId])
REFERENCES [Products] ([ProductID])
GO
ALTER TABLE [OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO
ALTER TABLE [Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_DiscountCodes] FOREIGN KEY([DiscountCodeID])
REFERENCES [DiscountCodes] ([DiscountCodeID])
GO
ALTER TABLE [Orders] CHECK CONSTRAINT [FK_Orders_DiscountCodes]
GO
ALTER TABLE [Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Users] FOREIGN KEY([UserId])
REFERENCES [Users] ([UserID])
GO
ALTER TABLE [Orders] CHECK CONSTRAINT [FK_Orders_Users]
GO
ALTER TABLE [ProductGalleries]  WITH CHECK ADD  CONSTRAINT [FK_ProductGalleries_Products] FOREIGN KEY([ProductID])
REFERENCES [Products] ([ProductID])
GO
ALTER TABLE [ProductGalleries] CHECK CONSTRAINT [FK_ProductGalleries_Products]
GO
ALTER TABLE [ProductGroup]  WITH CHECK ADD  CONSTRAINT [FK_ProductGroup_ProductBrand] FOREIGN KEY([ProductBrandID])
REFERENCES [ProductBrand] ([ProductBrandID])
GO
ALTER TABLE [ProductGroup] CHECK CONSTRAINT [FK_ProductGroup_ProductBrand]
GO
ALTER TABLE [Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_ProductSubGroup] FOREIGN KEY([ProductSubGroupID])
REFERENCES [ProductSubGroup] ([ProductSubGroupID])
GO
ALTER TABLE [Products] CHECK CONSTRAINT [FK_Products_ProductSubGroup]
GO
ALTER TABLE [ProductSubGroup]  WITH CHECK ADD  CONSTRAINT [FK_ProductSubGroup_ProductGroup] FOREIGN KEY([ProductGroupID])
REFERENCES [ProductGroup] ([ProductGroupID])
GO
ALTER TABLE [ProductSubGroup] CHECK CONSTRAINT [FK_ProductSubGroup_ProductGroup]
GO
ALTER TABLE [RefCode]  WITH CHECK ADD  CONSTRAINT [FK_RefCode_Users] FOREIGN KEY([UserId])
REFERENCES [Users] ([UserID])
GO
ALTER TABLE [RefCode] CHECK CONSTRAINT [FK_RefCode_Users]
GO
ALTER TABLE [Seminarparticipants]  WITH CHECK ADD  CONSTRAINT [FK_Seminarparticipants_News] FOREIGN KEY([NewsID])
REFERENCES [News] ([NewsID])
GO
ALTER TABLE [Seminarparticipants] CHECK CONSTRAINT [FK_Seminarparticipants_News]
GO
ALTER TABLE [Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_CustomerType] FOREIGN KEY([CustomerTypeID])
REFERENCES [CustomerType] ([CustomerTypeID])
GO
ALTER TABLE [Users] CHECK CONSTRAINT [FK_Users_CustomerType]
GO
ALTER TABLE [Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([RoleID])
REFERENCES [Roles] ([RoleID])
GO
ALTER TABLE [Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
USE [master]
GO
ALTER DATABASE [BehinFaraz_New] SET  READ_WRITE 
GO
