/*
Que1
A.  Table 2.1 is un-normalized because there are multi-valued attributes in the table.
	So, table 2.1 is not even in 1NF.
B. 
*/
SHOW DATABASES;
USE testdb;
-- DROP TABLE studentfine; 
CREATE TABLE studentfine(StudentID VARCHAR(255), Name VARCHAR(255), 
LicenseNo VARCHAR(255), CarReg VARCHAR(255), ReceiptNo VARCHAR(255), 
Date DATE, OffenceCode INT, FineRM DOUBLE);
DESC studentfine;
-- Ans A. 
INSERT INTO studentfine VALUES 
("F1011", "CK Fong", "P100", "JGK9201", "00-345", "10/03/06", 2, 30.00),
("F1011", "CK Fong", "P100", "JGK9201", "00-690", "15/03/06", 1, 20.00),
("F1011", "CK Fong", "P100", "JGK9201", "00-810", "20/03/06", 2, 30.00),
("L782", "AdamJames", "P290", "JJL99", "00-459", "13/03/06", 1, 20.00),
("H762", "MalaDewi", "P764", "JJK7654", "00-564", "12/03/06", 3, 40.00),
("H762", "MalaDewi", "P764", "JJK7654", "00-770", "19/06/06", 2, 30.00);
SELECT * FROM studentfine;
/*
Given table is in 1-NF.
Ans B. ReceiptNo -> PK (Primary Key)
*/

/*
2NF -> No-Partial Dependency
Partial Dependency -> Proper Subset of CK -> Non-Prime Attribute.
Ans C. Functional Dependency :
1. StudentID -> Name, LicenseNo, CarReg
2. ReceiptNo -> StudentID, Name, LicenseNo, CarReg, Date, OffenceCode, Fine
3. OffenceCode -> FineRM 

Ans D. No Partial Dependency -> Table is also in 2NF.
*/

/*
Ques 2.
A. Normalization is used to avoid anamolies which can lead to
data-inconsistence and to reduce down the redundancy with in the 
database.

B. Difference between insert, update and delete anamoly.
Ans. 
insert anamoly -> 
1. Records must always we inserted, when all the key-columns
values must be taken care of. 
2. No two records can hold all same-values.
update anamoly ->
1. All update in the tables must be done via primary key. So that
inconsistant data-storage can be avoided.
2. And all integrity of the database must be maintained. e.g referential 
integrity in case of FK (foreign keys).
delete anamoly ->
1. If a record is deleted from the key table, than it should affect all the
similar data stored at differenct columns in different table.


*/