
c

create table Clients
(
	Client_ID int primary key,
	Cname varchar(40) not null,
	Address varchar(30),
	Email varchar(30) unique,
	Phone float,
	Business varchar(20) not null
)

drop table Clients

insert into Clients values(1001,'ACME Utilities','Noida','contact@acmeutil.com',9567880032,'Manufactyring')
insert into Clients values(1002,'Trackon Consultants','Mumbai','consult@trackon.com',8734210090,'Consulting')
insert into Clients values(1003,'MoneySaver Distributors','Kolkata','save@moneysaver.com',7799886655,'Reseller')
insert into Clients values(1004,'Lawful Corp','Chemmai','justice@lawful.com',9210342219,'Manufactyring')

select * from Clients

create table Employees
(
	Empno int primary key,
	Ename varchar(20) not null,
	Job varchar(15),
	Salary int,
	Deptno int references Departments(Deptno)
)

alter table Employees
add constraint salchk check(salary>=0)

insert into Employees values(7001,'Sandeep','Analyst',2500,10)
insert into Employees values(7002,'Rajesh','Designer',30000,10)
insert into Employees values(7003,'Madhav','Developer',40000,20)
insert into Employees values(7004,'Manoj','Developer',40000,20)
insert into Employees values(7005,'Abhay','Designer',35000,10)
insert into Employees values(7006,'Uma','Tester',30000,30)
insert into Employees values(7007,'Gita','Tech. Writer',30000,40)
insert into Employees values(7008,'Priya','Tester',35000,30)
insert into Employees values(7009,'Nutan','Developer',45000,20)
insert into Employees values(7010,'Smita','Analyst',20000,10)
insert into Employees values(7011,'Anand','Project Mgr',65000,10)

update Employees set salary=25000 where Empno=7001

select * from Employees

create table Departments
(
	Deptno int primary key,
	Dname varchar(15) not null,
	Loc varchar(20)
)

insert into Departments values(10,'Design','Pune')
insert into Departments values(20,'Development','Pune')
insert into Departments values(30,'Testing','Mumbai')
insert into Departments values(40,'Document','Mumbai')

select * from Departments

create table Projects
(
	Project_ID int primary key,
	Descr varchar(20) not null,
	Start_Date date,
	Planned_End_Date date,
	Actual_End_Date date
)


insert into Projects values(401,'Inventory','01-Apr-11','01-Oct-11','31-Oct-11')
insert into Projects values(402,'Accounting','01-Apr-11','01-Jan-12',' ')
insert into Projects values(403,'Payroll','01-Oct-11','31-Dec-11',' ')
insert into Projects values(404,'Inventory','01-Oct-11','31-Dec-11',' ')

drop table Projects

select * from Projects

create table EmpProjectTasks
(
	Project_ID int references Projects(Project_ID),
	Empno int references Employees(Empno),
	startDate date,
	endDate date,
	task varchar(25) not null,
	empProjStatus varchar(15) not null  
	primary key (Project_ID,Empno)
)

insert into EmpProjectTasks values(401,7001,'2011-04-01','2011-04-20','System Analysis','Completed'),
										(401,7002,'2011-04-21','2011-05-30','System Design','Completed'),
										(401,7003,'2011-06-01','2011-07-15','Coding','Completed'),
										(401,7004,'2011-07-18','2011-09-01','Coding','Completed'),
										(401,7006,'2011-09-03','2011-09-15','Testing','Completed'),
										(401,7009,'2011-09-18','2011-10-05','Code Change','Completed'),
										(401,7008,'2011-10-06','2011-10-16','Testing','Completed'),
										(401,7007,'2011-10-06','2011-10-22','Documentation','Completed'),
										(401,7011,'2011-10-22','2011-10-31','Sign off','Completed'),
										(402,7010,'2011-08-01','2011-08-20','System Analysis','Completed'),
										(402,7002,'2011-08-22','2011-09-30','System Design','Completed'),
										(402,7004,'2011-10-01',null,'Coding','In Progress')

select * from EmpProjectTasks