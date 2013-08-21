USE [master]
GO
/****** Object:  Database [DogApp]    Script Date: 8/21/2013 1:41:18 PM ******/
CREATE DATABASE [DogApp]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DogApp', FILENAME = N'c:\Users\daniel.nixon\Dropbox\Programming\SQL\Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\DogApp.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DogApp_log', FILENAME = N'c:\Users\daniel.nixon\Dropbox\Programming\SQL\Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\DogApp_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DogApp] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DogApp].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DogApp] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DogApp] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DogApp] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DogApp] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DogApp] SET ARITHABORT OFF 
GO
ALTER DATABASE [DogApp] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DogApp] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [DogApp] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DogApp] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DogApp] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DogApp] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DogApp] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DogApp] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DogApp] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DogApp] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DogApp] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DogApp] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DogApp] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DogApp] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DogApp] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DogApp] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DogApp] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DogApp] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DogApp] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DogApp] SET  MULTI_USER 
GO
ALTER DATABASE [DogApp] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DogApp] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DogApp] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DogApp] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [DogApp]
GO
/****** Object:  StoredProcedure [dbo].[CreateDog]    Script Date: 8/21/2013 1:41:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CreateDog]
	@Name varchar(50),
	@Age int,
	@BreedId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Dogs VALUES(@Name, @Age, @BreedId, 1);
	SELECT SCOPE_IDENTITY()
END

GO
/****** Object:  StoredProcedure [dbo].[GetAllBreeds]    Script Date: 8/21/2013 1:41:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAllBreeds]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Id, Type
	FROM Breeds
	WHERE Active = 1
END

GO
/****** Object:  StoredProcedure [dbo].[GetAllDogs]    Script Date: 8/21/2013 1:41:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAllDogs]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Id, Name, Age
	FROM Dogs
	WHERE Active = 1
END

GO
/****** Object:  StoredProcedure [dbo].[GetBreedByDog]    Script Date: 8/21/2013 1:41:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetBreedByDog]
	@DogId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT b.Id, b.Type
	FROM Breeds b
	JOIN Dogs d
		ON b.Id = d.BreedId
	WHERE d.Id = @DogId
END

GO
/****** Object:  StoredProcedure [dbo].[GetBreedById]    Script Date: 8/21/2013 1:41:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetBreedById]
	@Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Id, Type
	FROM Breeds
	WHERE Id = @Id
END

GO
/****** Object:  StoredProcedure [dbo].[GetDogById]    Script Date: 8/21/2013 1:41:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetDogById]
	@Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Id, Name, Age
	FROM Dogs
	WHERE Id = @Id
END

GO
/****** Object:  StoredProcedure [dbo].[GetDogsByBreed]    Script Date: 8/21/2013 1:41:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetDogsByBreed]
	@BreedId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Id, Name, Age
	FROM Dogs
	WHERE BreedId = @BreedId
	AND Active = 1
END

GO
/****** Object:  StoredProcedure [dbo].[UpdateDog]    Script Date: 8/21/2013 1:41:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateDog]
	@Id int,
	@Name varchar(50),
	@Age int,
	@Active bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE Dogs
	SET
		Name = @Name,
		Age = @Age,
		Active = @Active
	WHERE Id = @Id
END

GO
/****** Object:  StoredProcedure [dbo].[UpdateDogBreed]    Script Date: 8/21/2013 1:41:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateDogBreed]
	@DogId int,
	@BreedId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE Dogs
	SET
		BreedId = @BreedID
	WHERE Id = @DogId
END

GO
/****** Object:  Table [dbo].[Breeds]    Script Date: 8/21/2013 1:41:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Breeds](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [varchar](50) NOT NULL,
	[Active] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Dogs]    Script Date: 8/21/2013 1:41:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Dogs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Age] [int] NOT NULL,
	[BreedId] [int] NOT NULL,
	[Active] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Breeds] ON 

INSERT [dbo].[Breeds] ([Id], [Type], [Active]) VALUES (1, N'Mastiff', 1)
INSERT [dbo].[Breeds] ([Id], [Type], [Active]) VALUES (2, N'Doberman', 1)
INSERT [dbo].[Breeds] ([Id], [Type], [Active]) VALUES (3, N'Labrador', 1)
INSERT [dbo].[Breeds] ([Id], [Type], [Active]) VALUES (4, N'Collie', 1)
SET IDENTITY_INSERT [dbo].[Breeds] OFF
SET IDENTITY_INSERT [dbo].[Dogs] ON 

INSERT [dbo].[Dogs] ([Id], [Name], [Age], [BreedId], [Active]) VALUES (1, N'Jeff', 8, 3, 1)
INSERT [dbo].[Dogs] ([Id], [Name], [Age], [BreedId], [Active]) VALUES (2, N'Jeff', 9, 2, 1)
INSERT [dbo].[Dogs] ([Id], [Name], [Age], [BreedId], [Active]) VALUES (3, N'Johnny', 3, 4, 1)
INSERT [dbo].[Dogs] ([Id], [Name], [Age], [BreedId], [Active]) VALUES (4, N'Gina', 5, 1, 1)
INSERT [dbo].[Dogs] ([Id], [Name], [Age], [BreedId], [Active]) VALUES (5, N'Carla', 6, 4, 1)
INSERT [dbo].[Dogs] ([Id], [Name], [Age], [BreedId], [Active]) VALUES (6, N'George', 6, 2, 1)
SET IDENTITY_INSERT [dbo].[Dogs] OFF
ALTER TABLE [dbo].[Breeds] ADD  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[Dogs]  WITH CHECK ADD FOREIGN KEY([BreedId])
REFERENCES [dbo].[Breeds] ([Id])
GO
USE [master]
GO
ALTER DATABASE [DogApp] SET  READ_WRITE 
GO
