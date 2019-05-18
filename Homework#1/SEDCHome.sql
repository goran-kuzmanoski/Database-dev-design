CREATE DATABASE HOMEWORK
GO

USE [HOMEWORK]
GO


DROP TABLE IF EXISTS [dbo].[Student];
DROP TABLE IF EXISTS [dbo].[Teacher];
DROP TABLE IF EXISTS [dbo].[GradeDetails];
DROP TABLE IF EXISTS [dbo].[Course];
DROP TABLE IF EXISTS [dbo].[Grade];
DROP TABLE IF EXISTS [dbo].[AchievementType];
GO

CREATE TABLE [dbo].[Student](
	[ID] [smallint] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[DateOfBirth] [date]NOT NULL,
	[EnroledDate] [date] NOT NULL,
	[Gender][nvarchar](6)NOT NULL,
	[NationalIdNumber][smallint] NULL,
	[StudentCardNumber][smallint] NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
))
GO

CREATE TABLE [dbo].[Teacher](
	[ID] [smallint] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[DateOfBirth] [date]NOT NULL,
	[AcademicRank][nvarchar](50)NOT NULL,
	[HireDate] [date] NOT NULL,
	CONSTRAINT [PK_Teacher] PRIMARY KEY CLUSTERED
	(
	[ID] ASC
	))
GO

CREATE TABLE [dbo].[GradeDetails](
	[ID] [smallint] IDENTITY(1,1) NOT NULL,
	[GradeID] [smallint] NULL,
	[AchivementTypeID] [smallint] NULL,
	[AchivementPoints] [smallint] NULL,
	[AchivementMaxPoints][smallint]NULL,
	[AchivementDate] [datetime] NOT NULL,
	CONSTRAINT [PK_GradeDetails] PRIMARY KEY CLUSTERED
	(
	[ID] ASC
	))
GO
	CREATE TABLE [dbo].[Course](
	[ID] [smallint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Credit] [nvarchar](2) NULL,
	[AccademicYear] [int] NULL,
	[Semester][nvarchar](10)NULL,
	CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED
	(
	[ID] ASC
	))
GO
	CREATE TABLE [dbo].[Grade](
	[ID] [smallint] IDENTITY(1,1) NOT NULL,
	[StudentID] [smallint] NOT NULL,
	[CourseID] [smallint] NOT NULL,
	[TeacherID] [smallint] NOT NULL,
	[Grade][tinyint]NOT NULL,
	[Comment][nvarchar](100)NULL,
	[CreateDate][datetime] NOT NULL,
	CONSTRAINT [PK_Grade] PRIMARY KEY CLUSTERED
	(
	[ID] ASC
	))
GO
	CREATE TABLE [dbo].[AchievementType](
	[ID] [smallint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](100) NULL,
	[ParticipationRate] [smallmoney] NOT NULL,
	CONSTRAINT [PK_AchievementType] PRIMARY KEY CLUSTERED
	(
	[ID] ASC
	))
GO