USE [master]
GO
/****** Object:  Database [wizard_magazine]    Script Date: 5/31/2023 10:48:07 AM ******/
CREATE DATABASE [wizard_magazine]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'wizard_magazine', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\wizard_magazine.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'wizard_magazine_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\wizard_magazine_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [wizard_magazine] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [wizard_magazine].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [wizard_magazine] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [wizard_magazine] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [wizard_magazine] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [wizard_magazine] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [wizard_magazine] SET ARITHABORT OFF 
GO
ALTER DATABASE [wizard_magazine] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [wizard_magazine] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [wizard_magazine] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [wizard_magazine] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [wizard_magazine] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [wizard_magazine] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [wizard_magazine] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [wizard_magazine] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [wizard_magazine] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [wizard_magazine] SET  ENABLE_BROKER 
GO
ALTER DATABASE [wizard_magazine] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [wizard_magazine] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [wizard_magazine] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [wizard_magazine] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [wizard_magazine] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [wizard_magazine] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [wizard_magazine] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [wizard_magazine] SET RECOVERY FULL 
GO
ALTER DATABASE [wizard_magazine] SET  MULTI_USER 
GO
ALTER DATABASE [wizard_magazine] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [wizard_magazine] SET DB_CHAINING OFF 
GO
ALTER DATABASE [wizard_magazine] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [wizard_magazine] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [wizard_magazine] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [wizard_magazine] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'wizard_magazine', N'ON'
GO
ALTER DATABASE [wizard_magazine] SET QUERY_STORE = ON
GO
ALTER DATABASE [wizard_magazine] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [wizard_magazine]
GO
/****** Object:  Table [dbo].[accounts]    Script Date: 5/31/2023 10:48:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[accounts](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[usename] [nvarchar](max) NULL,
	[email] [nvarchar](256) NULL,
	[password] [nvarchar](max) NULL,
	[full_name] [nvarchar](max) NULL,
	[avatar] [nvarchar](max) NULL,
	[sefl_des] [nvarchar](max) NULL,
 CONSTRAINT [PK_account] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[articles]    Script Date: 5/31/2023 10:48:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[articles](
	[article_id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](max) NULL,
	[textbody] [nvarchar](max) NULL,
	[create_time] [datetime] NULL,
	[image] [nvarchar](max) NULL,
	[user_id] [int] NULL,
	[cate_id] [int] NULL,
 CONSTRAINT [PK_articles] PRIMARY KEY CLUSTERED 
(
	[article_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[categories]    Script Date: 5/31/2023 10:48:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categories](
	[cate_id] [int] IDENTITY(1,1) NOT NULL,
	[cate_name] [nvarchar](max) NULL,
 CONSTRAINT [PK_categories] PRIMARY KEY CLUSTERED 
(
	[cate_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[comments]    Script Date: 5/31/2023 10:48:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[comments](
	[cmt_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[article_id] [int] NULL,
	[cmt_cotnent] [nvarchar](max) NULL,
	[create_time] [datetime] NULL,
 CONSTRAINT [PK_comments] PRIMARY KEY CLUSTERED 
(
	[cmt_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 5/31/2023 10:48:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[usename] [nvarchar](max) NULL,
	[email] [nvarchar](256) NULL,
	[password] [nvarchar](max) NULL,
	[full_name] [nvarchar](max) NULL,
	[avatar] [nvarchar](max) NULL,
	[sefl_des] [nvarchar](max) NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[accounts] ON 

INSERT [dbo].[accounts] ([user_id], [usename], [email], [password], [full_name], [avatar], [sefl_des]) VALUES (1, N'xxxx', N'xxxx@gmail.com', N'xxxx', N'xxxx', N'', N'G')
INSERT [dbo].[accounts] ([user_id], [usename], [email], [password], [full_name], [avatar], [sefl_des]) VALUES (2, N'demo', N'demo@gmail.com', N'demo', N'demo', N'', N'G')
SET IDENTITY_INSERT [dbo].[accounts] OFF
GO
SET IDENTITY_INSERT [dbo].[articles] ON 

INSERT [dbo].[articles] ([article_id], [title], [textbody], [create_time], [image], [user_id], [cate_id]) VALUES (1, N'Apple đầu tư 200 triệu USD cho sản xuất tấm nền mini LED', N'<p>Theo PhoneArena, iPad Pro 12,9 inch m&agrave; Apple ra mắt trong năm 2021 đi k&egrave;m m&agrave;n h&igrave;nh mini LED thu h&uacute;t được một lượng lớn kh&aacute;ch h&agrave;ng.<br />
Với sản lượng hiện tại kh&ocirc;ng thể đ&aacute;p ứng nhu cầu, Apple đ&atilde; mua c&aacute;c thiết bị sản xuất tấm nền mini LED trị gi&aacute; h&agrave;ng trăm triệu USD. M&aacute;y m&oacute;c sản xuất mới sẽ được sử dụng bởi c&aacute;c nh&agrave; cung cấp tấm nền mini LED duy nhất của Apple - Taiwan Surface Mounting Technology (TSMT). B&aacute;o c&aacute;o cũng n&oacute;i Apple đ&atilde; phải vật lộn với nhu cầu hiện tại về m&agrave;n h&igrave;nh cho iPad Pro 12,9 inch 2021. Apple được cho l&agrave; đang c&oacute; kế hoạch giới thiệu c&ocirc;ng nghệ m&agrave;n h&igrave;nh mới cho d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay MacBook Pro 14 v&agrave; 16 inch. C&aacute;c tin đồn cho biết Apple cũng đang c&oacute; kế hoạch bổ sung tấm nền mini LED cho iPad mini 6 thiết kế lại v&agrave; iPad gi&aacute; rẻ. Với khoản đầu tư 200 triệu USD n&agrave;y, Apple hy vọng sẽ cung cấp th&ecirc;m 700.000 đến 800.000 tấm nền mini LED được sản xuất mỗi th&aacute;ng.</p>
', CAST(N'2021-07-02T09:12:00.000' AS DateTime), N'/App_Datafiles/apple-dau-tu-200-trieu-usd-san-xuat-tam-nen-led-mini-cho-ipad-pro-595-5861282.jpeg', 1, 13)
INSERT [dbo].[articles] ([article_id], [title], [textbody], [create_time], [image], [user_id], [cate_id]) VALUES (2, N'14 cách giúp bạn tăng cường miễn dịch chống Covid-19', N'<p>Trong khi chờ đợi c&oacute; đủ vắc xin ngừa Covid-19, một trong những c&aacute;ch tốt nhất để tự bảo vệ m&igrave;nh khỏi sự tấn c&ocirc;ng của Covid-19 l&agrave; tăng cường hệ miễn dịch. Sau đ&acirc;y l&agrave; 14 lời khuy&ecirc;n của b&aacute;c sĩ tim mạch h&agrave;ng đầu, của c&aacute;c tổ chức y tế v&agrave; từ nghi&ecirc;n cứu mới nhất, gi&uacute;p bạn tăng cường khả năng miễn dịch chống lại Covid-19, theo eatthis.com.<br />
1. Tr&aacute;nh thực phẩm chế biến Tiến sĩ Luiza Petre, b&aacute;c sĩ tim mạch ki&ecirc;m chuy&ecirc;n gia dinh dưỡng, ph&oacute; gi&aacute;o sư l&acirc;m s&agrave;ng về tim mạch tại Trường Y Mount Sinai v&agrave; l&agrave; th&agrave;nh vi&ecirc;n t&iacute;ch cực của Trường cao đẳng Tim mạch Mỹ, cho biết n&ecirc;n ăn thực phẩm hữu cơ chưa qua chế biến, tr&aacute;nh đường v&agrave; thực phẩm đ&oacute;ng hộp để giảm vi&ecirc;m v&agrave; x&acirc;y dựng hệ miễn dịch. 2. Lập kế hoạch ăn uống l&agrave;nh mạnh Tiến sĩ Petre cho biết, tr&aacute;i c&acirc;y v&agrave; rau quả c&oacute; chứa c&aacute;c dưỡng chất thực vật gi&uacute;p bảo vệ chống lại chứng vi&ecirc;m. H&atilde;y ăn nhiều rau, thảo mộc v&agrave; tr&aacute;i c&acirc;y gi&agrave;u vitamin C, để ngăn ngừa v&agrave; kiểm so&aacute;t t&igrave;nh trạng vi&ecirc;m mạn t&iacute;nh, theo eatthis.com. Chất b&eacute;o l&agrave;nh mạnh, như chất b&eacute;o kh&ocirc;ng b&atilde;o h&ograve;a đơn (c&oacute; nhiều trong dầu &ocirc; liu, dầu cải, dầu đậu n&agrave;nh, dầu m&egrave;, bơ đậu phộng, c&aacute;c loại hạt v&agrave; tr&aacute;i bơ) v&agrave; a x&iacute;t b&eacute;o omega-3 cũng gi&uacute;p giảm vi&ecirc;m. Đồ chi&ecirc;n v&agrave; chất b&eacute;o b&atilde;o h&ograve;a l&agrave;m tăng t&igrave;nh trạng vi&ecirc;m v&agrave; l&agrave;m suy yếu khả năng miễn dịch. V&igrave; vậy, n&ecirc;n tr&aacute;nh mỡ, da động vật, sữa nguy&ecirc;n kem, bơ thực vật, dầu dừa, b&aacute;nh quy. 3. Ăn nhiều h&agrave;nh tỏi Tiến sĩ Petre khuyến kh&iacute;ch ăn th&ecirc;m h&agrave;nh tỏi. Tỏi rất gi&agrave;u allicin, c&oacute; đặc t&iacute;nh kh&aacute;ng khuẩn v&agrave; kh&aacute;ng virus, gi&uacute;p tăng cường hệ miễn dịch v&agrave; chống lại cảm lạnh. H&atilde;y ăn mỗi lần 1 t&eacute;p tỏi, 2 - 3 lần mỗi ng&agrave;y, theo eatthis.com. H&agrave;nh rất gi&agrave;u quercetin - một chất chống &ocirc; xy h&oacute;a v&agrave; flavonoid rất mạnh, c&oacute; đặc t&iacute;nh kh&aacute;ng virus v&agrave; gi&uacute;p miễn dịch. H&agrave;nh c&ograve;n chứa nhiều chất dinh dưỡng tăng cường miễn dịch như c&aacute;c hợp chất lưu huỳnh, selen, kẽm v&agrave; vitamin C. 4. Tăng cường vitamin C Tiến sĩ Petre chỉ ra rằng c&aacute;c loại tr&aacute;i c&acirc;y gi&agrave;u vitamin C, như cam, bưởi v&agrave; qu&yacute;t, l&agrave; n&ograve;ng cốt của hệ miễn dịch, gi&uacute;p tăng sản xuất tế b&agrave;o bạch cầu v&agrave; cải thiện chức năng của tế b&agrave;o lympho T - chống lại nhiễm tr&ugrave;ng. 5. Ăn thực phẩm gi&agrave;u omega-3 Thực phẩm gi&agrave;u omega 3, như c&aacute; m&ograve;i, c&aacute; hồi, tr&aacute;i bơ v&agrave; c&aacute;c loại hạt, rất tốt trong việc chống lại virus. Tiến sĩ Petre cho biết, mỗi loại đều tăng cường chức năng của c&aacute;c tế b&agrave;o miễn dịch, bằng c&aacute;ch cải thiện chức năng của tế b&agrave;o bạch cầu. 6. Ăn th&ecirc;m thực phẩm gi&agrave;u Beta Glucan Theo tiến sĩ Petre, nấm hương, men, rong biển v&agrave; tảo đều l&agrave; những thực phẩm gi&agrave;u beta glucan - c&oacute; t&aacute;c dụng hỗ trợ cải thiện chức năng tế b&agrave;o T v&agrave; c&oacute; đặc t&iacute;nh kh&aacute;ng virus, theo eatthis.com. B&aacute;c sĩ giải th&iacute;ch, vh&uacute;ng l&agrave;m tăng phản ứng miễn dịch bằng c&aacute;ch tăng cường c&aacute;c tế b&agrave;o ti&ecirc;u diệt tự nhi&ecirc;n v&agrave; tăng chức năng của đại thực b&agrave;o, cũng như k&iacute;ch hoạt miễn dịch ph&ograve;ng thủ. 7. Ăn nhiều rau củ m&agrave;u xanh l&aacute; c&acirc;y Tiến sĩ Petre khuyến kh&iacute;ch b&ocirc;ng cải xanh v&agrave; rau b&oacute; x&ocirc;i chứa đầy vitamin A, C v&agrave; D, chất xơ, chất chống &ocirc; xy h&oacute;a. V&agrave; chất chống &ocirc; xy h&oacute;a l&agrave;m tăng khả năng chống nhiễm tr&ugrave;ng của hệ miễn dịch. B&iacute; quyết l&agrave; nấu c&agrave;ng &iacute;t c&agrave;ng tốt hoặc l&agrave; ăn sống đối với những thứ ăn sống được. 8. Ăn nhiều thực phẩm gi&agrave;u vitamin D Vitamin D l&agrave; th&agrave;nh phần quan trọng trong việc cải thiện khả năng miễn dịch. Một số thực phẩm gi&agrave;u vitamin D gồm c&aacute; b&eacute;o, trứng, nấm, s&ograve; v&agrave; trứng c&aacute; muối, theo eatthis.com. Tiến sĩ Petre cho biết: &ldquo;Ch&uacute;ng được mệnh danh l&agrave; &#39;tốt hơn cả vắc xin&#39; v&agrave; rất cần để chống lại nhiễm tr&ugrave;ng do virus, v&igrave; vitamin D tăng cường khả năng miễn dịch tự nhi&ecirc;n&quot;. 9. Ti&ecirc;u thụ nhiều men vi sinh Tiến sĩ Petre cho biết, khoảng 70% hệ miễn dịch nằm trong ruột. Thực phẩm l&ecirc;n men l&agrave; ch&igrave;a kh&oacute;a để c&acirc;n bằng hệ vi sinh vật đường ruột v&agrave; tăng cường hệ miễn dịch. Ch&uacute;ng bảo vệ cơ thể khỏi c&aacute;c mầm bệnh nguy hiểm. C&oacute; thể uống chế phẩm sinh học hoặc ăn c&aacute;c loại thực phẩm l&ecirc;n men, như kim chi hoặc dưa muối để cung cấp c&aacute;c vi khuẩn l&agrave;nh mạnh, theo eatthis.com. 10. Vận động v&agrave; vận động Tiến sĩ Petre chỉ ra rằng tập thể dục l&agrave; c&aacute;ch hiệu quả để tăng cường hệ miễn dịch. Đặc biệt, tập thể dục g&acirc;y ra sự thay đổi trong c&aacute;c kh&aacute;ng thể v&agrave; tế b&agrave;o bạch cầu - những tế b&agrave;o của hệ miễn dịch của cơ thể chống lại bệnh tật. Một nghi&ecirc;n cứu gần đ&acirc;y cho thấy rằng tập thể dục &iacute;t nhất 5 ng&agrave;y một tuần l&agrave;m giảm nguy cơ bị nhiễm tr&ugrave;ng đường h&ocirc; hấp tr&ecirc;n. Người mắc Covid-19, nếu tu&acirc;n theo th&oacute;i quen n&agrave;y, c&oacute; thể giảm được 32 - 41% nguy cơ mắc bệnh nghi&ecirc;m trọng, theo eatthis.com. 11. Thiền Tiến sĩ Petre chỉ ra, thiền l&agrave;m giảm mức độ căng thẳng v&agrave; mức cortisol, th&uacute;c đẩy phản ứng của cơ thể để chống lại virus. Suy nghĩ ti&ecirc;u cực, căng thẳng v&agrave; trạng th&aacute;i cảm x&uacute;c c&oacute; thể c&oacute; t&aacute;c động ti&ecirc;u cực đến hệ thống miễn dịch, khiến người ta dễ bị nhiễm bệnh hơn. 12. Ngủ ngon giấc Giấc ngủ gi&uacute;p hỗ trợ c&aacute;c tế b&agrave;o v&agrave; protein của hệ miễn dịch ti&ecirc;u diệt v&agrave; ph&aacute;t hiện vi tr&ugrave;ng. N&oacute; cũng gi&uacute;p ghi nhớ c&aacute;c loại vi tr&ugrave;ng n&agrave;y, v&igrave; vậy trong tương lai hệ miễn dịch c&oacute; thể chống lại ch&uacute;ng nhanh hơn, tiến sĩ Petre nhấn mạnh. Ngủ đủ giấc cũng l&agrave;m tăng đ&aacute;ng kể phản ứng miễn dịch của cơ thể, v&igrave; vậy h&atilde;y đảm bảo ngủ từ 6 - 7 giờ mỗi đ&ecirc;m. 13. Kh&ocirc;ng uống rượu Tổ chức Y tế Thế giới cho biết, uống rượu l&agrave;m suy yếu hệ miễn dịch v&agrave; do đ&oacute; l&agrave;m giảm khả năng chống chọi với c&aacute;c bệnh truyền nhiễm. 14. Kh&ocirc;ng để b&eacute;o ph&igrave; Theo Trung t&acirc;m Kiểm so&aacute;t v&agrave; Ph&ograve;ng ngừa dịch bệnh Mỹ, b&eacute;o ph&igrave; nghi&ecirc;m trọng l&agrave;m tăng nguy cơ mắc c&aacute;c biến chứng do Covid-19. Nghi&ecirc;n cứu cho biết, b&eacute;o ph&igrave; l&agrave;m suy giảm chức năng miễn dịch. H&atilde;y giảm c&acirc;n nếu bị thừa c&acirc;n, theo eatthis.com.</p>
', CAST(N'2021-07-02T09:12:00.000' AS DateTime), N'/App_Datafiles/chong-covid1_BJTH.jpg', 2, 26)
INSERT [dbo].[articles] ([article_id], [title], [textbody], [create_time], [image], [user_id], [cate_id]) VALUES (10, N'TP.HCM mạnh tay xử phạt ''ra đường không chính đáng''', N'<p>Trong h&ocirc;m qua (11.7), nhiều trường hợp ra đường kh&ocirc;ng c&oacute; l&yacute; do ch&iacute;nh đ&aacute;ng đ&atilde; bị lực lượng chức năng tại c&aacute;c chốt kiểm so&aacute;t dịch bệnh&nbsp;<a href="https://thanhnien.vn/e-magazine/toan-canh-covid-19-tin-tuc-so-lieu-phan-tich-1265104.html" rel="" target="_blank">Covid-19</a>&nbsp;của TP.HCM kiểm tra, xử phạt.</p>

<p>Từ 0 giờ ng&agrave;y 9.7, TP.HCM &aacute;p dụng biện ph&aacute;p&nbsp;<a href="https://thanhnien.vn/tim-kiem/Y2jhu4kgdGjhu4sgMTY=/chi-thi-16.html?m=0&amp;t=&amp;c=0&amp;y=-1&amp;o=" rel="" target="_blank">gi&atilde;n c&aacute;ch x&atilde; hội to&agrave;n địa b&agrave;n theo Chỉ chị 16&nbsp;</a>của Thủ tướng. C&ocirc;ng an TP.HCM lập 12 chốt kiểm so&aacute;t dịch bệnh Covid-19 tại cửa ng&otilde; ra v&agrave;o&nbsp;<a href="https://thanhnien.vn/tphcm/" rel="" target="_blank">TP.HCM</a>; ri&ecirc;ng c&aacute;c quận, huyện v&agrave; TP.Thủ Đức cũng lập khoảng 266 chốt kiểm so&aacute;t việc đi lại theo Chỉ thị 16 của người d&acirc;n b&ecirc;n trong nội &ocirc; TP.HCM.</p>

<p>Tăng cường kiểm so&aacute;t đi lại, nhất l&agrave; việc ra đường khi kh&ocirc;ng thật sự cần thiết rất dễ l&agrave;m gia tăng nguy cơ l&acirc;y lan th&ecirc;m dịch bệnh, được xem l&agrave; một trong những giải ph&aacute;p cấp b&aacute;ch để g&oacute;p phần tận dụng được &ldquo;thời gian v&agrave;ng&rdquo; 15 ng&agrave;y gi&atilde;n c&aacute;ch khống chế, đẩy l&ugrave;i dịch bệnh. V&igrave; thế, sau 2 ng&agrave;y đầu ti&ecirc;n một số nơi c&ograve;n nhắc nhở, đến h&ocirc;m qua hầu hết c&aacute;c chốt kiểm so&aacute;t thực hiện nghi&ecirc;m việc xử l&yacute; c&aacute;c trường hợp ra đường kh&ocirc;ng c&oacute; l&yacute; do ch&iacute;nh đ&aacute;ng.</p>

<p><img alt="" src="/App_Dataimages/1_oara.jpg" style="height:434px; width:771px" /></p>

<h2><strong>Ra khỏi quận mua thực phẩm kh&ocirc;ng được chấp nhận</strong></h2>

<p>Khoảng 15 giờ ng&agrave;y 11.7, PV<em>&nbsp;<a href="https://thanhnien.vn/" rel="nofollow" target="_blank">Thanh Ni&ecirc;n</a></em>&nbsp;c&oacute; mặt tại đường&nbsp;<a href="https://thanhnien.vn/cach-mang-thang-8/" rel="">C&aacute;ch Mạng Th&aacute;ng 8</a>&nbsp;(đoạn gần v&ograve;ng xoay C&ocirc;ng trường D&acirc;n chủ) ghi nhận việc xử l&yacute; của C&ocirc;ng an Q.3 đối với c&aacute;c trường hợp ra đường kh&ocirc;ng ch&iacute;nh đ&aacute;ng. L&atilde;nh đạo Đội CSGT-TT C&ocirc;ng an Q.3 th&ocirc;ng tin 2 ng&agrave;y đầu thực hiện Chỉ thị 16 (ng&agrave;y 9 v&agrave; 10.7), đơn vị chủ yếu nhắc nhở, tuy&ecirc;n truyền cho người d&acirc;n, ri&ecirc;ng ng&agrave;y 11.7 tổ c&ocirc;ng t&aacute;c đ&atilde; lập bi&ecirc;n bản xử l&yacute; 20 trường hợp người d&acirc;n ra đường kh&ocirc;ng c&oacute; l&yacute; do ch&iacute;nh đ&aacute;ng, với mức phạt 2 triệu đồng/trường hợp.</p>

<h3><strong>Thế n&agrave;o l&agrave; ra đường c&oacute; l&yacute; do ch&iacute;nh đ&aacute;ng ?</strong></h3>

<p>Theo Chỉ thị 16 m&agrave; TP.HCM đang &aacute;p dụng, người d&acirc;n chỉ ra ngo&agrave;i trong trường hợp thật sự cần thiết gồm: mua lương thực, thực phẩm, dược phẩm v&agrave; h&agrave;ng h&oacute;a, dịch vụ thiết yếu kh&aacute;c; c&aacute;c trường hợp khẩn cấp như: cấp cứu, kh&aacute;m chữa bệnh; thi&ecirc;n tai, hỏa hoạn, tang lễ; l&agrave;m việc tại c&aacute;c cơ quan, đơn vị nh&agrave; nước, lực lượng vũ trang, cơ quan ngoại giao; l&agrave;m việc tại c&aacute;c cơ sở sản xuất, c&ocirc;ng trường, c&ocirc;ng tr&igrave;nh giao th&ocirc;ng, x&acirc;y dựng; cơ sở&nbsp;<a href="https://thanhnien.vn/tai-chinh-kinh-doanh/" rel="">kinh doanh</a>&nbsp;dịch vụ, h&agrave;ng h&oacute;a thiết yếu (như: lương thực, thực phẩm, dược phẩm; xăng, dầu; điện; nước; nhi&ecirc;n liệu,...); ng&acirc;n h&agrave;ng, kho bạc, c&aacute;c cơ sở kinh doanh dịch vụ trực tiếp li&ecirc;n quan đến hoạt động ng&acirc;n h&agrave;ng v&agrave; bổ trợ doanh nghiệp (như c&ocirc;ng chứng, luật sư, đăng kiểm, đăng k&yacute; giao dịch bảo đảm...), chứng kho&aacute;n, bưu ch&iacute;nh, viễn th&ocirc;ng, dịch vụ hỗ trợ vận chuyển, xuất, nhập khẩu h&agrave;ng h&oacute;a, kh&aacute;m bệnh, chữa bệnh, tang lễ...&nbsp;</p>
', CAST(N'2021-07-12T11:17:06.603' AS DateTime), N'/App_Dataimages/3_xzku.jpg', 4, 17)
INSERT [dbo].[articles] ([article_id], [title], [textbody], [create_time], [image], [user_id], [cate_id]) VALUES (11, N'Cháy nhà trong đêm, vợ chồng tử vong', N'<p>QUẢNG NAMHỏa hoạn tại ng&ocirc;i nh&agrave; hai tầng kinh doanh văn ph&ograve;ng phẩm ở đường Phan Chu Trinh, TP Tam Kỳ khiến vợ chồng tử vong l&uacute;c rạng s&aacute;ng 31/5.</p>

<p>Hơn 2h, lửa bốc l&ecirc;n từ tầng hai ng&ocirc;i nh&agrave; của vợ chồng &ocirc;ng Nguyễn Thanh v&agrave; b&agrave; Nguyễn Thị Th&ugrave;y Hoa. Một giờ sau, người d&acirc;n ph&aacute;t hiện đ&atilde; h&ocirc; ho&aacute;n v&agrave; b&aacute;o lực lượng chức năng.</p>

<p>Cảnh s&aacute;t ph&ograve;ng ch&aacute;y chữa ch&aacute;y điều 4 xe c&ugrave;ng 35 c&aacute;n bộ, chiến sĩ tham gia cứu hỏa. Tuy nhi&ecirc;n, do căn nh&agrave; kinh doanh văn ph&ograve;ng phẩm, chứa nhiều đồ vật dễ ch&aacute;y, lại đ&oacute;ng k&iacute;n n&ecirc;n việc cứu hỏa, cứu nạn gặp kh&oacute; khăn.</p>

<p><img alt="Hàng hóa ở tầng 1 ngôi nhà bị thiêu rụi. Ảnh: Đắc Thành" src="https://i1-vnexpress.vnecdn.net/2023/05/31/anh-1-5192-1685493657-16854954-9936-8674-1685495590.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=31f1g1KuojX97fTtB8__Lg" /></p>

<p>H&agrave;ng h&oacute;a ở tầng một ng&ocirc;i nh&agrave; bị thi&ecirc;u rụi. Ảnh:&nbsp;<em>Đắc Th&agrave;nh</em></p>

<p>Đến 4h, hỏa hoạn được khống chế. &Ocirc;ng Thanh v&agrave; b&agrave; Hoa tử vong, một người kh&aacute;c trong nh&agrave; được đưa đi cấp cứu tại Bệnh viện Đa khoa tỉnh Quảng Nam.</p>

<p>C&ocirc;ng an đang kh&aacute;m nghiệm hiện trường, điều tra nguy&ecirc;n nh&acirc;n hỏa hoạn.</p>

<p><img alt="Cảnh sát khám nghiệm hiện trường. Ảnh: Đắc Thành" src="https://i1-vnexpress.vnecdn.net/2023/05/31/2-jpeg-4148-1685493657.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=5jhXgFO_rfGuIs0DJ0tBBA" /></p>

<p>Cảnh s&aacute;t kh&aacute;m nghiệm hiện trường s&aacute;ng 31/5. Ảnh:&nbsp;<em>Đắc Th&agrave;nh</em></p>

<p>Miền Bắc v&agrave; miền Trung đang trong đợt nắng n&oacute;ng, nhu cầu sử dụng điện tăng cao. Cơ quan kh&iacute; tượng v&agrave; điện lực cảnh b&aacute;o người d&acirc;n cần cảnh gi&aacute;c với nguy cơ ch&aacute;y nổ do chập điện.</p>
', CAST(N'2023-05-31T08:38:42.840' AS DateTime), N'/App_Datafiles/2-jpeg-4148-1685493657.jpg', 4, 26)
INSERT [dbo].[articles] ([article_id], [title], [textbody], [create_time], [image], [user_id], [cate_id]) VALUES (12, N'Cầu vòm thép cao nhất Việt Nam trước một tháng thông xe', N'<p>Cầu Phật T&iacute;ch - Đại Đồng Th&agrave;nh bắc qua s&ocirc;ng Đuống, nối huyện Ti&ecirc;n Du v&agrave; Thuận Th&agrave;nh, được khởi c&ocirc;ng từ năm 2018. Đ&acirc;y l&agrave; c&ocirc;ng tr&igrave;nh trọng điểm của tỉnh Bắc Ninh với chiều d&agrave;i hơn 1,5 km, tổng mức đầu tư 1.927 tỷ đồng.</p>

<p>Cầu c&oacute; kiến tr&uacute;c với 5 v&ograve;m chịu lực mang h&igrave;nh tượng cặp rồng thời L&yacute;, th&acirc;n rồng cuộn h&igrave;nh chữ S, giữa đỉnh v&ograve;m l&agrave; đầu cặp rồng cất cao, đối xứng nhau qua h&ograve;n ngọc, tượng trưng cho mặt trăng, mặt trời. Mỗi th&acirc;n rồng c&oacute; 12 v&acirc;y tượng trưng cho 12 th&aacute;ng mưa thuận gi&oacute; h&ograve;a trong năm.</p>

<p><img src="https://i1-vnexpress.vnecdn.net/2023/05/30/cau-JPG-1685402250.jpg?w=0&amp;h=0&amp;q=100&amp;dpr=2&amp;fit=crop&amp;s=YcCvsVxq89dHYDMTfDVEfA" /></p>

<p>Bấm để xem ảnh</p>

<p><img src="https://i1-vnexpress.vnecdn.net/2023/05/30/cau-phat-tich1-1685402251.jpg?w=0&amp;h=0&amp;q=100&amp;dpr=2&amp;fit=crop&amp;s=9qw-_pjd_woPntvoAs-dJg" /></p>

<p>Sau gần 5 năm x&acirc;y dựng, cầu dự kiến th&ocirc;ng xe cuối th&aacute;ng 6 tới.</p>

<p>Theo thiết kế, phần th&acirc;n cầu được l&agrave;m bằng b&ecirc;t&ocirc;ng cốt th&eacute;p, kết hợp v&ograve;m th&eacute;p v&agrave; hệ d&acirc;y c&aacute;p treo v&agrave;o mặt cầu; mặt cắt ngang cầu rộng 22,5 m, thiết kế 4 l&agrave;n &ocirc;t&ocirc;, lề bộ h&agrave;nh mỗi b&ecirc;n 2 m, cầu ch&iacute;nh d&agrave;i 440 m, cầu dẫn ph&iacute;a bắc d&agrave;i hơn 623 m, ph&iacute;a nam d&agrave;i hơn 173 m.</p>

<p><img alt="" src="https://i1-vnexpress.vnecdn.net/2023/05/30/cau-3-JPG-1685402253.jpg?w=1200&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=gfX9saAHIMrX5tz22PuIvg" /></p>

<p>Từ th&aacute;ng 3, cầu ho&agrave;n th&agrave;nh lắp đặt 5 nhịp v&ograve;m th&eacute;p. Đ&acirc;y l&agrave; hạng mục c&oacute; kỹ thuật v&agrave; biện ph&aacute;p thi c&ocirc;ng phức tạp, kh&oacute; nhất của dự &aacute;n.</p>

<p>Từ mặt nước l&ecirc;n tới đỉnh v&ograve;m cao khoảng 87 m, cao nhất Việt Nam. Để thi c&ocirc;ng hạng mục nhịp v&ograve;m th&eacute;p, nh&agrave; thầu phải huy động cần cẩu nặng 800 tấn từ miền Nam di chuyển khoảng một th&aacute;ng bằng đường thủy.</p>

<p><iframe frameborder="0" height="250" id="google_ads_iframe_/27973503/Vnexpress/Desktop/Breakpage1/Thoisu/Thoisu.giaothong.detail_0" name="google_ads_iframe_/27973503/Vnexpress/Desktop/Breakpage1/Thoisu/Thoisu.giaothong.detail_0" scrolling="no" tabindex="0" title="3rd party ad content" width="1100"></iframe></p>

<p><img alt="" src="https://i1-vnexpress.vnecdn.net/2023/05/29/L1008863-JPG-1685372523.jpg?w=1200&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=0yhmL5t-T5sqVQTRX56e9Q" /></p>

<p>C&aacute;c c&ocirc;ng nh&acirc;n đang căng d&acirc;y c&aacute;p. Để bảo đảm tiến độ, khoảng 20 c&ocirc;ng nh&acirc;n l&agrave;m việc li&ecirc;n tục tr&ecirc;n c&ocirc;ng trường.</p>

<p><img alt="" src="https://i1-vnexpress.vnecdn.net/2023/05/29/L1008900-JPG-1685373293.jpg?w=1200&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=Sf2Py61HgQjG-mTlyioUJw" /></p>

<p>B&ecirc;n trong bụng cầu, nơi d&acirc;y c&aacute;p được cố định, c&ocirc;ng nh&acirc;n phải l&agrave;m việc trong m&ocirc;i trường thiếu &aacute;nh s&aacute;ng.</p>

<p><img alt="" src="https://i1-vnexpress.vnecdn.net/2023/05/29/L1120491-JPG-1685373295.jpg?w=1200&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=nKC9kqg2IloSnoqw2Z2UUA" /></p>

<p>Phần lan can cầu đang được thi c&ocirc;ng. Ngo&agrave;i ra, nh&agrave; thầu sẽ được căng c&aacute;p, thảm b&ecirc;t&ocirc;ng nhựa mặt cầu, lắp g&ograve; lan can, tay vịn; thi c&ocirc;ng khe co gi&atilde;n, hệ thống điện chiếu s&aacute;ng v&agrave; chống s&eacute;t.</p>

<p>Hiện cầu đ&atilde; ho&agrave;n thiện hơn 90% khối lượng c&ocirc;ng việc.</p>

<p><iframe frameborder="0" height="90" id="google_ads_iframe_/27973503/Vnexpress/Desktop/Breakpage2/Thoisu/Thoisu.giaothong.detail_0" name="" scrolling="no" src="https://846f9ed2ca9aab2d84b79fb03c4c5f42.safeframe.googlesyndication.com/safeframe/1-0-40/html/container.html" tabindex="0" title="3rd party ad content" width="728"></iframe></p>

<p><img alt="" src="https://i1-vnexpress.vnecdn.net/2023/05/29/L1008864-JPG-1685373296.jpg?w=1200&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=oKN3FkkBQhCv2mGv9WNHmw" /></p>

<p>Giao th&ocirc;ng đường thủy tấp nập ph&iacute;a dưới cầu. S&ocirc;ng Đuống vốn l&agrave; tuyến đường thủy kết nối 3 địa phương lớn của miền Bắc l&agrave; H&agrave; Nội - Hải Ph&ograve;ng - Quảng Ninh. Đ&acirc;y l&agrave; cầu thứ 6 vượt s&ocirc;ng Đuống, sau cầu Đuống, Đ&ocirc;ng Tr&ugrave;, Ph&ugrave; Đổng, B&igrave;nh Than v&agrave; cầu Hồ.</p>

<p>Từ cầu Phật T&iacute;ch, người d&acirc;n c&oacute; thể tham quan nhiều danh lam thắng cảnh của Bắc Ninh như lăng Kinh Dương Vương, ch&ugrave;a Phật T&iacute;ch.</p>

<p><img alt="" src="https://i1-vnexpress.vnecdn.net/2023/05/29/DJI-0407-JPG-1685372376.jpg?w=1200&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=RW9y5iVqwvFa9sDojGFwaw" /></p>

<p>Hiện phần đường dẫn b&ecirc;n ph&iacute;a huyện Ti&ecirc;n Du đ&atilde; ho&agrave;n tất. Trong khi ph&iacute;a huyện Thuận Th&agrave;nh chờ trải nhựa.</p>

<p>Khi th&ocirc;ng xe, cầu Phật T&iacute;ch h&igrave;nh th&agrave;nh mạng giao th&ocirc;ng kh&eacute;p k&iacute;n giữa khu vực bắc Đuống v&agrave; nam Đuống của tỉnh Bắc Ninh; gi&uacute;p kết nối với c&aacute;c tỉnh Đồng bằng s&ocirc;ng Hồng v&agrave; phụ cận như: H&agrave; Nội, Bắc Giang, Th&aacute;i Nguy&ecirc;n, Hưng Y&ecirc;n, Hải Dương qua c&aacute;c quốc lộ: 1, 5, 17, 38 v&agrave; c&aacute;c tỉnh lộ 276, 287&hellip;</p>

<p><img alt="" src="https://i1-vnexpress.vnecdn.net/2023/05/30/cau-dai-dong-1-jpeg-1685402255.jpg?w=1200&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=a983kBGdMVbBfH8DodYqaA" /></p>

<p>Cầu Phật T&iacute;ch khi ho&agrave;n thiện sẽ c&oacute; th&ecirc;m phần chiếu s&aacute;ng v&agrave;o ban đ&ecirc;m. Ảnh:&nbsp;<em>VTCO &ndash; WSP</em></p>

<p><iframe frameborder="0" height="250" id="google_ads_iframe_/27973503/Vnexpress/Desktop/Breakpage3/Thoisu/Thoisu.giaothong.detail_0" name="" scrolling="no" src="https://846f9ed2ca9aab2d84b79fb03c4c5f42.safeframe.googlesyndication.com/safeframe/1-0-40/html/container.html" tabindex="0" title="3rd party ad content" width="970"></iframe></p>

<p><img alt="" src="https://i1-vnexpress.vnecdn.net/2023/05/29/350372611-647902390032164-5203767962255577125-n-1685373298.jpg?w=1200&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=bjXptJEpKSHpthoLnVyWMQ" /></p>

<p>Vị tr&iacute; cầu Phật T&iacute;ch - Đại Đồng Th&agrave;nh. Đồ họa:&nbsp;<em>Mạnh Cường</em></p>
', CAST(N'2023-05-31T08:39:46.820' AS DateTime), N'/App_Datafiles/cau-6-JPG-1685402247.jpg', 4, 6)
SET IDENTITY_INSERT [dbo].[articles] OFF
GO
SET IDENTITY_INSERT [dbo].[categories] ON 

INSERT [dbo].[categories] ([cate_id], [cate_name]) VALUES (6, N'Văn hóa')
INSERT [dbo].[categories] ([cate_id], [cate_name]) VALUES (10, N'Thể thao')
INSERT [dbo].[categories] ([cate_id], [cate_name]) VALUES (13, N'Công nghệ')
INSERT [dbo].[categories] ([cate_id], [cate_name]) VALUES (15, N'Game')
INSERT [dbo].[categories] ([cate_id], [cate_name]) VALUES (16, N'Thời trang')
INSERT [dbo].[categories] ([cate_id], [cate_name]) VALUES (17, N'Covid-19')
INSERT [dbo].[categories] ([cate_id], [cate_name]) VALUES (18, N'Tuyển dụng')
INSERT [dbo].[categories] ([cate_id], [cate_name]) VALUES (23, N'Thời tiết')
INSERT [dbo].[categories] ([cate_id], [cate_name]) VALUES (24, N'Breaking news')
INSERT [dbo].[categories] ([cate_id], [cate_name]) VALUES (25, N'Bất động sản')
INSERT [dbo].[categories] ([cate_id], [cate_name]) VALUES (26, N'Pháp luật')
SET IDENTITY_INSERT [dbo].[categories] OFF
GO
SET IDENTITY_INSERT [dbo].[comments] ON 

INSERT [dbo].[comments] ([cmt_id], [user_id], [article_id], [cmt_cotnent], [create_time]) VALUES (1, 1, 2, N'Bài viết thật hữu ích!', CAST(N'2021-07-02T09:15:00.000' AS DateTime))
INSERT [dbo].[comments] ([cmt_id], [user_id], [article_id], [cmt_cotnent], [create_time]) VALUES (2, 1, 1, N'Bài viết thật hữu ích với mọi người!', CAST(N'2021-07-02T09:16:00.000' AS DateTime))
INSERT [dbo].[comments] ([cmt_id], [user_id], [article_id], [cmt_cotnent], [create_time]) VALUES (3, 1, 1, N'Thật tuyệt!', CAST(N'2021-07-02T09:19:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[comments] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([user_id], [usename], [email], [password], [full_name], [avatar], [sefl_des]) VALUES (2, N'admin', N'admin@wizard.com', N'12345', N'Adminstrator', NULL, NULL)
SET IDENTITY_INSERT [dbo].[users] OFF
GO
/****** Object:  StoredProcedure [dbo].[accountlogin]    Script Date: 5/31/2023 10:48:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[accountlogin](
	@email nvarchar(256),
	@password nvarchar(MAX))
as 
begin
	declare @count int
	declare @res bit
	select @count = count(*) from users where email = @email and password = @password
	if @count >= 1
		set @res = 1
	else 
		set @res = 0
	select @res
end
GO
/****** Object:  StoredProcedure [dbo].[countRowArticles]    Script Date: 5/31/2023 10:48:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[countRowArticles]
as
begin
	SELECT COUNT(*) FROM articles
	end
GO
/****** Object:  StoredProcedure [dbo].[countRowCategories]    Script Date: 5/31/2023 10:48:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[countRowCategories]
as
begin
	SELECT COUNT(*) FROM categories
	end
GO
/****** Object:  StoredProcedure [dbo].[countRowCmt]    Script Date: 5/31/2023 10:48:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[countRowCmt]
as
begin
	SELECT COUNT(*) FROM comments
	end
GO
/****** Object:  StoredProcedure [dbo].[countRowUsers]    Script Date: 5/31/2023 10:48:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[countRowUsers]
as
begin
	SELECT COUNT(*) FROM users
	end
GO
/****** Object:  StoredProcedure [dbo].[delete_article]    Script Date: 5/31/2023 10:48:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[delete_article](@art_id INT)
AS
   DELETE FROM articles
   WHERE article_id = @art_id
GO
/****** Object:  StoredProcedure [dbo].[delete_cate]    Script Date: 5/31/2023 10:48:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[delete_cate](@cateid INT)
AS
   DELETE FROM categories
   WHERE cate_id = @cateid
GO
/****** Object:  StoredProcedure [dbo].[delete_cmt]    Script Date: 5/31/2023 10:48:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[delete_cmt](@cmt_id INT)
AS
   DELETE FROM comments
   WHERE cmt_id = @cmt_id
GO
/****** Object:  StoredProcedure [dbo].[delete_user]    Script Date: 5/31/2023 10:48:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[delete_user](@userid INT)
AS
   DELETE FROM users
   WHERE user_id = @userid
GO
/****** Object:  StoredProcedure [dbo].[findArticles]    Script Date: 5/31/2023 10:48:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[findArticles](
	@title nvarchar(max)
)
as
begin
	select * from articles where title like '%@title%'
	end
GO
/****** Object:  StoredProcedure [dbo].[GetAll_Articles]    Script Date: 5/31/2023 10:48:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetAll_Articles]
as
select * from articles
GO
/****** Object:  StoredProcedure [dbo].[GetAll_Categories]    Script Date: 5/31/2023 10:48:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetAll_Categories]
as 
select * from categories
GO
/****** Object:  StoredProcedure [dbo].[GetAll_Comments]    Script Date: 5/31/2023 10:48:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetAll_Comments]
as 
select * from comments
GO
/****** Object:  StoredProcedure [dbo].[GetAll_Users]    Script Date: 5/31/2023 10:48:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetAll_Users]
as 
select * from users
GO
/****** Object:  StoredProcedure [dbo].[getArtById]    Script Date: 5/31/2023 10:48:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getArtById](
	@id int
)
as
begin
	select * from articles where article_id = @id
	end
GO
/****** Object:  StoredProcedure [dbo].[getCateById]    Script Date: 5/31/2023 10:48:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getCateById](
	@var_id int
)
as
begin
	select * from categories where cate_id = @var_id
	end
GO
/****** Object:  StoredProcedure [dbo].[insert_article]    Script Date: 5/31/2023 10:48:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[insert_article](
	@title nvarchar(max),
	@textbody nvarchar(max),
	@image nvarchar(max),
	@user_id int,
	@cate_id int
)
as
begin
	insert into articles(title,textbody,create_time,image,user_id,cate_id) values(@title,@textbody,GETDATE(),@image, @user_id,@cate_id)
end
GO
/****** Object:  StoredProcedure [dbo].[insert_category]    Script Date: 5/31/2023 10:48:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[insert_category](
	@name nvarchar(MAX)
)
as
begin
	insert into categories(cate_name) values(@name)
end
GO
/****** Object:  StoredProcedure [dbo].[spAccountCheckExists]    Script Date: 5/31/2023 10:48:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spAccountCheckExists](
	@username nvarchar(max),
	@email nvarchar(256))
as 
BEGIN
	DECLARE @count INT = 0
	select @count = COUNT(*) from accounts 
		WHERE email LIKE @email or usename LIKE @username
	select @count
end
GO
/****** Object:  StoredProcedure [dbo].[spAccountLogin]    Script Date: 5/31/2023 10:48:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[spAccountLogin](
	@email nvarchar(256),
	@password nvarchar(MAX))
as 
begin
	select * from accounts where email LIKE @email and password = @password
end
GO
/****** Object:  StoredProcedure [dbo].[spAccountRegister]    Script Date: 5/31/2023 10:48:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[spAccountRegister](
	@username NVARCHAR(MAX),
	@email nvarchar(256),
	@password nvarchar(MAX),
	@full_name nvarchar(MAX))
as 
begin
	INSERT INTO accounts (usename, email, password, full_name, avatar, sefl_des)
	VALUES (@username, @email, @password, @full_name, N'', N'G')
	
	SELECT * FROM accounts WHERE user_id = SCOPE_IDENTITY()
end
GO
/****** Object:  StoredProcedure [dbo].[update_article]    Script Date: 5/31/2023 10:48:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[update_article](
	@article_id int,
	@title nvarchar(max),
	@textbody nvarchar(max),
	@image nvarchar(max),
	@cateid int
)
as
BEGIN
	SET NOCOUNT ON
	UPDATE [articles]
	SET    [title] = @title, [textbody] = @textbody, [image] = @image, [cate_id] = @cateid
	WHERE  [article_id] = @article_id
	
	SELECT [article_id], [title], [textbody], [create_time], [image], [user_id], [cate_id]
	FROM   [articles]
	WHERE  [article_id] = @article_id	

end
GO
/****** Object:  StoredProcedure [dbo].[update_article1]    Script Date: 5/31/2023 10:48:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[update_article1](
	@article_id int,
	@title nvarchar(max),
	@textbody nvarchar(max),
	@image nvarchar(max),
	@cateid int
)
as
BEGIN
	SET NOCOUNT ON
	UPDATE [articles]
	SET    [title] = @title, [textbody] = @textbody, [image] = @image, [cate_id] = @cateid
	WHERE  [article_id] = @article_id
	
	SELECT [article_id], [title], [textbody], [create_time], [image], [user_id], [cate_id]
	FROM   [articles]
	WHERE  [article_id] = @article_id	

end
GO
/****** Object:  StoredProcedure [dbo].[update_cate]    Script Date: 5/31/2023 10:48:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[update_cate](
	@var_id int,
	@var_name nvarchar(max)
)
as
begin
	UPDATE categories
	SET cate_name = @var_name
	WHERE cate_id = @var_id;
end
GO
USE [master]
GO
ALTER DATABASE [wizard_magazine] SET  READ_WRITE 
GO
