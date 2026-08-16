use employees;
select * from employees;
#Q1. Find the total number of employees.
select count(*) as total_number from employees;

#Q2. Find the number of male and female employees.
select count(gender='m'),count(gender='f') from employees;

#Q3. Find the earliest and latest employee hire dates.
select min(hire_date) as earliest_date,max(hire_date) as latest_date from employees hire_date;

#Q4. Find employees hired after 1995.
select hire_date,count(*) as employees from employees where hire_date=1995;
select * from employees where year(hire_date)>1995;

#Q5. Find employees born before 1960.
select * from employees where birth_date<'1960-01-1';
select * from employees;

#Q6. Find the top 10 oldest employees.
select * from employees order by birth_date asc limit 10;

#Q7. Find the youngest 10 employees.
select * from employees order by birth_date desc limit 10;

#Q8. Find the average employee age.
select avg(year(curdate())-year(birth_date)) as avg_age from employees;

#Q9. Find the number of employees hired in each year.
select year(hire_date) as hire_year,count(*) as employee_count from employees group by year(hire_date);

#Q10. Find the number of employees hired in each decade.
select floor(year(hire_date)/10) * 10 as decade,count(*)from employees group by floor(year(hire_date)/10) * 10 order by decade ;
#🟡 Level 2 — Salary Analysis

#This is where your Data Analytics thinking starts.

#Salary Questions
select * from salaries;
#Q11. Find the highest salary in the company.
select max(salary) as highest_salary from salaries;

#Q12. Find the lowest salary.
select min(salary) as lowest_salary from salaries;

#Q13. Find the average salary.
select avg(salary) as avg_salary from salaries;

#Q14. Find the median salary.
select avg(salary) as median_salary from (select salary from salaries order by salary limit 2 - (select count(*) from salaries) % 2 offset 
(select(count(*)-1) div 2 from salaries) as middle;

#Q15. Find the top 10 highest-paid employees.
select * from salaries order by salary desc limit 10;

#Q16. Find the bottom 10 lowest-paid employees.
select * from salaries order by salary asc limit 10;

#Q17. Find the second-highest salary.
select max(salary) from salaries where saLary<( select max(salary) from salaries);

#Q18. Find the third-highest salary.
select max(salary) from salaries where saLary < (select max(salary) from salaries where saLary<( select max(salary) from salaries));

#Q19. Find the top 5 salaries without using LIMIT.
select emp_no,salary from(select emp_no,salary, dense_rank() over(order by salary desc) as salary_rank from salaries) as x where salary_rank<=5;

#Q20. Find employees whose salary is greater than the company's average salary.
select * from salaries where salary>(select avg(salary) from salaries);

#🟠 Level 3 — Department Analysis

#Now start thinking like a Data Analyst.

#Department Questions
select * from dept_emp;
select * from departments;
select * from dept_emp as d inner join departments as de on d.dept_no=de.dept_no;
#Q21. Find the number of employees in each department.
select dept_name,count(*) as employess from dept_emp as d join departments as de on d.dept_no=de.dept_no group by dept_name;
select dept_no,count(*) as employees from dept_emp group by dept_no;

#Q22. Find the department with the highest number of employees.
select dept_name,max(emp_no) as employees from dept_emp as d join departments as de on d.dept_no=de.dept_no 
group by dept_name order by employees desc;

#Q23. Find the department with the lowest number of employees.
select dept_name,max(emp_no) as employees from dept_emp as d join departments as de on d.dept_no=de.dept_no 
 group by dept_name order by employees asc;

#Q24. Find the average salary of employees in each department.
select de.dept_name,avg(salary) as emp_salary from dept_emp as d join departments as de on d.dept_no=de.dept_no 
join salaries as s on d.emp_no=s.emp_no group by de.dept_no, de.dept_name;
use employees;
#Q25. Find the department with the highest average salary.
select d.dept_no,avg(s.salary) as avg_salary from dept_emp as d join departments as de on d.dept_no=de.dept_no
 join salaries as s on d.emp_no=s.emp_no group by d.dept_no order by avg_salary desc;

#Q26. Find the department with the lowest average salary.
select de.dept_name,avg(s.salary) as avg_salary from dept_emp as d join departments as de on d.dept_no=de.dept_no
 join salaries as s on d.emp_no=s.emp_no group by de.dept_name order by avg(salary) asc limit 1;

#Q27. Find the total salary expense for each department.
select d.dept_no,de.dept_name,sum(s.salary) as total_salary from dept_emp as d join departments as de on d.dept_no=de.dept_no
join salaries as s on d.emp_no=s.emp_no group by d.dept_no,de.dept_name ;
 
#Q28. Find departments where the average salary is greater than the company average.
select d.dept_no,de.dept_name,round(avg(salary)) as total_salary from dept_emp as d join  departments as de on d.dept_no=de.dept_no 
join salaries as s on d.emp_no=s.emp_no group by d.dept_no,de.dept_name having avg(salary)>(select avg(salary) from salaries);

#Q29. Find the percentage of employees working in each department.
 select d.dept_no,de.dept_name,count(*) as employees,round(count(*)*100.0/(select count(*)from dept_emp),2 ) as percentage from 
dept_emp as d join departments as de on d.dept_no=de.dept_no join salaries as s on d.emp_no=s.emp_no group by d.dept_no,de.dept_name;

#Q30. Rank departments according to average salary.;
select d.dept_no,de.dept_name, avg(s.salary) as avg__salary,rank() over(order by avg(salary) desc) as salary_rank from dept_emp as d 
join departments as de on d.dept_no=de.dept_no join salaries as s on d.emp_no=s.emp_no group by d.dept_no,de.dept_name;
 
#Level 4 — Employee + Salary + Department

#These are very important SQL interview questions.
select * from employees;
select * from dept_emp;
select * from departments;
select * from salaries;
select e.first_name,e.last_name,de.dept_name,s.salary from employees as e join dept_emp d on e.emp_no=d.emp_no
join departments as de on d.dept_no=de.dept_no join salaries as s on e.emp_no=s.emp_no 
where s.to_date='9999-01-01' and d.to_date='9999-01-01' ;


#Q31. Display:Employee Name Department Salary for every employee.
select e.first_name,e.last_name,de.dept_name,s.salary from employees as e join dept_emp d on e.emp_no=d.emp_no
join departments as de on d.dept_no=de.dept_no join salaries as s on e.emp_no=s.emp_no 
where s.to_date='9999-01-01' and d.to_date='9999-01-01' ;

#Q32. Find the highest-paid employee in each department.
select e.first_name,e.last_name,de.dept_name,max(s.salary) as highest_salary from employees as e join dept_emp as d on e.emp_no=d.emp_no
join departments as de on d.dept_no=de.dept_no join salaries as s on e.emp_no=s.emp_no group by e.first_name,e.last_name,de.dept_name order by dept_name desc;

#Q33. Find the lowest-paid employee in each department.
select de.dept_name,min(s.salary) as lowest_salary from employees as e join dept_emp as d on e.emp_no=d.emp_no
join departments as de on d.dept_no=de.dept_no join salaries as s on e.emp_no=s.emp_no group by de.dept_name order by dept_name desc;

#Q34. Find the top 3 highest-paid employees from each department.
select de.dept_name,max(s.salary) as highest_salary from employees as e join dept_emp as d on e.emp_no=d.emp_no
join departments as de on d.dept_no=de.dept_no join salaries as s on e.emp_no=s.emp_no group by e.first_name,e.last_name,
de.dept_name order by dept_name desc limit 3;

#Q35. Find employees earning more than their department's average salary.
select e.emp_no,e.first_name,s.salary,de.dept_name from employees as e join dept_emp as d on e.emp_no=d.emp_no
join departments as de on d.dept_no=de.dept_no join salaries as s on e.emp_no=s.emp_no where s.salary>(select avg(s2.salary) from salaries s2 
join dept_emp de2 on s2.emp_no=de2.emp_no where de2.dept_no=de.dept_no);

SELECT e.emp_no,e.first_name,s.salary,de.dept_name FROM employees e JOIN dept_emp d ON e.emp_no = d.emp_no 
JOIN departments de ON d.dept_no = de.dept_no JOIN salaries s ON e.emp_no = s.emp_no JOIN (
SELECT d.dept_no,AVG(s2.salary) AS avg_salary FROM dept_emp d JOIN salaries s2 ON d.emp_no = s2.emp_no GROUP BY d.dept_no)
 a ON d.dept_no = a.dept_no WHERE s.salary > a.avg_salary;

#Q36. Find employees earning less than their department's average salary.


#Q37. Find the salary difference between each employee and their department's average salary.


#Q38. Find the salary difference between the highest and lowest salary in each department.


#Q39. Find the department having the highest total salary expenditure.

#Q40. Find the department having the highest salary inequality/range.

show databases;
#Q21. Display all employees.
select * from employees;

#Q22. Display only employee first names.
select first_name from employees;

#Q23. Display employee ID and employee name.
select emp_no,first_name,last_name from employees;

#Q24. Find the total number of employees.
select count(*) as total_employees from employees;

#Q25. Find the number of male employees.
select count(gender) from employees where gender="m";

#Q26. Find the number of female employees.
select count(gender) from employees where gender="f";

#Q27. Find employees whose gender is M.
select * from employees where gender="m";

#Q28. Find employees whose gender is F.
select * from employees where gender='f';

#Q29. Find employees hired after 1990.
select * from employees where year(hire_date) > 1990;

#Q30. Find employees hired before 1990.
select * from employees where year(hire_date)< 1990;

#Q31. Find employees born after 1960.
select * from employees where year(birth_date)>1990;

#Q32. Find employees born before 1960.
select * from employees where year(birth_date)<1960;

#Q33. Find employees whose first name is Georgi.
select * from employees where first_name like "Georgi";

#Q34. Find employees whose first name starts with A.
select * from employees where first_name like "A%";
#Q35. Find employees whose last name starts with S.
select * from employees where first_name like "S%";

#Q36. Find employees hired in 1995.
select * from employees where year(hire_date)=1995;

#Q37. Find the earliest hire date.
select min(hire_date) as earliest from employees;

#Q38. Find the latest hire date.
select max(hire_date) as earliest from employees;

select * from salaries;
#Q39. Find the highest salary.
select max(salary) as highest_salary from salaries;

#Q40. Find the lowest salary.
select min(salary) as lowest_salary from salaries;

# After these, slightly harder

#Q41. Find the average salary.
select avg(salary) as avg_salary from salaries;

#Q42. Find the total salary.
select sum(salary) as total_salary from salaries;

#Q43. Find the top 5 highest salaries.
select salary as top_salary from salaries order by salary desc limit 5;

#Q44. Find the bottom 5 salaries.
select salary as bottom_salary from salaries order by salary asc limit 5;

#Q45. Count employees hired in 1990.
select count(*) as total_employee from employees where year(hire_date)=1990 ;

#Q46. Count employees hired after 1995.
select count(*) as total_employees from employees where year(hire_date)=1995;

#Q47. Find employees whose salary is greater than 50,000.
select e.first_name,e.last_name,s.salary from employees as e join salaries as s on e.emp_no=s.emp_no where salary>50000;

#Q48. Find employees whose salary is between 40,000 and 60,000.
select e.first_name,e.last_name,s.salary from employees as e join salaries as s on e.emp_no=s.emp_no where salary between 40000 and 60000;

#Q49. Find employees whose first name starts with M.
select * from employees where first_name like "M%";

#Q50. Find employees whose last name ends with son.
select * from employees where last_name like "%son";

#We'll mainly practice INNER JOIN using employees, dept_emp, and departments.

#🟢 Simple JOIN Questions — Q51 to Q60
select * from employees;
select * from departments;
#Q51. Display employee ID, first name, and department number.
select e.emp_no,e.first_name,de.dept_no from employees as e join dept_emp as d on e.emp_no=d.emp_no join departments 
as de on d.dept_no=de.dept_no;

#Q52. Display employee first name and department name.
select e.emp_no,e.first_name,de.dept_name from employees as e join dept_emp as d on e.emp_no=d.emp_no join departments
as de on d.dept_no=de.dept_no;

#Q53. Display employee ID, employee name, and department name.
select e.emp_no,e.first_name,e.last_name,de.dept_name from employees as e join dept_emp as d on e.emp_no=d.emp_no join departments
as de on d.dept_no=de.dept_no;

#Q54. Find all employees who work in the Sales department.
select e.emp_no,e.first_name,e.last_name,de.dept_name from employees as e join dept_emp as d on e.emp_no=d.emp_no join departments
as de on d.dept_no=de.dept_no where dept_name="sales";

#Q55. Find all employees who work in the Development department.
select e.emp_no,e.first_name,e.last_name,de.dept_name from employees as e join dept_emp as d on e.emp_no=d.emp_no join departments
as de on d.dept_no=de.dept_no where dept_name="Development";

#Q56. Find the total number of employees in the Sales department.
select count(e.emp_no) as total,de.dept_name from employees as e join dept_emp as d on e.emp_no=d.emp_no join departments
as de on d.dept_no=de.dept_no where dept_name="sales" group by dept_name;

#Q57. Display all employees and their department names.
select e.first_name,e.last_name,de.dept_name from employees as e join dept_emp as d on e.emp_no=d.emp_no join departments
as de on d.dept_no=de.dept_no;

#Q58. Find employees working in the Marketing department.
select count(e.emp_no) as total,de.dept_name from employees as e join dept_emp as d on e.emp_no=d.emp_no join departments
as de on d.dept_no=de.dept_no where dept_name="Marketing" group by dept_name;

#Q59. Display employee first name, last name, and department name for employees whose first name starts with A.
select e.first_name,e.last_name,de.dept_name from employees as e join dept_emp as d on e.emp_no=d.emp_no join departments 
as de on d.dept_no=de.dept_no where first_name like "A%";

#Q60. Count how many employees are working in each department.
select de.dept_name,count(e.emp_no) as total from employees as e join dept_emp as d on e.emp_no=d.emp_no join departments as de
on d.dept_no=de.dept_no group by dept_name;

#Q61. Display employee first name and department name.
select e.first_name,de.dept_name from employees as e join dept_emp as d on e.emp_no=d.emp_no join departments
as de on d.dept_no=de.dept_no;


#Q62. Display employee last name and department name.
select e.last_name,de.dept_name from employees as e join dept_emp as d on e.emp_no=d.emp_no join departments
as de on d.dept_no=de.dept_no;

#Q63. Display employee ID, first name, and department name.
select e.emp_no,e.first_name,de.dept_name from employees as e join dept_emp as d on e.emp_no=d.emp_no join departments
as de on d.dept_no=de.dept_no;


#Q64. Find all employees working in the Finance department.
select e.emp_no,e.first_name,e.last_name,de.dept_name from employees as e join dept_emp as d on e.emp_no=d.emp_no join departments
as de on d.dept_no=de.dept_no where dept_name="Finance";

#Q65. Find all employees working in the Production department.
select e.emp_no,e.first_name,e.last_name,de.dept_name from employees as e join dept_emp as d on e.emp_no=d.emp_no join departments
as de on d.dept_no=de.dept_no where dept_name="Production";

#Q66. Find all employees working in the Customer Service department.
select e.emp_no,e.first_name,e.last_name,de.dept_name from employees as e join dept_emp as d on e.emp_no=d.emp_no join departments
as de on d.dept_no=de.dept_no where dept_name="customer service";

#Q67. Find all employees working in the Human Resources department.
select e.emp_no,e.first_name,e.last_name,de.dept_name from employees as e join dept_emp as d on e.emp_no=d.emp_no join departments
as de on d.dept_no=de.dept_no where dept_name="human resources";

#Q68. Find all employees working in the Research department.
select e.emp_no,e.first_name,e.last_name,de.dept_name from employees as e join dept_emp as d on e.emp_no=d.emp_no join departments
as de on d.dept_no=de.dept_no where dept_name="research";

#Q69. Display employees who joined the company after 1995 along with their department name.
select e.emp_no,e.first_name,e.last_name,de.dept_name,e.hire_date from employees as e join dept_emp as d on e.emp_no=d.emp_no join departments
as de on d.dept_no=de.dept_no where year(hire_date)>1995;

#Q70. Display employees whose gender is M along with their department name.


#Q71. Display employees whose gender is F along with their department name.

#Q72. Display employees whose first name starts with A along with their department name.

#Q73. Display employees whose last name starts with S along with their department name.

#Q74. Find the number of employees in the Finance department.

#Q75. Find the number of employees in the Sales department.

#Q76. Find the number of employees in the Marketing department.

#Q77. Display employee first name, last name, and department name for employees hired after 1990.

#Q78. Display employee name and department name for employees born before 1960.

#Q79. Display all department names with their employee IDs.

#Q80. Count the number of employees in each department.

