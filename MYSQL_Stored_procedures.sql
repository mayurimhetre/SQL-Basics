use test;

select * from student;

DELIMITER &&  
CREATE PROCEDURE spGetEmployeeDetails()
BEGIN
	select * from student where  roll_no >12;
END &&  
DELIMITER ;  

call spGetEmployeeDetails()



DELIMITER &&  
CREATE PROCEDURE spGetEmployeeDetails1(IN var1 int)
BEGIN
	select * from student where  roll_no >var1;
END &&  
DELIMITER ;  

call spGetEmployeeDetails1(15)



DELIMITER &&  
CREATE PROCEDURE spGetEmployeeDetails1(IN var1 int)
BEGIN
	select LENGTH(MAX(emailid)) from student where  roll_no >12;
END &&  
DELIMITER ;  

call spGetEmployeeDetails1(15)


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






