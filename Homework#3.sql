--Homework requirement 1/4

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
WHERE Len(LastName)>5

DROP TABLE #StudentList
GO

--Homework requirement 2/4

SELECT COUNT(Grade) as Total
FROM dbo.[Grade]
GO

SELECT TeacherID, COUNT(Grade) as Total
FROM dbo.[Grade]
GROUP BY TeacherID 
GO

SELECT TeacherID, COUNT(Grade) as Total
FROM dbo.[Grade]
GROUP BY TeacherID 
HAVING COUNT(ID) > 100
GO

SELECT StudentID, Max(Grade) as MaxGrade, AVG(Grade) as AverageGrade
FROM dbo.[Grade]
GROUP BY StudentID
GO

--Homework requirement 3/4

SELECT TeacherID, COUNT(Grade) as Total
FROM dbo.[Grade]
GROUP BY TeacherID 
HAVING COUNT(Grade)>200
GO

SELECT TeacherID, COUNT(Grade) as Total
FROM dbo.[Grade]
GROUP BY TeacherID 
HAVING COUNT(ID) > 100 AND COUNT(Grade)>50
GO

SELECT StudentID,COUNT(Grade) as GradeCount, Max(Grade) as MaxGrade, AVG(Grade) as AverageGrade
FROM dbo.[Grade]
GROUP BY StudentID
HAVING Max(Grade)=AVG(Grade)
GO

SELECT StudentID,b.FirstName,b.LastName,COUNT(Grade) as GradeCount, Max(Grade) as MaxGrade, AVG(Grade) as AverageGrade
FROM dbo.[Grade] A
INNER JOIN dbo.[Student] b on b.ID=A.StudentID
GROUP BY StudentID,b.FirstName,b.LastName
HAVING Max(Grade)=AVG(Grade)
GO

--Homework requirement 4/4


CREATE VIEW vv_StudentGrades
AS
select StudentID,COUNT(Grade) as GradePerStudent
from dbo.[Grade] 
group by StudentID
GO

ALTER VIEW vv_StudentGrades
AS
select B.FirstName as StudentName,B.LastName as StudentLastName,COUNT(Grade) as GradePerStudent
from dbo.[Grade] A
inner join dbo.Student B on B.ID = A.StudentID
group by B.FirstName,B.LastName
GO

SELECT *
FROM vv_StudentGrades
ORDER BY GradePerStudent DESC
GO


 CREATE VIEW vv_StudentGradeDetails
AS
SELECT StudentID,COUNT(CourseID) as CourseCount
from dbo.[Grade] 
group by StudentID
GO

ALTER VIEW vv_StudentGradeDetails
AS
select B.FirstName as StudentName,B.LastName as StudentLastName,COUNT(CourseID) as CourseCount
from dbo.[Grade] A
inner join dbo.Student B on B.ID = A.StudentID
group by B.FirstName,B.LastName
GO

SELECT *
FROM vv_StudentGradeDetails

