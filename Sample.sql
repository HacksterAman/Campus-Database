
-- Insert into Campuses
INSERT INTO Campuses (CampusID, CampusName, Location) VALUES
(1, 'IIT Bombay', 'Mumbai'),
(2, 'IIT Delhi', 'New Delhi'),
(3, 'IIT Madras', 'Chennai'),
(4, 'IIT Kanpur', 'Kanpur'),
(5, 'IIT Kharagpur', 'Kharagpur');

-- Insert into Branches
INSERT INTO Branches (BranchID, BranchName, CampusID) VALUES
(1, 'Engineering', 1),
(2, 'Humanities', 2),
(3, 'Science', 3),
(4, 'Management', 4),
(5, 'Design', 5);

-- Insert into Faculty
-- Note: DeptID will be updated later once Departments are inserted
INSERT INTO Faculty (FacultyID, FirstName, LastName, DateOfBirth, Gender, Email, ContactNumber, Address) VALUES
(1, 'Rajesh', 'Kumar', '1975-08-15', 'Male', 'rajesh.kumar@example.com', '9876543210', 'Mumbai'),
(2, 'Sunita', 'Gupta', '1980-02-20', 'Female', 'sunita.gupta@example.com', '9876501234', 'New Delhi'),
(3, 'Amit', 'Singh', '1978-06-25', 'Male', 'amit.singh@example.com', '9876547890', 'Chennai'),
(4, 'Priya', 'Malik', '1982-03-15', 'Female', 'priya.malik@example.com', '9876545678', 'Kanpur'),
(5, 'Suresh', 'Patel', '1979-12-05', 'Male', 'suresh.patel@example.com', '9876543456', 'Kharagpur');

-- Insert into Departments
-- Note: HODID will be updated later
INSERT INTO Departments (DeptID, DeptName, BranchID) VALUES
(1, 'Computer Science and Engineering', 1),
(2, 'English Literature', 2),
(3, 'Physics', 3),
(4, 'Business Administration', 4),
(5, 'Industrial Design', 5);

-- Update Faculty with DeptID
UPDATE Faculty SET DeptID = 1 WHERE FacultyID = 1;
UPDATE Faculty SET DeptID = 2 WHERE FacultyID = 2;
UPDATE Faculty SET DeptID = 3 WHERE FacultyID = 3;
UPDATE Faculty SET DeptID = 4 WHERE FacultyID = 4;
UPDATE Faculty SET DeptID = 5 WHERE FacultyID = 5;

-- Update Departments with HODID
UPDATE Departments SET HODID = 1 WHERE DeptID = 1;
UPDATE Departments SET HODID = 2 WHERE DeptID = 2;
UPDATE Departments SET HODID = 3 WHERE DeptID = 3;
UPDATE Departments SET HODID = 4 WHERE DeptID = 4;
UPDATE Departments SET HODID = 5 WHERE DeptID = 5;

-- Insert into Courses
INSERT INTO Courses (CourseID, CourseCode, CourseName, Credits, DeptID) VALUES
(1, 'CS101', 'Introduction to Computer Science', 4, 1),
(2, 'ENG101', 'Introduction to English Literature', 4, 2),
(3, 'PHY101', 'Introduction to Physics', 4, 3),
(4, 'MGT101', 'Principles of Management', 4, 4),
(5, 'DSN101', 'Basics of Design', 4, 5);

-- Insert into Subjects
INSERT INTO Subjects (SubjectID, SubjectName, CourseID) VALUES
(1, 'Programming Fundamentals', 1),
(2, 'British Poetry', 2),
(3, 'Quantum Mechanics', 3),
(4, 'Organizational Behavior', 4),
(5, 'Design Thinking', 5),
(6, 'American Literature', 2),
(7, 'World Literature', 2),
(8, 'Literary Theory', 2),
(9, 'Quantum Mechanics', 3),
(10, 'Classical Mechanics', 3),
(11, 'Electrodynamics', 3),
(12, 'Statistical Mechanics', 3),
(13, 'Organizational Behavior', 4),
(14, 'Marketing Management', 4),
(15, 'Financial Management', 4),
(16, 'Human Resource Management', 4),
(17, 'Design Thinking', 5),
(18, 'Graphic Design', 5),
(19, 'User Experience Design', 5),
(20, 'Product Design', 5);

-- Insert into Students
INSERT INTO Students (StudentID, FirstName, LastName, DateOfBirth, Gender, Email, ContactNumber, Address, DeptID, AdvisorID) VALUES
(1, 'Ananya', 'Sharma', '2000-07-23', 'Female', 'ananya.sharma@example.com', '9988776655', 'Mumbai', 1, 1),
(2, 'Vikram', 'Singh', '1999-11-30', 'Male', 'vikram.singh@example.com', '9966332211', 'New Delhi', 2, 2),
(3, 'Meena', 'Roy', '2001-03-12', 'Female', 'meena.roy@example.com', '9955667788', 'Chennai', 3, 3),
(4, 'Rohan', 'Gupta', '1998-09-17', 'Male', 'rohan.gupta@example.com', '9944221133', 'Kanpur', 4, 4),
(5, 'Pooja', 'Kumar', '1997-12-25', 'Female', 'pooja.kumar@example.com', '9933445566', 'Kharagpur', 5, 5);

-- Insert into StudentEnrollment
-- Inserting into StudentEnrollment, ensuring every student is enrolled in 5 different courses
INSERT INTO StudentEnrollment (EnrollmentID, StudentID, CourseID, EnrollmentDate, Grade) VALUES
(11, 1, 1, '2023-01-01', 92),
(12, 1, 2, '2023-01-02', 89),
(13, 1, 3, '2023-01-03', 85),
(14, 1, 4, '2023-01-04', 87),
(15, 1, 5, '2023-01-05', 90),
(16, 2, 1, '2023-01-01', 88),
(17, 2, 2, '2023-01-02', 91),
(18, 2, 3, '2023-01-03', 93),
(19, 2, 4, '2023-01-04', 86),
(20, 2, 5, '2023-01-05', 88),

(21, 3, 1, '2023-01-01', 90),
(22, 3, 2, '2023-01-02', 92),
(23, 3, 3, '2023-01-03', 94),
(24, 3, 4, '2023-01-04', 89),
(25, 3, 5, '2023-01-05', 91),

(26, 4, 1, '2023-01-01', 87),
(27, 4, 2, '2023-01-02', 85),
(28, 4, 3, '2023-01-03', 88),
(29, 4, 4, '2023-01-04', 90),
(30, 4, 5, '2023-01-05', 93),

(31, 5, 1, '2023-01-01', 89),
(32, 5, 2, '2023-01-02', 92),
(33, 5, 3, '2023-01-03', 95),
(34, 5, 4, '2023-01-04', 87),
(35, 5, 5, '2023-01-05', 90);


-- Insert into FacultyTeachingAssignments
INSERT INTO FacultyTeachingAssignments (AssignmentID, FacultyID, CourseID, AcademicYear) VALUES
(1, 1, 1, '2022-2023'),
(2, 2, 2, '2022-2023'),
(3, 3, 3, '2022-2023'),
(4, 4, 4, '2022-2023'),
(5, 5, 5, '2022-2023');

-- Insert into StudentAttendance
INSERT INTO StudentAttendance (AttendanceID, StudentID, CourseID, AttendanceDate, IsPresent) VALUES
(1, 1, 1, '2022-08-01', TRUE),
(2, 2, 2, '2022-08-01', TRUE),
(3, 3, 3, '2022-08-02', TRUE),
(4, 4, 4, '2022-08-03', TRUE),
(5, 5, 5, '2022-08-04', TRUE);

-- Insert into Exams
INSERT INTO Exams (ExamID, CourseID, ExamDate, MaxMarks) VALUES
(1, 1, '2022-12-15', 100),
(2, 2, '2022-12-16', 100),
(3, 3, '2022-12-17', 100),
(4, 4, '2022-12-18', 100),
(5, 5, '2022-12-19', 100);

-- Insert into StudentExamScores
INSERT INTO StudentExamScores (ScoreID, StudentID, ExamID, MarksObtained) VALUES
(1, 1, 1, 78),
(2, 2, 2, 82),
(3, 3, 3, 89),
(4, 4, 4, 85),
(5, 5, 5, 80);

-- Insert into LibraryResources
INSERT INTO LibraryResources (ResourceID, ResourceType, Title, Author, Publisher, PublishDate, Available, CampusID) VALUES
(1, 'Book', 'Introduction to Algorithms', 'Thomas H. Cormen', 'MIT Press', '2009-07-31', TRUE, 1),
(2, 'Journal', 'Modern English Review', 'Various', 'University Press', '2020-01-01', TRUE, 2),
(3, 'Book', 'Concepts of Physics', 'H.C. Verma', 'Bharti Bhawan', '1992-01-01', TRUE, 3),
(4, 'Book', 'Management Theory', 'Stephen P. Robbins', 'Pearson', '2015-05-01', TRUE, 4),
(5, 'Journal', 'Design Studies', 'Various', 'Elsevier', '2018-11-01', TRUE, 5);

-- Insert into LibraryLoans
INSERT INTO LibraryLoans (LoanID, StudentID, ResourceID, LoanDate, DueDate, ReturnDate) VALUES
(1, 1, 1, '2022-09-01', '2022-10-01', NULL),
(2, 2, 2, '2022-09-02', '2022-10-02', NULL),
(3, 3, 3, '2022-09-03', '2022-10-03', NULL),
(4, 4, 4, '2022-09-04', '2022-10-04', NULL),
(5, 5, 5, '2022-09-05', '2022-10-05', NULL);

-- Inserting into Hostels
INSERT INTO Hostels (HostelID, HostelName, Location, CampusID) VALUES
(1, 'Ganga Hostel', 'Mumbai', 1),
(2, 'Yamuna Hostel', 'New Delhi', 2),
(3, 'Saraswati Hostel', 'Chennai', 3),
(4, 'Narmada Hostel', 'Kanpur', 4),
(5, 'Kaveri Hostel', 'Kharagpur', 5);

-- Inserting into HostelRooms
INSERT INTO HostelRooms (RoomID, HostelID, RoomNumber, Capacity, Occupancy) VALUES
(1, 1, '101', 2, 1),
(2, 2, '102', 2, 2),
(3, 3, '201', 3, 1),
(4, 4, '202', 3, 2),
(5, 5, '301', 2, 2);

-- Inserting into HostelResidents
INSERT INTO HostelResidents (ResidentID, StudentID, RoomID, CheckInDate) VALUES
(1, 1, 1, '2022-07-15'),
(2, 2, 2, '2022-07-16'),
(3, 3, 3, '2022-07-17'),
(4, 4, 4, '2022-07-18'),
(5, 5, 5, '2022-07-19');
