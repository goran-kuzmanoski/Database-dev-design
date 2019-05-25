--Homework requirement 1/3

-- scalar variable
DECLARE @FirstName nvarchar(100)
set @FirstName = 'Antonio'

SELECT * 
FROM Student
WHERE FirstName = @FirstName
GO

-- table variable
DECLARE @StudentList TABLE 
(StidentId int, FirstName NVARCHAR(100), DateOfBirth date);

INSERT INTO @StudentList
SELECT Id, FirstName, DateOfBirth
FROM dbo.Student
WHERE Gender = 'F'

--SELECT * FROM @StudentList

SELECT * FROM @StudentList
WHERE DateOfBirth>'1992-02-02'

-- Temp table 
CREATE TABLE #StudentList 
(LastName NVARCHAR(100), EnrolledDate date);

INSERT INTO #StudentList
SELECT LastName, EnrolledDate 
FROM dbo.Student
WHERE Gender='M' AND FirstName like 'A%'

SELECT * 
FROM #StudentList
WHERE Len(LastName)=7

DROP TABLE #StudentList
GO

SELECT * 
FROM dbo.Teacher T
WHERE LEN(T.FirstName)<5
AND LEFT(T.FirstName,3)=LEFT(T.LastName,3)
GO

--Homework requirement 2/3

CREATE FUNCTION dbo.fn_FormatStudentName (@StudentID int)
RETURNS Nvarchar(100)
AS 
BEGIN
DECLARE @Output Nvarchar(100)

SELECT @Output=RIGHT(StudentCardNumber,5)+'-'+LEFT(FirstName,1)+'.'+LastName
FROM dbo.Student S
WHERE s.ID = @StudentID
RETURN @Output
END
GO

select dbo.fn_FormatStudentName(1)
GO

DROP FUNCTION  dbo.fn_FormatStudentName;
GO


--Homework requirement 3/3

CREATE FUNCTION dbo.fn_TeacherVsCourse (@TeacherID int,@CourseID int)
RETURNS @output TABLE (StudentFirstName nvarchar(100),StudentLastName nvarchar(100),Grade int, CreatedDate datetime)
AS
BEGIN

INSERT INTO @output
SELECT S.FirstName as StudentFirstName,S.LastName as StudentLastName, G.Grade as Grade,G.CreatedDate as CreatedDate
FROM dbo.[Grade] G
inner join dbo.Teacher T on G.TeacherID=T.ID
inner join dbo.Student S on G.StudentID=S.ID
WHERE T.ID = @TeacherID
and G.CourseID = @CourseID
RETURN 
END

GO

select * from dbo.fn_TeacherVsCourse (2,2)
GO