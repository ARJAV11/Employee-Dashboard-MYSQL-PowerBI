create database projects;
select*from hr

ALTER table hr
change column ï»¿id  emp_id varchar(20)Null
select*from hr
describe hr;
set sql_safe_updates = 0;

-- Cleaning birthdate column
update hr
set birthdate = case
when birthdate like '%/%' then date_format(str_to_date(birthdate,'%m/%d/%Y'),'%Y-%m-%d')
when birthdate like '%-%' then date_format(str_to_date(birthdate,'%m-%d-%Y'),'%Y-%m-%d')
else null
end;
select*from hr

alter table hr
modify column birthdate date;
select birthdate from hr;
describe hr;

-- cleaning hire_date column
update hr
set hire_date = case
when hire_date like '%/%' then date_format(str_to_date(hire_date,'%m/%d/%Y'),'%Y-%m-%d')
when hire_date like '%-%' then date_format(str_to_date(hire_date,'%m-%d-%Y'),'%Y-%m-%d')
else null
end;
ALTER TABLE hr
MODIFY COLUMN hire_date DATE;
select hire_date from hr;

select termdate from hr;
update hr
set termdate = date(str_to_date(termdate,'%Y-%m-%d %H:%i:%s UTC'))
where termdate is not null and termdate !='';
select termdate from hr;

alter table hr
modify column termdate date;



UPDATE hr
SET termdate = IF(termdate IS NOT NULL AND termdate != '', date(str_to_date(termdate, '%Y-%m-%d %H:%i:%s UTC')), '0000-00-00')
WHERE true;

SELECT termdate from hr;

SET sql_mode = 'ALLOW_INVALID_DATES';

ALTER TABLE hr
MODIFY COLUMN termdate DATE;
describe hr;

-- adding column to the table hr
SET SQL_SAFE_UPDATES = 0;

ALTER TABLE hr
 SET sql_mode = ' ';   

DROP COLUMN age;
alter table hr add column age int;
update hr 
set age = timestampdiff(year , birthdate,curdate());

select birthdate , age from hr;

select 
min(age) as Youngest,
max(age) as oldest
from hr;

select count(*) from hr where age<18;