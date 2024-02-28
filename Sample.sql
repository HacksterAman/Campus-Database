-- Insert into Campuses
INSERT INTO Campuses (CampusID, CampusName, Location) VALUES
(1, 'IIT Bombay', 'Mumbai'),
(2, 'IIT Delhi', 'New Delhi');

-- Insert into Branches
INSERT INTO Branches (BranchID, BranchName, CampusID) VALUES
(1, 'Engineering', 1),
(2, 'Humanities', 2);

-- Insert into Faculty
-- Note: DeptID will be updated later once Departments are inserted
INSERT INTO Faculty (FacultyID, FirstName, LastName, DateOfBirth, Gender, Email, ContactNumber, Address) VALUES
(1, 'Rajesh', 'Kumar', '1975-08-15', 'Male', 'rajesh.kumar@example.com', '9876543210', 'Mumbai'),
(2, 'Sunita', 'Gupta', '1980-02-20', 'Female', 'sunita.gupta@example.com', '9876501234', 'New Delhi');

-- Insert into Departments
-- Note: HODID will be updated later
INSERT INTO Departments (DeptID, DeptName, BranchID) VALUES
(1, 'Computer Science and Engineering', 1),
(2, 'English Literature', 2);

-- Update Faculty with DeptID
UPDATE Faculty SET DeptID = 1 WHERE FacultyID = 1;
UPDATE Faculty SET DeptID = 2 WHERE FacultyID = 2;

-- Update Departments with HODID
UPDATE Departments SET HODID = 1 WHERE DeptID = 1;
UPDATE Departments SET HODID = 2 WHERE DeptID = 2;

-- Insert into Courses
INSERT INTO Courses (CourseID, CourseCode, CourseName, Credits, DeptID) VALUES
(1, 'CS101', 'Introduction to Computer Science', 4, 1),
(2, 'ENG101', 'Introduction to English Literature', 4, 2);

-- Insert into Subjects
INSERT INTO Subjects (SubjectID, SubjectName, CourseID) VALUES
(1, 'Programming Fundamentals', 1),
(2, 'British Poetry', 2);

-- Insert into Students
INSERT INTO Students (StudentID, FirstName, LastName, DateOfBirth, Gender, Email, ContactNumber, Address, DeptID, AdvisorID) VALUES
(1, 'Ananya', 'Sharma', '2000-07-23', 'Female', 'ananya.sharma@example.com', '9988776655', 'Mumbai', 1, 1),
(2, 'Vikram', 'Singh', '1999-11-30', 'Male', 'vikram.singh@example.com', '9966332211', 'New Delhi', 2, 2);

-- Insert into StudentEnrollment
INSERT INTO StudentEnrollment (EnrollmentID, StudentID, CourseID, EnrollmentDate, Grade) VALUES
(1, 1, 1, '2022-07-01', 85.50),
(2, 2, 2, '2022-07-01', 88.00);

-- Insert into FacultyTeachingAssignments
INSERT INTO FacultyTeachingAssignments (AssignmentID, FacultyID, CourseID, AcademicYear) VALUES
(1, 1, 1, '2022-2023'),
(2, 2, 2, '2022-2023');

-- Insert into StudentAttendance
INSERT INTO StudentAttendance (AttendanceID, StudentID, CourseID, AttendanceDate, IsPresent) VALUES
(1, 1, 1, '2022-08-01', TRUE),
(2, 2, 2, '2022-08-01', TRUE);

-- Insert into Exams
INSERT INTO Exams (ExamID, CourseID, ExamDate, MaxMarks) VALUES
(1, 1, '2022-12-15', 100),
(2, 2, '2022-12-16', 100);

-- Insert into StudentExamScores
INSERT INTO StudentExamScores (ScoreID, StudentID, ExamID, MarksObtained) VALUES
(1, 1, 1, 78),
(2, 2, 2, 82);

-- Insert into LibraryResources
INSERT INTO LibraryResources (ResourceID, ResourceType, Title, Author, Publisher, PublishDate, Available, CampusID) VALUES
(1, 'Book', 'Introduction to Algorithms', 'Thomas H. Cormen', 'MIT Press', '2009-07-31', TRUE, 1),
(2, 'Journal', 'Modern English Review', 'Various', 'University Press', '2020-01-01', TRUE, 2);

-- Insert into LibraryLoans
INSERT INTO LibraryLoans (LoanID, StudentID, ResourceID, LoanDate, DueDate, ReturnDate) VALUES
(1, 1, 1, '2022-09-01', '2022-10-01', NULL),
(2, 2, 2, '2022-09-02', '2022-10-02', NULL);

-- Inserting into Hostels
INSERT INTO Hostels (HostelID, HostelName, Location, CampusID) VALUES
(1, 'Ganga Hostel', 'Mumbai', 1),
(2, 'Yamuna Hostel', 'New Delhi', 2);

-- Inserting into HostelRooms
INSERT INTO HostelRooms (RoomID, HostelID, RoomNumber, Capacity, Occupancy) VALUES
(1, 1, '101', 2, 0),
(2, 1, '102', 2, 1),
(3, 2, '201', 3, 2),
(4, 2, '202', 3, 3);

-- Inserting into HostelResidents
INSERT INTO HostelResidents (ResidentID, StudentID, RoomID, CheckInDate) VALUES
(1, 1, 1, '2022-07-15'),
(2, 2, 3, '2022-07-16');