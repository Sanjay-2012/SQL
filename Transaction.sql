/*TRANSACTION – Execute Multiple Queries Safely
A transaction is a group of SQL statements that run together. If one fails, none are applied.

 Keywords:
Keyword	               Description
START TRANSACTION	Begins transaction
COMMIT	            Saves all changes
ROLLBACK	        Cancels changes if error occurs

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
*/
SET SQL_SAFE_UPDATES = 0;
use boys;
update areaboys set role = 'ui/ux' where id = 1;
commit;
select * from areaboys;
-- this rollback is not work because the update will auto-commit , after commit rollback is not work.
update areaboys set role = 'sql' where id = 6;
rollback;

-- if we don't use start transaction rollback is not work. 
start transaction; -- it gives us to control when to save and when we undo
update areaboys set role = 'sql' where id = 10;
rollback;

