create database DeepakMYSQL;
show databases;
use DeepakMYSQL;
create table students(student_id int,name varchar(20),age int,city varchar(30));
alter table students add primary key(student_id);
describe students;

insert into students values(1,"Deepak",20,"Mahagaon"),(2,"Rohit",19,"Kolhapur"),(3,"Sahil",20,"Mahagaon"),(4,"Amey",20,"Gadhinglaj"),(5,"Ram",20,"Harali");
select * from students;

select name,city from students;

select * from students where age>19;

select * from students where city="Mahagaon";

select * from students order by age asc;
select * from students order by name asc;
select * from students order by name desc;

update students set city="pune" where student_id=3;
select * from students;
update students set age=21 where student_id=2;
select * from students;

delete from students where student_id=5;
select * from students;

select count(student_id) from students;

select max(age) from students;

select min(age) from students;

select round(avg(age)) from students;

select count(student_id) from students group by city;
select * from students;
update students set city="pune" where student_id=1;
select city,count(*) as total_students from students group by city having count(*)>1;

select * from students limit 3;

create table t1(id int primary key);
describe t1;
select * from t1;

create table t2(name varchar(20) not null);
select * from t2;
describe t2;

create table t3(email varchar(20) unique);
describe t3;

create table t4(id int primary key,name varchar(20) not null,email varchar(40) unique,city varchar(30) default "Pune",age int check (age>=18));
describe t4;

insert into t4 values(1,"Deepak","deepak12@gmail.com",city,19),(2,"Rahul","rohit23@gmail.com",city,23),(7,"123","ram12@gmail.com",city,12);
select * from t4;

create table dep1(dep_id int primary key,dep_name varchar(20));
insert into dep1 values(11,"BCA"),(12,"BCS"),(13,"BBA");
select * from dep1;

create table emp(emp_id int,emp_name varchar(20),dep_id int,foreign key(dep_id) references dep1(dep_id));
insert into emp values(110,"Ram",11),(120,"Amey",12),(130,"Rohit",13);

select * from emp;
create database collage;
use collage;
show databases;

create table employee(emp_id int,emp_nmae varchar(20),salary int,age int check (age>=18),Dep_name varchar(20));
describe employee;

alter table employee add primary key(emp_id);
describe employee;

alter table employee add not null(emp_nmae);
alter table employee rename column emp_nmae to name12;
describe employee;

alter table employee modify name12 varchar(40);
describe employee;

alter table employee modify salary int;
describe employee;

alter table employee drop dep_name;
describe employee;

describe employee;

alter table employee add unique(age);
describe employee;

alter table employee add unique(age);
describe employee;

alter table employee add salary int default(200000);
describe employee;

insert into employee values(1,"deepak",20000,19),(2,"rohit",40000,20),(3,"sahil",25000,21),(4,"pranav",80000,25);
select * from employee;

select * from employee where age>=20;

select name12 from employee;

select emp_id,salary from employee;

update employee set name12="rahul" where emp_id=2;
select * from employee;

delete from employee where emp_id=4;
select * from employee;

insert into employee values(4,"amey",50000,22);
select * from employee;

select sum(salary) from employee;
select round(avg(salary)) from employee;

select count(age) from employee;
select sum(age) from employee;
select max(age) from employee;

select * from employee;
select salary,sum(emp_id) from employee group by salary;

select * from employee order by salary asc;
select * from employee order by salary desc;

truncate table employee;
select * from employee;

use collage;
create table student1(id int,name varchar(40),email varchar(10));
select * from student1;
select name as student_name from student1;
select s.id,s.name,s.email from student1 as s;
select * from student1;

create table student0(student_id int primary key auto_increment,student_name varchar(40),dept_id int);
insert into student0 (student_name,dept_id) values ("Deepak",1),("rohit",2),("sahil",3),("Amey",4),("Omkar",5);
select * from student0;

create table depart(dept_id int primary key auto_increment,dept_name varchar(40));
insert into depart (dept_name) values ("BCA"),("BCS"),("BBA"),("BSc"),("Bcom");
select * from depart;

select s.student_name,d.dept_name from student0 as s inner join depart as d on s.dept_id=d.dept_id; 

create table s1(marks int);
select * from s1;
select marks as score from s1;

select employee_salary as salary from d1;
use collage;

create table st(student_id int primary key auto_increment,city varchar(20));
insert into st(city) values ("Pune"),("Delhi"),("mumbai"),("Kolhapur"),("Pune");
select* from st;
select * from st where city in('Pune','Delhi');
select * from st where student_id in(2,4,6);

select * from st where city not in('Mumbai');

alter table st add age int;
select * from st;
update st set age=23 where student_id=1;
update st set age=20 where student_id=2;
update st set age=24 where student_id=3;
update st set age=25 where student_id=4;
update st set age=19 where student_id=5;
select * from st where age between 21 and 25;

alter table st add salary int;
update st set salary=22000 where student_id=1;
update st set salary=20000 where student_id=2;
update st set salary=40000 where student_id=3;
update st set salary=54000 where student_id=4;
update st set salary=23000 where student_id=5;
select * from st;
select * from st where salary between 30000 and 50000;

alter table st add marks int;
update st set marks=90 where student_id=1;
update st set marks=88 where student_id=2;
update st set marks=60 where student_id=3;
update st set marks=45 where student_id=4;
update st set marks=65 where student_id=5;
select * from st where marks not between 60 and 80; 

create table stud(student_id int primary key auto_increment,student_name varchar(30));
insert into stud(student_name) values("Rahul"),("Rohit"),("Ravindra"),("Reshma"),("Rupail"),("Ramesh");
select * from stud where student_name like '_____';
select * from stud where student_name like '%a';

select * from st ;
select * from st where city='Pune' or age=20;
select * from st where city='Pune' and city='Delhi';
select * from st where age>18 or age<22;

alter table st add dept varchar(60);
update st set dept="HR" where student_id=1;
update st set dept="IT" where student_id=2;
update st set dept="BCA" where student_id=3;
update st set dept="HR" where student_id=4;

select * from st where Dept='HR' or salary=40000;
select * from st where Dept='HR' or Dept='IT';

INSERT INTO employee (name, email, age, city, salary) VALUES ('Amit', 'amit@gmail.com', 25, 'Pune', 35000), 
('Sneha', 'sneha@gmail.com', 28, 'Mumbai', 45000), ('Rahul', 'rahul@gmail.com', 22, 'Kolhapur', 28000), 
('Anjali', 'anjali@gmail.com', 30, 'Pune', 40000), ('Vikas', 'vikas@gmail.com', 35, 'Mumbai', 55000);

# Create a database named company and use it.
create database company;
use company;

#Create an employee table with:
#emp_id → Primary Key + Auto Increment
#name → NOT NULL
#email → UNIQUE
#age → CHECK(age >= 18)
#city → DEFAULT 'Pune'

create table employee(emp_id int primary key auto_increment,name varchar(40),email varchar(30) unique,age int check (age>=18),city varchar(40) default 'Pune');

#Use DESC to display the structure of the employee table.
describe employee;

#Insert 5 employees into the table.
INSERT INTO employee (name, email, age, city) VALUES ('Amit', 'amit@gmail.com', 25, 'Pune'), 
('Sneha', 'sneha@gmail.com', 28, 'Mumbai'), ('Rahul', 'rahul@gmail.com', 22, 'Kolhapur'), 
('Anjali', 'anjali@gmail.com', 30, 'Pune'), ('Vikas', 'vikas@gmail.com', 35, 'Mumbai');

#Display all employees using SELECT.
select * from employee;
alter table employee add salary int;
update employee set salary=40000 where emp_id=1;
update employee set salary=70000 where emp_id=2;
update employee set salary=33000 where emp_id=3;
update employee set salary=30000 where emp_id=4;
update employee set salary=60000 where emp_id=5;

select * from employee;
#Display only name and salary of employees whose salary is greater than 30000.
select name,salary from employee where salary>30000;

# Find employees whose name starts with A using LIKE.
select * from employee where name like 'A%';

#Find employees whose salary is between 25000 and 50000.
select * from employee where salary between 25000 and 50000;

#Find employees who are from Pune, Mumbai, or Kolhapur using IN.
select * from employee where city in ("Pune","Mumbai","Kolhapur");

#Find employees who are from Pune AND have salary greater than 30000.
select city,salary from employee where city="Pune" or salary>30000;
#Display unique cities using DISTINCT.
select distinct city from employee;

#12. Display name as Employee_Name and salary as Monthly_Salary using Alias (AS).
select name as Employee_name,salary as Monthly_salary from employee;

#13. Count the total number of employees using COUNT().
select count(*) from employee;

#14. Update the salary of the employee whose emp_id = 3 to 45000.
update employee set salary=45000 where emp_id=3;
select * from employee;

#Use ALTER and MODIFY:
#Add a phone column.
alter table employee add phone int;
describe employee;

#Change the name column to VARCHAR(100).
alter table employee modify name varchar(100);
describe employee;

create database sahil;
use sahil;
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50),
    City VARCHAR(50),
    Age INT,
    Marks INT);

INSERT INTO Students (StudentID, Name, City, Age, Marks)
VALUES
(1, 'Rohit', 'Pune', 20, 85),
(2, 'Amit', 'Mumbai', 21, 72),
(3, 'Priya', 'Pune', 20, 90),
(4, 'Neha', 'Delhi', 22, 65),
(5, 'Rahul', 'Mumbai', 21, 78),
(6, 'Sneha', 'Pune', 19, 88),
(7, 'Kiran', 'Delhi', 20, 55),
(8, 'Pooja', 'Mumbai', 22, 92),
(9, 'Akash', 'Pune', 21, 70),
(10, 'Riya', 'Delhi', 19, 80);

select * from Students;

#Display the number of students in each city.
select city,count(*) from Students group by city;

#Display the number of students for each age.
select age,count(*) from Students group by age;

#Find the total marks city-wise.
select city,sum(marks) from Students group by city;

#Find the average marks city-wise.
select city,avg(marks) from Students group by city;

#Find the maximum marks for each city.
select city,max(marks) from Students group by city;

#Find the minimum marks for each city.
select city,min(marks) from Students group by city;

#Intermediate Questions
#Display cities having more than 2 students.
select city,count(*) from Students group by city having count(*)>2;

#Display cities where the average marks are greater than 70.
select city,avg(marks) from Students where marks>70 group by city;

#Find the total number of students in each city using COUNT(*).
select city,count(*) from students group by city;

#Display the total marks and average marks for each city.
select city,sum(marks),avg(marks) from Students group by city;

#Group students by City and Age.
select city,count(*) and age,count(*) from Students group by city and age;

#Find the highest marks in each age group.
select age,max(marks) from Students group by age;

#Practice Table: Employees
CREATE TABLE Emp1 (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(50),
    Department VARCHAR(50),
    Salary INT);

INSERT INTO Emp1 (EmpID, Name, Department, Salary)
VALUES
(101, 'Rohit', 'IT', 60000),
(102, 'Amit', 'HR', 45000),
(103, 'Priya', 'IT', 70000),
(104, 'Neha', 'Sales', 55000),
(105, 'Rahul', 'HR', 50000),
(106, 'Sneha', 'IT', 65000),
(107, 'Kiran', 'Sales', 40000),
(108, 'Pooja', 'HR', 48000),
(109, 'Akash', 'IT', 75000),
(110, 'Riya', 'Sales', 52000);

select * from Emp1;

#Count employees in each department.
select department,count(*) from Emp1 group by department;

#Find the total salary department-wise.
    select department,sum(salary) from Emp1 group by department;

#Find the average salary of each department.
select department,avg(salary) from Emp1 group by department;

#Find the highest salary in each department.
select department,max(salary) from Emp1 group by department;

#Find the lowest salary in each department.
select department,min(salary) from Emp1 group by department;

#Display departments having more than 5 employees.
select department,count(*) from Emp1 group by department having count(*)>3;

#Display departments where the average salary is greater than 50,000.
select department,avg(salary) from Emp1 where salary>50000 group by department;

#Find the total and average salary for each department.
select department,sum(salary),avg(salary) from  Emp1 group by department;

#Find cities having the highest number of students.
select city,count(*) from Students group by city having count(*)=(select max(student_count) from (select count(*) as student_count
 from Students group by city) as counts);

#Find departments with a total salary greater than 1,00,000.
select department,sum(salary) from Emp1 group by department having sum(salary)>100000;

#Group students by city and display only groups with more than one student.
select city,count(*) from Students group by city having count(*)>1;

#Find the average marks for each city and sort from highest to lowest.
select city,avg(marks) from Students group by city order by city desc;

#Find the total number of students for each City and Age combination.
select city,age,count(*) as total_student from Students group by city,age;

#Display cities having more than 2 students.
select city,count(*) as total_student from Students group by city having count(*)>2; 

#Display cities having exactly 2 students.
select city,count(*) as total_student from Students group by city having count(*)=2; 

#Display cities where the average marks are greater than 70.
select city,avg(marks) from Students where marks>70 group by city;

#Display cities where the maximum marks are greater than 90.
select city,max(marks) from Students where marks>90 group by city;
select * from Students;

#Display cities where the minimum marks are less than 40.
select city,min(marks) from Students where marks<40 group by city;
#Intermediate

#Display departments having more than 5 employees.
select department,count(*) from Emp1 group by department having count(*)>3;
select * from Emp1;
#Display departments where the average salary is greater than 50,000.
select department,avg(salary) from Emp1 group by department having avg(salary)>50000;

#Display departments where the total salary is greater than 1,00,000.
select department,sum(salary) from Emp1 group by department having sum(salary)>100000;


#Display departments where the maximum salary is greater than 80,000.
select department,max(salary) from Emp1 group by department having sum(salary)>80000;


#Display departments where the minimum salary is less than 30,000.
select department,min(salary) from Emp1 group by department having sum(salary)<30000;
Advanced
#Find cities having more than 2 students and average marks greater than 75.
select city,count(*),avg(marks) from Students group by city having count(*)>2,avg(marks)>75;
use sahil;
select * from Emp1;
#Find departments having more than 3 employees and total salary greater than 2,00,000.
select department,avg(salary) as total_salary from Emp1 group by department having total_salary>40000;

#Group students by City and display only groups where the total marks are greater than 200.
select city,sum(marks) as total_marks from Students group by city having total_marks>200;

#Group employees by Department and display departments where the average salary is between 40,000 and 60,000.
select department,avg(salary) from Emp1 group by department having avg(salary)between 40000 and 60000;

#Find cities having exactly 3 students.
select city,count(*) from Students group by city having count(*)=3;









