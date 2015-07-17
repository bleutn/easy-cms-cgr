/****** Object:  Database CMS    Script Date: 17/06/2015 15:21:26 ******/
CREATE DATABASE CMS;

USE CMS;
/* CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CMS', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\CMS.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CMS_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\CMS_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
;
ALTER DATABASE CMS SET COMPATIBILITY_LEVEL = 110
;
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC CMS.sp_fulltext_database @action = 'enable'
end
;
ALTER DATABASE CMS SET ANSI_NULL_DEFAULT OFF 
;
ALTER DATABASE CMS 
ALTER DATABASE CMS 
ALTER DATABASE CMS SET ANSI_WARNINGS OFF 
;
ALTER DATABASE CMS SET ARITHABORT OFF 
;
ALTER DATABASE CMS SET AUTO_CLOSE OFF 
;
ALTER DATABASE CMS SET AUTO_CREATE_STATISTICS ON 
;
ALTER DATABASE CMS SET AUTO_SHRINK OFF 
;
ALTER DATABASE CMS SET AUTO_UPDATE_STATISTICS ON 
;
ALTER DATABASE CMS SET CURSOR_CLOSE_ON_COMMIT OFF 
;
ALTER DATABASE CMS SET CURSOR_DEFAULT  GLOBAL 
;
ALTER DATABASE CMS SET CONCAT_NULL_YIELDS_NULL OFF 
;
ALTER DATABASE CMS SET NUMERIC_ROUNDABORT OFF 
;
ALTER DATABASE CMS 
ALTER DATABASE CMS SET RECURSIVE_TRIGGERS OFF 
;
ALTER DATABASE CMS SET  DISABLE_BROKER 
;
ALTER DATABASE CMS SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
;
ALTER DATABASE CMS SET DATE_CORRELATION_OPTIMIZATION OFF 
;
ALTER DATABASE CMS SET TRUSTWORTHY OFF 
;
ALTER DATABASE CMS SET ALLOW_SNAPSHOT_ISOLATION OFF 
;
ALTER DATABASE CMS SET PARAMETERIZATION SIMPLE 
;
ALTER DATABASE CMS SET READ_COMMITTED_SNAPSHOT OFF 
;
ALTER DATABASE CMS SET HONOR_BROKER_PRIORITY OFF 
;
ALTER DATABASE CMS SET RECOVERY SIMPLE 
;
ALTER DATABASE CMS SET  MULTI_USER 
;
ALTER DATABASE CMS SET PAGE_VERIFY CHECKSUM  
;
ALTER DATABASE CMS SET DB_CHAINING OFF 
;
ALTER DATABASE CMS SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
;
ALTER DATABASE CMS SET TARGET_RECOVERY_TIME = 0 SECONDS 
;*/
/****** Object:  Table refStatus    Script Date: 17/06/2015 15:21:26 ******/



CREATE TABLE refStatus(
	StatusID bigint NOT NULL,
	Label varchar(50) NOT NULL,
 CONSTRAINT PK_refOrderStatus PRIMARY KEY 
(
	StatusID ASC
)
)

;

/****** Object:  Table relUserArticle    Script Date: 17/06/2015 15:21:26 ******/


CREATE TABLE relUserArticle(
	UserArticleID bigint AUTO_INCREMENT NOT NULL,
	ArticleID bigint NULL,
	UserID bigint NULL,
 CONSTRAINT PK_relUserArticle PRIMARY KEY 
(
	UserArticleID ASC
)
)

;
/****** Object:  Table tblArticle    Script Date: 17/06/2015 15:21:26 ******/



CREATE TABLE tblArticle(
	ArticleID bigint NOT NULL,
	CategoryID bigint NOT NULL,
	Price bigint NOT NULL,
	Label varchar(100) NOT NULL,
	Description text NOT NULL,
	IsOrdered bigint NOT NULL,
	IsOnSale tinyint NOT NULL,
	StatusID bigint NOT NULL,
 CONSTRAINT PK_tblArticle PRIMARY KEY 
(
	ArticleID ASC
)
)

;

/****** Object:  Table tblCategory    Script Date: 17/06/2015 15:21:26 ******/



CREATE TABLE tblCategory(
	CategoryID bigint NOT NULL,
	Label varchar(100) NULL,
 CONSTRAINT PK_tblCategory PRIMARY KEY 
(
	CategoryID ASC
)
)

;

/****** Object:  Table tblComment    Script Date: 17/06/2015 15:21:26 ******/


CREATE TABLE tblComment(
	CommentID bigint AUTO_INCREMENT NOT NULL,
	UserID bigint NOT NULL,
	Content text NULL,
 CONSTRAINT PK_tblComment PRIMARY KEY 
(
	CommentID ASC
)
)

;
/****** Object:  Table tblLineOrder    Script Date: 17/06/2015 15:21:26 ******/


CREATE TABLE tblLineOrder(
	LineOrderID bigint AUTO_INCREMENT NOT NULL,
	OrderID bigint NOT NULL,
	ArticleID bigint NOT NULL,
 CONSTRAINT PK_tblLineOrder PRIMARY KEY 
(
	LineOrderID ASC
)
)

;
/****** Object:  Table tblOrder    Script Date: 17/06/2015 15:21:26 ******/


CREATE TABLE tblOrder(
	OrderID bigint AUTO_INCREMENT NOT NULL,
	UserID bigint NOT NULL,
	StatusID bigint NOT NULL,
	OrderDate date NOT NULL,
 CONSTRAINT PK_tblOrder PRIMARY KEY 
(
	OrderID ASC
)
)

;
/****** Object:  Table tblStorage    Script Date: 17/06/2015 15:21:26 ******/


CREATE TABLE tblStorage(
	StorageID bigint AUTO_INCREMENT NOT NULL,
	ArticleID bigint NOT NULL,
	StorageCount bigint NOT NULL,
 CONSTRAINT PK_tblStorage PRIMARY KEY 
(
	StorageID ASC
)
)

;
/****** Object:  Table tblTag    Script Date: 17/06/2015 15:21:26 ******/



CREATE TABLE tblTag(
	TagID bigint AUTO_INCREMENT NOT NULL,
	Label varchar(50) NOT NULL,
 CONSTRAINT PK_tblTag PRIMARY KEY 
(
	TagID ASC
)
)

;

/****** Object:  Table tblUser    Script Date: 17/06/2015 15:21:26 ******/



CREATE TABLE tblUser(
	UserID bigint AUTO_INCREMENT NOT NULL,
	Password varchar(50) NOT NULL,
	Name varchar(50) NULL,
	Surname varchar(50) NULL,
	Adress varchar(50) NULL,
	PostalCode bigint NULL,
 CONSTRAINT PK_tblUser PRIMARY KEY 
(
	UserID ASC
)
)

;

ALTER TABLE relUserArticle  ADD  CONSTRAINT FOREIGN KEY (UserArticleID)
REFERENCES tblArticle (ArticleID)
;

ALTER TABLE relUserArticle  ADD  CONSTRAINT FOREIGN KEY (UserID)
REFERENCES tblUser (UserID)
;

ALTER TABLE tblArticle  ADD  CONSTRAINT FOREIGN KEY (StatusID)
REFERENCES refStatus (StatusID)
;
ALTER TABLE tblArticle  ADD  CONSTRAINT FOREIGN KEY (CategoryID)
REFERENCES tblCategory (CategoryID)
;

ALTER TABLE tblLineOrder  ADD  CONSTRAINT FOREIGN KEY (OrderID)
REFERENCES tblOrder (OrderID)
;

ALTER TABLE tblOrder  ADD  CONSTRAINT FOREIGN KEY (StatusID)
REFERENCES refStatus (StatusID)
;

ALTER TABLE tblOrder  ADD  CONSTRAINT FOREIGN KEY (OrderID)
REFERENCES tblUser (UserID)
;

ALTER TABLE tblStorage  ADD  CONSTRAINT FOREIGN KEY (ArticleID)
REFERENCES tblArticle (ArticleID)
;
/*
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Status of the order' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'refStatus'
;
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Articles by user' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'relUserArticle'
;
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'List of articles for users' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblArticle'
;
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'User comments' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblComment'
;
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Line order for order' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblLineOrder'
;
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Order by users' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblOrder'
;
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Articles storage' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStorage'
;
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tags for articles' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblTag'
;
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'User properties' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblUser'
;*/
/*ALTER DATABASE CMS SET  READ_WRITE 
;*/