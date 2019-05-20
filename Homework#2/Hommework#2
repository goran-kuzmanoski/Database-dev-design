--Homework requirement 1/6

SELECT *
FROM Student
WHERE FirstName='Antonio'
GO

SELECT *
FROM Student
WHERE DateOfBirth>'1999.01.01'
GO

SELECT *
FROM Student
WHERE Gender='M'
GO

SELECT *
FROM Student
WHERE LastName LIKE 'T%'
GO

SELECT *
FROM Student
WHERE EnrolledDate>'1998.01.01' AND EnrolledDate<'1998.01.31'
GO

SELECT *
FROM Student
WHERE LastName LIKE 'J%' AND EnrolledDate>'1998.01.01' AND EnrolledDate<'1998.01.31'
GO
--Homework requirement 2/6

SELECT *
FROM Student
WHERE FirstName='Antonio'
ORDER BY LastName ASC
GO

SELECT *
FROM Student
ORDER BY FirstName ASC
GO

SELECT *
FROM Student
WHERE Gender='M'
ORDER BY EnrolledDate DESC
GO

--Homework requirement 3/6
SELECT FirstName
FROM Teacher
UNION ALL 
SELECT FirstName 
FROM Student
GO

SELECT LastName
FROM Teacher
UNION
SELECT LastName 
FROM Student
GO

SELECT FirstName
FROM Teacher
INTERSECT 
SELECT FirstName 
FROM Student
GO


--Homework requirement 4/6

ALTER TABLE dbo.GradeDetails
ADD CONSTRAINT DF_GradeDetails_AchievementMaxPoints
DEFAULT 100 FOR AchievementMaxPoints
GO

ALTER TABLE dbo.GradeDetails WITH CHECK
ADD CONSTRAINT CHK_GradeDetails_AchievementMaxPoints
CHECK (AchievementPoints<=AchievementMaxPoints)
GO

ALTER TABLE dbo.AchievementType 
ADD CONSTRAINT UC_AchievementType_Name UNIQUE (Name)
GO

--Homework requirement 5/6

ALTER TABLE [dbo].[Grade]  WITH CHECK 
ADD CONSTRAINT [FK_Grade_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([ID])
GO

ALTER TABLE [dbo].[Grade]  WITH CHECK 
ADD CONSTRAINT [FK_Grade_Teacher] FOREIGN KEY([TeacherID])
REFERENCES [dbo].[Teacher] ([ID])
GO

ALTER TABLE [dbo].[Grade]  WITH CHECK 
ADD CONSTRAINT [FK_Grade_Course] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([ID])
GO

ALTER TABLE [dbo].[GradeDetails]  WITH CHECK 
ADD CONSTRAINT [FK_GradeDetails_AchievementType] FOREIGN KEY([AchievementTypeID])
REFERENCES [dbo].[AchievementType] ([ID])
GO

ALTER TABLE [dbo].[GradeDetails]  WITH CHECK 
ADD CONSTRAINT [FK_GradeDetails_Grade] FOREIGN KEY([GradeID])
REFERENCES [dbo].[Grade] ([ID])
GO

--Homework requirement 6/6

select a.Name,B.Name 
from Course as A
Cross join AchievementType as B
ORDER BY A.ID,B.ID

select A.FirstName,B.Grade
from Teacher as A
INNER JOIN Grade as B
ON a.ID=b.TeacherID

select A.FirstName,B.Grade
from Teacher as A
LEFT JOIN Grade as B
ON a.ID=b.TeacherID
WHERE Grade IS NULL

select A.Grade,B.FirstName
from Grade as A
RIGHT JOIN Student as B
ON a.StudentID=b.ID
WHERE Grade IS NULL









