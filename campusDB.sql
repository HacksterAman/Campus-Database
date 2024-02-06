-- Table for campuses
CREATE TABLE Campuses (
    CampusID INT PRIMARY KEY,
    CampusName VARCHAR(100) NOT NULL,
    Location VARCHAR(100) NOT NULL
);

-- Table for branches
CREATE TABLE Branches (
    BranchID INT PRIMARY KEY,
    BranchName VARCHAR(100) NOT NULL,
    CampusID INT,
    FOREIGN KEY (CampusID) REFERENCES Campuses(CampusID)
);

-- Table for departments
CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(100) NOT NULL,
    BranchID INT,
    HODID INT,
    FOREIGN KEY (BranchID) REFERENCES Branches(BranchID),
    FOREIGN KEY (HODID) REFERENCES Faculty(FacultyID)
);

-- Table for courses
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseCode VARCHAR(20) NOT NULL,
    CourseName VARCHAR(200) NOT NULL,
    Credits INT NOT NULL,
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
);

-- Table for subjects
CREATE TABLE Subjects (
    SubjectID INT PRIMARY KEY,
    SubjectName VARCHAR(200) NOT NULL,
    CourseID INT,
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

-- Table for students
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DateOfBirth DATE,
    Gender ENUM('Male', 'Female', 'Other'),
    Email VARCHAR(100) UNIQUE,
    ContactNumber VARCHAR(20),
    Address VARCHAR(255),
    DeptID INT,
    AdvisorID INT,
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID),
    FOREIGN KEY (AdvisorID) REFERENCES Faculty(FacultyID)
);

-- Table for faculty
CREATE TABLE Faculty (
    FacultyID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DateOfBirth DATE,
    Gender ENUM('Male', 'Female', 'Other'),
    Email VARCHAR(100) UNIQUE,
    ContactNumber VARCHAR(20),
    Address VARCHAR(255),
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
);

-- Table for student enrollment
CREATE TABLE StudentEnrollment (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE,
    Grade DECIMAL(4,2),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

-- Table for faculty teaching assignments
CREATE TABLE FacultyTeachingAssignments (
    AssignmentID INT PRIMARY KEY,
    FacultyID INT,
    CourseID INT,
    AcademicYear VARCHAR(10),
    FOREIGN KEY (FacultyID) REFERENCES Faculty(FacultyID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

-- Table for student attendance
CREATE TABLE StudentAttendance (
    AttendanceID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    AttendanceDate DATE,
    IsPresent BOOLEAN,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

-- Table for exams
CREATE TABLE Exams (
    ExamID INT PRIMARY KEY,
    CourseID INT,
    ExamDate DATE,
    MaxMarks INT,
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

-- Table for student exam scores
CREATE TABLE StudentExamScores (
    ScoreID INT PRIMARY KEY,
    StudentID INT,
    ExamID INT,
    MarksObtained INT,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (ExamID) REFERENCES Exams(ExamID)
);

-- Table for library resources
CREATE TABLE LibraryResources (
    ResourceID INT PRIMARY KEY,
    ResourceType ENUM('Book', 'Journal', 'Thesis', 'Magazine', 'Other'),
    Title VARCHAR(200) NOT NULL,
    Author VARCHAR(100),
    Publisher VARCHAR(100),
    PublishDate DATE,
    Available BOOLEAN,
    CampusID INT,
    FOREIGN KEY (CampusID) REFERENCES Campuses(CampusID)
);

-- Table for library loans
CREATE TABLE LibraryLoans (
    LoanID INT PRIMARY KEY,
    StudentID INT,
    ResourceID INT,
    LoanDate DATE,
    DueDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (ResourceID) REFERENCES LibraryResources(ResourceID)
);

-- Table for hostel information
CREATE TABLE Hostels (
    HostelID INT PRIMARY KEY,
    HostelName VARCHAR(100) NOT NULL,
    Location VARCHAR(100) NOT NULL,
    CampusID INT,
    FOREIGN KEY (CampusID) REFERENCES Campuses(CampusID)
);

-- Table for hostel rooms
CREATE TABLE HostelRooms (
    RoomID INT PRIMARY KEY,
    HostelID INT,
    RoomNumber VARCHAR(20) NOT NULL,
    Capacity INT,
    Occupancy INT DEFAULT 0,
    FOREIGN KEY (HostelID) REFERENCES Hostels(HostelID)
);

-- Table for hostel residents
CREATE TABLE HostelResidents (
    ResidentID INT PRIMARY KEY,
    StudentID INT,
    RoomID INT,
    CheckInDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (RoomID) REFERENCES HostelRooms(RoomID)
);
