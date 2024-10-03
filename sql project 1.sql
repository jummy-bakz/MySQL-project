select*
from
 employees_mod.  t_employees
order by 3,4;

-- Select all the data in employees tables

select*
from
t_employees;

-- Whenever we want to filter

select*
from
t_employees
where gender = "F";

-- Select Data we are going to be using

select emp_no,first_name,hire_date
from
t_employees
where
emp_no = 10011;

select emp_no,first_name,hire_date
from
t_employees
where
emp_no = 10011 or emp_no = 10012;

-- select employees whose their first_name start with "S"

select*
from
t_employees
where first_name like "s%";

-- Select employees whose their last_name end with i

select*
from
t_employees
where last_name like "%i";

-- Select employees whose their last_name has "a"

select*
from
t_employees
where last_name like "%a%";

-- Select employees whose their last_name end with "i" and whose their last_name has "a"

select*
from
t_employees
where last_name like "%a%" and first_name like "s%";

-- change first_name to capital letter

select upper(first_name)
from
t_employees;

-- To combine first_name and last_name together

select first_name, last_name, concat(first_name, " ", last_name) as "full name"
from
t_employees;

-- To filter female employees that are born in july

select emp_no,birth_date,first_name,last_name,gender,month(birth_date) as birth_month
from
t_employees
where month(birth_date) = 7 and gender = "f" ;

-- Total number of females and males using common table expression

with mariam as
(select emp_no,birth_date,first_name,last_name,gender,month(birth_date) as birth_month
from
t_employees
where month(birth_date) = 7)
select gender,count(gender) as total_gender
from
mariam
group by gender;










