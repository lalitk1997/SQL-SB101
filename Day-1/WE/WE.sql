-- SQL stands for Structured Query Language
-- RDBMS Relational Database Management System
-- Fields : Column Names
-- Records : Row Names

-- CREATE A DATABASE
CREATE DATABASE db;
CREATE DATABASE testDB;
-- SHOW ALL AVAILABLE DATABASE
SHOW DATABASES;
USE db;
USE testDB;
-- SHOW ALL TABLES WITHIN THE DATABASE
SHOW TABLES;
-- CREATE TABLE 
CREATE TABLE Customer(first_name varchar(255), last_name varchar(255), cust_id int);
CREATE TABLE Persons(PersonID int, LastName varchar(255), FirstName varchar(255), Address varchar(255), City varchar(255));
SHOW TABLES;
-- INSERT RECORDS INTO DATABASE
INSERT INTO Customer VALUES ("Lalit", "Kumar", 1);
INSERT INTO Customer VALUES ("Rupesh", "Patil", 2);
INSERT INTO Persons VALUES ( 1, "Kumar", "Lalit", "Street No 14, Patel Nagar", "Gurgaon" );
INSERT INTO Persons (PersonID, LastName, FirstName, Address, City) VALUES (2, "Patil", "Rupesh", "KohlapurNear Hanuman Mandir", "Maharashtra"); 
-- SHOW ALL ROWS WITHIN THE TABLE
SELECT * FROM customer;
SELECT * FROM Persons;
-- COUNT ALL ROWS WITHIN A TABLE
SELECT COUNT(*) FROM customer;
SELECT COUNT(*) FROM Persons;
-- TO PRINT PARTICULAR COLUMN FROM THE TABLE IN A PREFFRED SEQUENCE
SELECT LastName, FirstName FROM Persons;
SELECT FirstName, LastName, City FROM Persons;
-- CUST IN A PARTICULAR CITY
SELECT FirstName FROM Persons WHERE city = "Gurgaon";
-- TO SELECT DISTICT FIRST NAME FROM THE TABLE
INSERT INTO Persons VALUES(3, "Rajput", "Lalit", "Pink City, Rajasthan", "Jaipur");
SELECT * FROM Persons;
SELECT DISTINCT(FirstName) FROM Persons;
SELECT COUNT(DISTINCT(FirstName)) FROM Persons;
--  




-- 


