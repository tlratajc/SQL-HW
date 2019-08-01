create table Department_Employees(
	Employee_Number INT,
	Department_Number VARCHAR(255),
	From_Date Date,
	To_Date Date,
	FOREIGN KEY (Employee_Number) References Employees(Employee_Number),
	FOREIGN KEY (Department_Number) REFERENCES Departments(Department_Number)
);
select * from Department_Employees

--drop table Department_Employees 

Create Table Department_Managers(
	Department_Number VARCHAR(255),
	Employee_Number INT,
	From_Date Date,
	To_Date Date,
	FOREIGN KEY(Department_Number) REFERENCES Departments(Department_Number),
	FOREIGN KEY (Employee_Number) REFERENCES Employees(Employee_Number)
);
Select * from Department_Managers
--drop table Department_Managers


Create Table Departments(
	Department_Number VARCHAR(255),
	Department_Name VARCHAR(255),
	PRIMARY KEY (Department_Number)
);
select * from Departments
--drop table Departments

Create Table Employees(
	Employee_Number INT,
	DOB Date,
	First_Name VARCHAR(255),
	Last_Name VARCHAR(255),
	Gender VARCHAR(30),
	Hire_Date Date,
	PRIMARY KEY(Employee_Number)
);
select * from Employees
--drop table Employees

Create Table Salaries(
	Employee_Number INT,
	Salary INT,
	From_Date Date,
	To_Date Date,
	PRIMARY KEY (Employee_Number)
);
select * from Salaries
--Drop Table Salaries

Create Table Titles(
	Employee_Number INT,
	Title VARCHAR(255),
	From_Date Date,
	To_Date Date,
	FOREIGN KEY(Employee_Number) REFERENCES Salaries(Employee_Number)
);
select * from Titles
--drop table Titles


--List the following details of each employee: employee number, last name, first name, gender, and salary.
Select 
Employees.employee_number,
Employees.last_name,
Employees.first_name,
Employees.gender,
Salaries.Salary
from Employees 
inner join Salaries on 
Employees.employee_number = Salaries.employee_number;


--List employees who were hired in 1986.
Select employee_number, last_name, first_name, Hire_Date
from Employees
Where Hire_Date >= '1986-01-01' and Hire_Date <= '1986-12-31'
Order by Hire_Date Desc; 




--List the manager of each department with the following information:
--department number, department name, the manager's employee number, 
--last name, first name, and start and end employment dates.

select departments.department_number,
departments.department_name,
employees.employee_number,
employees.first_name,
employees.last_name,
department_managers.from_date,
department_managers.to_date
from department_managers
inner join departments on 
departments.department_number = department_managers.department_number
inner join employees on
department_managers.employee_number = employees.employee_number;

--List the department of each employee with the following information:
--employee number, last name, first name, and department name.

select 
employees.employee_number,
departments.department_name,
employees.last_name,
employees.first_name
from department_employees
inner join departments on 
departments.department_number = department_employees.department_number
inner join employees on
department_employees.employee_number = employees.employee_number;

--List all employees whose first name is "Hercules" and last names begin with "B."

select 
last_name, first_name from employees 
where last_name like 'B%' or first_name = 'Hercules'


--List all employees in the Sales department, including their employee number, last name,
--first name, and department name.
select employees.employee_number,
employees.last_name,
employees.first_name,
departments.department_name
from department_employees
inner join departments on 
departments.department_name = 'Sales'
inner join employees on 
department_employees.employee_number = employees.employee_number;

--in descending order, list the frequency count of employee last names, i.e., 
--how many employees share each last name.

select last_name, COUNT(last_name) as Frequency 
from employees 
Group By last_name 
Order By
COUNT(last_name) DESC; 




 





