-- Create the database
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
    Credits INT
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
    AppliesToSemester INT,
    InstructorID INT,
    FOREIGN KEY (CourseCode) REFERENCES Courses(CourseCode),
    FOREIGN KEY (InstructorID) REFERENCES Instructors(InstructorID)
);

-- Current Courses Table

CREATE TABLE CurrentCourses (
    CurrentCourseID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT,
    OfferingCode INT,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (OfferingCode) REFERENCES CourseOfferings(OfferingCode)
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
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseCode) REFERENCES Courses(CourseCode)
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
('DBA527198', 'Database Design and Implementation', 4),
('PRO650000', 'Enterprise Application Development', 3),
('PROG10000', 'Introduction to Programming', 4),
('PROG30000', 'Mobile Programming', 3),
('PRO680000', 'Advanced Enterprise Apps', 4),
('DSC10000', 'Introduction to Data Science', 4),
('AI500000', 'Machine Learning Fundamentals', 4),
('PROG10008', 'Java Programming 1', 3),
('PROG10009', 'Java Programming 2', 3),
('SYS131313', 'Operating System Linux', 4),
('SYS133333', 'Operating System Unix', 4);

-- Insert Data into Instructors
INSERT INTO Instructors VALUES 
(12121212, 'Timothy', 'Pham', '9055553344', '9055558866', 'tim.pham@sheridancollege.ca', 'MIS'),
(22332211, 'Mary', 'Smith', '9054515543', '9052327765', 'mary.smith@sheridancollege.ca', 'AC'),
(33445566, 'John', 'Taylor', '6475557890', '6475550987', 'john.taylor@sheridancollege.ca', 'MIS'),
(44556677, 'Alice', 'Johnson', '5195551234', '5195555678', 'alice.johnson@sheridancollege.ca', 'DS'),
(55667788, 'Bob', 'Williams', '4165554321', '4165558765', 'bob.williams@sheridancollege.ca', 'DS');

-- Insert Data into Course Offerings
INSERT INTO CourseOfferings VALUES
(10001, 'DBA527198', 'F 2024', 1, 12121212),
(10002, 'PRO650000', 'W 2024', 2, 22332211),
(10003, 'PROG10000', 'F 2024', 1, 33445566),
(10004, 'PROG30000', 'W 2024', 2, 33445566),
(10005, 'DSC10000', 'F 2024', 1, 44556677),
(10006, 'AI500000', 'W 2024', 2, 55667788),
(10007, 'PRO680000', 'F 2024', 2, 55667788),
(10008, 'SYS131313', 'F 2024', 1, 22332211),
(10009, 'SYS133333', 'F 2024', 2, 22332211);

-- Insert Data into Current Courses
INSERT INTO CurrentCourses (StudentID, OfferingCode) VALUES 
(991234567, 10001),
(991234567, 10003);


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

-- XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX


-- Student Dashboard
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



-- Current Courses
SELECT
    co.CourseCode,
    c.CourseName
FROM 
    CurrentCourses cc 
JOIN 
    CourseOfferings co ON cc.OfferingCode = co.OfferingCode
JOIN 
    Courses c ON co.CourseCode = c.CourseCode
WHERE 
    cc.StudentID = 991234567;




-- Academic History
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
SELECT 
    c.CourseCode, 
    c.CourseName,
    IFNULL(GROUP_CONCAT(p.PrerequisiteCourseCode), 'No Prerequisite') AS Prerequisites
FROM 
    Courses c
LEFT JOIN 
    Prerequisites p ON c.CourseCode = p.CourseCode
INNER JOIN 
    CourseOfferings co ON c.CourseCode = co.CourseCode
INNER JOIN 
    ProgramCourses pc ON c.CourseCode = pc.CourseCode
INNER JOIN 
    Students s ON s.ProgramCode = pc.ProgramCode
WHERE 
    co.Term = 'F 2024'
    AND co.AppliesToSemester = s.Semester
    AND s.StudentID = 991234567
    AND co.OfferingCode NOT IN (
        SELECT cc.OfferingCode
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
SELECT
    p.ProgramCode,
    p.ProgramName,
    COUNT(s.StudentID) AS Enrollment
FROM
    Programs p
LEFT JOIN
    Students s ON p.ProgramCode = s.ProgramCode
GROUP BY
    p.ProgramCode;
    
    
    
    
    
-- Students
SELECT StudentID, LastName, FirstName, HomePhone, CellPhone, Email, s.ProgramCode, p.ProgramName 
FROM students s JOIN programs p 
ON s.ProgramCode=p.ProgramCode;




-- Courses
SELECT CourseCode, CourseName FROM courses;





-- Instructors
SELECT InstructorID, LastName, FirstName, HomePhone, CellPhone, Email, i.DepartmentCode, DepartmentName
FROM instructors i JOIN departments d on i.DepartmentCode = d.DepartmentCode;





-- Course Offerings
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
    CurrentCourses cc ON co.OfferingCode = cc.OfferingCode
GROUP BY 
    co.OfferingCode, co.CourseCode, c.CourseName, co.Term, co.InstructorID, i.FirstName, i.LastName
ORDER BY 
    co.OfferingCode;
