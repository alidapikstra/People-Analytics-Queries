
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
 
 /*
create a stored procedure with output parameter - employee average salary
*/
Use employees;

Drop procedure if exists emp_avg_salary_out;

Delimiter $$
Create procedure emp_avg_salary_out(in p_emp_no integer, out p_avg_salary decimal (10,2))
Begin
select AVG(s.salary)
into p_avg_salary From employees e
Join
Salaries s on e.emp_no = s.emp_no
Where
e.emp_no = p_emp_no;

end$$

Delimiter ;

/*
Create Stored Procedures with an Output Parameter - Create a procedure called ‘emp_info’ that uses as parameters the first and the last name of an individual, and returns their employee number.
*/
use employees;

Drop procedure if exists emp_info;

Delimiter $$
Create procedure emp_info(in p_first_name varchar(255), in p_last_name varchar(255), out p_emp_no integer)
Begin
select e.emp_no
into p_emp_no From employees e
Where
e.first_name = p_first_name and e.last_name = p_last_name;

end$$

Delimiter ;

/*
SQL Variables - Create a variable, called ‘v_emp_no’, where you will store the output of the procedure you created in the last exercise.
Call the same procedure, inserting the values ‘Aruna’ and ‘Journel’ as a first and last name respectively.
Finally, select the obtained output.
*/
SET @v_emp_no = 0;

CALL emp_info('Aruna', 'Journel', @v_emp_no);

SELECT @v_emp_no;

/*
The Benefit of User-Defined Functions in MySQL - Create a function called ‘emp_info’ that takes for parameters the first and last name of an employee, and returns the salary from the newest contract of that employee.
*/
DELIMITER $$

CREATE FUNCTION emp_info(p_first_name varchar(255), p_last_name varchar(255)) RETURNS decimal(10,2)

BEGIN

                DECLARE v_max_from_date date;

    DECLARE v_salary decimal(10,2);

                SELECT

    MAX(from_date)

INTO v_max_from_date FROM

    employees e

        JOIN

    salaries s ON e.emp_no = s.emp_no

WHERE

    e.first_name = p_first_name

        AND e.last_name = p_last_name;

                SELECT

    s.salary

INTO v_salary FROM

    employees e

        JOIN

    salaries s ON e.emp_no = s.emp_no

WHERE

    e.first_name = p_first_name

        AND e.last_name = p_last_name

        AND s.from_date = v_max_from_date;

           

                RETURN v_salary;

END$$

DELIMITER ;

SELECT EMP_INFO('Aruna', 'Journel');

/*
The SQL CASE Statement - obtain a result set containing the employee number, first name, and last name of all employees with a number higher than 109990. Create a fourth column in the query, indicating whether this employee is also a manager, according to the data provided in the dept_manager table, or a regular employee. 
*/
SELECT

    e.emp_no,

    e.first_name,

    e.last_name,

    CASE

        WHEN dm.emp_no IS NOT NULL THEN 'Manager'

        ELSE 'Employee'

    END AS is_manager

FROM

    employees e

        LEFT JOIN

    dept_manager dm ON dm.emp_no = e.emp_no

WHERE

    e.emp_no > 109990;
    
/*
THE SQL CASE Statement - Extract a dataset containing the following information about the managers: employee number, first name, and last name. Add two columns at the end – one showing the difference between the maximum and minimum salary of that employee, and another one saying whether this salary raise was higher than $30,000 or NOT.
*/
SELECT

    dm.emp_no,  

    e.first_name,  

    e.last_name,  

    MAX(s.salary) - MIN(s.salary) AS salary_difference,  

    CASE  

        WHEN MAX(s.salary) - MIN(s.salary) > 30000 THEN 'Salary was raised by more then $30,000'  

        ELSE 'Salary was NOT raised by more then $30,000'  

    END AS salary_raise  

FROM  

    dept_manager dm  

        JOIN  

    employees e ON e.emp_no = dm.emp_no  

        JOIN  

    salaries s ON s.emp_no = dm.emp_no  

GROUP BY s.emp_no;  

/*
THE SQL CASE Statement - Extract the employee number, first name, and last name of the first 100 employees, and add a fourth column, called “current_employee” saying “Is still employed” if the employee is still working in the company, or “Not an employee anymore” if they aren’t.
*/
SELECT

    e.emp_no,

    e.first_name,

    e.last_name,

    CASE

        WHEN MAX(de.to_date) > SYSDATE() THEN 'Is still employed'

        ELSE 'Not an employee anymore'

    END AS current_employee

FROM

    employees e

        JOIN

    dept_emp de ON de.emp_no = e.emp_no

GROUP BY de.emp_no

LIMIT 100;

/*
Create a visualization in Tableau using data from MySQL that provides a breakdown between the male and female employees working in the company each year, starting from 1990. 
*/
SELECT 
    YEAR(d.from_date) AS calendar_year,
    e.gender,
    COUNT(e.emp_no) AS num_of_employees
FROM
    t_employees e
        JOIN
    t_dept_emp d ON d.emp_no = e.emp_no
GROUP BY calendar_year , e.gender
HAVING calendar_year >= 1990;

/*
SQL - Tableau: Compare the number of male managers to the number of female managers from different departments for each year, starting from 1990.
*/
SELECT 
    d.dept_name,
    ee.gender,
    dm.emp_no,
    dm.from_date,
    dm.to_date,
    e.calendar_year,
    CASE
        WHEN
            YEAR(dm.to_date) >= e.calendar_year
                AND YEAR(dm.from_date) <= e.calendar_year
        THEN
            1
        ELSE 0
    END AS active
FROM
    (SELECT 
        YEAR(hire_date) AS calendar_year
    FROM
        t_employees
    GROUP BY calendar_year) e
        CROSS JOIN
    t_dept_manager dm
        JOIN
    t_departments d ON dm.dept_no = d.dept_no
        JOIN
    t_employees ee ON dm.emp_no = ee.emp_no
ORDER BY dm.emp_no , calendar_year;

/*
SQL - Tableau: Compare the average salary of female versus male employees in the entire company until year 2002, and add a filter allowing you to see that per each department.
*/
SELECT 
    e.gender,
    d.dept_name,
    ROUND(AVG(s.salary), 2) AS salary,
    YEAR(s.from_date) AS calendar_year
FROM
    t_salaries s
        JOIN
    t_employees e ON s.emp_no = e.emp_no
        JOIN
    t_dept_emp de ON de.emp_no = e.emp_no
        JOIN
    t_departments d ON d.dept_no = de.dept_no
GROUP BY d.dept_no , e.gender , calendar_year
HAVING calendar_year <= 2002
ORDER BY d.dept_no;
