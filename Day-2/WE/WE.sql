-- Day-2 Nested Queries
SHOW DATABASES;
CREATE DATABASE testdb;
USE testdb;
CREATE TABLE teachers (teacherid int, teachername varchar(255));
INSERT INTO teachers VALUES (2, "t2");
INSERT INTO teachers VALUES (1, "t1");
INSERT INTO teachers VALUES (3, "t3");
INSERT INTO teachers VALUES (4, "t4");
CREATE TABLE courses (courseid int, coursename varchar(255), teacherid int);
INSERT INTO courses VALUES (1, "c1", 1);
INSERT INTO courses VALUES (2, "c2", 2);
INSERT INTO courses VALUES (3, "c3", 4);
SHOW TABLES;
SELECT * FROM teachers; -- (teacherid, teachername)
SELECT * FROM courses; -- (courseid, coursename, teacherid)
-- EXPLICIT JOIN
SELECT * FROM courses INNER JOIN teachers ON teachers.teacherid = courses.teacherid;
SELECT * FROM courses JOIN teachers ON teachers.teacherid = courses.teacherid; 
-- IMPLICIT JOIN
SELECT * FROM courses, teachers WHERE courses.teacherid = teachers.teacherid;
-- ALL TYPE OF JOINS
SELECT * FROM teachers;
SELECT * FROM courses;
-- INNER JOIN
SELECT * FROM teachers INNER JOIN courses ON teachers.teacherid = courses.teacherid;
-- LEFT JOIN / LEFT OUTER JOIN
SELECT * FROM courses LEFT OUTER JOIN teachers ON teachers.teacherid = courses.teacherid;
-- RIGHT JOIN / RIGHT OUTER JOIN
SELECT * FROM courses RIGHT OUTER JOIN teachers ON teachers.teacherid = courses.teacherid;
-- FULL OUTER JOIN / FULL JOIN
SELECT * FROM teachers LEFT JOIN courses ON teachers.teacherid = courses.teacherid
UNION
SELECT * FROM teachers RIGHT JOIN courses ON teachers.teacherid = courses.teacherid;
-- CARTESIAN PRODUCT
SELECT * FROM teachers JOIN courses;
-- INTRO TO SUBQUERY
CREATE TABLE offices (officecode int, country varchar(255));
INSERT INTO offices VALUES (1, "UK");
INSERT INTO offices VALUES (2, "INDIA");
INSERT INTO offices VALUES (3, "US");
INSERT INTO offices VALUES (4, "Germany");
INSERT INTO offices VALUES (5, "Australia");
SELECT * FROM offices;
CREATE TABLE newoffices(officecode int, country varchar(255));
INSERT INTO newoffices (SELECT * FROM offices); -- INSERTED ALL ROWS TO THE NEW TBALE
SELECT * FROM newoffices;
-- DELETING DATA FROM OFFICES TABLE
DELETE FROM offices;
SELECT * FROM offices;
INSERT INTO offices VALUES (3, "India");
INSERT INTO offices VALUES (4, "Thailand");
INSERT INTO offices VALUES (2, "USA");
SELECT * FROM offices;
-- DROP TABLE employee;
-- employee table <firstname, lastname, officecode>
-- office tbale <officecode, country>
CREATE TABLE employees (firstname varchar(255), lastname varchar(255), officecode int);
INSERT INTO employees VALUES ("f1", "l1", 1);
INSERT INTO employees VALUES ("f3", "l3", 3);
INSERT INTO employees VALUES ("f2", "l2", 2);
-- SUBQUERY
SELECT lastname, firstname FROM employees WHERE officecode IN 
(SELECT officecode FROM offices WHERE country = "USA");






