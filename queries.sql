-- DDL

-- Create a new table to store student report card
CREATE TABLE ReportCards (
    ReportCardID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT,
    SubjectID INT,
    MarksObtained INT,
    Grade VARCHAR(2),
    IsPass BOOLEAN,
    Remarks TEXT,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (SubjectID) REFERENCES Subjects(SubjectID)
);

-- DML

-- Insert student report card data
INSERT INTO ReportCards (StudentID, SubjectID, MarksObtained, Grade, IsPass, Remarks)
VALUES
    -- Ravi Kumar's report card data
    (1001, 1, 85, NULL, NULL, NULL), -- Data Structures and Algorithms
    (1001, 2, 78, NULL, NULL, NULL), -- Digital Electronics
    (1001, 3, 92, NULL, NULL, NULL), -- Thermodynamics
    (1001, 4, 88, NULL, NULL, NULL), -- Structural Engineering

    -- Sneha Patil's report card data
    (1002, 1, 70, NULL, NULL, NULL), -- Data Structures and Algorithms
    (1002, 2, 82, NULL, NULL, NULL), -- Digital Electronics
    (1002, 3, 75, NULL, NULL, NULL), -- Thermodynamics
    (1002, 4, 80, NULL, NULL, NULL); -- Structural Engineering

-- DCL

-- Grant SELECT, INSERT, UPDATE permission on ReportCards table to a new user 'report_user'
GRANT SELECT, INSERT, UPDATE ON ReportCards TO 'root'@'localhost';

-- TCL

-- Start a transaction
START TRANSACTION;

-- Update student marks and grades in the report card based on a grading system
UPDATE ReportCards SET 
    Grade = CASE
                WHEN MarksObtained >= 90 THEN 'A'
                WHEN MarksObtained >= 80 THEN 'B'
                WHEN MarksObtained >= 70 THEN 'C'
                WHEN MarksObtained >= 60 THEN 'D'
                ELSE 'F'
            END,
    IsPass = CASE
                WHEN MarksObtained >= 60 THEN TRUE
                ELSE FALSE
            END,
    Remarks = CASE
                WHEN MarksObtained >= 90 THEN 'Excellent performance!'
                WHEN MarksObtained >= 80 THEN 'Very good!'
                WHEN MarksObtained >= 70 THEN 'Good effort!'
                WHEN MarksObtained >= 60 THEN 'Passable, but needs improvement.'
                ELSE 'Needs significant improvement.'
            END;

-- Insert a new record into the report card for a student
INSERT INTO ReportCards (StudentID, SubjectID, MarksObtained)
VALUES (1003, 2, 95);

-- Commit the transaction
COMMIT;

-- DQL

-- Create a view to display student details, subjects with marks, faculty, grades, and total marks
CREATE VIEW StudentReportCardDetails AS
SELECT 
    Students.StudentID,
    CONCAT(Students.FirstName, ' ', Students.LastName) AS StudentName,
    Departments.DeptName AS Department,
    Branches.BranchName AS Branch,
    Faculty.FirstName AS FacultyFirstName,
    Faculty.LastName AS FacultyLastName,
    -- Calculate total marks for each student
    (SELECT SUM(MarksObtained) FROM ReportCards WHERE StudentID = Students.StudentID) AS TotalMarks,
    -- Calculate average marks for each student
    (SELECT AVG(MarksObtained) FROM ReportCards WHERE StudentID = Students.StudentID) AS AverageMarks,
    -- Calculate CGPA for each student (assuming a grading system)
    CASE 
        WHEN (SELECT AVG(MarksObtained) FROM ReportCards WHERE StudentID = Students.StudentID) >= 90 THEN 'A'
        WHEN (SELECT AVG(MarksObtained) FROM ReportCards WHERE StudentID = Students.StudentID) >= 80 THEN 'B'
        WHEN (SELECT AVG(MarksObtained) FROM ReportCards WHERE StudentID = Students.StudentID) >= 70 THEN 'C'
        WHEN (SELECT AVG(MarksObtained) FROM ReportCards WHERE StudentID = Students.StudentID) >= 60 THEN 'D'
        ELSE 'F'
    END AS CGPA
FROM 
    Students
INNER JOIN Departments ON Students.DeptID = Departments.DeptID
INNER JOIN Branches ON Departments.BranchID = Branches.BranchID
INNER JOIN Faculty ON Departments.HODID = Faculty.FacultyID;

-- Query the view to retrieve student report card details
SELECT 
    StudentID,
    StudentName,
    Department,
    Branch,
    concat(FacultyFirstName, ' ', FacultyLastName) AS 'Faculty Name',
    TotalMarks,
    AverageMarks,
    CGPA
FROM 
    StudentReportCardDetails;
    
    
DELIMITER $$
CREATE PROCEDURE CalculateStudentReportCard()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE student_id INT;
    DECLARE total_marks INT;
    DECLARE average_marks DECIMAL(5, 2);
    DECLARE cgpa CHAR(1);
    
    -- Declare cursor to select each student
    DECLARE cur CURSOR FOR
        SELECT StudentID FROM Students;
    
    -- Declare continue handler to exit loop
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    -- Create temporary table to store results
    CREATE TEMPORARY TABLE IF NOT EXISTS TempStudentReportCard (
        StudentID INT,
        TotalMarks INT,
        AverageMarks DECIMAL(5, 2),
        CGPA CHAR(1)
    );
    
    -- Open cursor
    OPEN cur;
    
    read_loop: LOOP
        -- Fetch student ID
        FETCH cur INTO student_id;
        IF done THEN
            LEAVE read_loop;
        END IF;
        
        -- Calculate total marks
        SELECT SUM(MarksObtained) INTO total_marks FROM ReportCards WHERE StudentID = student_id;
        
        -- Calculate average marks
        SELECT AVG(MarksObtained) INTO average_marks FROM ReportCards WHERE StudentID = student_id;
        
        -- Calculate CGPA
        SET cgpa = CASE
            WHEN average_marks >= 90 THEN 'A'
            WHEN average_marks >= 80 THEN 'B'
            WHEN average_marks >= 70 THEN 'C'
            WHEN average_marks >= 60 THEN 'D'
            ELSE 'F'
        END;
        
        -- Insert into temporary table
        INSERT INTO TempStudentReportCard (StudentID, TotalMarks, AverageMarks, CGPA) VALUES (student_id, total_marks, average_marks, cgpa);
    END LOOP;
    
    -- Close cursor
    CLOSE cur;
    
    -- Select results from temporary table
    SELECT 
        Students.StudentID,
        CONCAT(Students.FirstName, ' ', Students.LastName) AS StudentName,
        Departments.DeptName AS Department,
        Branches.BranchName AS Branch,
        CONCAT(Faculty.FirstName, ' ', Faculty.LastName) AS FacultyName,
        TempStudentReportCard.TotalMarks,
        TempStudentReportCard.AverageMarks,
        TempStudentReportCard.CGPA
    FROM 
        Students
    INNER JOIN Departments ON Students.DeptID = Departments.DeptID
    INNER JOIN Branches ON Departments.BranchID = Branches.BranchID
    INNER JOIN Faculty ON Departments.HODID = Faculty.FacultyID
    INNER JOIN TempStudentReportCard ON Students.StudentID = TempStudentReportCard.StudentID;
    
    -- Drop temporary table
    DROP TEMPORARY TABLE IF EXISTS TempStudentReportCard;
END$$

DELIMITER ;




