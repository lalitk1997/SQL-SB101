-- Database Normalization
/*
PRIMARY KEY
CANDIDATE KEY
PRIME ATTRIBUTES : Attributes which are a part of any candidate key.
NON-PRIME ATTRIBUTES : Attributes which are not a part of any candidate key.
Partial Dependency : Proper subset of a candidate key -> Non-Prime attribute.
1-NF : Atomic cells.
2-NF : No-partial dependency.
3-NF : At least one of the below conditions have to hold - 
 X -> Y
1. X is a super key.
2. Y is a prime attribute. 
BCNF : 
 X -> Y
 1. X is a super key / candidate key.
*/
CREATE DATABASE Normalization;
SHOW DATABASES;
USE Normalization;
CREATE TABLE Student (EnrollmentNumber INT, Email VARCHAR(255), Name VARCHAR(255),
 Phone BIGINT, City VARCHAR(255), Age INT, PRIMARY KEY(EnrollmentNumber));
 DESC Student;
/*
CANDIDATE KEYS : Email, Phone and EnrollmentNumber | Def : The minimal set of attributes
that can uniquely identiy a tuple.
Chosen PRIMARY KEYS : EnrollmentNumber
PRIME ATTRIBUTE : Email, Phone and EnrollmentNumber
NON PRIME ATTRIBUTE : Name, City and Age
NORMALIZATION : Avoid Data Redundancy, Insertion Anamoly, Update Anomaly & Deletion Anamoly
Table Employee : 
Id  Name Add   Dept
101 Rick Delhi D001
101 Rick Delhi D002
123 Maggie Agra D890
166 Glenn Chennai D900
166 Glenn Chennai D004
1. Update Anomaly : Updating Rick address. (Have to update in both rows for different Dept --> 
Otherwise data-inconsistent)
2. Insert Anamoly : Insert new emp (under training) without dept. NOT ALLOWED 
3. Delete Anamoly : Deleting a Dept will also effect employee data. (If an employee is assigned 
to only deleted dept it's data will also be deleted).
*/

/*
Table : Employees and Department
empNum lastName firstName deptName deptCity deptCountry
1001 Andrews Jack Accounts New York United States
1002 Schwatz Mike Technology New York United States
1009 Beker Harry HR Berlin Germany
1007 Harvey Parker Admin London United Kingdom
1007 Harvey Parker HR London United Kingdom

explaination : 
1. Table is in 1-NF (atomic values in all cells).
2. Dependencies : 
 empNum -> {lastName}, {firstName} (Partial Dependency)
 Table is not in 2NF.
 {deptName, deptCity, deptCountry, empNum} -> Uniquely identify each tuple (PK);
 3.1. Table1 : Employee (empNum (PK), firstName, lastName)
 empNum -> PK 
 Partial Dependency -> No
 3.2. Table2 : Department (deptName, deptCity, deptCountry)
 {deptName, deptCity, deptCountry} -> PK 
 Partial Dependency -> No
 3.3 Table 3 : Merge (empNum, deptName, deptCity, deptCountry)
 {empNum, deptName, deptCity} -> PK
 deptCity -> DeptCountry (Partial-Dependency) 
 Partial Dependency -> Yes
 3.4 Table 4 : CityToCountry(deptCity, deptCountry)
 deptCity -> PK
 3.5 Table 5 -> EmployeeToCity(empNum, deptName, deptCity)
 {empNum, deptName, deptCity} -> PK
*/

/*
Employee (empNum (PK), firstName, lastName)
EmployeeToCity(empNum, deptName, deptCity) PK-> {empNum, deptName, deptCity} 
CityToCountry(deptCity, deptCountry) PK-> {deptCity}
You Problem :- Ans. 2
*/




