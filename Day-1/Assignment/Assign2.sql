SHOW DATABASES;
USE ASSIGN1;
SHOW TABLES;
CREATE TABLE EMPLOYEE (EmpID INT NOT NULL, EmpFname VARCHAR(255), EmpLname VARCHAR(255),
 Department VARCHAR(255), Project VARCHAR(5), Address VARCHAR(255), DOB DATE,
 Gender VARCHAR(1), Salary INT, PRIMARY KEY (EmpID));
 SELECT * FROM EMPLOYEE;
 INSERT INTO EMPLOYEE VALUES (1, "Sanjay", "Mehra", "HR", "P1", "Hyderabad (HYD)", 01/12/1976, "M", 50000);
 INSERT INTO EMPLOYEE VALUES (2, "Ananya", "Mishra", "Admin", "P2", "Delhi (DEL)", 02/05/1968, "F", 75000);
 INSERT INTO EMPLOYEE VALUES (3, "Rohan", "Diwan", "Account", "P1", "Mumbai (BOM)", 01/01/1980, "M", 90000);
 INSERT INTO EMPLOYEE VALUES (4, "Sonia", "Kulkarni", "HR", "P3", "Hyderabad (HYD)", 02/05/1992, "F", 50000);
 INSERT INTO EMPLOYEE VALUES (5, "Priya", "Thakur", "Development", "P2", "Bangalore (BAN)", 23/02/1992, "F", 100000);
 SELECT * FROM EMPLOYEE;
-- 1. Display details of employees in the HR department only.
SELECT * FROM EMPLOYEE WHERE Department = "HR";
-- 2.List number of female employees.
SELECT COUNT(*) AS "FEMALE EMPLOYEE" FROM EMPLOYEE WHERE Gender = "F";
-- 3. Display all female HR employees.
SELECT * FROM EMPLOYEE WHERE Gender = "F" AND Department = "HR";
-- 4.Display all the names whose name starts with vowels
SELECT EmpFname FROM EMPLOYEE WHERE EmpFname LIKE "a%" OR "e%" OR "i%" OR "o%" OR "u%";
-- 5.List all the males whose name has a vowel as the 2nd character.
SELECT * FROM EMPLOYEE WHERE Gender = "M" AND EmpFname LIKE "_a%" OR "e%" OR "i%" OR "o%" OR "u%";
-- 6.Name of all departments
SELECT DISTINCT(Department) FROM EMPLOYEE;
-- 7.all the female employees earning less than 75000.
SELECT * FROM EMPLOYEE WHERE Gender = "F" AND Salary < 75000;
-- 8.count number of employees earning between 50k and 1 lakh.
SELECT COUNT(*) AS "NO OF EMPLOYEE" FROM EMPLOYEE WHERE Salary BETWEEN 50000 AND 100000;
-- 9.count the number of projects.
SELECT COUNT(DISTINCT(Project)) AS "UNIQUE PROJECTS" FROM EMPLOYEE;
-- 10.Department wise count of employees.
SELECT COUNT(EmpID) AS "EMPLOYEE COUNT", Department FROM EMPLOYEE GROUP BY Department;

/*
Q2.
1. What is the difference between a Unique Key and Primary Key?
Ans. A UNIQUE KEY can be null, but PRIMARY KEY cannot be null;
2.SQL is a case-sensitive language. (True or False)
Ans. SQL is a case-insensitive language.
*/
 