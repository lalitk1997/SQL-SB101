-- Q1.
DROP TABLE students;
DROP TABLE courses;
CREATE TABLE students(S_ID varchar(255), S_NAME varchar(255), S_ADDRESS varchar(255), S_PHONE bigint, S_AGE int);
INSERT INTO students VALUES ("S1", "RAM", "DELHI", 9455123451, 18);
INSERT INTO students VALUES ("S2", "RAMESH", "GURGAON", 9652431543, 18);
INSERT INTO students VALUES ("S3", "SUJIT", "Chandigarh", 9156253131, 20);
INSERT INTO students VALUES ("S4", "SURESH", "DELHI", 9156768971, 18);
INSERT INTO students VALUES ("S5", "Ratan", "Delhi", 9567890876, 20);
CREATE TABLE courses (C_ID varchar(255), C_NAME varchar(255));
INSERT INTO courses VALUES ("C1", "DSA");
INSERT INTO courses VALUES ("C2", "JAVA");
INSERT INTO courses VALUES ("C3", "MERN");
CREATE TABLE students_courses (S_ID varchar(255), C_ID varchar(255));
INSERT INTO students_courses VALUES ("S1", "C1"), ("S1", "C3"), ("S2", "C1"), ("S3", "C2"), ("S4", "C2"), ("S4", "C3"), ("S5", "C2");
SELECT * FROM students;
SELECT * FROM courses;
SELECT * FROM students_courses;
-- SOLUTION
SELECT * FROM students_courses INNER JOIN courses ON students_courses.C_ID = courses.C_ID WHERE C_NAME = "JAVA";
SELECT * FROM students where 
students.S_ADDRESS = "DELHI" AND students.S_ID IN 
(SELECT S_ID FROM students_courses INNER JOIN courses ON students_courses.C_ID = courses.C_ID WHERE C_NAME = "JAVA");

-- Q2
CREATE TABLE movies (id int, title varchar(255), director varchar(255), year int, length_minutes int);
DESC movies;
INSERT INTO movies VALUES (1, "Toy Story", "John Lasseter", 1995, 81),
(2, "A Bug's Life", "John Lasseter", 1998, 95),
(3, "Toy Story 2", "John Lasseter", 1999, 93),
(4, "Monsters, Inc.", "Pete Docter", 2001, 92),
(5, "Civil War", "Andrew Stanton", 2003, 107),
(6, "The Incredibles", "Brad Bird", 2004, 116);
SELECT * FROM movies;
-- DROP TABLE movie_rating;
CREATE TABLE movies_rating (movie_id int, rating float, domestic_sales float, international_sales bigint);
DESC movie_rating;
INSERT INTO movies_rating VALUES (5, 8.2, 380843261, 555900000),
(1, 7.4, 268492764, 475066843),
(3, 8, 206445654, 417277164),
(2, 6.4, 191452396, 368400000),
(4, 7.9, 245852179, 239163000),
(6, 8, 261441092, 370001000);
SELECT * FROM movies_rating;
-- 2.1
SELECT * FROM movies WHERE id IN 
(SELECT movie_id FROM movies_rating WHERE international_sales > domestic_sales);
-- 2.2
SELECT movies.title, movies_rating.rating FROM movies JOIN movies_rating
 ON movies.id = movies_rating.movie_id ORDER BY movies_rating.rating DESC;
 
 -- Q4
 CREATE TABLE persons(personId int, lastName varchar(255), firstName varchar(255));
 DESC persons;
 INSERT INTO persons VALUES (1, "Wang", "Allen"),
 (2, "Alice", "Bob");
 SELECT * FROM persons;
 CREATE TABLE address(addressId int, personId int, city varchar(255), state varchar(255));
 DESC address;
 INSERT INTO address VALUES (1, 2, "New York City", "New York"),
 (2, 3, "San Diego", "California");
 SELECT * FROM address;
 -- Query
 SELECT persons.firstName, persons.lastName, address.city FROM persons 
 LEFT JOIN address ON persons.personId = address.personId; 
 

