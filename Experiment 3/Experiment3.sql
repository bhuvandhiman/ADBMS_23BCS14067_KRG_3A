------- EASY LEVEL PROBLEM ---------

CREATE TABLE EMPLOYEE(
EMP_ID INT
);

INSERT INTO EMPLOYEE
VALUES
(2),
(4),
(4),
(6),
(7),
(8),
(8),
(8);


SELECT MAX(EMP_ID) FROM EMPLOYEES WHERE EMP_ID 
NOT IN
(SELECT EMP_ID FROM EMPLOYEE 
GROUP BY EMP_ID
HAVING COUNT(EMP_ID) > 1 )--4,6,8



-------- MEDIUM LEVEL PROBLEM --------

-- Create Department Table
CREATE TABLE department_new (
    id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);


-- Create Employee Table

CREATE TABLE employee_new (
    id INT,
    name VARCHAR(50),
    salary INT,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES department_new(id)
);

-- Insert into Department Table
INSERT INTO department_new (id, dept_name) VALUES
(1, 'IT'),
(2, 'SALES');

-- Insert into Employee Table
INSERT INTO employee_new (id, name , salary, department_id) VALUES
(1, 'JOE', 70000, 1),
(2, 'JIM', 90000, 1),
(3, 'HENRY', 80000, 2),
(4, 'SAM', 60000, 2),
(5, 'MAX', 90000, 1);

-- CO RELATED SUB QUERY

SELECT D.DEPT_NAME,E.NAME, E.SALARY 
FROM Employee_new as E
INNER JOIN 
Department_new as D
ON E.department_id=D.id
WHERE E.SALARY IN   
(   
    SELECT MAX(SALARY)
    FROM employee_new
    WHERE department_id = E.department_id   
)
ORDER BY D.dept_name;

-------- HARD --------

CREATE TABLE A(
EMPID INT,
ENAME VARCHAR(20),
Salary INT
);

CREATE TABLE B(
EMPID INT,
ENAME VARCHAR(20),
Salary INT
);

INSERT INTO A
VALUES 
(1,'AA', 1000),
(2, 'BB', 300);

INSERT INTO B
VALUES 
(2,'BB', 400),
(3, 'CC', 100);



SELECT * FROM A
UNION ALL     
SELECT * FROM B
WHERE SALARY IN
(SELECT MIN(SALARY) FROM B);