-- CREATE DATABASE

CREATE DATABASE LibraryManagementDB
GO


USE LibraryManagementDB
GO

CREATE TABLE tblBookAuthor
(
    Author_ID NVARCHAR(10) PRIMARY KEY NOT NULL,
    Author_Name NVARCHAR(50) NOT NULL
)
GO

SELECT * FROM tblBookAuthor
GO

CREATE TABLE tblBookPublisher
(
    Publisher_ID NVARCHAR(10) PRIMARY KEY NOT NULL,
    Publisher_Name NVARCHAR(50) NOT NULL
)
GO

SELECT * FROM tblBookPublisher
GO

CREATE TABLE tblBookCategory
(
    Category_ID INT PRIMARY KEY NOT NULL,
    Category_Name NVARCHAR(50) NOT NULL
)
GO

INSERT INTO tblBookCategory VALUES
(1,'C#.NET'),
(2, 'Java')
GO

SELECT * FROM tblBookCategory
GO

CREATE TABLE tblBookDetails
(
    Book_ID NVARCHAR(10) PRIMARY KEY NOT NULL, 
    Book_Name NVARCHAR(MAX) NOT NULL, -- 1
    Category_Name NVARCHAR(MAX), --2
    Book_Author NVARCHAR(MAX), -- 3
    Book_Publisher NVARCHAR(MAX), -- 4
    Publish_Date NVARCHAR(50), -- 5
    Book_Language NVARCHAR(20), -- 6
    Book_Edition NVARCHAR(50), -- 7
    Book_Cost NVARCHAR(50), -- 8
    Book_Pages NVARCHAR(50), -- 9
    Book_Description NVARCHAR(MAX), --10
    Actual_Stock NVARCHAR(50), -- 11
    Current_Stock NVARCHAR(50), -- 12
    Book_Img NVARCHAR(MAX) --13
)
GO




SELECT * FROM tblBookDetails

DELETE FROM tblBookDetails WHERE Book_Name = 'Learn C# in One Day and Learn It Well: C# for Beginners'
GO

CREATE TABLE tblLibraryMember
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

SELECT * FROM tblLibraryMember
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