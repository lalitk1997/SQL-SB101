DROP DATABASE bookstore;
CREATE DATABASE bookstore;
USE bookstore;
CREATE TABLE category
( id int PRIMARY KEY,
name varchar(255) NOT NULL UNIQUE,
description varchar(255) NOT NULL );

CREATE TABLE authors
( id int PRIMARY KEY,
name varchar(255) NOT NULL,
bio varchar(500) NOT NULL );

CREATE TABLE books
( id int PRIMARY KEY,
title varchar(255) NOT NULL,
description varchar(255) NOT NULL,
ISBN char(13) NOT NULL,
category_id INT NOT NULL,
FOREIGN KEY (category_id) REFERENCES category(id)
);

CREATE TABLE books_authors ( 
is_main_author BOOLEAN NOT NULL DEFAULT false,
PRIMARY KEY (books_id, authors_id),
books_id int REFERENCES books(id),
authors_id int REFERENCES authors(id));
SHOW CREATE TABLE books_authors;
USE bookstore;
SELECT i.TABLE_NAME, i.CONSTRAINT_TYPE, i.CONSTRAINT_NAME, k.REFERENCED_TABLE_NAME, k.REFERENCED_COLUMN_NAME 
FROM information_schema.TABLE_CONSTRAINTS i 
LEFT JOIN information_schema.KEY_COLUMN_USAGE k ON i.CONSTRAINT_NAME = k.CONSTRAINT_NAME 
WHERE i.CONSTRAINT_TYPE = 'FOREIGN KEY' 
AND i.TABLE_SCHEMA = DATABASE();