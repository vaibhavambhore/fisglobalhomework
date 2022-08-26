create database Assignment_2

use Assignment_2

create table tblDept
(
	DeptNo int primary key,
	DName varchar(30),
	Loc varchar(30)
)

create table tblEmp
(  EmpNo int Primary Key,
   EName varchar(30),
   Job varchar(30),
   MgrId int,
   HireDate Date,
   Salary float,
   Comm int,
   DeptNo int references tblDept(DeptNo)
)

select EmpNo, EName, Job, MgrId, HireDate, Salary, Comm, DeptNo from tblEmp;


select * from tblDept;

--Insert into table Department
insert into tblDept Values(10,'ACCOUNTING','NEW YORK'),
(20,'RESEARCH','DALLAS'),
(30,'SALES','CHICAGO'),
(40,'OPERATIONS','BOSTON')



Insert into tblEmp Values(7369,'SMITH','CLERK',7902,'1980-12-17',800,NULL,20),
(7499,'ALLEN','SALESMAN',7698,'1981-02-20',1600,300,30),
(7521,'WARD','SALESMAN',7698,'1981-02-22',1250,500,30),
(7566,'JONES','MANAGER',7839,'1981-04-02',2975, null,20),
(7654,'MARTIN','SALESMAN',7698,'1981-09-28',1250,1400,30),
(7698,'BLAKE','MANAGER',7839,'1981-05-01',2850,null,30),
(7782,'CLARK','MANAGER',7839,'1981-06-09',2450,null,10),
(7788,'SCOTT','ANALYST',7566,'1987-04-19',3000,null,20),
(7839,'KING','PRESIDENT',null,'1981-11-17',5000,null,10),
(7844,'TURNER','SALESMAN',7698,'1981-09-08',1500,0,30),
(7876,'ADAMS','CLERK',7788,'1987-05-23',1100,null,20),
(7900,'JAMES','CLERK',7698,'1981-12-03',950,null,30),
(7902,'FORD','ANALYST',7566,'1981-12-03',3000,null,20),
(7934,'MILLER','CLERK',7782,'1982-01-23',1300,null,10)

--ASSIGNMENT QUESTIONS

-- 1. List all employees whose name begins with 'A'. 
select * from tblEmp where EName like 'A%'

-- 2. Select all those employees who don't have a manager. 
select * from tblEmp where MgrId is null;

-- 3. List employee name, number and salary for those employees who earn in the range 1200 to 1400.
select EmpNo, EName, Salary from tblEmp where Salary between 1200 and 1400

-- 4. Give all the employees in the RESEARCH department a 10% pay rise. Verify that this has been done by listing all their details before and after the rise. 
   
   select * from tblEmp
   where DeptNo = (Select DeptNo from tblDept where DName='Research')

   update tblEmp
   set Salary = Salary+(Salary*10/100)
   where DeptNo = (Select DeptNo from tblDept where DName='Research')

   select * from tblEmp
   where DeptNo = (Select DeptNo from tblDept where DName='Research')

-- 5. Find the number of CLERKS employed. Give it a descriptive heading. 
   select count(*) as 'Number of Clerk' from tblEmp 
   where job='CLERK'

-- 6. Find the average salary for each job type and the number of people employed in each job. 
   select Job, Count(*), Avg(Salary) as 'Average Salary' from tblEmp
   group by Job

-- 7. List the employees with the lowest and highest salary. 
   select * from tblEmp
   where Salary in (select min(Salary) from tblEmp) or Salary in (select max(Salary) from tblEmp)


-- 8. List full details of departments that don't have any employees.
   select * from tblDept
   where DeptNo not in (select DeptNo from tblEmp)

-- 9. Get the names and salaries of all the analysts earning more than 1200 who are based in department 20. Sort the answer by ascending order of name. 
   select EName, Salary from tblEmp
   where Job='ANALYST' and Salary > 1200 and DeptNo = 20
   order by EName

-- 10. For each department, list its name and number together with the total salary paid to employees in that department. 
   select e.DeptNo, d.Dname, sum(e.Salary) as 'Total Salary'
   from tblEmp e , tblDept d 
   where e.DeptNo = d.DeptNo
   group by e.DeptNo, d.DName
   

-- 11. Find out salary of both MILLER and SMITH.
   select Ename, Salary from tblEmp
   where EName in ('MILLER','SMITH')

-- 12. Find out the names of the employees whose name begin with �A� or �M�. 
   select EName from tblEmp
   where EName like '[AM]%'

-- 13. Compute yearly salary of SMITH. 
   Select EName , Salary*12 as 'Yearly Salary'
   from tblEmp
   where EName='SMITH'

-- 14. List the name and salary for all employees whose salary is not in the range of 1500 and 2850. 
   select EName, Salary from tblEmp
   where Salary not between 1500 and 2850

-- 15. display list of managers who have more than 2 employees reporting to them
	select MgrId, count(EmpNo) as EMP_COUNT 
	from tblEmp  
	group by MgrId 
	having count(EmpNo) > 2;
	