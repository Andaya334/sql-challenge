
--1.
SELECT e.emp_no, e.last_name, e.first_name, e.sex,
(SELECT s.salary FROM salaries AS s 
WHERE e.emp_no = s.emp_no) AS salary				
FROM employees AS e
;

--2.
select emp_no, last_name, first_name, hire_date 
from employees 
where extract(year from hire_date) = 1986;

--3.
select distinct on (dept_manager.dept_no) dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
from dept_manager 
inner join departments 
on dept_manager.dept_no= departments.dept_no
inner join employees 
on dept_manager.emp_no = employees.emp_no
;

--4.
select distinct on (e.emp_no) e.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e
left join dept_emp as de
on e.emp_no = de.emp_no
inner join departments as d
on de.dept_no = d.dept_no
;

--5.
select e.last_name, e.first_name
from employees as e
where (e.first_name = 'Hercules') and (lower(e.last_name) like 'b%')
;

--6.
select distinct on (emp_no) * into current_sales_dept_emp
from dept_emp
;

select e.emp_no, e.first_name, e.last_name, d.dept_name
from employees as e
inner join current_sales_dept_emp as csde
on e.emp_no = csde.emp_no
inner join departments as d
on csde.dept_no = d.dept_no
where lower(d.dept_name) = 'sales';

--7.
select e.emp_no, e.first_name, e.last_name, d.dept_name
from employees as e
inner join current_sales_dept_emp as csde
on e.emp_no = csde.emp_no
inner join departments as d
on csde.dept_no = d.dept_no
where (lower(d.dept_name) = 'sales') or (lower(d.dept_name) = 'development');

--8.
select e.last_name, count(e.last_name) as frequency
from employees as e
group by e.last_name
order by frequency DESC;