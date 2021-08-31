select ascii('A')

select chr(65) as m


select chr(90)

do $$
declare 
   start integer := 65;
begin
   while start <= 90 loop
      raise notice 'start %', chr(start);
	  start := start + 1;
   end loop;
end$$;


set search_path TO mayuri

select * from employee


select LTRIM('    mayuri   ')

select RTRIM('mayuri  ')


select length('mayu')


select 'mayuri', reverse('MaYURI') as m


select * from employee


select empl_name, length(empl_name) as count ,lower(empl_name) as lower , reverse(empl_name),
CASE WHEN reverse(empl_name) = empl_name THEN 'Match'
ELSE 'NO match'
END as check
from employee



select right('mayuri',2)

select left('mayuri',3)


select empl_name from employee
select position('3' IN 'chai2')


select substring('mayuri mhetre',1,6)


select * from employee

alter table employee add email varchar(50)

update employee set email ='mhetremayuri25@gmail.com'


insert into mayuri.employee values(201,'Ranjana',2,'Female',500,3,'rang@sbi.co.in');

select distinct(email) from employee;

select distinct(substring(email, position('@'IN email)+1, length(email)-position('@'IN email))) as domainName
from employee

select substring(email, position('@'IN email)+1, length(email)-position('@'IN email)) as domainName,
count(*)
from employee
group by domainName

select substring(email, 1,position('@'IN email)-1) as personname,
count(*)
from employee
group by personname


select repeat('mayur ',2)

select email from employee

select email , 
substring(email,1,2) || repeat('*',position('@'IN email)-4)|| substring(email,position('@'IN email)-1,position('@'IN email)-1) as hashemail,
substring(email,1,position('@'IN email)-1) as personaname
from employee

insert into mayuri.employee values(202,'Sarika',2,'Female',500,3,'rang@sbi.co.in');
insert into mayuri.employee values(203,'Sarika1',2,'Female',500,3,'rang1@sbi.co.in');
insert into mayuri.employee values(204,'Sarika2',2,'Female',500,3,'rang2@sbi.co.in');


select email from employee;

select email as original , replace(email,'.com','.net') as changedemail 
from employee


select email, substring(email, 1,1)|| repeat('*',3)||substring(email,2,length(email)) as change,
replace (email, '@','#') as new_email,
CASE WHEN substring(email, position('@'IN email)+1, length(email)-position('@'IN email)) = 'gmail.com'
THEN 'MATCH'
ELSE 'OFFICE EMAIL ID'
END as chcek
from employee
