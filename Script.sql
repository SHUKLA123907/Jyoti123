USE [master]
GO
/****** Object:  Database [SchoolDb]    Script Date: 13-09-2024 17:25:00 ******/
CREATE DATABASE [SchoolDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SchoolDb_Data', FILENAME = N'C:\Users\susha\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\SchoolDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SchoolDb_Log', FILENAME = N'C:\Users\susha\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\SchoolDb.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SchoolDb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SchoolDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SchoolDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SchoolDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SchoolDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SchoolDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SchoolDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [SchoolDb] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [SchoolDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SchoolDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SchoolDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SchoolDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SchoolDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SchoolDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SchoolDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SchoolDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SchoolDb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SchoolDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SchoolDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SchoolDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SchoolDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SchoolDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SchoolDb] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [SchoolDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SchoolDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SchoolDb] SET  MULTI_USER 
GO
ALTER DATABASE [SchoolDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SchoolDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SchoolDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SchoolDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SchoolDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SchoolDb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SchoolDb] SET QUERY_STORE = OFF
GO
USE [SchoolDb]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 13-09-2024 17:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Administrators]    Script Date: 13-09-2024 17:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Administrators](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AdministratorUserId] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Administrators] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 13-09-2024 17:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[BookId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[AuthorName] [nvarchar](max) NOT NULL,
	[ISBN] [nvarchar](max) NOT NULL,
	[PublishedDate] [date] NOT NULL,
	[NumberofCopies] [int] NOT NULL,
 CONSTRAINT [PK_Books] PRIMARY KEY CLUSTERED 
(
	[BookId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Classes]    Script Date: 13-09-2024 17:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Classes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClassName] [nvarchar](max) NOT NULL,
	[TeacherCoordinatorId] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Classes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Guardians]    Script Date: 13-09-2024 17:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Guardians](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GuardianId] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[FirstName] [nvarchar](max) NOT NULL,
	[LastName] [nvarchar](max) NOT NULL,
	[Relationship] [nvarchar](max) NOT NULL,
	[ContactNumber] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Guardians] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IssuedBooks]    Script Date: 13-09-2024 17:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IssuedBooks](
	[IssuedId] [int] IDENTITY(1,1) NOT NULL,
	[BookId] [int] NOT NULL,
	[Userid] [int] NOT NULL,
	[IssueDate] [date] NOT NULL,
	[ReturnDate] [date] NOT NULL,
	[Status] [nvarchar](max) NOT NULL,
	[LateFee] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_IssuedBooks] PRIMARY KEY CLUSTERED 
(
	[IssuedId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[librarians]    Script Date: 13-09-2024 17:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[librarians](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LibrarianId] [nvarchar](max) NOT NULL,
	[password] [nvarchar](max) NOT NULL,
	[FirstName] [nvarchar](max) NOT NULL,
	[LastName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_librarians] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reservations]    Script Date: 13-09-2024 17:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservations](
	[ReservationId] [int] IDENTITY(1,1) NOT NULL,
	[BookId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[ReservationDate] [date] NOT NULL,
	[Status] [nvarchar](max) NULL,
 CONSTRAINT [PK_Reservations] PRIMARY KEY CLUSTERED 
(
	[ReservationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentAttendances]    Script Date: 13-09-2024 17:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentAttendances](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [nvarchar](max) NOT NULL,
	[AttendanceDate] [date] NOT NULL,
	[Attendance] [bit] NOT NULL,
 CONSTRAINT [PK_StudentAttendances] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 13-09-2024 17:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[FirstName] [nvarchar](max) NOT NULL,
	[MiddleName] [nvarchar](max) NOT NULL,
	[LastName] [nvarchar](max) NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[Gender] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[ContactNumber] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[EnrollmentDate] [date] NOT NULL,
	[GuardianId] [nvarchar](max) NOT NULL,
	[ClassId] [int] NOT NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subjects]    Script Date: 13-09-2024 17:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subjects](
	[SubjectId] [int] IDENTITY(1,1) NOT NULL,
	[SubjectName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Subjects] PRIMARY KEY CLUSTERED 
(
	[SubjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teachers]    Script Date: 13-09-2024 17:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teachers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TeacherUserId] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[FirstName] [nvarchar](max) NOT NULL,
	[LastName] [nvarchar](max) NOT NULL,
	[Qualification] [nvarchar](max) NOT NULL,
	[SubjectId] [int] NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[HireDate] [date] NOT NULL,
 CONSTRAINT [PK_Teachers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TeachersLeaves]    Script Date: 13-09-2024 17:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeachersLeaves](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TeacherId] [nvarchar](max) NOT NULL,
	[Leavetype] [nvarchar](max) NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[LeaveReason] [nvarchar](max) NOT NULL,
	[Status] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_TeachersLeaves] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Timetables]    Script Date: 13-09-2024 17:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Timetables](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClassId] [int] NOT NULL,
	[Day] [nvarchar](max) NOT NULL,
	[StartTime] [nvarchar](max) NOT NULL,
	[EndTime] [nvarchar](max) NOT NULL,
	[Subject] [nvarchar](max) NOT NULL,
	[TeacherId] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Timetables] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 13-09-2024 17:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[Urole] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[TeachersLeaves] ADD  DEFAULT (N'') FOR [Status]
GO
/****** Object:  StoredProcedure [dbo].[AddAdministrator]    Script Date: 13-09-2024 17:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[AddAdministrator]
@AdministratorUserId varchar(100),
@password varchar(100)
as
begin
	Insert into Administrators values(@AdministratorUserId,@password);
end
GO
/****** Object:  StoredProcedure [dbo].[AddBooks]    Script Date: 13-09-2024 17:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[AddBooks]
@Title varchar(100),
@authorname varchar(100),
@isbn varchar(100),
@publishdate date,
@numberofcopies int
as
begin
	insert into books values (@Title,@authorname,@isbn,@publishdate,@numberofcopies);
end
GO
/****** Object:  StoredProcedure [dbo].[AddClass]    Script Date: 13-09-2024 17:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[AddClass]
@Classname varchar(100),
@teachercoordinatorId varchar(100)
as
begin
	Insert into Classes values(@Classname,@teachercoordinatorId);
end
GO
/****** Object:  StoredProcedure [dbo].[AddGuardian]    Script Date: 13-09-2024 17:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[AddGuardian]
@UserId varchar(100),
@pass varchar(100),
@firstname varchar(100),
@lastname varchar(100),
@relationship varchar(100),
@contactnumber varchar(100),
@email varchar(100),
@address varchar(100)
as
begin
	Insert into Guardians values (@UserId,@pass,@firstname,@lastname,@relationship,@contactnumber,@email,@address);
end
GO
/****** Object:  StoredProcedure [dbo].[AddLibrarian]    Script Date: 13-09-2024 17:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[AddLibrarian]
@librarianid varchar(100),
@password varchar(100),
@firstName varchar(100),
@lastname varchar(100)
as
begin
	Insert into Librarians values (@librarianid,@password,@firstName,@lastname);
end
GO
/****** Object:  StoredProcedure [dbo].[AddStudent]    Script Date: 13-09-2024 17:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[AddStudent]
@Studentid varchar(100),
@password varchar(100),
@firstname varchar(100),
@middlename varchar(100),
@lastname varchar(100),
@DateofBirth date,
@gender varchar(100),
@Address varchar(100),
@contactnumber varchar(100),
@Email varchar(100),
@Enrollmentdate date,
@guardianid varchar(100),
@classid int
as
begin
	insert into students values(@Studentid,@password,@firstname,@middlename,@lastname,@DateofBirth,@gender,@Address,@contactnumber,@Email,@Enrollmentdate,@guardianid,@classid);
end
GO
/****** Object:  StoredProcedure [dbo].[AddStudentAttendance]    Script Date: 13-09-2024 17:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[AddStudentAttendance]
@studentid varchar(100),
@Currentdate date,
@attendance bit
as
begin
	Insert into StudentAttendances values(@studentid,@Currentdate,@attendance)
end
GO
/****** Object:  StoredProcedure [dbo].[AddSubjects]    Script Date: 13-09-2024 17:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[AddSubjects]
@SubjectName varchar(100)
as
begin
	Insert into Subjects values(@SubjectName);
end
GO
/****** Object:  StoredProcedure [dbo].[AddTeacher]    Script Date: 13-09-2024 17:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[AddTeacher]
@teacheruserid varchar(100),
@password varchar(100),
@firstname varchar(100),
@lastname varchar(100),
@Qualification varchar(100),
@SubjectId int,
@email varchar(100),
@HireDate date
as
begin
	Insert into Teachers values (@teacheruserid,@password,@firstname,@lastname,@Qualification,@SubjectId,@email,@HireDate);
end
GO
/****** Object:  StoredProcedure [dbo].[AddTeacherLeave]    Script Date: 13-09-2024 17:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[AddTeacherLeave]
@Teacherid varchar(100),
@leavetype varchar(100),
@StartDate Date,
@EndDate date,
@Leavereason varchar(100),
@status varchar(100)
as
begin
	Insert into TeachersLeaves Values(@Teacherid,@leavetype,@StartDate,@EndDate,@Leavereason,@status);
end
GO
/****** Object:  StoredProcedure [dbo].[AddTimetable]    Script Date: 13-09-2024 17:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  create proc [dbo].[AddTimetable]
  @classid int,
  @day varchar(100),
  @starttime varchar(100),
  @endtime varchar(100),
  @subject int,
  @teacherid varchar(100)
  as
  begin
	insert into Timetables values (@classid,@day,@starttime,@endtime,@subject,@teacherid);
end
GO
/****** Object:  StoredProcedure [dbo].[ApproveTeacherLeave]    Script Date: 13-09-2024 17:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[ApproveTeacherLeave]
@id int
as
begin
update teachersleaves set Status = 'Approved' where Id= @id;
end
GO
/****** Object:  StoredProcedure [dbo].[AuthUser]    Script Date: 13-09-2024 17:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[AuthUser]
@userid varchar(100),
@password varchar(100)
as
	begin
	select * from Users where UserId = @userid and Password= @password;
end
GO
/****** Object:  StoredProcedure [dbo].[CalculateLateFee]    Script Date: 13-09-2024 17:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CalculateLateFee]
    @IssuedId INT,
    @ReturnDate DATE
AS
BEGIN
    DECLARE @IssueDate DATE
    DECLARE @LateFee DECIMAL(18,2)

    -- Fetch IssueDate for the given IssueId
    SELECT @IssueDate = IssueDate
    FROM IssuedBooks
    WHERE IssuedId = @IssuedId

    -- Check if IssueId exists
    IF @IssueDate IS NULL
    BEGIN
        RAISERROR('Invalid IssueId', 16, 1)
        RETURN
    END

    -- Calculate Late Fee
    IF DATEDIFF(DAY, @IssueDate, @ReturnDate) > 7
    BEGIN
        SET @LateFee = (DATEDIFF(DAY, @IssueDate, @ReturnDate) - 7) * 5
    END
    ELSE
    BEGIN
        SET @LateFee = 0
    END

    -- Update LateFee in the issues table
    UPDATE IssuedBooks
    SET LateFee = @LateFee
    WHERE IssuedId = @IssuedId

    -- Return the result set including IssueId and LateFee
    SELECT IssuedId, BookId, IssueDate, ReturnDate, Status, Userid, LateFee
    FROM IssuedBooks
    WHERE IssuedId = @IssuedId
END
GO
/****** Object:  StoredProcedure [dbo].[DisplayAllUsers]    Script Date: 13-09-2024 17:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[DisplayAllUsers]
as 
begin
	select * from Users;
end
GO
/****** Object:  StoredProcedure [dbo].[FetchAdministratorByUserId]    Script Date: 13-09-2024 17:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[FetchAdministratorByUserId]
@AdministratorUserId varchar(100)
as
begin
	select * from Administrators where AdministratorUserId = @AdministratorUserId;
end
GO
/****** Object:  StoredProcedure [dbo].[FetchAllClasses]    Script Date: 13-09-2024 17:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[FetchAllClasses]
as
begin
	select * from Classes;
end
GO
/****** Object:  StoredProcedure [dbo].[FetchAllGuardians]    Script Date: 13-09-2024 17:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[FetchAllGuardians]
as
begin
	Select * from Guardians;
end
GO
/****** Object:  StoredProcedure [dbo].[FetchAllStudentClassId]    Script Date: 13-09-2024 17:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[FetchAllStudentClassId] 
@teacherid varchar(100)
as
begin
	select * from students where classid = (select id from classes where TeacherCoordinatorId = @teacherid);
end
GO
/****** Object:  StoredProcedure [dbo].[FetchAllSubjects]    Script Date: 13-09-2024 17:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[FetchAllSubjects]
as
begin
	Select * from Subjects;
end
GO
/****** Object:  StoredProcedure [dbo].[FetchAllTeacherLeaveRequest]    Script Date: 13-09-2024 17:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[FetchAllTeacherLeaveRequest]
as
begin
select tl.Id,t.FirstName + t.LastName as TeacherId,tl.Leavetype,tl.StartDate,tl.EndDate,tl.LeaveReason,tl.Status from teachersLeaves tl
inner join Teachers t on tl.TeacherId = t.TeacherUserId
where tl.Status = 'Pending';
end
GO
/****** Object:  StoredProcedure [dbo].[FetchAllTeacherLeavesBasedOnTeacherId]    Script Date: 13-09-2024 17:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[FetchAllTeacherLeavesBasedOnTeacherId]
@teacherid varchar(100)
as
begin
	select * from TeachersLeaves Where Teacherid = @teacherid;
end
GO
/****** Object:  StoredProcedure [dbo].[FetchAllTeachers]    Script Date: 13-09-2024 17:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[FetchAllTeachers]
as
begin
	select * from teachers
end
GO
/****** Object:  StoredProcedure [dbo].[FetchTimetableByStudentid]    Script Date: 13-09-2024 17:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[FetchTimetableByStudentid]
@studentid varchar(100)
as
begin
	select tt.id,tt.ClassId,tt.Day,tt.StartTime,tt.EndTime,s.SubjectName as Subject,t.FirstName + t.LastName as teacherid from timetables tt 
inner join Teachers t on tt.TeacherId = t.TeacherUserId
inner join Subjects s on tt.Subject = s.SubjectId
where Classid = (select ClassId from students where StudentId = @studentid)
end
GO
/****** Object:  StoredProcedure [dbo].[GetAllBooks]    Script Date: 13-09-2024 17:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetAllBooks]
   
AS
BEGIN
    SELECT * FROM Books 
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllIssuedBooks]    Script Date: 13-09-2024 17:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetAllIssuedBooks]
AS
BEGIN
    SELECT * FROM IssuedBooks
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllUsers]    Script Date: 13-09-2024 17:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetAllUsers]
as
begin 
select * from Users
end
GO
/****** Object:  StoredProcedure [dbo].[GetBookById]    Script Date: 13-09-2024 17:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[GetBookById]
    @BookId INT
AS
BEGIN
    SELECT * FROM Books WHERE BookId = @BookId;
END
GO
/****** Object:  StoredProcedure [dbo].[GetIssuedBookById]    Script Date: 13-09-2024 17:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetIssuedBookById]
    @IssuedId INT
AS
BEGIN
    SELECT * FROM IssuedBooks WHERE IssuedId = @IssuedId
END
GO
/****** Object:  StoredProcedure [dbo].[InsertBook]    Script Date: 13-09-2024 17:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[InsertBook]
    @Title NVARCHAR(255),
    @AuthorName NVARCHAR(255),
    @ISBN NVARCHAR(50),
    @PublishedDate Date,
    @NumberofCopies INT
AS
BEGIN
    INSERT INTO Books (Title, AuthorName, ISBN, PublishedDate, NumberofCopies )
    VALUES (@Title, @AuthorName, @ISBN, @PublishedDate, @NumberofCopies);
END
GO
/****** Object:  StoredProcedure [dbo].[insertUser]    Script Date: 13-09-2024 17:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[insertUser]
@Userid varchar(100),
@Password varchar(100),
@Urole varchar(100)
as
begin
	Insert into users values(@Userid,@Password,@Urole);
end
GO
/****** Object:  StoredProcedure [dbo].[IssueBook]    Script Date: 13-09-2024 17:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[IssueBook]
    @BookId INT,
    @Userid INT,
    @IssueDate Date,
	@ReturnDate Date,
	@LateFee decimal(10,2)
	
AS
BEGIN
    INSERT INTO IssuedBooks (BookId, Userid, IssueDate,ReturnDate, Status,LateFee)
    VALUES (@BookId, @Userid, @IssueDate,@IssueDate, 'Issued',@LateFee)
END
GO
/****** Object:  StoredProcedure [dbo].[RejectTeacherLeave]    Script Date: 13-09-2024 17:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[RejectTeacherLeave]
@id int
as
begin
update teachersleaves set Status = 'Rejected' where Id= @id;
end
GO
/****** Object:  StoredProcedure [dbo].[ReturnBook]    Script Date: 13-09-2024 17:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[ReturnBook]
    @IssuedId INT,
    @ReturnDate Date
AS
BEGIN
    UPDATE issues
    SET ReturnDate = @ReturnDate, Status = 'Returned'
    WHERE IssuedId = @IssuedId
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateAll]    Script Date: 13-09-2024 17:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[UpdateAll]
   @BookId int,
    @Title NVARCHAR(255),
    @AuthorName NVARCHAR(255),
    @ISBN NVARCHAR(50),
    @PublishedDate Date,
    @NumberofCopies INT
AS
BEGIN
    UPDATE Books
    SET 
        Title = @Title,
       AuthorName = @AuthorName,
        ISBN = @ISBN,
        PublishedDate = @PublishedDate,
        NumberofCopies = @NumberofCopies
    WHERE 
        BookId = @BookId;
END
GO
USE [master]
GO
ALTER DATABASE [SchoolDb] SET  READ_WRITE 
GO
