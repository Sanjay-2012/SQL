create database school;
use school;
create table marks ( id int , name varchar(20) , tamil int );
insert into marks values(1,'sanjay',92);
insert into marks values(2,'sam',89);
insert into marks values (3,'ram',99);
insert into marks values (4,'kathir',94,88);
insert into marks values (5,'nithish',91,90);
insert into marks values (6,'ragul',89,78);
insert into marks values (7,'ajith',84,89);
select * from marks;
SET SQL_SAFE_UPDATES = 0;
create table employees (id int , Name varchar(20),department varchar(20),Salary int);
INSERT INTO employees VALUES 
(1, 'Arun', 'HR', 30000),
(2, 'Priya', 'IT', 45000),
(3, 'Ravi', 'Sales', 28000),
(4, 'Keerthi', 'IT', 50000),
(5, 'Divya', 'HR', 32000),
(6, 'Santhosh', 'Sales', 41000);


-- Update the table  
update marks set tamil = 100  where id = 1;
update marks set english = 90  where id = 1;
update marks set english = 80  where id = 2;
update marks set english = 70  where id = 3;

- Alter the table
alter table marks add english int;
-- rename the column
alter table marks change  column english japanese int;
-- modify the column
alter table marks modify name varchar(50) not null;
-- creating a database    
create database employees;
use employees; 

-- Creating a table inside the employees DB and insert the values in the table
create table employees (id int , Name varchar(20),department varchar(20),Salary int);
INSERT INTO employees VALUES 
(1, 'Arun', 'HR', 30000),
(2, 'Priya', 'IT', 45000),
(3, 'Ravi', 'Sales', 28000),
(4, 'Keerthi', 'IT', 50000),
(5, 'Divya', 'HR', 32000),
(6, 'Santhosh', 'Sales', 41000);

-- This is used to retrieve all the elements 
select * from employees;

-- Using Where,And,Or,Not
select * from employees where department ='IT';
select * from employees where salary >= 30000;
select * from employees where salary >= 30000 and department = 'hr';
select * from employees where department ='sales' or department ='it';
select * from employees where not department ='hr';
select * from employees where not name = 'ravi' and salary <=40000;

-- Using Order By - Sorting Results
select * from employees order by salary desc;
select * from employees order by department,salary desc;

-- Using Limit - Show Only Top N Rows
select * from employees order by salary desc limit 2;
select * from employees limit 3;

-- Using Distinct - Remove Duplicate Values
select distinct department from employees; 
select distinct salary from employees;

-- Using Aggregate Functions 
select count(*) from employees;
select sum(salary) from employees;
select min(salary) from employees;
select max(salary) from employees;
select avg(salary) from employees;

-- Using Group By - Group Data and Use Aggregates
select department,sum(salary) from employees group by department;
select department,count(*) from employees group by department;

-- Using Having - Filter Grouped Data (Used with GROUP BY)
select department,count(*) from employees group by department having 1< count(*);
select department,avg(salary) from employees group by department having avg(salary)>40000; 

create table departments (id int ,department varchar(20));
insert into departments value
(101,'HR'),
(102,'Sales'),
(103,'Marketing');

select * from departments;
-- JOIN - combine data from multiple tables
/* Types of join
    -INNER Join
    -LEFT Join
    -RIGHT Join
    -FULL Join -- not supported by mysql
    
Syntax:
  SELECT a.column1, b.column2
  FROM tableA a
  JOIN tableB b ON a.id = b.id;*/ 

-- INNER Join
select employees.name , departments.id from employees inner join departments on employees.department = departments.department;
-- LEFT Join
select employees.name , departments.id from employees left join departments on employees.department = departments.department;
-- RIGHT Join
select employees.name , departments.id from employees right join departments on employees.department = departments.department;

-- CASE – If/Else in SQL
select
 name , 
 department,

case
 when salary >= 50000 then "A"
 when salary >= 40000 then "B"
  when salary >= 30000 then "C"
  else 'D'
  end as grade,
  
  case 
  when department = "IT" then "Technical"
  else "Non-technical"
  end as role
  
from employees;

-- IN - matches from list
select * from employees where department in ('it','hr');

-- between - range filter
select * from employees where salary between 20000 and 30000; 

-- like - pattern matching
select * from employees where name like 's%';

-- Union 
--   Combine Results from Multiple Queries
select name from employees
union
select name from marks;



