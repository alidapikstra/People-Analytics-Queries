
/*
Select the information from the “dept_no” column of the “departments” table.
*/
select dept_no from departments;

/*
Select all data from the “departments” table.
*/
SELECT 
    *
FROM
    departments;

/*
Select all people from the “employees” table whose first name is “Elvis”.
*/
select * from employees where first_name = "Elvis";

/*
Using AND - Retrieve a list with all female employees whose first name is Kellie
*/
select * from employees where first_name = "Kellie" and gender = "F";

/*
Using OR - Retrieve a list with all employees whose first name is either Kellie or Aruna
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
Using NOT IN - Extract all records from the ‘employees’ table, aside from those with employees named John, Mark, or Jacob.
*/
select * from employees where first_name not in ("John", "Mark", "Jacob");

/*
Working with the “employees” table, use the LIKE operator to select the data about all individuals, whose first name starts with “Mark”; specify that the name can be succeeded by any sequence of characters.
*/
select * from employees where first_name Like ("Mar%");

/*
Using LIKE - Retrieve a list with all employees who have been hired in the year 2000.
*/
select * from employees where hire_date like ("%2000%");

/*
Using LIKE - Retrieve a list with all employees whose employee number is written with 5 characters, and starts with “1000”. 
*/
select * from employees where emp_no like ("1000_");

/*
Using LIKE - Extract all individuals from the ‘employees’ table whose first name contains “Jack”.
*/
select * from employees where first_name like ("%Jack%");

/*
Using NOT LIKE - names of employees that do not contain “Jack”.
*/
select * from employees where first_name not like ("%Jack%");

/*
Using BETWEEN AND - Select all the information from the “salaries” table regarding contracts from 66,000 to 70,000 dollars per year.
*/
select * from salaries where salary between "66000" and "70000";

/*
Using NOT BETWEEN AND - Retrieve a list with all individuals whose employee number is not between ‘10004’ and ‘10012’.
*/
select * from employees where emp_no not between "10004" and "10012";

/*
Using BETWEEN AND - Select the names of all departments with numbers between ‘d003’ and ‘d006’.
*/
select * from departments where dept_no between "d003" and "d006";

/*
Using IS NOT NULL - Select the names of all departments whose department number value is not null.
*/
SELECT 
    dept_name
FROM
    departments
WHERE
    dept_no IS NOT NULL;
    
/*
Using AND - Retrieve a list with data about all female employees who were hired in the year 2000 or after.
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
SELECT 
    COUNT(*)
FROM
    salaries
WHERE
    salary >= '100000';


/*
Select all data from the “employees” table, ordering it by “hire date” in descending order.
*/
SELECT 
    *
FROM
    employees
ORDER BY hire_date DESC;

/*
Applying Alias - Write a query that obtains an output whose first column must contain annual salaries higher than 80,000 dollars. The second column, renamed to “emps_with_same_salary”, must show the number of employee contracts signed with this salary.
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
Applying GROUP BY, HAVING AVG - Select all employees whose average salary is higher than $120,000 per annum.
*/
SELECT 
    emp_no, AVG(salary)
FROM
    salaries
GROUP BY emp_no
HAVING AVG(salary) > 120000
ORDER BY emp_no;

/*
Applying GROUP BY, HAVING - Select the employee numbers of all individuals who have signed more than 1 contract after the 1st of January 2000.
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
Applying LIMIT - Select the first 100 rows from the ‘dept_emp’ table. 
*/
SELECT 
    *
FROM
    dept_emp
LIMIT 100;

/*
Applying SUM - What is the total amount of money spent on salaries for all contracts starting after the 1st of January 1997?
*/
SELECT 
    SUM(salary)
FROM
    salaries
WHERE
    from_date > '1997-01-01';
    
/*
Applying DISTINCT - How many departments are there in the “employees” database? Use the ‘dept_emp’ table to answer the question.
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
    
/*
Functionality of INNER JOIN - Extract a list containing information about all managers’ employee number, first and last name, department number, and hire date
*/
SELECT 
    e.emp_no, e.first_name, e.last_name, dm.dept_no, e.hire_date
FROM
    employees e
        JOIN
    dept_manager dm ON e.emp_no = dm.emp_no;
    
/*
The Functionality of LEFT JOIN - Join the 'employees' and the 'dept_manager' tables to return a subset of all the employees whose last name is Markovitch. See if the output contains a manager with that name.  
*/
SELECT

    e.emp_no,

    e.first_name,

    e.last_name,

    dm.dept_no,

    dm.from_date

FROM

    employees e

        LEFT JOIN

    dept_manager dm ON e.emp_no = dm.emp_no

WHERE

    e.last_name = 'Markovitch'

ORDER BY dm.dept_no DESC, e.emp_no;

/*
Using JOIN and WHERE Together - Select the first and last name, the hire date, and the job title of all employees whose first name is “Margareta” and have the last name “Markovitch”.
*/
SELECT

    e.first_name, e.last_name, e.hire_date, t.title

FROM

    employees e

        JOIN

    titles t ON e.emp_no = t.emp_no

WHERE

    first_name = 'Margareta'

        AND last_name = 'Markovitch'

ORDER BY e.emp_no

;   

/*
The Functionality of CROSS JOIN - Use a CROSS JOIN to return a list with all possible combinations between managers from the dept_manager table and department number 9.
*/
SELECT

    dm.*, d.*

FROM

    departments d

        CROSS JOIN

    dept_manager dm

WHERE

    d.dept_no = 'd009'

ORDER BY d.dept_name;

 /* 
 JOIN More than Two Tables - Select all managers’ first and last name, hire date, job title, start date, and department name.
 */
SELECT

    e.first_name,

    e.last_name,

    e.hire_date,

    t.title,

    m.from_date,

    d.dept_name

FROM

    employees e

        JOIN

    dept_manager m ON e.emp_no = m.emp_no

        JOIN

    departments d ON m.dept_no = d.dept_no

        JOIN

    titles t ON e.emp_no = t.emp_no

WHERE t.title = 'Manager'

ORDER BY e.emp_no;
    
/*
How many male and how many female managers do we have in the ‘employees’ database?
*/
SELECT

    e.gender, COUNT(dm.emp_no)

FROM

    employees e

        JOIN

    dept_manager dm ON e.emp_no = dm.emp_no

GROUP BY gender;

/*
SQL Subqueries with IN Embedded Inside WHERE - Extract the information about all department managers who were hired between the 1st of January 1990 and the 1st of January 1995.
*/
SELECT

    *

FROM

    dept_manager

WHERE

    emp_no IN (SELECT

            emp_no

        FROM

            employees

        WHERE

            hire_date BETWEEN '1990-01-01' AND '1995-01-01');
            
/*
SQL Subqueries with EXISTS-NOT EXISTS Embedded Inside WHERE - Select the entire information for all employees whose job title is “Assistant Engineer”. 
*/
SELECT

    *

FROM

    employees e

WHERE

    EXISTS( SELECT

            *

        FROM

            titles t

        WHERE

            t.emp_no = e.emp_no

                AND title = 'Assistant Engineer');

/*
SQL Subqueries Embedded in SELECT and FRO - Fill emp_manager with data about employees, the number of the department they are working in, and their managers.
*/
INSERT INTO emp_manager
SELECT 
    u.*
FROM
    (SELECT 
        a.*
    FROM
        (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110022) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no <= 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS a UNION SELECT 
        b.*
    FROM
        (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110039) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no > 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no
    LIMIT 20) AS b UNION SELECT 
        c.*
    FROM
        (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110039) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no = 110022
    GROUP BY e.emp_no) AS c UNION SELECT 
        d.*
    FROM
        (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110022) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no = 110039
    GROUP BY e.emp_no) AS d) as u;
    
    /*
    An Example of Stored Procedures - Create a procedure that will provide the average salary of all employees.
    */

drop procedure avg_salary;

DELIMITER $$

CREATE PROCEDURE avg_salary()

BEGIN

                SELECT

                                AVG(salary)

                FROM

                                salaries;

END$$

DELIMITER ;

CALL avg_salary;

CALL avg_salary();

CALL employees.avg_salary;

CALL employees.avg_salary();

/*
create a stored procedure with input parameter - employee salary
*/
Use employees;

Drop procedure if exists emp_salary;

Delimiter $$
Create procedure emp_salary(in p_emp_no integer)
Begin
select e.first_name, e.last_name, s.salary, s.from_date, s.to_date
From employees e
Join
Salaries s on e.emp_no = s.emp_no
Where
e.emp_no = p_emp_no;

end$$

Delimiter ;
 