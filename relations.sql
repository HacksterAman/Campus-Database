-- Faculty table
ALTER TABLE Faculty ADD FOREIGN KEY (DeptID) REFERENCES Departments(DeptID);

-- Branches table
ALTER TABLE Branches ADD FOREIGN KEY (CampusID) REFERENCES Campuses(CampusID);

-- Departments table
ALTER TABLE Departments ADD FOREIGN KEY (BranchID) REFERENCES Branches(BranchID);
ALTER TABLE Departments ADD FOREIGN KEY (HODID) REFERENCES Faculty(FacultyID);

-- Subjects table
ALTER TABLE Subjects ADD FOREIGN KEY (DeptID) REFERENCES Departments(DeptID);

-- Students table
ALTER TABLE Students ADD FOREIGN KEY (DeptID) REFERENCES Departments(DeptID);
ALTER TABLE Students ADD FOREIGN KEY (AdvisorID) REFERENCES Faculty(FacultyID);

-- StudentEnrollment table
ALTER TABLE StudentEnrollment ADD FOREIGN KEY (StudentID) REFERENCES Students(StudentID);
ALTER TABLE StudentEnrollment ADD FOREIGN KEY (SubjectID) REFERENCES Subjects(SubjectID);

-- FacultyTeachingAssignments table
ALTER TABLE FacultyTeachingAssignments ADD FOREIGN KEY (FacultyID) REFERENCES Faculty(FacultyID);
ALTER TABLE FacultyTeachingAssignments ADD FOREIGN KEY (SubjectID) REFERENCES Subjects(SubjectID);

-- StudentAttendance table
ALTER TABLE StudentAttendance ADD FOREIGN KEY (StudentID) REFERENCES Students(StudentID);
ALTER TABLE StudentAttendance ADD FOREIGN KEY (SubjectID) REFERENCES Subjects(SubjectID);

-- Exams table
ALTER TABLE Exams ADD FOREIGN KEY (SubjectID) REFERENCES Subjects(SubjectID);

-- StudentExamScores table
ALTER TABLE StudentExamScores ADD FOREIGN KEY (StudentID) REFERENCES Students(StudentID);
ALTER TABLE StudentExamScores ADD FOREIGN KEY (ExamID) REFERENCES Exams(ExamID);

-- LibraryResources table
ALTER TABLE LibraryResources ADD FOREIGN KEY (CampusID) REFERENCES Campuses(CampusID);

-- LibraryLoans table
ALTER TABLE LibraryLoans ADD FOREIGN KEY (StudentID) REFERENCES Students(StudentID);
ALTER TABLE LibraryLoans ADD FOREIGN KEY (ResourceID) REFERENCES LibraryResources(ResourceID);

-- Hostels table
ALTER TABLE Hostels ADD FOREIGN KEY (CampusID) REFERENCES Campuses(CampusID);

-- HostelRooms table
ALTER TABLE HostelRooms ADD FOREIGN KEY (HostelID) REFERENCES Hostels(HostelID);

-- HostelResidents table
ALTER TABLE HostelResidents ADD FOREIGN KEY (StudentID) REFERENCES Students(StudentID);
ALTER TABLE HostelResidents ADD FOREIGN KEY (RoomID) REFERENCES HostelRooms(RoomID);
