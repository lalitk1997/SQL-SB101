-- https://masai-course.s3.ap-south-1.amazonaws.com/editor/uploads/2022-08-23/Day1-%20Basic%20SQL-1_246432.pdf
-- Basic SQL-2
create database db3;
show databases;
use db3;
create table STUDENT (NAME varchar(20), ROLLNO int, BRANCH varchar(20),
CITY varchar(20));
insert into STUDENT values ("VIJAYA", 150, "CSE", "CHENNAI"),
("SITA", 202, "ETC", "KOLKATA"),
("RAVI", 300, "EEE", "DELHI"),
("BASU", 165, "ETC", "CHENNAI"),
("RASMI", 107, "ETC", "RKL"),
("KARAN", 111, "CSE", "CTC"),
("REKHA", 117, "BME", "BBSR");
select * from student;
select BRANCH, count(*) as StudentNo from student group by BRANCH;
select BRANCH, count(*) as StudentNo from student where BRANCH 
LIKE "E%" group by BRANCH;
alter table student add MARKS int8;
desc student;
alter table student modify NAME varchar(25);
desc student;
delete from student where BRANCH = "ETC";
select * from student;
alter table STUDENT rename to STUDINFORMATION;
select * from STUDINFORMATION;
delete from studinformation;
select * from studinformation;
drop table studinformation;
drop database db3;