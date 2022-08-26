-- https://masai-course.s3.ap-south-1.amazonaws.com/editor/uploads/2022-08-23/Day2%20-%20SQL_922107.pdf
create database db4;
show databases;
use db4;
-- drop table Person;
create table Person (id int, email  varchar(25), primary key(id),   
CONSTRAINT force_lower_case CHECK(email = LOWER(email)));
desc Person;
insert into Person values (1, "a@b.com"),
(2, "c@d.com"), (3, "a@b.com");

select email from( 
select count(*) as rep, email from Person
group by email having count(*) = 1) as A;

-- -------------------------------------------------------
CREATE DATABASE ORG;
SHOW DATABASES;
USE ORG;

CREATE TABLE Worker (
WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
FIRST_NAME CHAR(25),
LAST_NAME CHAR(25),
SALARY INT(15),
JOINING_DATE DATETIME,
DEPARTMENT CHAR(25)
);

INSERT INTO Worker
(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
(001, 'Monika', 'Arora', 100000, '14-02-20 09.00.00', 'HR'),
(002, 'Niharika', 'Verma', 80000, '14-06-11 09.00.00', 'Admin'),
(003, 'Vishal', 'Singhal', 300000, '14-02-20 09.00.00', 'HR'),
(004, 'Amitabh', 'Singh', 500000, '14-02-20 09.00.00', 'Admin'),
(005, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'Admin'),
(006, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'),
(007, 'Satish', 'Kumar', 75000, '14-01-20 09.00.00', 'Account'),
(008, 'Geetika', 'Chauhan', 90000, '14-04-11 09.00.00', 'Admin');

CREATE TABLE Bonus (
WORKER_REF_ID INT,
BONUS_AMOUNT INT(10),
BONUS_DATE DATETIME,
FOREIGN KEY (WORKER_REF_ID)
REFERENCES Worker(WORKER_ID)
ON DELETE CASCADE
);

INSERT INTO Bonus
(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
(001, 5000, '16-02-20'),
(002, 3000, '16-06-11'),
(003, 4000, '16-02-20'),
(001, 4500, '16-02-20'),
(002, 3500, '16-06-11');

CREATE TABLE Title (
WORKER_REF_ID INT,
WORKER_TITLE CHAR(25),
AFFECTED_FROM DATETIME,
FOREIGN KEY (WORKER_REF_ID)
REFERENCES Worker(WORKER_ID)
ON DELETE CASCADE
);

INSERT INTO Title
(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
(001, 'Manager', '2016-02-20 00:00:00'),
(002, 'Executive', '2016-06-11 00:00:00'),
(008, 'Executive', '2016-06-11 00:00:00'),
(005, 'Manager', '2016-06-11 00:00:00'),
(004, 'Asst. Manager', '2016-06-11 00:00:00'),
(007, 'Executive', '2016-06-11 00:00:00'),
(006, 'Lead', '2016-06-11 00:00:00'),
(003, 'Lead', '2016-06-11 00:00:00');

desc worker;
select salary from  worker group by salary 
order by salary desc limit 1 offset 1;

select salary from worker group by salary 
order by salary desc limit 5;

select * from worker;
select * from worker where WORKER_ID % 2 = 0;

select count(*) as NoOfEmployee, DEPARTMENT from worker 
group by DEPARTMENT order by NoOfEmployee desc;

select count(*) as NoOfEmployee, salary from worker 
group by salary order by salary desc; 

-- -------------------------------------------------------
create database db5;
show databases;
use db5;

-- drop table EmployeeDetails;
create table EmployeeDetails(EmpId int, FullName varchar(25), 
ManagerId int, DateOfJoining date, city varchar(25));

insert into EmployeeDetails values 
(121, 'John Snow', 321, str_to_date('01/31/2014', '%m/%d/%Y'), 'Toronto'),
(321, 'Walter White', 986, str_to_date('01/30/2015', '%m/%d/%Y'), 'California'),
(421, 'Kuldeep Rana', 876, str_to_date('27/11/2016', '%d/%m/%Y'), 'New Delhi');
select * from EmployeeDetails;

create table EmployeeSalary (EmpId int, Project varchar(2), 
Salary int, Variable int);
insert into EmployeeSalary values 
(121, 'P1', 8000, 500),
(321, 'P2', 10000, 1000),
(421, 'P1', 12000, 0);

-- Q1
select EmpId, FullName from EmployeeDetails where FullName LIKE '__hn%'; 
-- Q2
select * from EmployeeDetails JOIN EmployeeSalary on 
EmployeeDetails.EmpId = EmployeeSalary.EmpId;
-- Q3
select * from EmployeeDetails LEFT JOIN EmployeeSalary on
EmployeeDetails.EmpId = EmployeeSalary.EmpId
UNION
select * from EmployeeDetails RIGHT JOIN EmployeeSalary on
EmployeeDetails.EmpId = EmployeeSalary.EmpId;
-- Q4
select MIN(EmployeeSalary.Salary), MAX(EmployeeSalary.Salary), 
AVG(EmployeeSalary.Salary) from EmployeeDetails RIGHT JOIN 
EmployeeSalary on EmployeeDetails.EmpId = EmployeeSalary.EmpId;
-- Q5
select * from EmployeeDetails LEFT JOIN EmployeeSalary on 
EmployeeDetails.EmpId = EmployeeSalary.EmpId;
