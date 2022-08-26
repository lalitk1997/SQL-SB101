-- https://masai-course.s3.ap-south-1.amazonaws.com/editor/uploads/2022-08-23/Day1-%20Basic%20SQL-1_246432.pdf
-- Basic SQL 1
create database db2;
show databases;
use db2;
-- drop table DEPOSIT;
create table DEPOSIT (ACTNO varchar(25), CNAME varchar(20), 
BNAME varchar(20), AMOUNT int, ADATE DATE);
create table BRANCH(BNAME varchar(20), CITY varchar(20));
create table CUSTOMER(CNAME varchar(20), CITY varchar(20));
create table BORROW(LOANNO varchar(5), CNAME varchar(20),
BNAME varchar(20), AMOUNT int);
desc deposit;
desc branch;
desc customer;
desc borrow;
insert into deposit values ("100", "ANIL", "VRCE", 1000, 
str_to_date("01-MAR-95", "%d-%M-%Y"));
insert into deposit values 
("101", "SUNIL", "MGROAD", 5000, 
str_to_date("04-JAN-96", "%d-%M-%Y")),
("102", "RAHUL", "KAROLBAGH", 3500, 
str_to_date("17-NOV-95", "%d-%M-%Y")),
("103", "MADHURI", "CHANDNI", 1200, 
str_to_date("17-DEC-95", "%d-%M-%Y")),
("104", "PRAMOD", "MGROAD", 3000, 
str_to_date("27-MAR-96", "%d-%M-%Y")),
("105", "SANDIP", "KAROLBAGH", 2000, 
str_to_date("31-MAR-96", "%d-%M-%Y"));
select * from deposit;
insert into branch values 
("VRCE", "NAGPUR"),
("KAROLBAGH", "DELHI"),
("CHANDNI", "DELHI"),
("MGROAD", "BANGALORE");
select * from branch;
insert into customer values
("ANIL", "CALCUTA"),
("RAHUL", "BARODA"),
("MADHURI", "NAGPUR"),
("PRAMOD", "NAGPUR"),
("SUNIL", "DELHI");
select * from customer;
insert into borrow values 
("201", "ANIL", "VRCE", 1000),
("206", "RAHUL", "KAROLBAGH", 5000),
("311", "SUNIL", "MGROAD", 3000),
("321", "MADHURI", "CHANDNI", 2000),
("375", "PRAMMOD", "MGROAD", 8000);
select * from borrow;
select * from borrow where amount between 2000 and 3000;
select ACTNO, CNAME, BNAME, AMOUNT, 
DATE_FORMAT (ADATE, "%e-%b-%Y") as ADATE from deposit;
select * from customer where city = "NAGPUR";
select ACTNO from deposit where ADATE between '1995-12-01' 
and '1996-06-01'; 
select * from deposit;
select * from deposit where CNAME like "C%";
select * from borrow where CNAME like "_U%";
select * from deposit where BNAME = "CHANDNI" or BNAME = "MGROAD";
select * from deposit where BNAME != "CHANDNI" and BNAME != "MGROAD";
select * from deposit where AMOUNT > 1000 order by CNAME ASC;
select * from deposit where AMOUNT > 1000 order by CNAME DESC;
select * from borrow where CNAME like "__A%" or CNAME like "__D%";
select * from borrow where AMOUNT NOT BETWEEN 2000 and 8000; 
select DISTINCT * from deposit ;
update deposit set amount = amount + (amount * 0.1) where BNAME = "VRCE";
update deposit set amount = amount + (amount * 0.1) 
where BNAME = "VRCE" and CNAME = "ANIL";
select * from deposit;
select * from borrow;
