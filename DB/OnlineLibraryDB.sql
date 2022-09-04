-- CREATE DATABASE

CREATE DATABASE OnlineLibraryDB
GO

USE OnlineLibraryDB
GO

CREATE TABLE tblMasterAuthor
(
    Author_ID NVARCHAR(10) PRIMARY KEY NOT NULL,
    Author_Name NVARCHAR(50) NOT NULL
)
GO

CREATE TABLE tblMasterBook
(
    Book_ID NVARCHAR(10) PRIMARY KEY NOT NULL,
    Book_Name NVARCHAR(MAX) NOT NULL,
    Book_Genre NVARCHAR(MAX),
    Book_Author NVARCHAR(MAX),
    Book_Publisher NVARCHAR(MAX),
    Publish_Date NVARCHAR(50),
    Book_Language NVARCHAR(20),
    Book_Edition NVARCHAR(50),
    Book_Cost NVARCHAR(50),
    Book_Pages NVARCHAR(50),
    Book_Description NVARCHAR(MAX),
    Actual_Stock NVARCHAR(50),
    Current_Stock NVARCHAR(50),
    Book_Img_Link NVARCHAR(100)
)
GO

CREATE TABLE tblMasterMember
(
    Full_Name NVARCHAR(50),
    Member_DOB NVARCHAR(50),
    Member_Contact NVARCHAR(50),
    Member_Email NVARCHAR(50),
    Member_District NVARCHAR(50),
    Member_City NVARCHAR(50),
    Member_Postalcode NVARCHAR(50),
    Member_Address NVARCHAR(MAX),
    Member_ID NVARCHAR(10) PRIMARY KEY NOT NULL,
    Member_Password NVARCHAR(20),
    Account_Status NVARCHAR(20)
)
GO



SELECT * FROM tblMasterMember
GO

CREATE TABLE tblMasterPublisher
(
    Publisher_ID NVARCHAR(10) PRIMARY KEY NOT NULL,
    Publisher_Name NVARCHAR(50) NOT NULL
)
GO

CREATE TABLE tblBookIssue
(
    Member_ID NVARCHAR(50),
    Member_Name NVARCHAR(50),
    Book_ID NVARCHAR(50),
    Book_Name NVARCHAR(MAX),
    Issue_Date NUMERIC(18, 0),
    Return_Date NVARCHAR(50),
)
GO

CREATE TABLE tblAdminLogin
(
   Admin_Username NVARCHAR(10) PRIMARY KEY NOT NULL,
   Admin_PassWord NVARCHAR(20),
   Admin_Fullname NVARCHAR(50)
)
GO


INSERT INTO tblAdminLogin
VALUES('Admin', '123456', 'Mainul Hasan')
GO

SELECT * FROM tblAdminLogin
GO