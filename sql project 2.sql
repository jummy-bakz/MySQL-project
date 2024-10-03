-- select all data in salaries table

select*
from 
t_salaries;

-- Total salaries paid to employees

select format(sum(salary), " ") as total_salary
from
t_salaries;

-- Total salary paid to each staff since they've joined the organinzation

select emp_no,format(sum(salary)," ")
from
t_salaries
group by
emp_no;

-- To know employees who have earned 500000 and above

select emp_no,format(sum(salary)," ")
from
t_salaries
group by
emp_no
having sum(salary) >= 500000;

-- Remove duplicate

select distinct(emp_no)
from
t_salaries;

-- Total number of employees 

select count(distinct emp_no)
from
t_salaries;

-- Current salary of each staffs

select emp_no,max(salary)
from
t_salaries
group by
emp_no;


-- increment of salary by 20% of employees earning less down 50000 

with mariam as
(select emp_no, max(salary) as current_salary 
from
t_salaries
group by emp_no)
select emp_no,current_salary, 1.2*current_salary as salary_increment
from
mariam
where current_salary < 50000;

-- Total years in which each employees has spent in the organization

select emp_no,count(emp_no) as total_years
from
t_salaries
group by emp_no
having count(emp_no) >=10;
-- Result shows close to 50% employees has spent more than 10 years and above in the organization

-- To make a range 

select*
from
t_salaries
where salary between 50000 and 70000;

-- Case when

with anything as
(select emp_no,max(salary) as present_salary
from
t_salaries
group by emp_no)
select emp_no,present_salary,
case when present_salary >=80000 then "High Salary earners" else "low salary earners" end as salary_status
 from
 anything;
 
 -- Inner join
 
 select e.emp_no,first_name,last_name,gender,salary
 from
 t_employees e
 inner join
 t_salaries s
 on e.emp_no = s.emp_no;
 
  select e.emp_no,first_name,last_name,gender,sum(salary)
 from
 t_employees e
 inner join
 t_salaries s
 on e.emp_no = s.emp_no
 group by emp_no;
 













