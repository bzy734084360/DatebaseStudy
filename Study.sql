USE [master]
GO
/****** Object:  Database [Study]    Script Date: 2019/12/25 17:48:07 ******/
CREATE DATABASE [Study]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Study', FILENAME = N'F:\SQLSERVER2012\MSSQL11.SQLEXPRESS\MSSQL\DATA\Study.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Study_log', FILENAME = N'F:\SQLSERVER2012\MSSQL11.SQLEXPRESS\MSSQL\DATA\Study_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Study] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Study].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Study] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Study] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Study] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Study] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Study] SET ARITHABORT OFF 
GO
ALTER DATABASE [Study] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Study] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Study] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Study] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Study] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Study] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Study] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Study] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Study] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Study] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Study] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Study] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Study] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Study] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Study] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Study] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Study] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Study] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Study] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Study] SET  MULTI_USER 
GO
ALTER DATABASE [Study] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Study] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Study] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Study] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Study]
GO
/****** Object:  User [study]    Script Date: 2019/12/25 17:48:07 ******/
CREATE USER [study] FOR LOGIN [study] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[ClassInfo]    Script Date: 2019/12/25 17:48:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClassInfo](
	[ClassID] [int] IDENTITY(1,1) NOT NULL,
	[ClassName] [nvarchar](5) NOT NULL,
 CONSTRAINT [PK_Class] PRIMARY KEY CLUSTERED 
(
	[ClassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ScoreInfo]    Script Date: 2019/12/25 17:48:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ScoreInfo](
	[scoreId] [int] IDENTITY(1,1) NOT NULL,
	[stuId] [int] NOT NULL,
	[subId] [int] NOT NULL,
	[score] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[scoreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StudentInfo]    Script Date: 2019/12/25 17:48:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StudentInfo](
	[StudentID] [int] IDENTITY(1,1) NOT NULL,
	[StudentName] [nvarchar](10) NOT NULL,
	[StudentGender] [bit] NOT NULL,
	[StudentBirthday] [datetime] NOT NULL,
	[StudentPhone] [char](11) NULL,
	[StudentEmail] [varchar](20) NOT NULL,
	[ClassID] [int] NOT NULL,
 CONSTRAINT [PK_StudentInfo] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Subject]    Script Date: 2019/12/25 17:48:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[subId] [int] IDENTITY(1,1) NOT NULL,
	[subTitle] [nvarchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[subId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Table_1]    Script Date: 2019/12/25 17:48:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table_1](
	[TestId] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[TestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbtest]    Script Date: 2019/12/25 17:48:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbtest](
	[scoreId] [int] NOT NULL,
	[stuId] [int] NOT NULL,
	[subId] [int] NOT NULL,
	[score] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[test1]    Script Date: 2019/12/25 17:48:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[test1](
	[ClassID] [int] IDENTITY(1,1) NOT NULL,
	[ClassName] [varchar](4) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[test2]    Script Date: 2019/12/25 17:48:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[test2](
	[ClassID] [int] IDENTITY(1,1) NOT NULL,
	[ClassName] [nvarchar](4) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TestTable]    Script Date: 2019/12/25 17:48:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TestTable](
	[cId] [int] IDENTITY(1,1) NOT NULL,
	[cTitle] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[cId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TestTable2]    Script Date: 2019/12/25 17:48:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TestTable2](
	[sId] [int] IDENTITY(1,1) NOT NULL,
	[sName] [nvarchar](10) NOT NULL,
	[sGender] [bit] NULL,
	[sBirthday] [date] NULL,
	[sPhone] [char](11) NULL,
	[sEmail] [varchar](20) NULL,
	[cId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[sId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserInfo]    Script Date: 2019/12/25 17:48:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserInfo](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](10) NOT NULL,
	[UserPwd] [char](32) NOT NULL,
	[RegDate] [datetime] NULL,
	[TestId] [int] NULL,
 CONSTRAINT [PK_UserInfo] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[ClassInfo] ON 

INSERT [dbo].[ClassInfo] ([ClassID], [ClassName]) VALUES (2, N'白虎')
INSERT [dbo].[ClassInfo] ([ClassID], [ClassName]) VALUES (1, N'青龙')
INSERT [dbo].[ClassInfo] ([ClassID], [ClassName]) VALUES (5, N'武当')
INSERT [dbo].[ClassInfo] ([ClassID], [ClassName]) VALUES (3, N'玄武')
SET IDENTITY_INSERT [dbo].[ClassInfo] OFF
SET IDENTITY_INSERT [dbo].[ScoreInfo] ON 

INSERT [dbo].[ScoreInfo] ([scoreId], [stuId], [subId], [score]) VALUES (1, 5, 1, 80)
INSERT [dbo].[ScoreInfo] ([scoreId], [stuId], [subId], [score]) VALUES (2, 5, 2, 88)
INSERT [dbo].[ScoreInfo] ([scoreId], [stuId], [subId], [score]) VALUES (3, 5, 3, 90)
INSERT [dbo].[ScoreInfo] ([scoreId], [stuId], [subId], [score]) VALUES (4, 5, 4, 95)
INSERT [dbo].[ScoreInfo] ([scoreId], [stuId], [subId], [score]) VALUES (5, 6, 1, 80)
INSERT [dbo].[ScoreInfo] ([scoreId], [stuId], [subId], [score]) VALUES (6, 6, 2, 88)
INSERT [dbo].[ScoreInfo] ([scoreId], [stuId], [subId], [score]) VALUES (7, 6, 3, 90)
INSERT [dbo].[ScoreInfo] ([scoreId], [stuId], [subId], [score]) VALUES (8, 6, 4, 95)
INSERT [dbo].[ScoreInfo] ([scoreId], [stuId], [subId], [score]) VALUES (9, 7, 1, 80)
INSERT [dbo].[ScoreInfo] ([scoreId], [stuId], [subId], [score]) VALUES (10, 7, 2, 88)
INSERT [dbo].[ScoreInfo] ([scoreId], [stuId], [subId], [score]) VALUES (11, 7, 3, 90)
INSERT [dbo].[ScoreInfo] ([scoreId], [stuId], [subId], [score]) VALUES (12, 7, 4, 95)
INSERT [dbo].[ScoreInfo] ([scoreId], [stuId], [subId], [score]) VALUES (13, 8, 1, 80)
INSERT [dbo].[ScoreInfo] ([scoreId], [stuId], [subId], [score]) VALUES (14, 8, 2, 88)
INSERT [dbo].[ScoreInfo] ([scoreId], [stuId], [subId], [score]) VALUES (15, 8, 3, 90)
INSERT [dbo].[ScoreInfo] ([scoreId], [stuId], [subId], [score]) VALUES (16, 8, 4, 95)
SET IDENTITY_INSERT [dbo].[ScoreInfo] OFF
SET IDENTITY_INSERT [dbo].[StudentInfo] ON 

INSERT [dbo].[StudentInfo] ([StudentID], [StudentName], [StudentGender], [StudentBirthday], [StudentPhone], [StudentEmail], [ClassID]) VALUES (5, N'张七八', 1, CAST(0x000081D600000000 AS DateTime), NULL, N'777@qq.com', 1)
INSERT [dbo].[StudentInfo] ([StudentID], [StudentName], [StudentGender], [StudentBirthday], [StudentPhone], [StudentEmail], [ClassID]) VALUES (6, N'李四五', 1, CAST(0x000081D700000000 AS DateTime), NULL, N'555@qq.com', 2)
INSERT [dbo].[StudentInfo] ([StudentID], [StudentName], [StudentGender], [StudentBirthday], [StudentPhone], [StudentEmail], [ClassID]) VALUES (7, N'王五六', 1, CAST(0x000081D800000000 AS DateTime), N'123555     ', N'666@qq.com', 3)
INSERT [dbo].[StudentInfo] ([StudentID], [StudentName], [StudentGender], [StudentBirthday], [StudentPhone], [StudentEmail], [ClassID]) VALUES (8, N'赵六', 1, CAST(0x000081D900000000 AS DateTime), N'13333      ', N'999@qq.com', 3)
INSERT [dbo].[StudentInfo] ([StudentID], [StudentName], [StudentGender], [StudentBirthday], [StudentPhone], [StudentEmail], [ClassID]) VALUES (9, N'张三', 1, CAST(0x000081D600000000 AS DateTime), N'123456     ', N'777@qq.com', 1)
INSERT [dbo].[StudentInfo] ([StudentID], [StudentName], [StudentGender], [StudentBirthday], [StudentPhone], [StudentEmail], [ClassID]) VALUES (10, N'李四', 1, CAST(0x000081D700000000 AS DateTime), N'1256666    ', N'555@qq.com', 2)
INSERT [dbo].[StudentInfo] ([StudentID], [StudentName], [StudentGender], [StudentBirthday], [StudentPhone], [StudentEmail], [ClassID]) VALUES (11, N'王五', 1, CAST(0x000081D800000000 AS DateTime), N'123555     ', N'666@qq.com', 3)
INSERT [dbo].[StudentInfo] ([StudentID], [StudentName], [StudentGender], [StudentBirthday], [StudentPhone], [StudentEmail], [ClassID]) VALUES (12, N'赵六', 0, CAST(0x000081D900000000 AS DateTime), N'13333      ', N'999@qq.com', 3)
SET IDENTITY_INSERT [dbo].[StudentInfo] OFF
SET IDENTITY_INSERT [dbo].[Subject] ON 

INSERT [dbo].[Subject] ([subId], [subTitle]) VALUES (1, N'数据库')
INSERT [dbo].[Subject] ([subId], [subTitle]) VALUES (2, N'软件工程')
INSERT [dbo].[Subject] ([subId], [subTitle]) VALUES (3, N'计算机英语')
INSERT [dbo].[Subject] ([subId], [subTitle]) VALUES (4, N'算法与设计')
SET IDENTITY_INSERT [dbo].[Subject] OFF
INSERT [dbo].[tbtest] ([scoreId], [stuId], [subId], [score]) VALUES (1, 5, 1, 80)
INSERT [dbo].[tbtest] ([scoreId], [stuId], [subId], [score]) VALUES (2, 5, 2, 88)
INSERT [dbo].[tbtest] ([scoreId], [stuId], [subId], [score]) VALUES (3, 5, 3, 90)
INSERT [dbo].[tbtest] ([scoreId], [stuId], [subId], [score]) VALUES (4, 5, 4, 95)
INSERT [dbo].[tbtest] ([scoreId], [stuId], [subId], [score]) VALUES (5, 6, 1, 80)
INSERT [dbo].[tbtest] ([scoreId], [stuId], [subId], [score]) VALUES (6, 6, 2, 88)
INSERT [dbo].[tbtest] ([scoreId], [stuId], [subId], [score]) VALUES (7, 6, 3, 90)
INSERT [dbo].[tbtest] ([scoreId], [stuId], [subId], [score]) VALUES (8, 6, 4, 95)
INSERT [dbo].[tbtest] ([scoreId], [stuId], [subId], [score]) VALUES (9, 7, 1, 80)
INSERT [dbo].[tbtest] ([scoreId], [stuId], [subId], [score]) VALUES (10, 7, 2, 88)
INSERT [dbo].[tbtest] ([scoreId], [stuId], [subId], [score]) VALUES (11, 7, 3, 90)
INSERT [dbo].[tbtest] ([scoreId], [stuId], [subId], [score]) VALUES (12, 7, 4, 95)
INSERT [dbo].[tbtest] ([scoreId], [stuId], [subId], [score]) VALUES (13, 8, 1, 80)
INSERT [dbo].[tbtest] ([scoreId], [stuId], [subId], [score]) VALUES (14, 8, 2, 88)
INSERT [dbo].[tbtest] ([scoreId], [stuId], [subId], [score]) VALUES (15, 8, 3, 90)
INSERT [dbo].[tbtest] ([scoreId], [stuId], [subId], [score]) VALUES (16, 8, 4, 95)
SET IDENTITY_INSERT [dbo].[test1] ON 

INSERT [dbo].[test1] ([ClassID], [ClassName]) VALUES (2, N'白虎')
INSERT [dbo].[test1] ([ClassID], [ClassName]) VALUES (1, N'青龙')
INSERT [dbo].[test1] ([ClassID], [ClassName]) VALUES (5, N'武当')
INSERT [dbo].[test1] ([ClassID], [ClassName]) VALUES (3, N'玄武')
INSERT [dbo].[test1] ([ClassID], [ClassName]) VALUES (8, N'名字')
INSERT [dbo].[test1] ([ClassID], [ClassName]) VALUES (9, N'aaaa')
SET IDENTITY_INSERT [dbo].[test1] OFF
SET IDENTITY_INSERT [dbo].[test2] ON 

INSERT [dbo].[test2] ([ClassID], [ClassName]) VALUES (1, N'武当')
INSERT [dbo].[test2] ([ClassID], [ClassName]) VALUES (2, N'玄武')
INSERT [dbo].[test2] ([ClassID], [ClassName]) VALUES (3, N'四个名字')
INSERT [dbo].[test2] ([ClassID], [ClassName]) VALUES (4, N'aaaa')
SET IDENTITY_INSERT [dbo].[test2] OFF
SET IDENTITY_INSERT [dbo].[UserInfo] ON 

INSERT [dbo].[UserInfo] ([UserId], [UserName], [UserPwd], [RegDate], [TestId]) VALUES (1, N'小笼包', N'21232f297a57a5a743894a0e4a801fc3', CAST(0x000081D500000000 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([UserId], [UserName], [UserPwd], [RegDate], [TestId]) VALUES (3, N'尹志平', N'21232f297a57a5a743894a0e4a801fc3', CAST(0x000081D500000000 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([UserId], [UserName], [UserPwd], [RegDate], [TestId]) VALUES (4, N'大头贴', N'21232f297a57a5a743894a0e4a801fc3', CAST(0x0000877600000000 AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[UserInfo] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Class]    Script Date: 2019/12/25 17:48:07 ******/
ALTER TABLE [dbo].[ClassInfo] ADD  CONSTRAINT [IX_Class] UNIQUE NONCLUSTERED 
(
	[ClassName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserInfo]    Script Date: 2019/12/25 17:48:07 ******/
ALTER TABLE [dbo].[UserInfo] ADD  CONSTRAINT [IX_UserInfo] UNIQUE NONCLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TestTable2] ADD  DEFAULT ((0)) FOR [sGender]
GO
ALTER TABLE [dbo].[UserInfo] ADD  CONSTRAINT [DF_UserInfo_RegDate]  DEFAULT ('1991-1-1') FOR [RegDate]
GO
ALTER TABLE [dbo].[ScoreInfo]  WITH CHECK ADD  CONSTRAINT [FK__ScoreInfo__stuId__34C8D9D1] FOREIGN KEY([stuId])
REFERENCES [dbo].[StudentInfo] ([StudentID])
GO
ALTER TABLE [dbo].[ScoreInfo] CHECK CONSTRAINT [FK__ScoreInfo__stuId__34C8D9D1]
GO
ALTER TABLE [dbo].[ScoreInfo]  WITH CHECK ADD FOREIGN KEY([subId])
REFERENCES [dbo].[Subject] ([subId])
GO
ALTER TABLE [dbo].[StudentInfo]  WITH CHECK ADD  CONSTRAINT [FK_StudentInfo_ClassInfo] FOREIGN KEY([ClassID])
REFERENCES [dbo].[ClassInfo] ([ClassID])
GO
ALTER TABLE [dbo].[StudentInfo] CHECK CONSTRAINT [FK_StudentInfo_ClassInfo]
GO
ALTER TABLE [dbo].[TestTable2]  WITH CHECK ADD FOREIGN KEY([cId])
REFERENCES [dbo].[TestTable] ([cId])
GO
ALTER TABLE [dbo].[UserInfo]  WITH CHECK ADD  CONSTRAINT [FK_UserInfo_UserInfo] FOREIGN KEY([TestId])
REFERENCES [dbo].[Table_1] ([TestId])
GO
ALTER TABLE [dbo].[UserInfo] CHECK CONSTRAINT [FK_UserInfo_UserInfo]
GO
ALTER TABLE [dbo].[UserInfo]  WITH CHECK ADD  CONSTRAINT [CK_UserInfo] CHECK  ((datepart(year,[RegDate])>=(1980) AND datepart(year,[RegDate])<=(1999)))
GO
ALTER TABLE [dbo].[UserInfo] CHECK CONSTRAINT [CK_UserInfo]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0男1女' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StudentInfo', @level2type=N'COLUMN',@level2name=N'StudentGender'
GO
USE [master]
GO
ALTER DATABASE [Study] SET  READ_WRITE 
GO
