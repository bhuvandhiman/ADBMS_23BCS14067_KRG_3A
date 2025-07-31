CREATE TABLE Department (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(100)
);

-- Create Course Table

CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES Department(DeptID)
);

-- Insert Departments
INSERT INTO Department VALUES
(1, 'Computer Science'),
(2, 'Physics'),
(3, 'Mathematics'),
(4, 'Chemistry'),
(5, 'Biology');

-- Insert Course
INSERT INTO Course VALUES
(101, 'Data Structures', 1),
(102, 'Operating Systems', 1),
(103, 'Quantum Mechanics', 3),
(104, 'Electromagnetism', 2),
(105, 'Linear Algebra', 3),
(106, 'Calculus', 3),
(107, 'Organic Chemistry', 4),
(108, 'Physical Chemistry', 4),
(109, 'Genetics', 5),
(110, 'Molecular Biology', 5);

SELECT DeptName
FROM Department
WHERE DeptID IN (

SELECT DeptID 
FROM COURSE
GROUP BY DeptID
HAVING COUNT(*) > 2
)
CREATE LOGIN BHUVAN
WITH PASSWORD = 'Bhuvan';
USE EMPLOYEES;
CREATE USER Bhuvan FOR LOGIN BHUVAN;
GRANT SELECT ON Course TO BHUVAN;
