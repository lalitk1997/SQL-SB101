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
SELECT DISTINCT FirstName FROM Persons;
SELECT COUNT(DISTINCT(FirstName)) FROM Persons;
-- WHERE IS USED TO FILTER OUT THE ROWS BASED ON CONDITIONS
SELECT * FROM Persons WHERE FirstName = "Lalit";
-- AND, OR & NOT
SELECT * FROM Persons WHERE NOT FirstName = "Lalit";
SELECT * FROM Persons WHERE FirstName = "Lalit" OR city = "Maharashtra" ;
SELECT * FROM Persons WHERE FirstName = "Lalit" AND LastName = "Rajput";
-- COMBINING AND, OR, & NOT
SELECT * FROM Persons;
SELECT * FROM Persons WHERE FirstName = "Lalit" AND (city = "Gurgaon" OR city = "Jaipur");
-- ORDER BY 
SELECT * FROM Persons ORDER BY PersonID DESC;
SELECT * FROM Persons ORDER BY LastName DESC;
SELECT * FROM Persons ORDER BY FirstName;
-- ORDER BY ON MULTIPLE COLUMNS
INSERT INTO Persons VALUES (4, "Bai", "Kanta", "Near Peepal Tree, Sector - 15", "Gurgaon");
INSERT INTO Persons VALUES (5, "Kant", "Rajni", "Sector 44, OLD DLF Colony", "Gurgaon");
SELECT FirstName, LastName, city FROM Persons ORDER BY city, FirstName;
SELECT FIRSTNAME, LastName, city FROM Persons WHERE city = "Gurgaon" ORDER BY city ASC, FirstName DESC ;
-- GROUP BY IS OFTEN USED WITH AGGREGATE FUNCTION 
SELECT COUNT(PersonID), city FROM Persons GROUP BY city ORDER BY COUNT(PersonID); -- NUMBERS OF PERSONS FROM EACH CITY
SELECT SUM(PersonID), city FROM Persons GROUP BY city;
SELECT FirstName, COUNT(*) FROM Persons GROUP BY FirstName;
-- NULL VALUE - A FIELD WITH NO VALUE IS CALLED NULL VALUE
SELECT * FROM Persons;
INSERT INTO Persons VALUES (6, "Lala", "Raman", "Goregoan", null);
SELECT FirstName FROM Persons WHERE city IS NULL;
SELECT FirstName FROM Persons WHERE city IS NOT NULL;
-- UPDATE COLUMN VALUES 
SHOW DATABASES;
USE testdb;
UPDATE Persons SET FirstName = "Ronit" WHERE PersonID = 2;
SELECT * FROM Persons;
-- LIMIT & OFFSET
SELECT * FROM Persons;
SELECT * FROM Persons LIMIT 3;
SELECT * FROM Persons LIMIT 3 OFFSET 3;
-- MIN & MAX
SELECT *  FROM Persons ORDER BY PersonID DESC LIMIT 1;
SELECT MAX(PersonID) AS Largest_Value FROM Persons;
SELECT MIN(PersonID) AS Smallest_Value FROM Persons;
-- COUNT, AVERAGE & SUM
SELECT COUNT(*) AS No_Of_Person FROM Persons WHERE city = "Gurgaon";
SELECT AVG(PersonID) FROM Persons;
SELECT SUM(PersonID) FROM Persons;
/*
LIKE OPERATOR
% --> ONE OR MORE CHARACTERS
_ --> ONE CHARACTER ONLY
*/
SELECT * FROM Persons WHERE FirstName LIKE "%it";
SELECT * FROM Persons WHERE LastName LIKE "%i_";
-- IN & BETWEEN
SHOW DATABASES;
USE testdb;
SELECT * FROM Persons WHERE city IN ("Gurgaon", "Jaipur");
SELECT * FROM Persons WHERE PersonID BETWEEN 2 AND 4;
-- DROP A COLUMN FROM THE TABLE
ALTER TABLE Persons DROP COLUMN Address;
-- DROP A TABLE
DROP TABLE Persons;
SHOW TABLES;
-- PRIMARY KEY
CREATE TABLE Persons( ID int NOT NULL, LastName varchar(255) NOT NULL, FirstName varchar(255), Age int, PRIMARY KEY(ID));
SHOW TABLES;
-- FOREIGN KEY
CREATE TABLE Items(ItemID int NOT NULL, ItemName varchar(255), ItemPrice varchar(255), PersonID int, PRIMARY KEY(ItemID), FOREIGN KEY(PersonID) REFERENCES Persons(ID));


 


