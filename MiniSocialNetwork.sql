USE [master]
GO
/****** Object:  Database [MiniSocialNetwork]    Script Date: 9/29/2020 11:27:29 PM ******/
CREATE DATABASE [MiniSocialNetwork]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SocialNetwork', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\SocialNetwork.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SocialNetwork_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\SocialNetwork_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [MiniSocialNetwork] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MiniSocialNetwork].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MiniSocialNetwork] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MiniSocialNetwork] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MiniSocialNetwork] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MiniSocialNetwork] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MiniSocialNetwork] SET ARITHABORT OFF 
GO
ALTER DATABASE [MiniSocialNetwork] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MiniSocialNetwork] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MiniSocialNetwork] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MiniSocialNetwork] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MiniSocialNetwork] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MiniSocialNetwork] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MiniSocialNetwork] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MiniSocialNetwork] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MiniSocialNetwork] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MiniSocialNetwork] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MiniSocialNetwork] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MiniSocialNetwork] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MiniSocialNetwork] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MiniSocialNetwork] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MiniSocialNetwork] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MiniSocialNetwork] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MiniSocialNetwork] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MiniSocialNetwork] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MiniSocialNetwork] SET  MULTI_USER 
GO
ALTER DATABASE [MiniSocialNetwork] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MiniSocialNetwork] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MiniSocialNetwork] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MiniSocialNetwork] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [MiniSocialNetwork] SET DELAYED_DURABILITY = DISABLED 
GO
USE [MiniSocialNetwork]
GO
/****** Object:  Table [dbo].[tblArticle]    Script Date: 9/29/2020 11:27:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblArticle](
	[postID] [varchar](5) NOT NULL,
	[email] [nvarchar](255) NOT NULL,
	[title] [nvarchar](255) NOT NULL,
	[description] [text] NOT NULL,
	[date] [datetime] NOT NULL,
	[image] [nvarchar](255) NULL,
	[statusID] [nchar](5) NOT NULL,
 CONSTRAINT [PK_tblArticless] PRIMARY KEY CLUSTERED 
(
	[postID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblComment]    Script Date: 9/29/2020 11:27:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblComment](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[postID] [varchar](5) NULL,
	[email] [nvarchar](255) NULL,
	[date] [datetime] NULL,
	[comment] [nvarchar](255) NULL,
	[statusID] [nchar](5) NULL,
 CONSTRAINT [PK_tblComment] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblEmotion]    Script Date: 9/29/2020 11:27:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblEmotion](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[postID] [varchar](5) NULL,
	[email] [nvarchar](255) NOT NULL,
	[emotion] [varchar](50) NOT NULL,
	[date] [datetime] NOT NULL,
	[statusID] [nchar](5) NOT NULL,
 CONSTRAINT [PK_tblEmotion] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblNotifies]    Script Date: 9/29/2020 11:27:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblNotifies](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[postID] [varchar](5) NOT NULL,
	[email] [nvarchar](255) NOT NULL,
	[date] [datetime] NOT NULL,
	[type] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblNotifies] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblStatus]    Script Date: 9/29/2020 11:27:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblStatus](
	[statusID] [nchar](5) NOT NULL,
	[statusName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tblStatus] PRIMARY KEY CLUSTERED 
(
	[statusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 9/29/2020 11:27:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblUser](
	[email] [nvarchar](255) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[password] [varchar](64) NOT NULL,
	[role] [varchar](50) NOT NULL,
	[statusID] [nchar](5) NOT NULL,
	[verifyCode] [nchar](6) NULL,
 CONSTRAINT [PK_tblUser] PRIMARY KEY CLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[tblArticle] ([postID], [email], [title], [description], [date], [image], [statusID]) VALUES (N'P1', N'abcdef@gmail.com', N'abcdef@article', N'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Consequatur quidem, consectetur tempore tempora quisquam magnam? Deserunt velit, neque tempora omnis quam, dolorum quia saepe maxime, adipisci corrupti recusandae labore sapiente.', CAST(N'2020-09-25 14:32:21.000' AS DateTime), N'image/image-analysis.png', N'S0001')
INSERT [dbo].[tblArticle] ([postID], [email], [title], [description], [date], [image], [statusID]) VALUES (N'P10', N'xyz@gmail.com', N'xyz@article3', N'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Consequatur quidem, consectetur tempore tempora quisquam magnam? Deserunt velit, neque tempora omnis quam, dolorum quia saepe maxime, adipisci corrupti recusandae labore sapiente.', CAST(N'2020-09-25 15:13:46.000' AS DateTime), N'image/image-analysis.png', N'S0003')
INSERT [dbo].[tblArticle] ([postID], [email], [title], [description], [date], [image], [statusID]) VALUES (N'P11', N'xyz@gmail.com', N'xyz@article4', N'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Consequatur quidem, consectetur tempore tempora quisquam magnam? Deserunt velit, neque tempora omnis quam, dolorum quia saepe maxime, adipisci corrupti recusandae labore sapiente.', CAST(N'2020-09-25 15:29:13.000' AS DateTime), N'image/image-analysis.png', N'S0001')
INSERT [dbo].[tblArticle] ([postID], [email], [title], [description], [date], [image], [statusID]) VALUES (N'P12', N'abc@gmail.com', N'abc@article3', N'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Consequatur quidem, consectetur tempore tempora quisquam magnam? Deserunt velit, neque tempora omnis quam, dolorum quia saepe maxime, adipisci corrupti recusandae labore sapiente.

', CAST(N'2020-09-25 15:38:12.000' AS DateTime), N'image/image-analysis.png', N'S0001')
INSERT [dbo].[tblArticle] ([postID], [email], [title], [description], [date], [image], [statusID]) VALUES (N'P13', N'abcd@gmail.com', N'abcd@article', N'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Consequatur quidem, consectetur tempore tempora quisquam magnam? Deserunt velit, neque tempora omnis quam, dolorum quia saepe maxime, adipisci corrupti recusandae labore sapiente.', CAST(N'2020-09-25 15:39:43.000' AS DateTime), N'image/download.jpg', N'S0001')
INSERT [dbo].[tblArticle] ([postID], [email], [title], [description], [date], [image], [statusID]) VALUES (N'P14', N'abc@gmail.com', N'abc@article4', N'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Consequatur quidem, consectetur tempore tempora quisquam magnam? Deserunt velit, neque tempora omnis quam, dolorum quia saepe maxime, adipisci corrupti recusandae labore sapiente.

', CAST(N'2020-09-26 07:32:29.000' AS DateTime), N'image/image-analysis.png', N'S0001')
INSERT [dbo].[tblArticle] ([postID], [email], [title], [description], [date], [image], [statusID]) VALUES (N'P15', N'abc@gmail.com', N'abc@article5', N'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Consequatur quidem, consectetur tempore tempora quisquam magnam? Deserunt velit, neque tempora omnis quam, dolorum quia saepe maxime, adipisci corrupti recusandae labore sapiente.', CAST(N'2020-09-26 07:34:34.000' AS DateTime), N'image/satellite-image-of-globe.jpg', N'S0001')
INSERT [dbo].[tblArticle] ([postID], [email], [title], [description], [date], [image], [statusID]) VALUES (N'P16', N'xyz@gmail.com', N'Hieu''s post', N'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Consequatur quidem, consectetur tempore tempora quisquam magnam? Deserunt velit, neque tempora omnis quam, dolorum quia saepe maxime, adipisci corrupti recusandae labore sapiente.

', CAST(N'2020-09-26 19:52:20.000' AS DateTime), N'image/Capture.PNG', N'S0003')
INSERT [dbo].[tblArticle] ([postID], [email], [title], [description], [date], [image], [statusID]) VALUES (N'P17', N'xyz@gmail.com', N'Hieu''s post', N'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Consequatur quidem, consectetur tempore tempora quisquam magnam? Deserunt velit, neque tempora omnis quam, dolorum quia saepe maxime, adipisci corrupti recusandae labore sapiente.', CAST(N'2020-09-26 19:55:25.000' AS DateTime), N'image/people-5594462_1280.jpg', N'S0001')
INSERT [dbo].[tblArticle] ([postID], [email], [title], [description], [date], [image], [statusID]) VALUES (N'P18', N'abcdef@gmail.com', N'Thanh Phuong''s  News', N'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Consequatur quidem, consectetur tempore tempora quisquam magnam? Deserunt velit, neque tempora omnis quam, dolorum quia saepe maxime, adipisci corrupti recusandae labore sapiente.

', CAST(N'2020-09-27 01:03:26.000' AS DateTime), N'image/satellite-image-of-globe.jpg', N'S0001')
INSERT [dbo].[tblArticle] ([postID], [email], [title], [description], [date], [image], [statusID]) VALUES (N'P19', N'abc@gmail.com', N'Today News', N'Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi iste debitis nostrum nobis labore temporibus hic quod, recusandae modi quibusdam eos quae sed! Tempora, alias labore laboriosam officiis quidem esse!
        Error dolorum aut esse perferendis cumque, nihil, obcaecati ex dolores exercitationem illo cupiditate ducimus debitis laboriosam! Laudantium, incidunt. Sequi velit veritatis molestiae distinctio accusantium ipsam enim commodi cumque, itaque maxime.
        Incidunt repellat tempora quia dolorum totam enim alias, quo assumenda ipsam eaque rem aliquam? Mollitia, nisi, enim dolor aperiam sunt facilis repellat consequuntur provident quos sapiente voluptatibus. Impedit, praesentium suscipit.
        Laboriosam nihil a aspernatur alias, porro minus praesentium ullam nostrum voluptatum exercitationem nisi blanditiis unde natus quae quasi sequi, iure animi rerum laudantium harum est corporis! Nisi itaque nemo praesentium?
        Sunt eius a libero praesentium nemo autem provident maiores accusamus nesciunt, repellendus ex rem consequuntur in officia perferendis ipsa illo repudiandae quam amet, nulla alias hic aperiam saepe! Adipisci, tenetur.
        Eveniet deleniti officia a esse rerum vitae perspiciatis magnam fugit. Impedit, molestiae. Non dolores odit soluta maiores delectus, minus voluptate numquam eligendi quisquam, necessitatibus voluptatum et mollitia deserunt a repellat.
        Non, minus error suscipit, distinctio sapiente quasi optio sint culpa nulla delectus repellat soluta maiores facere aliquid aliquam dicta assumenda! Quibusdam facilis quasi accusamus suscipit quae veritatis beatae modi soluta!
        Neque ea est, ratione iste necessitatibus cumque doloremque suscipit ipsam facere dolores harum tenetur repellat hic voluptatem nostrum labore! Provident consequuntur quod aliquid, incidunt repellat cupiditate nihil officiis vitae itaque.
        Vero porro eos fuga eaque repellat ab qui illo numquam animi deleniti et aliquam reprehenderit nobis excepturi, deserunt illum culpa magni tenetur architecto in sint dolorem facere. Aspernatur, quod esse!
        Pariatur sit praesentium fuga omnis repudiandae nemo dicta voluptatem accusantium, molestiae aspernatur culpa sed totam dolorem iste facere! Saepe corrupti est praesentium voluptas harum deleniti numquam tenetur mollitia magnam illo!
        Earum nihil maiores illo incidunt. Beatae exercitationem deserunt earum delectus quam nulla enim maiores placeat. Enim, possimus officia? Saepe numquam porro asperiores odit officia exercitationem necessitatibus cum ex eius veritatis!
        Dolore inventore ab quo blanditiis accusamus! Laborum, ullam quae. Distinctio ut eveniet veniam quidem voluptatem omnis velit asperiores nulla quis. Tempore sint ipsa pariatur illum harum dolorem ducimus accusantium. Dolores!
        Enim quibusdam dicta sit omnis voluptatibus dolore, sunt, earum temporibus, eaque labore eligendi velit reprehenderit adipisci. Nam, omnis sint, nisi delectus soluta neque ab numquam perspiciatis commodi ipsa nobis? Culpa.
        Quisquam itaque tempora nisi ex explicabo ad cupiditate? Sed non minima unde iusto ipsa vel quo consectetur deleniti quis sint nobis, voluptate ducimus sit, sapiente doloremque modi maiores possimus quae.
        Libero praesentium fugiat, laboriosam blanditiis nostrum reiciendis vero et, ratione fugit consequatur doloremque molestiae voluptatum ipsam, vitae dolorem dicta dolorum culpa. Et eos sint enim iure ad rem, repellat blanditiis?
        Reiciendis ratione facere ipsa omnis placeat quidem nam accusantium! Quo quibusdam illo molestiae dicta sed alias maxime vero distinctio nesciunt rem. Voluptatem nostrum sunt autem id consectetur repellat vero exercitationem!
        Impedit natus inventore quibusdam sed repellat! Sit ex excepturi dolore rem numquam impedit quae animi debitis quidem itaque, dolores maxime laboriosam neque cum molestias aspernatur blanditiis sapiente pariatur beatae saepe?
        Adipisci eos labore, placeat quisquam aperiam quam at mollitia aliquam nisi facilis quasi deserunt obcaecati, nemo quia ab magnam eum odit pariatur nulla maxime assumenda eligendi illum, quas fugiat? Iste!
        Alias aliquam, qui, adipisci quaerat impedit, deleniti maiores recusandae necessitatibus dolore earum molestiae totam placeat quia cum magni blanditiis beatae dolorem? Voluptatum culpa dicta quos esse fugiat blanditiis excepturi nostrum.
        Excepturi aut quae eum assumenda sunt, soluta dolores neque illo dolorem magnam ipsam culpa earum magni deleniti sint ea obcaecati optio quam, distinctio beatae? Ad consectetur pariatur numquam! Pariatur, perferendis.', CAST(N'2020-09-28 14:56:33.000' AS DateTime), N'image/satellite-image-of-globe.jpg', N'S0003')
INSERT [dbo].[tblArticle] ([postID], [email], [title], [description], [date], [image], [statusID]) VALUES (N'P2', N'abcdef@gmail.com', N'abcdef@article2', N'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Consequatur quidem, consectetur tempore tempora quisquam magnam? Deserunt velit, neque tempora omnis quam, dolorum quia saepe maxime, adipisci corrupti recusandae labore sapiente.', CAST(N'2020-09-25 14:48:42.000' AS DateTime), N'image/image-analysis.png', N'S0001')
INSERT [dbo].[tblArticle] ([postID], [email], [title], [description], [date], [image], [statusID]) VALUES (N'P20', N'labwebfptu@gmail.com', N'Test', N'', CAST(N'2020-09-28 18:45:20.000' AS DateTime), N'image/', N'S0003')
INSERT [dbo].[tblArticle] ([postID], [email], [title], [description], [date], [image], [statusID]) VALUES (N'P21', N'abc@gmail.com', N'Today News', N'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Consequatur quidem, consectetur tempore tempora quisquam magnam? Deserunt velit, neque tempora omnis quam, dolorum quia saepe maxime, adipisci corrupti recusandae labore sapiente.
', CAST(N'2020-09-28 19:30:44.000' AS DateTime), N'', N'S0001')
INSERT [dbo].[tblArticle] ([postID], [email], [title], [description], [date], [image], [statusID]) VALUES (N'P22', N'abc@gmail.com', N'Breaking News', N'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Consequatur quidem, consectetur tempore tempora quisquam magnam? Deserunt velit, neque tempora omnis quam, dolorum quia saepe maxime, adipisci corrupti recusandae labore sapiente.

', CAST(N'2020-09-28 20:01:02.000' AS DateTime), N'', N'S0001')
INSERT [dbo].[tblArticle] ([postID], [email], [title], [description], [date], [image], [statusID]) VALUES (N'P23', N'abc@gmail.com', N'Breaking News', N'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Consequatur quidem, consectetur tempore tempora quisquam magnam? Deserunt velit, neque tempora omnis quam, dolorum quia saepe maxime, adipisci corrupti recusandae labore sapiente.

', CAST(N'2020-09-28 20:01:17.000' AS DateTime), N'image/people-5594462_1280.jpg', N'S0001')
INSERT [dbo].[tblArticle] ([postID], [email], [title], [description], [date], [image], [statusID]) VALUES (N'P24', N'labwebfptu@gmail.com', N'Breaking News 2', N'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Consequatur quidem, consectetur tempore tempora quisquam magnam? Deserunt velit, neque tempora omnis quam, dolorum quia saepe maxime, adipisci corrupti recusandae labore sapiente.

', CAST(N'2020-09-28 20:03:18.000' AS DateTime), N'image/satellite-image-of-globe.jpg', N'S0001')
INSERT [dbo].[tblArticle] ([postID], [email], [title], [description], [date], [image], [statusID]) VALUES (N'P25', N'labwebfptu@gmail.com', N'Breaking News 3', N'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Consequatur quidem, consectetur tempore tempora quisquam magnam? Deserunt velit, neque tempora omnis quam, dolorum quia saepe maxime, adipisci corrupti recusandae labore sapiente.

', CAST(N'2020-09-28 20:03:36.000' AS DateTime), N'image/image-analysis.png', N'S0001')
INSERT [dbo].[tblArticle] ([postID], [email], [title], [description], [date], [image], [statusID]) VALUES (N'P26', N'abc@gmail.com', N'Breaking News', N'ASDASDASDA', CAST(N'2020-09-29 01:32:57.000' AS DateTime), N'', N'S0001')
INSERT [dbo].[tblArticle] ([postID], [email], [title], [description], [date], [image], [statusID]) VALUES (N'P27', N'abc@gmail.com', N'ASDSADAS', N'ASDASDSDSA', CAST(N'2020-09-29 01:33:02.000' AS DateTime), N'', N'S0001')
INSERT [dbo].[tblArticle] ([postID], [email], [title], [description], [date], [image], [statusID]) VALUES (N'P28', N'abc@gmail.com', N'Test', N'SDFSDFSDFSDF', CAST(N'2020-09-29 01:33:08.000' AS DateTime), N'', N'S0001')
INSERT [dbo].[tblArticle] ([postID], [email], [title], [description], [date], [image], [statusID]) VALUES (N'P29', N'abc@gmail.com', N'SDFF', N'SDFSDFFFF', CAST(N'2020-09-29 01:33:25.000' AS DateTime), N'image/people-5594462_1280.jpg', N'S0001')
INSERT [dbo].[tblArticle] ([postID], [email], [title], [description], [date], [image], [statusID]) VALUES (N'P3', N'abcdef@gmail.com', N'abcdef@article3', N'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Consequatur quidem, consectetur tempore tempora quisquam magnam? Deserunt velit, neque tempora omnis quam, dolorum quia saepe maxime, adipisci corrupti recusandae labore sapiente.

', CAST(N'2020-09-25 14:49:20.000' AS DateTime), N'image/download.jpg', N'S0001')
INSERT [dbo].[tblArticle] ([postID], [email], [title], [description], [date], [image], [statusID]) VALUES (N'P30', N'abc@gmail.com', N'Breaking News 2', N'111111111111111111111111111', CAST(N'2020-09-29 01:33:32.000' AS DateTime), N'', N'S0001')
INSERT [dbo].[tblArticle] ([postID], [email], [title], [description], [date], [image], [statusID]) VALUES (N'P31', N'abc@gmail.com', N'sad', N'1111111111111111111111111111111111111', CAST(N'2020-09-29 01:33:41.000' AS DateTime), N'', N'S0001')
INSERT [dbo].[tblArticle] ([postID], [email], [title], [description], [date], [image], [statusID]) VALUES (N'P32', N'abc@gmail.com', N'ADASHGFDAS', N'DSGVDGDSFCSF', CAST(N'2020-09-29 01:33:47.000' AS DateTime), N'', N'S0001')
INSERT [dbo].[tblArticle] ([postID], [email], [title], [description], [date], [image], [statusID]) VALUES (N'P33', N'abc@gmail.com', N'SDFSDCFSD', N'CSFSDFSDFSFA', CAST(N'2020-09-29 01:33:52.000' AS DateTime), N'', N'S0001')
INSERT [dbo].[tblArticle] ([postID], [email], [title], [description], [date], [image], [statusID]) VALUES (N'P34', N'abc@gmail.com', N'Breaking News', N'QWEQWERFSDFSFSD', CAST(N'2020-09-29 01:34:07.000' AS DateTime), N'', N'S0001')
INSERT [dbo].[tblArticle] ([postID], [email], [title], [description], [date], [image], [statusID]) VALUES (N'P35', N'abc@gmail.com', N'SDFSDFSDF', N'SDFSDFSDFDSF', CAST(N'2020-09-29 01:34:12.000' AS DateTime), N'', N'S0001')
INSERT [dbo].[tblArticle] ([postID], [email], [title], [description], [date], [image], [statusID]) VALUES (N'P36', N'abc@gmail.com', N'SFSDF', N'SDFSDFSDF', CAST(N'2020-09-29 01:34:16.000' AS DateTime), N'', N'S0001')
INSERT [dbo].[tblArticle] ([postID], [email], [title], [description], [date], [image], [statusID]) VALUES (N'P37', N'abc@gmail.com', N'DASDA', N'SDADSADSDS', CAST(N'2020-09-29 01:34:23.000' AS DateTime), N'', N'S0001')
INSERT [dbo].[tblArticle] ([postID], [email], [title], [description], [date], [image], [statusID]) VALUES (N'P38', N'abc@gmail.com', N'ASDAS', N'DASDADAD', CAST(N'2020-09-29 01:34:40.000' AS DateTime), N'', N'S0001')
INSERT [dbo].[tblArticle] ([postID], [email], [title], [description], [date], [image], [statusID]) VALUES (N'P39', N'abc@gmail.com', N'SADASD', N'SADADASDA', CAST(N'2020-09-29 01:34:44.000' AS DateTime), N'', N'S0001')
INSERT [dbo].[tblArticle] ([postID], [email], [title], [description], [date], [image], [statusID]) VALUES (N'P4', N'abc@gmail.com', N'abc@article', N'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Consequatur quidem, consectetur tempore tempora quisquam magnam? Deserunt velit, neque tempora omnis quam, dolorum quia saepe maxime, adipisci corrupti recusandae labore sapiente.', CAST(N'2020-09-25 15:03:28.000' AS DateTime), N'image/download.jpg', N'S0001')
INSERT [dbo].[tblArticle] ([postID], [email], [title], [description], [date], [image], [statusID]) VALUES (N'P40', N'taekwondo.ptp@gmail.com', N'Lorem ipsum dolor sit amet consectetur adipisicing elit.', N'Lorem ipsum dolor sit amet consectetur adipisicing elit. Excepturi expedita iusto obcaecati, ipsa omnis consequatur itaque corporis? Placeat sequi quae, neque excepturi voluptatem quia at quibusdam, consequuntur accusantium sapiente inventore.
        Adipisci corrupti vel, dolores at voluptates quaerat libero! Quos provident sequi illum ad eius ipsam quidem molestiae quia magni quod fugiat saepe, explicabo corrupti culpa vero a ipsum deserunt officiis?
        Qui enim placeat molestias facere. Commodi fugiat, laborum repellendus accusamus ullam placeat harum impedit. Architecto repellat nihil deleniti vitae iure facilis repellendus, neque nam voluptas iusto, ullam velit quasi nostrum?
        Voluptatem, incidunt pariatur odit tempora adipisci neque reprehenderit voluptatum iste consequuntur eos sed quisquam? Velit, provident perspiciatis ea facere, quo assumenda, ex quis alias cupiditate aspernatur sed sequi nemo? Nemo.
        Debitis architecto facilis asperiores exercitationem? Animi corrupti nam eaque minima repellendus unde enim debitis pariatur iure mollitia officia nostrum dolorem quas quasi, deserunt consequatur expedita quam dignissimos molestiae cupiditate. Est!
        Provident autem dolor temporibus dolorem mollitia quis architecto obcaecati cumque ab dolorum iusto, ratione explicabo porro! Maiores dolorum facere optio dignissimos laudantium at nulla, ab alias culpa aliquid architecto magni.
        Illo voluptatem ea eaque exercitationem tempore asperiores laboriosam nam architecto. Consequatur excepturi quod cupiditate quas earum corrupti totam vero sint magni esse eius laborum asperiores, eaque quasi illo temporibus quidem.
        Perspiciatis ex nesciunt temporibus error eaque atque praesentium cupiditate, provident beatae recusandae vitae, enim laudantium hic labore unde voluptates blanditiis ab minus natus excepturi sint harum porro alias! Optio, deleniti.
        Id reprehenderit, magni iure fuga eius ipsum iusto amet saepe ut consequatur, aliquam quibusdam labore architecto. Optio, ea iure animi suscipit voluptatibus porro? Accusamus itaque expedita blanditiis iure nulla laudantium.
        Doloribus perferendis nostrum ducimus, soluta aut recusandae consequatur commodi exercitationem similique ratione modi error, iste mollitia laudantium est? Aliquid reprehenderit numquam beatae. Beatae totam praesentium velit expedita, perferendis architecto blanditiis?
        Aliquam natus porro voluptates iusto possimus eos iure quia officia, molestiae quidem corporis ratione! Itaque, ipsa nobis cumque veniam magnam dolorem quod, fuga, cum earum et error amet placeat ex.
        Modi assumenda repudiandae voluptate, molestias voluptates vel unde, tempora fugiat ab fuga quisquam veniam. Obcaecati recusandae eos quod qui nostrum quaerat quam similique nisi, iure natus omnis, placeat, nulla doloremque.
        Nemo ut quisquam officiis, voluptatibus deserunt tempora vitae asperiores esse iste vero voluptatem veritatis dolorem debitis suscipit? Rem vitae assumenda inventore nesciunt natus ex, incidunt voluptatibus sunt error expedita ut.
        Consectetur mollitia voluptates rem perferendis, odio hic accusantium sapiente necessitatibus inventore tempore doloremque vero ad esse sed, voluptatibus aliquam pariatur debitis dolorem amet! Praesentium impedit cupiditate nemo hic nesciunt facere!
        Id cupiditate laborum deleniti blanditiis, ipsum ad dicta quia reprehenderit repellat sapiente quisquam, dolores, nemo ea tenetur ex nisi voluptate. Nisi, natus? Sed similique necessitatibus facere accusamus, non a suscipit.
        Aperiam quo repellat in nobis, quisquam laboriosam sit consequatur ab maxime cumque temporibus magni quis accusamus id corrupti impedit maiores reprehenderit neque odio animi? Nemo obcaecati magnam vel beatae accusamus.
        Voluptate voluptatem impedit vitae ducimus ab animi saepe tempore consequatur est incidunt, officia reprehenderit iusto repudiandae corrupti quis. Voluptate eius cumque voluptates laudantium magni? Temporibus deserunt molestiae recusandae aspernatur quod.
        Itaque ea ut magnam laudantium sint nesciunt a obcaecati autem soluta harum. Aperiam autem obcaecati tempore praesentium quod soluta, reprehenderit, odio omnis asperiores a necessitatibus provident, animi deleniti eaque vero.
        Quasi voluptate veniam nam error ratione? Accusantium vitae error repellat eius, possimus eveniet alias nostrum itaque temporibus voluptatem dolor? Modi placeat itaque cum accusantium fugit asperiores odit corporis nisi veritatis?
        Quisquam mollitia assumenda, consequatur ut et sunt inventore neque deleniti veniam modi expedita dolorem maxime corrupti beatae dolores accusamus, quia quam! Ipsa aspernatur nisi architecto officiis? A necessitatibus ut expedita!', CAST(N'2020-09-29 16:50:27.000' AS DateTime), N'', N'S0001')
INSERT [dbo].[tblArticle] ([postID], [email], [title], [description], [date], [image], [statusID]) VALUES (N'P5', N'abc@gmail.com', N'abc@article2', N'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Consequatur quidem, consectetur tempore tempora quisquam magnam? Deserunt velit, neque tempora omnis quam, dolorum quia saepe maxime, adipisci corrupti recusandae labore sapiente.', CAST(N'2020-09-25 15:03:41.000' AS DateTime), N'image/image-analysis.png', N'S0001')
INSERT [dbo].[tblArticle] ([postID], [email], [title], [description], [date], [image], [statusID]) VALUES (N'P6', N'xyz@gmail.com', N'xyz@article', N'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Consequatur quidem, consectetur tempore tempora quisquam magnam? Deserunt velit, neque tempora omnis quam, dolorum quia saepe maxime, adipisci corrupti recusandae labore sapiente.', CAST(N'2020-09-25 15:06:03.000' AS DateTime), N'image/download.jpg', N'S0001')
INSERT [dbo].[tblArticle] ([postID], [email], [title], [description], [date], [image], [statusID]) VALUES (N'P7', N'xyz@gmail.com', N'xyz@article2', N'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Consequatur quidem, consectetur tempore tempora quisquam magnam? Deserunt velit, neque tempora omnis quam, dolorum quia saepe maxime, adipisci corrupti recusandae labore sapiente.', CAST(N'2020-09-25 15:06:15.000' AS DateTime), N'image/image-analysis.png', N'S0001')
INSERT [dbo].[tblArticle] ([postID], [email], [title], [description], [date], [image], [statusID]) VALUES (N'P8', N'def@gmail.com', N'def@article', N'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Consequatur quidem, consectetur tempore tempora quisquam magnam? Deserunt velit, neque tempora omnis quam, dolorum quia saepe maxime, adipisci corrupti recusandae labore sapiente.', CAST(N'2020-09-25 15:09:01.000' AS DateTime), N'image/download.jpg', N'S0001')
INSERT [dbo].[tblArticle] ([postID], [email], [title], [description], [date], [image], [statusID]) VALUES (N'P9', N'def@gmail.com', N'def@article2', N'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Consequatur quidem, consectetur tempore tempora quisquam magnam? Deserunt velit, neque tempora omnis quam, dolorum quia saepe maxime, adipisci corrupti recusandae labore sapiente.', CAST(N'2020-09-25 15:09:13.000' AS DateTime), N'image/image-analysis.png', N'S0001')
SET IDENTITY_INSERT [dbo].[tblComment] ON 

INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (47, N'P1', N'abcdef@gmail.com', CAST(N'2020-09-25 15:11:45.000' AS DateTime), N'hihi', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (48, N'P1', N'abcdef@gmail.com', CAST(N'2020-09-25 15:11:51.000' AS DateTime), N'let''s go', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (49, N'P4', N'abc@gmail.com', CAST(N'2020-09-25 15:12:04.000' AS DateTime), N'hihi', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (50, N'P9', N'def@gmail.com', CAST(N'2020-09-25 15:12:27.000' AS DateTime), N'hihi', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (51, N'P3', N'abcdef@gmail.com', CAST(N'2020-09-25 15:12:45.000' AS DateTime), N'asdasd', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (52, N'P3', N'abcdef@gmail.com', CAST(N'2020-09-25 15:12:49.000' AS DateTime), N'haha', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (53, N'P9', N'def@gmail.com', CAST(N'2020-09-25 15:13:06.000' AS DateTime), N'haha', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (54, N'P8', N'def@gmail.com', CAST(N'2020-09-25 15:13:13.000' AS DateTime), N'Ã¡dsds', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (55, N'P7', N'xyz@gmail.com', CAST(N'2020-09-25 15:13:27.000' AS DateTime), N'asdasd', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (56, N'P10', N'xyz@gmail.com', CAST(N'2020-09-25 15:26:06.000' AS DateTime), N'hixhix', N'S0003')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (57, N'P10', N'xyz@gmail.com', CAST(N'2020-09-25 15:26:10.000' AS DateTime), N'haha', N'S0003')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (58, N'P13', N'abcd@gmail.com', CAST(N'2020-09-26 01:01:54.000' AS DateTime), N'hihi', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (59, N'P13', N'abcd@gmail.com', CAST(N'2020-09-26 01:01:59.000' AS DateTime), N'aaa', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (806, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:12.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (807, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:12.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (808, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:12.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (809, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:12.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (810, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:12.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (811, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:12.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (812, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:12.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (813, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:12.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (814, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:12.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (815, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:12.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (816, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:12.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (817, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:12.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (818, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:12.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (819, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:12.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (820, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:12.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (821, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:12.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (822, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:12.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (823, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:12.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (824, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:12.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (825, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:12.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (826, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:12.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (827, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:12.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (828, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:12.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (829, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:12.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (830, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:12.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (831, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:12.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (832, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:12.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (833, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:12.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (834, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:12.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (835, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:12.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (836, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:12.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (837, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:12.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (838, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:12.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (839, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:12.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (840, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:12.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (841, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:12.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (842, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:12.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (843, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:12.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (844, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:12.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (845, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:12.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (846, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:13.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (847, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:13.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (848, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:13.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (849, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:13.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (850, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:13.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (851, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:13.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (852, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:13.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (853, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:13.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (854, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:13.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (855, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:13.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (856, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:13.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (857, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:13.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (858, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:13.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (859, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:13.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (860, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:13.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (861, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:13.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (862, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:13.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (863, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:13.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (864, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:13.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (865, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:13.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (866, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:13.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (867, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:13.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (868, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:13.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (869, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:13.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (870, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:13.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (871, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:13.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (872, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:13.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (873, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:13.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (874, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:13.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (875, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:13.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (876, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:13.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (877, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:13.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (878, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:13.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (879, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:13.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (880, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:13.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (881, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:13.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (882, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:13.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (883, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:13.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (884, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:13.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (885, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:13.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (886, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:13.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (887, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:13.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (888, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:13.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (889, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:13.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (890, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:13.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (891, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:13.000' AS DateTime), N'hehe', N'S0001')
GO
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (892, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:13.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (893, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:13.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (894, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:13.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (895, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:13.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (896, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:14.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (897, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:14.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (898, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:14.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (899, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:14.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (900, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:14.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (901, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:14.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (902, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:14.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (903, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:14.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (904, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:14.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (905, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:14.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (906, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:14.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (907, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:14.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (908, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:14.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (909, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:14.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (910, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:14.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (911, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:14.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (912, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:14.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (913, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:14.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (914, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:14.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (915, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:14.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (916, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:14.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (917, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:14.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (918, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:14.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (919, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:14.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (920, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:14.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (921, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:14.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (922, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:14.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (923, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:14.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (924, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:14.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (925, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:14.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (926, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:14.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (927, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:14.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (928, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:14.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (929, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:14.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (930, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:14.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (931, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:14.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (932, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:14.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (933, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:14.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (934, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:14.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (935, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:14.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (936, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:14.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (937, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:14.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (938, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:14.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (939, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:14.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (940, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:14.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (941, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:14.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (942, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:14.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (943, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:14.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (944, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:14.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (945, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:14.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (946, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:14.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (947, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:14.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (948, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:14.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (949, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:14.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (950, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:14.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (951, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:14.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (952, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:14.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (953, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:14.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (954, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:15.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (955, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:15.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (956, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:15.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (957, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:15.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (958, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:15.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (959, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:15.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (960, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:15.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (961, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:15.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (962, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:15.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (963, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:15.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (964, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:15.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (965, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:15.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (966, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:15.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (967, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:15.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (968, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:15.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (969, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:15.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (970, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:15.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (971, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:15.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (972, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:15.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (973, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:15.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (974, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:15.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (975, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:15.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (976, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:15.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (977, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:15.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (978, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:15.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (979, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:15.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (980, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:15.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (981, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 19:13:15.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (982, N'P7', N'xyz@gmail.com', CAST(N'2020-09-26 19:14:31.000' AS DateTime), N'aaaa', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (983, N'P13', N'abcd@gmail.com', CAST(N'2020-09-26 19:18:47.000' AS DateTime), N'bcv', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (984, N'P12', N'abc@gmail.com', CAST(N'2020-09-26 19:19:30.000' AS DateTime), N'aaa', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (985, N'P12', N'xyz@gmail.com', CAST(N'2020-09-26 19:26:32.000' AS DateTime), N'hihi', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (986, N'P8', N'abcd@gmail.com', CAST(N'2020-09-26 19:28:37.000' AS DateTime), N'haha good', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (987, N'P17', N'def@gmail.com', CAST(N'2020-09-26 19:58:32.000' AS DateTime), N'hehe', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (988, N'P11', N'def@gmail.com', CAST(N'2020-09-26 19:58:58.000' AS DateTime), N'like for fun :v', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (989, N'P1', N'xyz@gmail.com', CAST(N'2020-09-26 20:24:33.000' AS DateTime), N'haha', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (990, N'P7', N'xyz@gmail.com', CAST(N'2020-09-26 20:27:11.000' AS DateTime), N'haha', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (991, N'P9', N'xyz@gmail.com', CAST(N'2020-09-26 20:27:23.000' AS DateTime), N'aaa', N'S0001')
GO
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (992, N'P15', N'xyz@gmail.com', CAST(N'2020-09-26 20:38:47.000' AS DateTime), N'asdasd', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (993, N'P17', N'xyz@gmail.com', CAST(N'2020-09-26 20:43:06.000' AS DateTime), N'hihi', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (994, N'P14', N'xyz@gmail.com', CAST(N'2020-09-26 20:43:20.000' AS DateTime), N'aaaa', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (995, N'P12', N'xyz@gmail.com', CAST(N'2020-09-26 20:46:50.000' AS DateTime), N'haha', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (996, N'P8', N'xyz@gmail.com', CAST(N'2020-09-26 20:49:17.000' AS DateTime), N'haha', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (997, N'P17', N'def@gmail.com', CAST(N'2020-09-26 21:00:08.000' AS DateTime), N'haha', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (998, N'P12', N'def@gmail.com', CAST(N'2020-09-26 21:01:37.000' AS DateTime), N'haha', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (999, N'P8', N'def@gmail.com', CAST(N'2020-09-26 21:01:59.000' AS DateTime), N'don''t', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (1000, N'P14', N'def@gmail.com', CAST(N'2020-09-26 21:05:47.000' AS DateTime), N'good', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (1001, N'P11', N'def@gmail.com', CAST(N'2020-09-26 21:16:35.000' AS DateTime), N'haha', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (1002, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 21:18:17.000' AS DateTime), N'why', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (1003, N'P19', N'abc@gmail.com', CAST(N'2020-09-28 15:34:28.000' AS DateTime), N'hay', N'S0003')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (1004, N'P19', N'abc@gmail.com', CAST(N'2020-09-28 15:38:37.000' AS DateTime), N'hay', N'S0003')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (1005, N'P15', N'abc@gmail.com', CAST(N'2020-09-28 18:22:25.000' AS DateTime), N'good', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (1006, N'P20', N'abc@gmail.com', CAST(N'2020-09-28 18:46:09.000' AS DateTime), N'delete it', N'S0003')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (1007, N'P3', N'labwebfptu@gmail.com', CAST(N'2020-09-28 20:15:27.000' AS DateTime), N'hihi
', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (1008, N'P36', N'taekwondo.ptp@gmail.com', CAST(N'2020-09-29 16:48:05.000' AS DateTime), N'hihi', N'S0001')
INSERT [dbo].[tblComment] ([ID], [postID], [email], [date], [comment], [statusID]) VALUES (1009, N'P34', N'taekwondo.ptp@gmail.com', CAST(N'2020-09-29 16:48:36.000' AS DateTime), N'asaa', N'S0001')
SET IDENTITY_INSERT [dbo].[tblComment] OFF
SET IDENTITY_INSERT [dbo].[tblEmotion] ON 

INSERT [dbo].[tblEmotion] ([ID], [postID], [email], [emotion], [date], [statusID]) VALUES (10, N'P12', N'abc@gmail.com', N'dislike', CAST(N'2020-09-26 08:45:15.000' AS DateTime), N'S0001')
INSERT [dbo].[tblEmotion] ([ID], [postID], [email], [emotion], [date], [statusID]) VALUES (18, N'P14', N'abc@gmail.com', N'like', CAST(N'2020-09-26 09:29:24.000' AS DateTime), N'S0001')
INSERT [dbo].[tblEmotion] ([ID], [postID], [email], [emotion], [date], [statusID]) VALUES (21, N'P14', N'xyz@gmail.com', N'like', CAST(N'2020-09-26 11:04:04.000' AS DateTime), N'S0001')
INSERT [dbo].[tblEmotion] ([ID], [postID], [email], [emotion], [date], [statusID]) VALUES (22, N'P13', N'xyz@gmail.com', N'like', CAST(N'2020-09-26 11:04:10.000' AS DateTime), N'S0001')
INSERT [dbo].[tblEmotion] ([ID], [postID], [email], [emotion], [date], [statusID]) VALUES (23, N'P15', N'xyz@gmail.com', N'like', CAST(N'2020-09-26 11:06:57.000' AS DateTime), N'S0001')
INSERT [dbo].[tblEmotion] ([ID], [postID], [email], [emotion], [date], [statusID]) VALUES (30, N'P11', N'abc@gmail.com', N'dislike', CAST(N'2020-09-26 19:14:18.000' AS DateTime), N'S0001')
INSERT [dbo].[tblEmotion] ([ID], [postID], [email], [emotion], [date], [statusID]) VALUES (31, N'P7', N'abc@gmail.com', N'like', CAST(N'2020-09-26 19:14:34.000' AS DateTime), N'S0001')
INSERT [dbo].[tblEmotion] ([ID], [postID], [email], [emotion], [date], [statusID]) VALUES (35, N'P3', N'def@gmail.com', N'like', CAST(N'2020-09-26 19:24:30.000' AS DateTime), N'S0001')
INSERT [dbo].[tblEmotion] ([ID], [postID], [email], [emotion], [date], [statusID]) VALUES (36, N'P13', N'abc@gmail.com', N'like', CAST(N'2020-09-26 19:27:45.000' AS DateTime), N'S0001')
INSERT [dbo].[tblEmotion] ([ID], [postID], [email], [emotion], [date], [statusID]) VALUES (37, N'P8', N'abcd@gmail.com', N'like', CAST(N'2020-09-26 19:28:38.000' AS DateTime), N'S0001')
INSERT [dbo].[tblEmotion] ([ID], [postID], [email], [emotion], [date], [statusID]) VALUES (38, N'P17', N'def@gmail.com', N'dislike', CAST(N'2020-09-26 19:58:25.000' AS DateTime), N'S0001')
INSERT [dbo].[tblEmotion] ([ID], [postID], [email], [emotion], [date], [statusID]) VALUES (39, N'P11', N'def@gmail.com', N'like', CAST(N'2020-09-26 19:58:48.000' AS DateTime), N'S0001')
INSERT [dbo].[tblEmotion] ([ID], [postID], [email], [emotion], [date], [statusID]) VALUES (40, N'P17', N'xyz@gmail.com', N'like', CAST(N'2020-09-26 19:59:55.000' AS DateTime), N'S0001')
INSERT [dbo].[tblEmotion] ([ID], [postID], [email], [emotion], [date], [statusID]) VALUES (41, N'P1', N'xyz@gmail.com', N'like', CAST(N'2020-09-26 20:24:28.000' AS DateTime), N'S0001')
INSERT [dbo].[tblEmotion] ([ID], [postID], [email], [emotion], [date], [statusID]) VALUES (42, N'P9', N'xyz@gmail.com', N'like', CAST(N'2020-09-26 20:27:20.000' AS DateTime), N'S0001')
INSERT [dbo].[tblEmotion] ([ID], [postID], [email], [emotion], [date], [statusID]) VALUES (43, N'P6', N'xyz@gmail.com', N'like', CAST(N'2020-09-26 20:27:51.000' AS DateTime), N'S0001')
INSERT [dbo].[tblEmotion] ([ID], [postID], [email], [emotion], [date], [statusID]) VALUES (45, N'P12', N'xyz@gmail.com', N'dislike', CAST(N'2020-09-26 20:46:47.000' AS DateTime), N'S0001')
INSERT [dbo].[tblEmotion] ([ID], [postID], [email], [emotion], [date], [statusID]) VALUES (46, N'P7', N'xyz@gmail.com', N'like', CAST(N'2020-09-26 20:48:19.000' AS DateTime), N'S0001')
INSERT [dbo].[tblEmotion] ([ID], [postID], [email], [emotion], [date], [statusID]) VALUES (48, N'P12', N'def@gmail.com', N'like', CAST(N'2020-09-26 21:01:34.000' AS DateTime), N'S0001')
INSERT [dbo].[tblEmotion] ([ID], [postID], [email], [emotion], [date], [statusID]) VALUES (49, N'P8', N'def@gmail.com', N'like', CAST(N'2020-09-26 21:02:01.000' AS DateTime), N'S0001')
INSERT [dbo].[tblEmotion] ([ID], [postID], [email], [emotion], [date], [statusID]) VALUES (50, N'P11', N'xyz@gmail.com', N'like', CAST(N'2020-09-26 21:18:20.000' AS DateTime), N'S0001')
INSERT [dbo].[tblEmotion] ([ID], [postID], [email], [emotion], [date], [statusID]) VALUES (54, N'P15', N'abc@gmail.com', N'like', CAST(N'2020-09-28 18:22:15.000' AS DateTime), N'S0001')
INSERT [dbo].[tblEmotion] ([ID], [postID], [email], [emotion], [date], [statusID]) VALUES (55, N'P18', N'labwebfptu@gmail.com', N'like', CAST(N'2020-09-28 18:32:31.000' AS DateTime), N'S0001')
INSERT [dbo].[tblEmotion] ([ID], [postID], [email], [emotion], [date], [statusID]) VALUES (56, N'P15', N'labwebfptu@gmail.com', N'like', CAST(N'2020-09-28 18:32:36.000' AS DateTime), N'S0001')
INSERT [dbo].[tblEmotion] ([ID], [postID], [email], [emotion], [date], [statusID]) VALUES (57, N'P19', N'abc@gmail.com', N'dislike', CAST(N'2020-09-28 18:41:54.000' AS DateTime), N'S0003')
INSERT [dbo].[tblEmotion] ([ID], [postID], [email], [emotion], [date], [statusID]) VALUES (59, N'P8', N'abc@gmail.com', N'dislike', CAST(N'2020-09-28 18:43:22.000' AS DateTime), N'S0001')
INSERT [dbo].[tblEmotion] ([ID], [postID], [email], [emotion], [date], [statusID]) VALUES (60, N'P20', N'abc@gmail.com', N'like', CAST(N'2020-09-28 18:46:10.000' AS DateTime), N'S0003')
INSERT [dbo].[tblEmotion] ([ID], [postID], [email], [emotion], [date], [statusID]) VALUES (61, N'P19', N'labwebfptu@gmail.com', N'like', CAST(N'2020-09-28 18:56:06.000' AS DateTime), N'S0003')
INSERT [dbo].[tblEmotion] ([ID], [postID], [email], [emotion], [date], [statusID]) VALUES (62, N'P18', N'abc@gmail.com', N'like', CAST(N'2020-09-28 19:19:02.000' AS DateTime), N'S0001')
INSERT [dbo].[tblEmotion] ([ID], [postID], [email], [emotion], [date], [statusID]) VALUES (63, N'P3', N'labwebfptu@gmail.com', N'like', CAST(N'2020-09-28 20:15:32.000' AS DateTime), N'S0001')
INSERT [dbo].[tblEmotion] ([ID], [postID], [email], [emotion], [date], [statusID]) VALUES (67, N'P5', N'abc@gmail.com', N'dislike', CAST(N'2020-09-29 01:40:59.000' AS DateTime), N'S0001')
INSERT [dbo].[tblEmotion] ([ID], [postID], [email], [emotion], [date], [statusID]) VALUES (68, N'P36', N'taekwondo.ptp@gmail.com', N'like', CAST(N'2020-09-29 16:48:00.000' AS DateTime), N'S0001')
INSERT [dbo].[tblEmotion] ([ID], [postID], [email], [emotion], [date], [statusID]) VALUES (69, N'P34', N'taekwondo.ptp@gmail.com', N'dislike', CAST(N'2020-09-29 16:48:31.000' AS DateTime), N'S0001')
INSERT [dbo].[tblEmotion] ([ID], [postID], [email], [emotion], [date], [statusID]) VALUES (70, N'P2', N'taekwondo.ptp@gmail.com', N'like', CAST(N'2020-09-29 16:51:03.000' AS DateTime), N'S0001')
INSERT [dbo].[tblEmotion] ([ID], [postID], [email], [emotion], [date], [statusID]) VALUES (71, N'P34', N'abc@gmail.com', N'like', CAST(N'2020-09-29 16:51:43.000' AS DateTime), N'S0001')
SET IDENTITY_INSERT [dbo].[tblEmotion] OFF
SET IDENTITY_INSERT [dbo].[tblNotifies] ON 

INSERT [dbo].[tblNotifies] ([ID], [postID], [email], [date], [type]) VALUES (457, N'P15', N'xyz@gmail.com', CAST(N'2020-09-26 11:06:57.000' AS DateTime), N'like')
INSERT [dbo].[tblNotifies] ([ID], [postID], [email], [date], [type]) VALUES (458, N'P14', N'abc@gmail.com', CAST(N'2020-09-26 11:07:03.000' AS DateTime), N'comment')
INSERT [dbo].[tblNotifies] ([ID], [postID], [email], [date], [type]) VALUES (459, N'P14', N'abc@gmail.com', CAST(N'2020-09-26 11:07:08.000' AS DateTime), N'comment')
INSERT [dbo].[tblNotifies] ([ID], [postID], [email], [date], [type]) VALUES (460, N'P13', N'abcd@gmail.com', CAST(N'2020-09-26 11:11:05.000' AS DateTime), N'comment')
INSERT [dbo].[tblNotifies] ([ID], [postID], [email], [date], [type]) VALUES (461, N'P13', N'abcd@gmail.com', CAST(N'2020-09-26 11:12:06.000' AS DateTime), N'comment')
INSERT [dbo].[tblNotifies] ([ID], [postID], [email], [date], [type]) VALUES (462, N'P13', N'abc@gmail.com', CAST(N'2020-09-26 11:12:59.000' AS DateTime), N'like')
INSERT [dbo].[tblNotifies] ([ID], [postID], [email], [date], [type]) VALUES (463, N'P13', N'abc@gmail.com', CAST(N'2020-09-26 11:13:02.000' AS DateTime), N'dislike')
INSERT [dbo].[tblNotifies] ([ID], [postID], [email], [date], [type]) VALUES (464, N'P13', N'abc@gmail.com', CAST(N'2020-09-26 11:13:05.000' AS DateTime), N'like')
INSERT [dbo].[tblNotifies] ([ID], [postID], [email], [date], [type]) VALUES (465, N'P13', N'abc@gmail.com', CAST(N'2020-09-26 11:14:11.000' AS DateTime), N'dislike')
INSERT [dbo].[tblNotifies] ([ID], [postID], [email], [date], [type]) VALUES (466, N'P13', N'abc@gmail.com', CAST(N'2020-09-26 11:14:15.000' AS DateTime), N'like')
INSERT [dbo].[tblNotifies] ([ID], [postID], [email], [date], [type]) VALUES (931, N'P11', N'abc@gmail.com', CAST(N'2020-09-26 19:14:08.000' AS DateTime), N'like')
INSERT [dbo].[tblNotifies] ([ID], [postID], [email], [date], [type]) VALUES (932, N'P11', N'abc@gmail.com', CAST(N'2020-09-26 19:14:18.000' AS DateTime), N'dislike')
INSERT [dbo].[tblNotifies] ([ID], [postID], [email], [date], [type]) VALUES (933, N'P7', N'xyz@gmail.com', CAST(N'2020-09-26 19:14:31.000' AS DateTime), N'comment')
INSERT [dbo].[tblNotifies] ([ID], [postID], [email], [date], [type]) VALUES (934, N'P7', N'abc@gmail.com', CAST(N'2020-09-26 19:14:34.000' AS DateTime), N'like')
INSERT [dbo].[tblNotifies] ([ID], [postID], [email], [date], [type]) VALUES (935, N'P13', N'abcd@gmail.com', CAST(N'2020-09-26 19:18:47.000' AS DateTime), N'comment')
INSERT [dbo].[tblNotifies] ([ID], [postID], [email], [date], [type]) VALUES (936, N'P12', N'xyz@gmail.com', CAST(N'2020-09-26 19:19:27.000' AS DateTime), N'like')
INSERT [dbo].[tblNotifies] ([ID], [postID], [email], [date], [type]) VALUES (937, N'P12', N'abc@gmail.com', CAST(N'2020-09-26 19:19:30.000' AS DateTime), N'comment')
INSERT [dbo].[tblNotifies] ([ID], [postID], [email], [date], [type]) VALUES (938, N'P3', N'def@gmail.com', CAST(N'2020-09-26 19:21:46.000' AS DateTime), N'like')
INSERT [dbo].[tblNotifies] ([ID], [postID], [email], [date], [type]) VALUES (939, N'P3', N'def@gmail.com', CAST(N'2020-09-26 19:23:08.000' AS DateTime), N'dislike')
INSERT [dbo].[tblNotifies] ([ID], [postID], [email], [date], [type]) VALUES (941, N'P3', N'def@gmail.com', CAST(N'2020-09-26 19:24:30.000' AS DateTime), N'like')
INSERT [dbo].[tblNotifies] ([ID], [postID], [email], [date], [type]) VALUES (942, N'P12', N'xyz@gmail.com', CAST(N'2020-09-26 19:26:32.000' AS DateTime), N'comment')
INSERT [dbo].[tblNotifies] ([ID], [postID], [email], [date], [type]) VALUES (943, N'P13', N'abc@gmail.com', CAST(N'2020-09-26 19:27:45.000' AS DateTime), N'like')
INSERT [dbo].[tblNotifies] ([ID], [postID], [email], [date], [type]) VALUES (944, N'P8', N'abcd@gmail.com', CAST(N'2020-09-26 19:28:37.000' AS DateTime), N'comment')
INSERT [dbo].[tblNotifies] ([ID], [postID], [email], [date], [type]) VALUES (945, N'P8', N'abcd@gmail.com', CAST(N'2020-09-26 19:28:38.000' AS DateTime), N'like')
INSERT [dbo].[tblNotifies] ([ID], [postID], [email], [date], [type]) VALUES (946, N'P17', N'def@gmail.com', CAST(N'2020-09-26 19:58:25.000' AS DateTime), N'dislike')
INSERT [dbo].[tblNotifies] ([ID], [postID], [email], [date], [type]) VALUES (947, N'P17', N'def@gmail.com', CAST(N'2020-09-26 19:58:32.000' AS DateTime), N'comment')
INSERT [dbo].[tblNotifies] ([ID], [postID], [email], [date], [type]) VALUES (948, N'P11', N'def@gmail.com', CAST(N'2020-09-26 19:58:48.000' AS DateTime), N'like')
INSERT [dbo].[tblNotifies] ([ID], [postID], [email], [date], [type]) VALUES (949, N'P11', N'def@gmail.com', CAST(N'2020-09-26 19:58:58.000' AS DateTime), N'comment')
INSERT [dbo].[tblNotifies] ([ID], [postID], [email], [date], [type]) VALUES (950, N'P17', N'xyz@gmail.com', CAST(N'2020-09-26 19:59:55.000' AS DateTime), N'like')
INSERT [dbo].[tblNotifies] ([ID], [postID], [email], [date], [type]) VALUES (951, N'P1', N'xyz@gmail.com', CAST(N'2020-09-26 20:24:28.000' AS DateTime), N'like')
INSERT [dbo].[tblNotifies] ([ID], [postID], [email], [date], [type]) VALUES (952, N'P1', N'xyz@gmail.com', CAST(N'2020-09-26 20:24:33.000' AS DateTime), N'comment')
INSERT [dbo].[tblNotifies] ([ID], [postID], [email], [date], [type]) VALUES (953, N'P7', N'xyz@gmail.com', CAST(N'2020-09-26 20:27:11.000' AS DateTime), N'comment')
INSERT [dbo].[tblNotifies] ([ID], [postID], [email], [date], [type]) VALUES (954, N'P9', N'xyz@gmail.com', CAST(N'2020-09-26 20:27:20.000' AS DateTime), N'like')
INSERT [dbo].[tblNotifies] ([ID], [postID], [email], [date], [type]) VALUES (955, N'P9', N'xyz@gmail.com', CAST(N'2020-09-26 20:27:23.000' AS DateTime), N'comment')
INSERT [dbo].[tblNotifies] ([ID], [postID], [email], [date], [type]) VALUES (956, N'P6', N'xyz@gmail.com', CAST(N'2020-09-26 20:27:51.000' AS DateTime), N'like')
INSERT [dbo].[tblNotifies] ([ID], [postID], [email], [date], [type]) VALUES (957, N'P15', N'xyz@gmail.com', CAST(N'2020-09-26 20:38:47.000' AS DateTime), N'comment')
INSERT [dbo].[tblNotifies] ([ID], [postID], [email], [date], [type]) VALUES (958, N'P17', N'xyz@gmail.com', CAST(N'2020-09-26 20:43:06.000' AS DateTime), N'comment')
INSERT [dbo].[tblNotifies] ([ID], [postID], [email], [date], [type]) VALUES (959, N'P14', N'xyz@gmail.com', CAST(N'2020-09-26 20:43:20.000' AS DateTime), N'comment')
INSERT [dbo].[tblNotifies] ([ID], [postID], [email], [date], [type]) VALUES (960, N'P8', N'xyz@gmail.com', CAST(N'2020-09-26 20:45:02.000' AS DateTime), N'like')
INSERT [dbo].[tblNotifies] ([ID], [postID], [email], [date], [type]) VALUES (961, N'P12', N'xyz@gmail.com', CAST(N'2020-09-26 20:46:47.000' AS DateTime), N'dislike')
INSERT [dbo].[tblNotifies] ([ID], [postID], [email], [date], [type]) VALUES (962, N'P12', N'xyz@gmail.com', CAST(N'2020-09-26 20:46:50.000' AS DateTime), N'comment')
INSERT [dbo].[tblNotifies] ([ID], [postID], [email], [date], [type]) VALUES (963, N'P7', N'xyz@gmail.com', CAST(N'2020-09-26 20:48:19.000' AS DateTime), N'like')
INSERT [dbo].[tblNotifies] ([ID], [postID], [email], [date], [type]) VALUES (964, N'P8', N'xyz@gmail.com', CAST(N'2020-09-26 20:49:13.000' AS DateTime), N'')
INSERT [dbo].[tblNotifies] ([ID], [postID], [email], [date], [type]) VALUES (965, N'P8', N'xyz@gmail.com', CAST(N'2020-09-26 20:49:14.000' AS DateTime), N'like')
INSERT [dbo].[tblNotifies] ([ID], [postID], [email], [date], [type]) VALUES (966, N'P8', N'xyz@gmail.com', CAST(N'2020-09-26 20:49:17.000' AS DateTime), N'comment')
INSERT [dbo].[tblNotifies] ([ID], [postID], [email], [date], [type]) VALUES (967, N'P8', N'xyz@gmail.com', CAST(N'2020-09-26 20:50:07.000' AS DateTime), N'')
INSERT [dbo].[tblNotifies] ([ID], [postID], [email], [date], [type]) VALUES (968, N'P17', N'def@gmail.com', CAST(N'2020-09-26 21:00:08.000' AS DateTime), N'comment')
INSERT [dbo].[tblNotifies] ([ID], [postID], [email], [date], [type]) VALUES (969, N'P12', N'def@gmail.com', CAST(N'2020-09-26 21:01:34.000' AS DateTime), N'like')
INSERT [dbo].[tblNotifies] ([ID], [postID], [email], [date], [type]) VALUES (970, N'P12', N'def@gmail.com', CAST(N'2020-09-26 21:01:37.000' AS DateTime), N'comment')
INSERT [dbo].[tblNotifies] ([ID], [postID], [email], [date], [type]) VALUES (971, N'P8', N'def@gmail.com', CAST(N'2020-09-26 21:01:59.000' AS DateTime), N'comment')
INSERT [dbo].[tblNotifies] ([ID], [postID], [email], [date], [type]) VALUES (972, N'P8', N'def@gmail.com', CAST(N'2020-09-26 21:02:01.000' AS DateTime), N'like')
INSERT [dbo].[tblNotifies] ([ID], [postID], [email], [date], [type]) VALUES (973, N'P14', N'def@gmail.com', CAST(N'2020-09-26 21:05:47.000' AS DateTime), N'comment')
INSERT [dbo].[tblNotifies] ([ID], [postID], [email], [date], [type]) VALUES (974, N'P11', N'def@gmail.com', CAST(N'2020-09-26 21:16:35.000' AS DateTime), N'comment')
INSERT [dbo].[tblNotifies] ([ID], [postID], [email], [date], [type]) VALUES (975, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 21:18:17.000' AS DateTime), N'comment')
INSERT [dbo].[tblNotifies] ([ID], [postID], [email], [date], [type]) VALUES (976, N'P11', N'xyz@gmail.com', CAST(N'2020-09-26 21:18:20.000' AS DateTime), N'like')
INSERT [dbo].[tblNotifies] ([ID], [postID], [email], [date], [type]) VALUES (977, N'P19', N'abc@gmail.com', CAST(N'2020-09-28 15:34:14.000' AS DateTime), N'like')
INSERT [dbo].[tblNotifies] ([ID], [postID], [email], [date], [type]) VALUES (978, N'P19', N'abc@gmail.com', CAST(N'2020-09-28 15:34:28.000' AS DateTime), N'comment')
INSERT [dbo].[tblNotifies] ([ID], [postID], [email], [date], [type]) VALUES (979, N'P19', N'abc@gmail.com', CAST(N'2020-09-28 15:38:37.000' AS DateTime), N'comment')
INSERT [dbo].[tblNotifies] ([ID], [postID], [email], [date], [type]) VALUES (980, N'P15', N'abc@gmail.com', CAST(N'2020-09-28 18:22:08.000' AS DateTime), N'like')
INSERT [dbo].[tblNotifies] ([ID], [postID], [email], [date], [type]) VALUES (981, N'P15', N'abc@gmail.com', CAST(N'2020-09-28 18:22:12.000' AS DateTime), N'dislike')
INSERT [dbo].[tblNotifies] ([ID], [postID], [email], [date], [type]) VALUES (982, N'P15', N'abc@gmail.com', CAST(N'2020-09-28 18:22:15.000' AS DateTime), N'like')
INSERT [dbo].[tblNotifies] ([ID], [postID], [email], [date], [type]) VALUES (983, N'P15', N'abc@gmail.com', CAST(N'2020-09-28 18:22:25.000' AS DateTime), N'comment')
INSERT [dbo].[tblNotifies] ([ID], [postID], [email], [date], [type]) VALUES (984, N'P18', N'labwebfptu@gmail.com', CAST(N'2020-09-28 18:32:31.000' AS DateTime), N'like')
INSERT [dbo].[tblNotifies] ([ID], [postID], [email], [date], [type]) VALUES (985, N'P15', N'labwebfptu@gmail.com', CAST(N'2020-09-28 18:32:36.000' AS DateTime), N'like')
INSERT [dbo].[tblNotifies] ([ID], [postID], [email], [date], [type]) VALUES (986, N'P19', N'abc@gmail.com', CAST(N'2020-09-28 18:41:54.000' AS DateTime), N'dislike')
INSERT [dbo].[tblNotifies] ([ID], [postID], [email], [date], [type]) VALUES (987, N'P8', N'abc@gmail.com', CAST(N'2020-09-28 18:43:16.000' AS DateTime), N'like')
INSERT [dbo].[tblNotifies] ([ID], [postID], [email], [date], [type]) VALUES (988, N'P8', N'abc@gmail.com', CAST(N'2020-09-28 18:43:22.000' AS DateTime), N'dislike')
INSERT [dbo].[tblNotifies] ([ID], [postID], [email], [date], [type]) VALUES (991, N'P19', N'labwebfptu@gmail.com', CAST(N'2020-09-28 18:56:06.000' AS DateTime), N'like')
INSERT [dbo].[tblNotifies] ([ID], [postID], [email], [date], [type]) VALUES (992, N'P18', N'abc@gmail.com', CAST(N'2020-09-28 19:19:02.000' AS DateTime), N'like')
INSERT [dbo].[tblNotifies] ([ID], [postID], [email], [date], [type]) VALUES (993, N'P3', N'labwebfptu@gmail.com', CAST(N'2020-09-28 20:15:27.000' AS DateTime), N'comment')
INSERT [dbo].[tblNotifies] ([ID], [postID], [email], [date], [type]) VALUES (994, N'P3', N'labwebfptu@gmail.com', CAST(N'2020-09-28 20:15:32.000' AS DateTime), N'like')
INSERT [dbo].[tblNotifies] ([ID], [postID], [email], [date], [type]) VALUES (995, N'P3', N'labwebfptu@gmail.com', CAST(N'2020-09-28 20:16:21.000' AS DateTime), N'')
INSERT [dbo].[tblNotifies] ([ID], [postID], [email], [date], [type]) VALUES (996, N'P3', N'labwebfptu@gmail.com', CAST(N'2020-09-28 20:16:43.000' AS DateTime), N'')
INSERT [dbo].[tblNotifies] ([ID], [postID], [email], [date], [type]) VALUES (997, N'P3', N'labwebfptu@gmail.com', CAST(N'2020-09-28 20:16:59.000' AS DateTime), N'')
INSERT [dbo].[tblNotifies] ([ID], [postID], [email], [date], [type]) VALUES (998, N'P3', N'labwebfptu@gmail.com', CAST(N'2020-09-28 20:19:40.000' AS DateTime), N'')
INSERT [dbo].[tblNotifies] ([ID], [postID], [email], [date], [type]) VALUES (999, N'P3', N'labwebfptu@gmail.com', CAST(N'2020-09-28 20:19:55.000' AS DateTime), N'')
INSERT [dbo].[tblNotifies] ([ID], [postID], [email], [date], [type]) VALUES (1000, N'P3', N'labwebfptu@gmail.com', CAST(N'2020-09-28 20:20:23.000' AS DateTime), N'')
INSERT [dbo].[tblNotifies] ([ID], [postID], [email], [date], [type]) VALUES (1001, N'P3', N'labwebfptu@gmail.com', CAST(N'2020-09-28 20:20:32.000' AS DateTime), N'')
INSERT [dbo].[tblNotifies] ([ID], [postID], [email], [date], [type]) VALUES (1002, N'P3', N'labwebfptu@gmail.com', CAST(N'2020-09-28 20:20:45.000' AS DateTime), N'')
INSERT [dbo].[tblNotifies] ([ID], [postID], [email], [date], [type]) VALUES (1003, N'P3', N'labwebfptu@gmail.com', CAST(N'2020-09-28 20:21:01.000' AS DateTime), N'')
INSERT [dbo].[tblNotifies] ([ID], [postID], [email], [date], [type]) VALUES (1004, N'P3', N'labwebfptu@gmail.com', CAST(N'2020-09-28 20:21:22.000' AS DateTime), N'')
INSERT [dbo].[tblNotifies] ([ID], [postID], [email], [date], [type]) VALUES (1005, N'P5', N'abc@gmail.com', CAST(N'2020-09-29 01:40:52.000' AS DateTime), N'like')
INSERT [dbo].[tblNotifies] ([ID], [postID], [email], [date], [type]) VALUES (1006, N'P5', N'abc@gmail.com', CAST(N'2020-09-29 01:40:54.000' AS DateTime), N'dislike')
INSERT [dbo].[tblNotifies] ([ID], [postID], [email], [date], [type]) VALUES (1007, N'P5', N'abc@gmail.com', CAST(N'2020-09-29 01:40:57.000' AS DateTime), N'like')
INSERT [dbo].[tblNotifies] ([ID], [postID], [email], [date], [type]) VALUES (1008, N'P5', N'abc@gmail.com', CAST(N'2020-09-29 01:40:59.000' AS DateTime), N'dislike')
INSERT [dbo].[tblNotifies] ([ID], [postID], [email], [date], [type]) VALUES (1009, N'P36', N'taekwondo.ptp@gmail.com', CAST(N'2020-09-29 16:48:00.000' AS DateTime), N'like')
INSERT [dbo].[tblNotifies] ([ID], [postID], [email], [date], [type]) VALUES (1010, N'P36', N'taekwondo.ptp@gmail.com', CAST(N'2020-09-29 16:48:05.000' AS DateTime), N'comment')
INSERT [dbo].[tblNotifies] ([ID], [postID], [email], [date], [type]) VALUES (1011, N'P34', N'taekwondo.ptp@gmail.com', CAST(N'2020-09-29 16:48:31.000' AS DateTime), N'dislike')
INSERT [dbo].[tblNotifies] ([ID], [postID], [email], [date], [type]) VALUES (1012, N'P34', N'taekwondo.ptp@gmail.com', CAST(N'2020-09-29 16:48:36.000' AS DateTime), N'comment')
INSERT [dbo].[tblNotifies] ([ID], [postID], [email], [date], [type]) VALUES (1013, N'P2', N'taekwondo.ptp@gmail.com', CAST(N'2020-09-29 16:51:03.000' AS DateTime), N'like')
INSERT [dbo].[tblNotifies] ([ID], [postID], [email], [date], [type]) VALUES (1014, N'P34', N'abc@gmail.com', CAST(N'2020-09-29 16:51:43.000' AS DateTime), N'like')
SET IDENTITY_INSERT [dbo].[tblNotifies] OFF
INSERT [dbo].[tblStatus] ([statusID], [statusName]) VALUES (N'S0001', N'Active')
INSERT [dbo].[tblStatus] ([statusID], [statusName]) VALUES (N'S0002', N'New')
INSERT [dbo].[tblStatus] ([statusID], [statusName]) VALUES (N'S0003', N'Delete')
INSERT [dbo].[tblUser] ([email], [name], [password], [role], [statusID], [verifyCode]) VALUES (N'abc@gmail.com', N'Phạm Thanh Phương', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'admin', N'S0001', NULL)
INSERT [dbo].[tblUser] ([email], [name], [password], [role], [statusID], [verifyCode]) VALUES (N'abcd@gmail.com', N'ttttttttttt', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'member', N'S0001', NULL)
INSERT [dbo].[tblUser] ([email], [name], [password], [role], [statusID], [verifyCode]) VALUES (N'abcdef@gmail.com', N'Thanh Phương', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'member', N'S0001', NULL)
INSERT [dbo].[tblUser] ([email], [name], [password], [role], [statusID], [verifyCode]) VALUES (N'def@gmail.com', N'Đào Bảo Trâm', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'member', N'S0001', NULL)
INSERT [dbo].[tblUser] ([email], [name], [password], [role], [statusID], [verifyCode]) VALUES (N'labwebfptu@gmail.com', N'Test Account', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'member', N'S0001', N'2X6nCk')
INSERT [dbo].[tblUser] ([email], [name], [password], [role], [statusID], [verifyCode]) VALUES (N'taekwondo.ptp@gmail.com', N'Test Account', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'member', N'S0001', N'WCDE9l')
INSERT [dbo].[tblUser] ([email], [name], [password], [role], [statusID], [verifyCode]) VALUES (N'xyz@gmail.com', N'Nguyễn Thị Hiếu', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'member', N'S0001', NULL)
ALTER TABLE [dbo].[tblArticle]  WITH CHECK ADD  CONSTRAINT [FK_tblArticle_tblStatus] FOREIGN KEY([statusID])
REFERENCES [dbo].[tblStatus] ([statusID])
GO
ALTER TABLE [dbo].[tblArticle] CHECK CONSTRAINT [FK_tblArticle_tblStatus]
GO
ALTER TABLE [dbo].[tblArticle]  WITH CHECK ADD  CONSTRAINT [FK_tblArticle_tblUser] FOREIGN KEY([email])
REFERENCES [dbo].[tblUser] ([email])
GO
ALTER TABLE [dbo].[tblArticle] CHECK CONSTRAINT [FK_tblArticle_tblUser]
GO
ALTER TABLE [dbo].[tblComment]  WITH CHECK ADD  CONSTRAINT [FK_tblComment_tblArticle] FOREIGN KEY([postID])
REFERENCES [dbo].[tblArticle] ([postID])
GO
ALTER TABLE [dbo].[tblComment] CHECK CONSTRAINT [FK_tblComment_tblArticle]
GO
ALTER TABLE [dbo].[tblComment]  WITH CHECK ADD  CONSTRAINT [FK_tblComment_tblStatus] FOREIGN KEY([statusID])
REFERENCES [dbo].[tblStatus] ([statusID])
GO
ALTER TABLE [dbo].[tblComment] CHECK CONSTRAINT [FK_tblComment_tblStatus]
GO
ALTER TABLE [dbo].[tblComment]  WITH CHECK ADD  CONSTRAINT [FK_tblComment_tblUser] FOREIGN KEY([email])
REFERENCES [dbo].[tblUser] ([email])
GO
ALTER TABLE [dbo].[tblComment] CHECK CONSTRAINT [FK_tblComment_tblUser]
GO
ALTER TABLE [dbo].[tblEmotion]  WITH CHECK ADD  CONSTRAINT [FK_tblEmotion_tblArticle] FOREIGN KEY([postID])
REFERENCES [dbo].[tblArticle] ([postID])
GO
ALTER TABLE [dbo].[tblEmotion] CHECK CONSTRAINT [FK_tblEmotion_tblArticle]
GO
ALTER TABLE [dbo].[tblEmotion]  WITH CHECK ADD  CONSTRAINT [FK_tblEmotion_tblStatus] FOREIGN KEY([statusID])
REFERENCES [dbo].[tblStatus] ([statusID])
GO
ALTER TABLE [dbo].[tblEmotion] CHECK CONSTRAINT [FK_tblEmotion_tblStatus]
GO
ALTER TABLE [dbo].[tblEmotion]  WITH CHECK ADD  CONSTRAINT [FK_tblEmotion_tblUser] FOREIGN KEY([email])
REFERENCES [dbo].[tblUser] ([email])
GO
ALTER TABLE [dbo].[tblEmotion] CHECK CONSTRAINT [FK_tblEmotion_tblUser]
GO
ALTER TABLE [dbo].[tblUser]  WITH CHECK ADD  CONSTRAINT [FK_tblUser_tblStatus] FOREIGN KEY([statusID])
REFERENCES [dbo].[tblStatus] ([statusID])
GO
ALTER TABLE [dbo].[tblUser] CHECK CONSTRAINT [FK_tblUser_tblStatus]
GO
USE [master]
GO
ALTER DATABASE [MiniSocialNetwork] SET  READ_WRITE 
GO
