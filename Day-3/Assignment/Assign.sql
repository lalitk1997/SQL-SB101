/*
DB Schema and Transaction Assignment
*/
-- Q1
/*
Students : (Id, Name, Address) [Id -> PK]
Subjects : (Id, Name) [Id -> Pk]
MarksScored : (StuID, SubId, Marks) [StuId -> FK], [SubId -> FK]
*/
DROP TABLE Students;
DROP TABLE Subjects;
DROP TABLE MarksScored; 
CREATE TABLE Students (Id INT, Name VARCHAR(255), Address VARCHAR(255),
PRIMARY KEY(Id));
DESC Students;
CREATE TABLE Subjects (Id INT, Name VARCHAR(255), Primary Key (Id));
DESC Subjects;
CREATE TABLE MarksScored (StudentId INT, SubjectId INT, Marks INT,
FOREIGN KEY(StudentId) REFERENCES Students(Id),
FOREIGN KEY(SubjectId) REFERENCES Subjects(Id));
DESC MarksScored;
INSERT INTO Students VALUES (1, "Lalit", "Gurgaon"), 
(2, "Rupesh", "Kohlapur"), (3, "Vaishali", "Udipur");
INSERT INTO Subjects VALUES (101, "Java"), (201, "Angular");
INSERT INTO MarksScored VALUES (1, 101, 8), (2, 101, 9), (3, 101, 9), 
(1, 201, 7), (2, 201, 8), (3, 201, 9);
SELECT * FROM MarksScored;

(SELECT Students.Name, AVG(Marks) AS TotalMarks FROM MarksScored 
JOIN Students WHERE Students.Id = MarksScored.StudentID 
GROUP BY StudentId ORDER BY TotalMarks DESC);

-- Q2
/*
Transactions -> Follow the ACID properties which are :-
1. Atomic : Query/Queries executed must be atomic in nature.
2. Consistency : DB state must always remain consistent, In case of txn faliure.
3. Isolation : One Txn does not effect other Txn happening in DB.
4. Durability : Changes must be permanently save in DB after Txn commit or rollback.
So, that Consistency is always maintained.
*/

-- Q3
USE testdb;
CREATE TABLE Bank (Name VARCHAR(255), AccountNumber VARCHAR(255), Balance INT);
INSERT INTO Bank VALUES ("Ram", "ac-12123", 50000),
("John", "ac-w4123", 60000),
("David", "ac-23134", 10000);
SELECT * FROM Bank;
-- Doing Transaction
START TRANSACTION;
UPDATE Bank SET Balance = (Balance-10000) WHERE Name = "John";
UPDATE Bank SET Balance = (Balance+10000) WHERE Name = "David";
COMMIT;
SELECT * FROM Bank; 