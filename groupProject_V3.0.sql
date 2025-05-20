-- Create the database
DROP DATABASE IF EXISTS group_project;
CREATE DATABASE group_project;
USE group_project;

-- Departments Table
CREATE TABLE Departments (
    DepartmentCode VARCHAR(10) PRIMARY KEY,
    DepartmentName VARCHAR(50) UNIQUE
);

-- Programs Table
CREATE TABLE Programs (
    ProgramCode VARCHAR(10) PRIMARY KEY,
    ProgramName VARCHAR(50),
    ProgramDuration INT,
    DepartmentCode VARCHAR(10),
    FOREIGN KEY (DepartmentCode) REFERENCES Departments(DepartmentCode)
);

-- Courses Table
CREATE TABLE Courses (
    CourseCode VARCHAR(10) PRIMARY KEY,
    CourseName VARCHAR(100),
    Credits INT,
    Semester INT 
);

-- Students Table
CREATE TABLE Students (
    StudentID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    HomePhone VARCHAR(15),
    CellPhone VARCHAR(15),
    Email VARCHAR(100),
    Semester INT,
    EnrollmentDate DATE,
    DateOfBirth DATE,
    ProgramCode VARCHAR(10),
    FOREIGN KEY (ProgramCode) REFERENCES Programs(ProgramCode)
);

-- Instructors Table
CREATE TABLE Instructors (
    InstructorID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    HomePhone VARCHAR(15),
    CellPhone VARCHAR(15),
    Email VARCHAR(100),
    DepartmentCode VARCHAR(10),
    FOREIGN KEY (DepartmentCode) REFERENCES Departments(DepartmentCode)
);

-- Course Offerings Table
CREATE TABLE CourseOfferings (
    OfferingCode INT PRIMARY KEY,
    CourseCode VARCHAR(10),
    Term VARCHAR(10),
    InstructorID INT,
    FOREIGN KEY (CourseCode) REFERENCES Courses(CourseCode),
    FOREIGN KEY (InstructorID) REFERENCES Instructors(InstructorID)
);

-- Current Courses Table
CREATE TABLE CurrentCourses (
    CurrentCourseID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT,
    CourseCode VARCHAR(10),
    CourseName VARCHAR(100),
    Term VARCHAR(10),
    Grade VARCHAR(2),
    CreditsEarned INT,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseCode) REFERENCES Courses(CourseCode)
);

-- Academic History Table
CREATE TABLE AcademicHistory (
    HistoryID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT,
    CourseCode VARCHAR(10),
    CourseName VARCHAR(100),
    Term VARCHAR(10),
    Grade VARCHAR(2),
    CreditsEarned INT,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);

-- Prerequisites Table
CREATE TABLE Prerequisites (
    CourseCode VARCHAR(10),
    PrerequisiteCourseCode VARCHAR(10),
    PRIMARY KEY (CourseCode, PrerequisiteCourseCode),
    FOREIGN KEY (CourseCode) REFERENCES Courses(CourseCode),
    FOREIGN KEY (PrerequisiteCourseCode) REFERENCES Courses(CourseCode)
);

-- Program Courses Table
CREATE TABLE ProgramCourses (
    ProgramCode VARCHAR(10),
    CourseCode VARCHAR(10),
    PRIMARY KEY (ProgramCode, CourseCode),
    FOREIGN KEY (ProgramCode) REFERENCES Programs(ProgramCode),
    FOREIGN KEY (CourseCode) REFERENCES Courses(CourseCode)
);


-- XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
-- Inserting Sample Data



-- Insert Data into Departments
INSERT INTO Departments VALUES 
('MIS', 'Management Information Systems'),
('AC', 'Applied Computing'),
('DS', 'Data Science and AI');

-- Insert Data into Programs
INSERT INTO Programs VALUES 
('SA', 'System Analyst', 6, 'MIS'),
('CP', 'Computer Programmer', 4, 'AC'),
('EDM', 'Enterprise Database Management', 6, 'DS'),
('DS', 'Data Science', 8, 'DS'),
('AI', 'Artificial Intelligence', 8, 'AC');

-- Insert Data into Students
INSERT INTO Students (StudentID, FirstName, LastName, HomePhone, CellPhone, Email, Semester, EnrollmentDate, DateOfBirth, ProgramCode) VALUES 
(991234567, 'Timothy', 'Jones', '9055551456', '9055551457', 'tim.jones@sheridancollege.ca', 2, '2023-09-01', '2003-04-15', 'SA'),
(991234568, 'Mary', 'Green', '3054511212', '9052321212', 'mary.green@sheridancollege.ca', 1, '2024-01-01', '2004-06-21', 'CP'),
(991234569, 'John', 'Doe', '4165551234', '4165555678', 'john.doe@sheridancollege.ca', 3, '2022-09-01', '2002-10-03', 'EDM'),
(991234570, 'Alice', 'Brown', '6475557890', '6475550987', 'alice.brown@sheridancollege.ca', 4, '2022-09-01', '2002-11-11', 'DS'),
(991234571, 'Bob', 'Smith', '5195554321', '5195558765', 'bob.smith@sheridancollege.ca', 2, '2023-09-01', '2003-05-18', 'AI'),
(991234572, 'Faisal', 'Sameem', '9909932323', '1231231234', 'faisal.abc@abc.com.ca', 2, '2023-09-01', '2003-02-27', 'AI');

-- Insert Data into Courses
INSERT INTO Courses VALUES 
('DBA527198', 'Database Design and Implementation', 4, 1),
('PRO650000', 'Enterprise Application Development', 3, 2),
('PROG10000', 'Introduction to Programming', 4, 1),
('PROG30000', 'Mobile Programming', 3, 2),
('PRO680000', 'Advanced Enterprise Apps', 4, 2),
('DSC10000', 'Introduction to Data Science', 4, 1),
('AI500000', 'Machine Learning Fundamentals', 4, 2),
('PROG10008', 'Java Programming 1', 3, 1),
('PROG10009', 'Java Programming 2', 3, 2),
('SYS131313', 'Operating System Linux', 4, 1),
('SYS133333', 'Operating System Unix', 4, 2);

-- Insert Data into Instructors
INSERT INTO Instructors VALUES 
(12121212, 'Timothy', 'Pham', '9055553344', '9055558866', 'tim.pham@sheridancollege.ca', 'MIS'),
(22332211, 'Mary', 'Smith', '9054515543', '9052327765', 'mary.smith@sheridancollege.ca', 'AC'),
(33445566, 'John', 'Taylor', '6475557890', '6475550987', 'john.taylor@sheridancollege.ca', 'MIS'),
(44556677, 'Alice', 'Johnson', '5195551234', '5195555678', 'alice.johnson@sheridancollege.ca', 'DS'),
(55667788, 'Bob', 'Williams', '4165554321', '4165558765', 'bob.williams@sheridancollege.ca', 'DS');

-- Insert Data into Course Offerings
INSERT INTO CourseOfferings VALUES
(10001, 'DBA527198', 'F 2024', 12121212),
(10002, 'PRO650000', 'W 2024', 22332211),
(10003, 'PROG10000', 'F 2024', 33445566),
(10004, 'PROG30000', 'W 2024', 33445566),
(10005, 'DSC10000', 'F 2024', 44556677),
(10006, 'AI500000', 'W 2024', 55667788),
(10007, 'PRO680000', 'W 2024', 55667788),
(10008, 'SYS131313', 'S 2024', 22332211),
(10009, 'SYS133333', 'W 2024', 22332211);

-- Insert Data into Current Courses
INSERT INTO CurrentCourses (StudentID, CourseCode, CourseName, Term, Grade, CreditsEarned) VALUES 
(991234567, 'DBA527198', 'Database Design and Implementation', 'F 2024', NULL, 4),
(991234567, 'PROG10000', 'Introduction to Programming', 'F 2024', NULL, 4);

-- Insert Data into Academic History
INSERT INTO AcademicHistory (StudentID, CourseCode, CourseName, Term, Grade, CreditsEarned) VALUES 
(991234567, 'PRO650000', 'Enterprise Application Development', 'W 2024', 'B+', 3),
(991234568, 'PROG10000', 'Introduction to Programming', 'F 2024', 'A+', 4),
(991234568, 'PROG30000', 'Mobile Programming', 'W 2024', 'B', 3),
(991234569, 'DBA527198', 'Database Design and Implementation', 'F 2024', 'B', 4),
(991234570, 'DSC10000', 'Introduction to Data Science', 'F 2024', 'A', 4),
(991234571, 'AI500000', 'Machine Learning Fundamentals', 'W 2024', 'A+', 4),
(991234567, 'PROG10008', 'Java Programming 1', 'S 2024', 'A+', 3),
(991234567, 'PROG10009', 'Java Programming 2', 'S 2024', 'B', 3);

-- Insert Data into Prerequisites
INSERT INTO Prerequisites VALUES 
('PRO680000', 'PRO650000'),
('PRO650000', 'DBA527198'),
('AI500000', 'DSC10000');

-- Insert Data into Program Courses
INSERT INTO ProgramCourses VALUES 
('SA', 'DSC10000'),
('SA', 'PRO680000'),
('SA', 'SYS133333');



-- XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX Queries And Views XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

-- Student Dashboard

CREATE VIEW StudentDashboard AS
SELECT 
    StudentID AS StudentNumber,
    CONCAT(FirstName, ' ', LastName) AS FullName,
    Email,
    HomePhone AS HomePhoneNumber,
    CellPhone AS CellPhoneNumber
FROM 
    Students
WHERE 
    StudentID = 991234567;
    
    
-- Current courses
CREATE VIEW CurrentCoursesView AS
SELECT
    CourseCode,
    CourseName
FROM 
    CurrentCourses
WHERE 
    StudentID = 991234567;
    
    
-- Academic History
CREATE VIEW AcademicHistoryView AS
SELECT
    CourseCode,
    CourseName,
    Term,
    Grade
FROM 
    AcademicHistory
WHERE 
    StudentID = 991234567;



-- Add Course
CREATE VIEW AddCourseView AS
SELECT 
    c.CourseCode, 
    c.CourseName,
    co.Term,
    IFNULL(GROUP_CONCAT(p.PrerequisiteCourseCode), 'No Prerequisite') AS Prerequisites
FROM 
    Courses c
LEFT JOIN 
    Prerequisites p ON c.CourseCode = p.CourseCode
INNER JOIN 
    ProgramCourses pc ON c.CourseCode = pc.CourseCode
INNER JOIN 
    Students s ON s.ProgramCode = pc.ProgramCode
INNER JOIN 
    CourseOfferings co ON c.CourseCode = co.CourseCode
WHERE 
    s.StudentID = 991234567
    AND co.Term = 'W 2024'
    AND c.Semester = s.Semester
    AND c.CourseCode NOT IN (
        SELECT cc.CourseCode
        FROM CurrentCourses cc
        WHERE cc.StudentID = 991234567
    )
    AND NOT EXISTS (
        SELECT 1
        FROM Prerequisites pr
        LEFT JOIN AcademicHistory ah ON pr.PrerequisiteCourseCode = ah.CourseCode
        WHERE pr.CourseCode = c.CourseCode
        AND (ah.StudentID IS NULL OR ah.Grade IN ('F', 'D') OR ah.Grade IS NULL)
        AND ah.StudentID = 991234567
    )
GROUP BY 
    c.CourseCode, c.CourseName;






-- Programs
CREATE VIEW ProgramsView AS
SELECT 
    p.ProgramCode,
    p.ProgramName,
    COUNT(s.StudentID) AS Enrollment
FROM
    Programs p
        LEFT JOIN
    Students s ON p.ProgramCode = s.ProgramCode
GROUP BY p.ProgramCode;
    
    
    
-- Students
CREATE VIEW StudentsView AS
SELECT 
    StudentID, 
    LastName, 
    FirstName, 
    HomePhone, 
    CellPhone, 
    Email, 
    s.ProgramCode, 
    p.ProgramName 
FROM 
    Students s 
JOIN 
    Programs p ON s.ProgramCode = p.ProgramCode;



-- Courses
CREATE VIEW CoursesView AS
SELECT 
    CourseCode, 
    CourseName
FROM 
    Courses;


-- Instructors
CREATE VIEW InstructorsView AS
SELECT 
    InstructorID, 
    LastName, 
    FirstName, 
    HomePhone, 
    CellPhone, 
    Email, 
    i.DepartmentCode, 
    DepartmentName
FROM 
    Instructors i 
JOIN 
    Departments d ON i.DepartmentCode = d.DepartmentCode;
    
    

-- Course Offerings
CREATE VIEW CourseOfferingsView AS
SELECT 
    co.OfferingCode, 
    co.CourseCode, 
    c.CourseName, 
    co.Term, 
    co.InstructorID, 
    CONCAT(i.FirstName, ' ', i.LastName) AS InstructorName, 
    COUNT(cc.StudentID) AS Enrollment
FROM 
    CourseOfferings co
INNER JOIN 
    Courses c ON co.CourseCode = c.CourseCode
INNER JOIN 
    Instructors i ON co.InstructorID = i.InstructorID
LEFT JOIN 
    CurrentCourses cc ON co.CourseCode = cc.CourseCode
GROUP BY 
    co.OfferingCode, co.CourseCode, c.CourseName, co.Term, co.InstructorID, i.FirstName, i.LastName
ORDER BY 
    co.OfferingCode;
    
    
    
-- =================================== Create Indexes ====================================================

-- Indexes for Departments Table
CREATE INDEX idx_departments_departmentname ON Departments(DepartmentName);

-- Indexes for Programs Table
CREATE INDEX idx_programs_departmentcode ON Programs(DepartmentCode);

-- Indexes for Courses Table
CREATE INDEX idx_courses_coursecode ON Courses(CourseCode);
CREATE INDEX idx_courses_semester ON Courses(Semester);

-- Indexes for Students Table
CREATE INDEX idx_students_programcode ON Students(ProgramCode);
CREATE INDEX idx_students_email ON Students(Email);
CREATE INDEX idx_students_semester ON Students(Semester);

-- Indexes for Instructors Table
CREATE INDEX idx_instructors_departmentcode ON Instructors(DepartmentCode);
CREATE INDEX idx_instructors_email ON Instructors(Email);

-- Indexes for CourseOfferings Table
CREATE INDEX idx_courseofferings_coursecode ON CourseOfferings(CourseCode);
CREATE INDEX idx_courseofferings_term ON CourseOfferings(Term);
CREATE INDEX idx_courseofferings_instructorid ON CourseOfferings(InstructorID);
CREATE INDEX idx_courseofferings_coursecode_term ON CourseOfferings(CourseCode, Term);

-- Indexes for CurrentCourses Table
CREATE INDEX idx_currentcourses_studentid ON CurrentCourses(StudentID);
CREATE INDEX idx_currentcourses_coursecode ON CurrentCourses(CourseCode);

-- Indexes for AcademicHistory Table
CREATE INDEX idx_academichistory_studentid ON AcademicHistory(StudentID);
CREATE INDEX idx_academichistory_coursecode ON AcademicHistory(CourseCode);
CREATE INDEX idx_academichistory_term ON AcademicHistory(Term);

-- Indexes for Prerequisites Table
CREATE INDEX idx_prerequisites_coursecode ON Prerequisites(CourseCode);
CREATE INDEX idx_prerequisites_prerequisitecoursecode ON Prerequisites(PrerequisiteCourseCode);
CREATE INDEX idx_prerequisites_course_prereq ON Prerequisites(CourseCode, PrerequisiteCourseCode);

-- Indexes for ProgramCourses Table
CREATE INDEX idx_programcourses_programcode ON ProgramCourses(ProgramCode);
CREATE INDEX idx_programcourses_coursecode ON ProgramCourses(CourseCode);

-- Composite Indexes for Query Optimization
CREATE INDEX idx_students_programcode_semester ON Students(ProgramCode, Semester); -- For AddCourseView query
CREATE INDEX idx_courses_coursecode_semester ON Courses(CourseCode, Semester);     -- For AddCourseView query
CREATE INDEX idx_currentcourses_studentid_coursecode ON CurrentCourses(StudentID, CourseCode); -- For AddCourseView query
CREATE INDEX idx_academichistory_studentid_coursecode_grade ON AcademicHistory(StudentID, CourseCode, Grade); -- For AddCourseView query






