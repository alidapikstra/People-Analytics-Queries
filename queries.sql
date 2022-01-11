
/*
Select the information from the “dept_no” column of the “departments” table.
*/
select dept_no from departments;

/*
Select all data from the “departments” table.
*/
ELECT 
    *
FROM
    departments;

/*
Select all people from the “employees” table whose first name is “Elvis”.
*/
select * from employees where first_name = "Elvis";

/*
Retrieve a list with all female employees whose first name is Kellie
*/
select * from employees where first_name = "Kellie" and gender = "F";

/*
Retrieve a list with all employees whose first name is either Kellie or Aruna
*/
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Kellie'
        OR first_name = 'Aruna';

/*
Retrieve a list with all female employees whose first name is either Kellie or Aruna.
*/
select * from employees where gender = "F" and (first_name = "Kellie" or first_name = "Aruna");

/*
Use the IN operator to select all individuals from the “employees” table, whose first name is either “Denis”, or “Elvis”.
*/
select * from employees where first_name in ("Denis", "Elvis");

/*
Extract all records from the ‘employees’ table, aside from those with employees named John, Mark, or Jacob.
*/
select * from employees where first_name not in ("John", "Mark", "Jacob");

/*
Working with the “employees” table, use the LIKE operator to select the data about all individuals, whose first name starts with “Mark”; specify that the name can be succeeded by any sequence of characters.
*/
select * from employees where first_name Like ("Mar%");

/*
Retrieve a list with all employees who have been hired in the year 2000.
*/
select * from employees where hire_date like ("%2000%");

/*
Retrieve a list with all employees whose employee number is written with 5 characters, and starts with “1000”. 
*/
select * from employees where emp_no like ("1000_");

/*
Extract all individuals from the ‘employees’ table whose first name contains “Jack”.
*/
select * from employees where first_name like ("%Jack%");

/*
names of employees that do not contain “Jack”.
*/
select * from employees where first_name not like ("%Jack%");

/*
Select all the information from the “salaries” table regarding contracts from 66,000 to 70,000 dollars per year.
*/
select * from salaries where salary between "66000" and "70000";

/*
Retrieve a list with all individuals whose employee number is not between ‘10004’ and ‘10012’.
*/
select * from employees where emp_no not between "10004" and "10012";

/*
Select the names of all departments with numbers between ‘d003’ and ‘d006’.
*/
select * from departments where dept_no between "d003" and "d006";

/*
Select the names of all departments whose department number value is not null.
*/
SELECT 
    dept_name
FROM
    departments
WHERE
    dept_no IS NOT NULL;
    
/*
Retrieve a list with data about all female employees who were hired in the year 2000 or after.
*/
SELECT 
    *
FROM
    employees
WHERE
    hire_date >= '2000-01-01'
        AND gender = 'F';

/*
Extract a list with all employees’ salaries higher than $150,000 per annum.
*/
SELECT 
    *
FROM
    salaries
WHERE
    salary > '150000';

/*
Obtain a list with all different “hire dates” from the “employees” table.
*/
SELECT DISTINCT
    hire_date
FROM
    employees;
    
/*
How many annual contracts with a value higher than or equal to $100,000 have been registered in the salaries table?
*/
select count(*) from salaries where salary >= "100000";

