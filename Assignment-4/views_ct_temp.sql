
create table Profession (
id serial primary key,
firstName varchar(50),
lastName varchar(50),
sex varchar(50),
doj date,
currentDate date,
designation varchar(50),
age int,
salary int,
unit varchar(50),
leavesUsed int,
leavesRemaining int,
ratings int,
pastExp int

);

copy Profession(firstName,lastName,sex,doj,currentDate,designation,age,salary,unit,leavesUsed,leavesRemaining,ratings,pastExp) 
from 'D:\Web\Leapfrog\Fellowship\Database\Assignment-4\Salary Prediction of Data Professions.csv' DELIMITER ',' CSV header;
select * from Profession ;

--Question 1: Calculate the average salary by department for all Analysts.
with 
avg_sal as (
select p.designation,avg(p.salary)  from Profession p group by p.designation having p.designation='Analyst' 
)
select * from avg_sal;
--Question 2: List all employees who have used more than 10 leaves.
with 
leaves as(
select firstname,leavesUsed from profession where leavesUsed >10
)
select * from leaves;

--Views:
--Question 3: Create a view to show the details of all Senior Analysts.
create view seniorAnalyst as
select * from profession where profession.designation='Senior Analyst';
select * from seniorAnalyst

--Materialized Views:
--Question 4: Create a materialized view to store the count of employees by department.
create materialized view  countEmployees as
select unit,count(unit) from profession group by unit;


select * from countEmployees;

--
--Procedures (Stored Procedures):
--Question 6: Create a procedure to update an employee's salary by their first name and last name.

create or replace procedure updateSalary(
   first varchar(50),
   last varchar(50), 
   amount int
)
language plpgsql    
as $$
begin
update profession 
set salary=salary+amount where firstname=first and lastname=last ;
commit; 
	end;$$;
call updateSalary('OLIVE','ANCY',10000);
select * from profession order by id
--
--Question 7: Create a procedure to calculate the total number of leaves used across all departments.
--	


create or replace procedure calcLeavesUsed()
language plpgsql
as $$
DECLARE
    total_leaves INTEGER;
begin 
	create temporary table leavesTable as 
	(select  SUM(leavesused) from profession
);
	end;$$;

call calcLeavesUsed();
select * from leavesTable;

