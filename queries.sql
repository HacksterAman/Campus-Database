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

-- Create a view to retrieve student report card details along with related information
CREATE VIEW StudentReportCardDetails AS
SELECT 
    Students.StudentID,
    CONCAT(Students.FirstName, ' ', Students.LastName) AS StudentName,
    Subjects.SubjectName,
    ReportCards.MarksObtained,
    ReportCards.Grade,
    ReportCards.IsPass,
    ReportCards.Remarks,
    Departments.DeptName AS Department,
    Branches.BranchName AS Branch,
    Faculty.FirstName AS FacultyFirstName,
    Faculty.LastName AS FacultyLastName
FROM 
    ReportCards
INNER JOIN Students ON ReportCards.StudentID = Students.StudentID
INNER JOIN Subjects ON ReportCards.SubjectID = Subjects.SubjectID
INNER JOIN Departments ON Subjects.DeptID = Departments.DeptID
INNER JOIN Branches ON Departments.BranchID = Branches.BranchID
INNER JOIN Faculty ON Departments.HODID = Faculty.FacultyID;

-- Query the view to retrieve student report card details
SELECT * FROM StudentReportCardDetails;

