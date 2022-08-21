/*
Transaction and ACID Properties
Transaction -> Sequence of operations (single or multiple) on a DB, which has to be 
atomic in nature.

ACID -> Transaction an a DB must be Atomic, Consistent, Isolated and Durable.
1. Atomic -> Transactions are atomic in nature.
Either completed or not completed.
2. Consistent -> Data must always be in consistent state in case of any Transaction 
or after rolling back any transactions.
3. Isolation -> A transactions doee not effect other transactions in process.
4. Durable -> Changes made must be consistent and permanent in the DB.

Recoverable Resource -> Steps which can be undone to reach to the initial phase of DB are
generally known as recoverable resources.
Irrecoverable Resources -> Resources whose steps cannot be undone or rolledback in case
of any faliure.

Transfer Rs 100 from my bank acc to my friend's bank acc.
*/

SHOW DATABASES;
USE testdb;
SHOW TABLES;
DESC address;
SELECT * FROM address;
-- Executed line-by-line via users. 
START TRANSACTION; 
SELECT * FROM address;
DELETE FROM address WHERE addressId = 2; 
rollback; 
-- Another Transaction
START TRANSACTION; 
SELECT * FROM address;
DELETE FROM address WHERE addressId = 2; 
commit;

/*
Schema Design : 
1. One-to-One Relationship 
Country - to - UN Representative
*/
CREATE TABLE Country( CountryId INT, Name VARCHAR(255), OfficialLang VARCHAR(255),
Size INT, PRIMARY KEY(CountryId));
CREATE TABLE UNRepresentative( UNRepID INT, Name VARCHAR(255), Gender VARCHAR(255),
CountryId INT, FOREIGN KEY(CountryId) REFERENCES Country(CountryId) );
DESC Country;
DESC UNRepresentative;

/*
2. One to Many Relationship 
One car can have multiple engineers.
Car(One) to Engineers(Many) -> 2 Tables
Car Table -> (carId, carName, engineersWorking) [carId -> PK]
Engineer Table -> (engineerId, engName, engAdress, carIdFK) [engineerId -> PK]
[carId -> Foreign Key].
*/

/*
3. Many to Many Relationship
One Student -> Multiple Teacher (taught by)
One teacher -> Multiple Student (teaches) 
NOTE : One Teacher teaches only one subject.
Student (stuId, stuName, stuAddress, subjName); [PK -> stuId] []
Teacher (teachId, teachName, teachAddress, subjName); [PK -> teachId]
StudentToTeacher (stuId, teachId) [PK -> (stuId, teachId)]
[FK -> stuId(Student Table), teachId(Teacher Table) ]
3 Tables;
*/
