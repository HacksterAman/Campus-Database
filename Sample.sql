-- Disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;

INSERT INTO Campuses (CampusID, CampusName, Location) VALUES
    (1, 'Delhi University', 'Delhi'),
    (2, 'Mumbai University', 'Mumbai'),
    (3, 'Bangalore University', 'Bangalore');

-- Sample data for Branches
INSERT INTO Branches (BranchID, BranchName, CampusID) VALUES
    (1, 'Computer Science', 1),
    (2, 'Electronics Engineering', 1),
    (3, 'Mechanical Engineering', 2),
    (4, 'Civil Engineering', 3);

-- Sample data for Departments
INSERT INTO Departments (DeptID, DeptName, BranchID, HODID) VALUES
    (101, 'Computer Science Department', 1, 201),
    (102, 'Electronics Department', 2, 202),
    (103, 'Mechanical Department', 3, 203),
    (104, 'Civil Department', 4, 204);

-- Sample data for Faculty
INSERT INTO Faculty (FacultyID, FirstName, LastName, DateOfBirth, Gender, Email, ContactNumber, Address, DeptID) VALUES
    (201, 'Amit', 'Sharma', '1980-03-12', 'Male', 'amit.sharma@example.com', '+919876543210', 'Delhi', 101),
    (202, 'Priya', 'Patel', '1975-08-22', 'Female', 'priya.patel@example.com', '+919876543211', 'Mumbai', 102),
    (203, 'Rahul', 'Singh', '1982-05-06', 'Male', 'rahul.singh@example.com', '+919876543212', 'Bangalore', 103),
    (204, 'Anjali', 'Kaur', '1985-11-18', 'Female', 'anjali.kaur@example.com', '+919876543213', 'Delhi', 104);

-- Sample data for Subjects
INSERT INTO Subjects (SubjectID, SubjectName, Credits, DeptID) VALUES
    (1, 'Data Structures and Algorithms', 4, 101),
    (2, 'Digital Electronics', 3, 102),
    (3, 'Thermodynamics', 3, 103),
    (4, 'Structural Engineering', 4, 104);

-- Sample data for Students
INSERT INTO Students (StudentID, FirstName, LastName, DateOfBirth, Gender, Email, ContactNumber, Address, DeptID, AdvisorID) VALUES
     (1001, 'Ravi', 'Kumar', '2000-01-05', 'Male', 'ravi.kumar@example.com', '+919876543214', 'Delhi', 101, 201),
     (1002, 'Sneha', 'Patil', '2000-07-15', 'Female', 'sneha.patil@example.com', '+919876543215', 'Mumbai', 102, 202),
     (1003, 'Vikram', 'Singh', '2000-12-25', 'Male', 'vikram.singh@example.com', '+919876543216', 'Bangalore', 103, 203),
     (1004, 'Pooja', 'Shah', '2001-05-10', 'Female', 'pooja.shah@example.com', '+919876543217', 'Delhi', 104, 204);


-- Sample data for StudentEnrollment
INSERT INTO StudentEnrollment (EnrollmentID, StudentID, SubjectID, EnrollmentDate, Grade) VALUES
    (1, 1001, 1, '2023-09-01', 8.5),
    (2, 1002, 2, '2023-09-01', 7.9),
    (3, 1003, 3, '2023-09-01', 8.1),
    (4, 1004, 4, '2023-09-01', 7.6);

-- Sample data for FacultyTeachingAssignments
INSERT INTO FacultyTeachingAssignments (AssignmentID, FacultyID, SubjectID, AcademicYear) VALUES
    (1, 201, 1, '2023-2024'),
    (2, 202, 2, '2023-2024'),
    (3, 203, 3, '2023-2024'),
    (4, 204, 4, '2023-2024');

-- Sample data for StudentAttendance
INSERT INTO StudentAttendance (AttendanceID, StudentID, SubjectID, AttendanceDate, IsPresent) VALUES
    (1, 1001, 1, '2023-09-10', 1),
    (2, 1001, 1, '2023-09-12', 1),
    (3, 1001, 1, '2023-09-15', 0),
    (4, 1002, 2, '2023-09-10', 1),
    (5, 1002, 2, '2023-09-12', 1),
    (6, 1002, 2, '2023-09-15', 1),
    (7, 1003, 3, '2023-09-10', 1),
    (8, 1003, 3, '2023-09-12', 1),
    (9, 1003, 3, '2023-09-15', 1),
    (10, 1004, 4, '2023-09-10', 1),
    (11, 1004, 4, '2023-09-12', 1),
    (12, 1004, 4, '2023-09-15', 0);

-- Sample data for Exams
INSERT INTO Exams (ExamID, SubjectID, ExamDate, MaxMarks) VALUES
    (1, 1, '2024-01-10', 100),
    (2, 2, '2024-01-15', 100),
    (3, 3, '2024-01-20', 100),
    (4, 4, '2024-01-25', 100);

-- Sample data for StudentExamScores
INSERT INTO StudentExamScores (ScoreID, StudentID, ExamID, MarksObtained) VALUES
    (1, 1001, 1, 85),
    (2, 1001, 2, 80),
    (3, 1001, 3, 75),
    (4, 1002, 1, 75),
    (5, 1002, 2, 70),
    (6, 1002, 3, 85),
    (7, 1003, 1, 90),
    (8, 1003, 2, 85),
    (9, 1003, 3, 80),
    (10, 1004, 4, 90);

-- Sample data for LibraryResources
INSERT INTO LibraryResources (ResourceID, ResourceType, Title, Author, Publisher, PublishDate, Available, CampusID) VALUES
    (1, 'Book', 'Introduction to Algorithms', 'Thomas H. Cormen', 'MIT Press', '2009-07-31', 1, 1),
    (2, 'Journal', 'IEEE Transactions on Information Theory', NULL, 'IEEE', '2023-01-01', 1, 2),
    (3, 'Thesis', 'Data Mining Techniques', 'H. Gupta', NULL, '2021-05-15', 1, 3),
    (4, 'Magazine', 'National Geographic', NULL, 'National Geographic Society', '2023-02-01', 1, 1);

-- Sample data for LibraryLoans
INSERT INTO LibraryLoans (LoanID, StudentID, ResourceID, LoanDate, DueDate, ReturnDate) VALUES
    (1, 1001, 1, '2023-09-10', '2023-09-24', NULL),
    (2, 1002, 2, '2023-09-12', '2023-09-26', '2023-09-25'),
    (3, 1003, 3, '2023-09-15', '2023-09-29', NULL),
    (4, 1004, 4, '2023-09-18', '2023-10-02', NULL);

-- Sample data for Hostels
INSERT INTO Hostels (HostelID, HostelName, Location, CampusID) VALUES
    (1, 'North Hostel', 'Delhi', 1),
    (2, 'South Hostel', 'Mumbai', 2),
    (3, 'East Hostel', 'Bangalore', 3);

-- Sample data for HostelRooms
INSERT INTO HostelRooms (RoomID, HostelID, RoomNumber, Capacity, Occupancy) VALUES
    (1, 1, '101', 2, 2),
    (2, 1, '102', 2, 1),
    (3, 2, '201', 2, 1),
    (4, 2, '202', 2, 2),
    (5, 3, '301', 2, 1),
    (6, 3, '302', 2, 0);

-- Sample data for HostelResidents
INSERT INTO HostelResidents (ResidentID, StudentID, RoomID, CheckInDate) VALUES
    (1, 1001, 1, '2023-09-10'),
    (2, 1001, 2, '2023-09-10'),
    (3, 1002, 3, '2023-09-12'),
    (4, 1002, 4, '2023-09-12'),
    (5, 1003, 5, '2023-09-15');

-- Enable foreign key checks again
SET FOREIGN_KEY_CHECKS = 1;
