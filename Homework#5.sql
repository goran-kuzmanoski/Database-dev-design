/*
Create new procedure called CreateGrade
Procedure should create only Grade header info (not Grade Details) 
Procedure should return the total number of grades in the system for the Student on input (from the CreateGrade)
Procedure should return second resultset with the MAX Grade of all grades for the Student and Teacher on input (regardless the Course)
*/

CREATE PROCEDURE dbo.CreateGrade (@StudentID INT,@CourseID SMALLINT,@TeacherID SMALLINT,@Grade TINYINT)

AS
BEGIN
	
	DECLARE @CreatedDate datetime
	SELECT @CreatedDate = GETDATE() 


	INSERT INTO dbo.Grade(StudentID,CourseID,TeacherID,Grade,CreatedDate)
	VALUES (@StudentID,@CourseID,@TeacherID,@Grade,@CreatedDate)

	
	select count(*) as TotalGradesPerStudent
	FROM dbo.Grade G
	WHERE StudentID = @StudentID

	SELECT MAX(G.Grade) as MaxGrade
	FROM dbo.Grade G
	WHERE StudentID = @StudentID
	and TeacherID = @TeacherID

END
GO

-- test execution
EXEC dbo.CreateGrade @StudentID=7,@CourseID=5,@TeacherID=2,@Grade=9
GO

--delete procedure
DROP PROCEDURE  dbo.CreateGrade 
GO


-- Second part
--------------
/*
Create new procedure called CreateGradeDetail
Procedure should add details for specific Grade (new record for new AchievementTypeID, Points, MaxPoints, Date for specific Grade)
Output from this procedure should be resultset with SUM of GradePoints calculated with formula AchievementPoints/AchievementMaxPoints*ParticipationRate for specific Grade
*/

CREATE PROCEDURE dbo.CreateGradeDetail (@GradeID int,@AchievementTypeID tinyint, @AchievementPoints tinyint, @AchievementMaxPoints tinyint)
AS
BEGIN
	DECLARE @AchievementDate datetime
	SELECT @AchievementDate = GETDATE() 

INSERT INTO dbo.GradeDetails (GradeID, AchievementTypeID, AchievementPoints, AchievementMaxPoints,AchievementDate)
VALUES (@GradeID,@AchievementTypeID, @AchievementPoints, @AchievementMaxPoints,@AchievementDate)

-- output
	SELECT GD.GradeID,SUM(AchievementPoints/AchievementMaxPoints*ATy.ParticipationRate) as GradePoints
	FROM dbo.GradeDetails GD
	INNER JOIN dbo.AchievementType as ATy on ATy.ID=GD.AchievementTypeID
	GROUP BY GD.GradeID

END
GO


-- test execution
exec dbo.CreateGradeDetail @GradeID=0,@AchievementTypeID=5, @AchievementPoints=70, @AchievementMaxPoints=50
GO

ALTER PROCEDURE dbo.CreateGradeDetail (@GradeID int,@AchievementTypeID tinyint, @AchievementPoints tinyint, @AchievementMaxPoints tinyint)
AS
BEGIN
	DECLARE @AchievementDate datetime
	SELECT @AchievementDate = GETDATE() 
BEGIN TRY
	INSERT INTO dbo.GradeDetails (GradeID, AchievementTypeID, AchievementPoints, AchievementMaxPoints,AchievementDate)
	VALUES (@GradeID,@AchievementTypeID, @AchievementPoints, @AchievementMaxPoints,@AchievementDate)
END TRY
BEGIN CATCH  
SELECT  
    ERROR_NUMBER() AS ErrorNumber  
    ,ERROR_SEVERITY() AS ErrorSeverity  
    ,ERROR_STATE() AS ErrorState  
    ,ERROR_PROCEDURE() AS ErrorProcedure  
    ,ERROR_LINE() AS ErrorLine  
    ,ERROR_MESSAGE() AS ErrorMessage;  
END CATCH;  
-- output
	SELECT GD.GradeID,SUM(AchievementPoints/AchievementMaxPoints*ATy.ParticipationRate) as GradePoints
	FROM dbo.GradeDetails GD
	INNER JOIN dbo.AchievementType as ATy on ATy.ID=GD.AchievementTypeID
	GROUP BY GD.GradeID

END
GO

exec dbo.CreateGradeDetail @GradeID=0,@AchievementTypeID=5, @AchievementPoints=70, @AchievementMaxPoints=50
GO