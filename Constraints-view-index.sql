create database User;
use User;
-- Constraints are the rules added to the columns to maintain the data integrity (honest)
/*
Constraint	                  Description
NOT NULL	                 Value cannot be empty
UNIQUE	                     Value must be unique across rows
PRIMARY KEY	                 Uniquely identifies each row (NOT NULL + UNIQUE)
FOREIGN KEY	                 Links column to another table’s primary key
CHECK	                     Limits values based on condition
DEFAULT	                     Sets a default value if none is given
*/


create table user 
(id int primary key , 
name varchar(10) not null , 
email varchar(100) unique,
age int check(age>10));

alter table user add city varchar(20) default 'unknown';
insert into user values
(1,'Sanjay','san@mail.com',15 , 'madurai'),
(2,'deva','deva@mail.com',12 ,'chennai'),
(3,'Surya','surya@mail.com',20,'nkl'),
(4, '','basha@mail.com',30,'salem'),
(5,'Antony','antony@mail.com',21,'trichy');
update  user  set name = 'basha' where id = 4 ;
select * from user;

-- view 
-- A VIEW is like a saved SQL query — used to simplify complex queries.
create view Clg_stu as select name , age , city  from user where age >=20;
select * from clg_stu;

-- INDEX 
-- Indexes help speed up data retrieval (especially with WHERE, JOIN, ORDER BY).
create index city on user(city);
show index from user;

