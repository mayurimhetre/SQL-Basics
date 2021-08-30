select * from mayuri.student;



insert into mayuri.student values(1,'Mayuri');
insert into mayuri.student values(2,'Chaitanya');

select * from mayuri.employee;

create table mayuri.employee (empid int, empl_name varchar(30),manager_id int);
insert into mayuri.employee values(1,'Mayuri',2);
insert into mayuri.employee values(2,'Asha',3);
insert into mayuri.employee values(3,'Sonal',4);
insert into mayuri.employee values(32,'Ranjana',2);



create table mayuri.manager (managerid int, manager_name varchar(30));
insert into mayuri.manager values(1,'Ravi');
insert into mayuri.manager values(2,'Asha');
insert into mayuri.manager values(3,'Sonal');
insert into mayuri.manager values(4,'Piyush');

select * from mayuri.manager;

select a.empid, a.empl_name , b.manager_name, b.managerid from mayuri.employee a
inner join mayuri.manager b 
on a.manager_id = b. managerid order by a.empid;


https://www.youtube.com/watch?v=-VO7YjQeG6Y


select empid,empl_name , gender,salary,
RANK() OVER (ORDER BY SALARY DESC) RANK_1,
DENSE_RANK() OVER (ORDER BY salary DESC) DENSE_1
from employee;


select empid,empl_name , gender,salary,
RANK() OVER (PARTITION BY gender ORDER BY SALARY DESC) RANK_1,
DENSE_RANK() OVER (PARTITION BY gender ORDER BY salary DESC) DENSE_1
from employee;

select empid,empl_name , gender,salary,
RANK() OVER (PARTITION BY gender ORDER BY SALARY DESC) RANK_1,
DENSE_RANK() OVER (PARTITION BY gender ORDER BY salary DESC) DENSE_1
from employee;

https://www.youtube.com/watch?v=7GVFYt6_ZFM&list=PL08903FB7ACA1C2FB


select * from employee;

copy mayuri.employee  from 'C:\Users\MANOJKUMAR M MHETRE\Desktop\POSTGREsql\employee_file.csv' 
DELIMITER ',' csv  HEADER;


create table department (dept_id int, dept_name varchar(20));

insert into department values(1,'IT');
insert into department values(2,'CIF');
insert into department values(3,'LOANS');
insert into department values(4,'INTF');
insert into department values(5,'DEP');

select * from department;

alter table employee add dept_number int;
select * from employee;

delete from employee where manager_id= 1;


copy employee to 'C:\Users\MANOJKUMAR M MHETRE\Desktop\POSTGREsql\employee_file.csv' delimiter ',' csv;

copy mayuri.employee  from 'C:\Users\MANOJKUMAR M MHETRE\Desktop\POSTGREsql\employee_file.csv' 
DELIMITER ',' csv  HEADER;


select a.empl_name,a.empid,b.dept_id,b.dept_name from employee a
inner join department b
on a.dept_number = b.dept_id;


with result as 
(
select a.empl_name,a.empid,a.salary ,b.dept_id,b.dept_name,
DENSE_RANK() OVER (PARTITION BY b.dept_id ORDER BY a.salary DESC) rank1 from employee a
inner join department b
on a.dept_number = b.dept_id
)
select empl_name, salary,dept_name from result where rank1=1;

select E.empl_name as employee , COALESCE(M.empl_name ,'NO MANAGER') as manager
from employee E
left join employee M
on M.empid = E.manager_id;

################ COALESCE ---- checks ISNULL 


select E.empl_name as employee , 
	CASE WHEN M.empl_name IS NULL
	THEN 'NO manager'
	ELSE M.empl_name 
	END as manager
from employee E
left join employee M
on M.empid = E.manager_id;


CREATE OR REPLACE PROCEDURE sp_employee1()

LANGUAGE plpgsql
AS $$
DECLARE
BEGIN
	 PERFORM * from employee;
END $$;

CALL sp_employee1()


MYSQL 
################################ NO parameters  ################################

DELIMITER &&  
CREATE PROCEDURE spGetEmployeeDetails()
BEGIN
	select * from student where  roll_no >12;
END &&  
DELIMITER ;  

call spGetEmployeeDetails()

############################### IN variable


DELIMITER &&  
CREATE PROCEDURE spGetEmployeeDetails1(IN var1 int)
BEGIN
	select * from student where  roll_no >var1;
END &&  
DELIMITER ;  

call spGetEmployeeDetails1(15)


################################### IN and OUT


DELIMITER &&  
CREATE PROCEDURE spGetEmployeeDetails2(IN var1 int,OUT length1 int)
BEGIN
	select LENGTH(MAX(emailid)) INTO length1 from student where  roll_no >var1;
END &&  
DELIMITER ;  

call spGetEmployeeDetails2(15,@M)
select @M



DELIMITER &&  
CREATE PROCEDURE spGetEmployeeDetails3(INOUT length1 int)
BEGIN
	select LENGTH(MAX(emailid)) INTO length1 from student where  roll_no >length1;
END &&  
DELIMITER ;  

set @N = 15;
call spGetEmployeeDetails3(@N)
select @N;