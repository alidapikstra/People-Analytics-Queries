
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
How many anual contracts with a value higher than or equal to $100,000 have been registered in the salaries table?
*/
select count(*) from salaries where salary >= "100000";


/*
Select all data from the “employees” table, ordering it by “hire date” in descending order.
*/
SELECT 
    *
FROM
    employees
ORDER BY hire_date DESC;

/*
Write a query that obtains an output whose first column must contain annual salaries higher than 80,000 dollars. The second column, renamed to “emps_with_same_salary”, must show the number of employee contracts signed with this salary.
*/
SELECT

    salary, COUNT(emp_no) AS emps_with_same_salary

FROM

    salaries

WHERE

    salary > 80000

GROUP BY salary

ORDER BY salary;


/*
Select all employees whose average salary is higher than $120,000 per annum.
*/
SELECT 
    emp_no, AVG(salary)
FROM
    salaries
GROUP BY emp_no
HAVING AVG(salary) > 120000
ORDER BY emp_no;

/*
Select the employee numbers of all individuals who have signed more than 1 contract after the 1st of January 2000.
*/
SELECT

    emp_no

FROM

    dept_emp

WHERE

    from_date > '2000-01-01'

GROUP BY emp_no

HAVING COUNT(from_date) > 1

ORDER BY emp_no;

/*
Select the first 100 rows from the ‘dept_emp’ table. 
*/
SELECT 
    *
FROM
    dept_emp
LIMIT 100;

/*
What is the total amount of money spent on salaries for all contracts starting after the 1st of January 1997?
*/
SELECT 
    SUM(salary)
FROM
    salaries
WHERE
    from_date > '1997-01-01';
    
/*
How many departments are there in the “employees” database? Use the ‘dept_emp’ table to answer the question.
*/
SELECT 
    COUNT(DISTINCT dept_no)
FROM
    dept_emp;

/*
What is the average annual salary paid to employees who started after the 1st of January 1997?
*/
SELECT 
    AVG(salary)
FROM
    salaries
WHERE
    from_date > '1997-01-01';
    
    /*
    Round the average amount of money spent on salaries for all contracts that started after the 1st of January 1997 to a precision of cents.
    */
    SELECT 
    ROUND(AVG(salary), 2)
FROM
    salaries
WHERE
    from_date > '1997-01-01';
    

    

