-- length - length (Column_name)

create database boys;
use boys;

create table areaboys (id int,name varchar (20), role varchar(20),salary int);

insert into areaboys values
(1,'ajith','front-end',50000),
(2,'sanjay','web developer',40000),
(3,'ragul','back-end',60000),
(4,'sageeth','ui/ux',80000),
(5,'gowtham','java developer',100000),
(6,'rajesh','python-developer',120000),
(7,'gopi','back-end',28000),
(8,'kumar','Sql',50000),
(9,'vinoth','front-end',50000),
(10,'yash','web developer',50000);

select * from areaboys;

/* STORED PROCEDURE – Reusable SQL Code Block
A stored procedure is a predefined set of SQL statements you can run many times.
syntax:
DELIMITER //

CREATE PROCEDURE procedure_name()
BEGIN
  -- SQL Statements
END //

DELIMITER ; */

delimiter //
create procedure all_elements()
begin
select * from areaboys where salary >= 100000;
end //
delimiter ;

-- call the procedure
call all_elements;

-- IN
delimiter //
create procedure addemployee
(in emp_id int,
in emp_name varchar(20),
in emp_role varchar(20),
emp_salary int
)
begin 
  insert into areaboys values(emp_id,emp_name,emp_role,emp_salary);
end //

delimiter ;

call addemployee(11,'yuvaraj','sql',80000);


-- OUT
delimiter //

create procedure total (out total int)
begin
  select count(*) into total from areaboys;
end //
delimiter ;

set @x=0;
call total(@x);
select @x;


-- INOUT 
delimiter //
CREATE PROCEDURE MultiplyByTwo(INOUT num INT)
BEGIN
  SET num = num * 2;
END //

DELIMITER ;

-- Test:
SET @n = 5;
CALL MultiplyByTwo(@n);
SELECT @n;