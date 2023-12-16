SELECT first_name, last_name FROM employees;
SELECT * FROM employees;
SELECT * FROM departments;
SELECT dept_no FROM departments;
SELECT * FROM employees
WHERE first_name = "Denis";
SELECT * FROM employees
WHERE first_name = "Elvis";
SELECT * FROM employees
WHERE first_name = "Elvis" AND gender = "M";
SELECt * FROM employees
WHERE first_name = "Denis" OR first_name = "Elvis";
SELECT * FROM employees
WHERE first_name = "Denis" AND gender = "M" OR gender = "F";
SELECT * FROM employees
WHERE first_name = "Denis" AND (gender = "M" OR gender = "F");
SELECT * FROM employees
WHERE (first_name = "Kellie" OR first_name = "Aruna") AND gender = "F";
SELECT * FROM employees
WHERE first_name IN ("Cathie", "Mark", "Nathan");
SELECT * FROM employees
WHERE first_name NOT IN ("Cathie", "Mark", "Nathan");
SELECT * FROM employees
WHERE first_name IN ("Denis", "Elvis");
SELECT * FROM employees
WHERE first_name NOT IN ("John", "Mark", "Jacob");
SELECT * FROM employees
WHERE first_name LIKE ("Mar%");
SELECT * FROM employees
WHERE first_name LIKE ("%Mar");
SELECT * FROM employees
WHERE first_name LIKE ("Mar_");
SELECT * FROM employees
WHERE first_name NOT LIKE ("%Mar%");
SELECT * FROM employees
WHERE first_name LIKE ("Mark%") AND emp_no LIKE ("1000_");
SELECT * FROM employees
WHERE hire_date LIKE ("%2000%");
SELECT * FROM employees
WHERE year(hire_date) = 2000;
SELECT * FROM employees
WHERE first_name LIKE ("Jack%");
SELECT * FROM employees
WHERE first_name NOT LIKE ("%Jack%");
SELECT * FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '2000-01-01';
SELECT * FROM employees
WHERE hire_date NOT BETWEEN '1990-01-01' AND '2000-01-01';
SELECT * FROM salaries
WHERE salary BETWEEN 66000 AND 70000;
SELECT * FROM employees
WHERE emp_no NOT BETWEEN '10004' AND '10012';
SELECT * FROM departments
WHERE dept_no BETWEEN "d003" AND "d006";
SELECT * FROM employees
WHERE first_name IS NOT NULL;
SELECT * FROM employees
WHERE first_name IS NULL;
SELECT * FROM employees
WHERE first_name <> "Mark";
SELECT * FROM employees
WHERE first_name != "Mark";

##Provide a list of employees hired after the 1st of Januray 2000
SELECT * FROM employees
WHERE hire_date > '2000-01-01';
/*Please note in the above code Jan 1, 2000 will be excluded, if you want to include
then add >= */
SELECT * FROM employees
WHERE hire_date >= '2000-01-01';
SELECT * FROM employees
WHERE hire_date < '1985-02-01';
SELECT * FROM employees
WHERE hire_date <= '1985-02-01';
##Retrieve a list with data about all female employees who were hired in the year 2000 or after.
SELECT * FROM employees
WHERE gender = 'F' AND hire_date >= '2000-01-01'; 
##Extract a list with all employees’ salaries higher than $150,000 per annum.
SELECT * FROM salaries 
WHERE salary > '150000';
SELECT DISTINCT gender FROM employees;
/*Obtain a list with all different “hire dates” from the “employees” table.
Expand this list and click on “Limit to 1000 rows”. This way you will set the limit of output rows 
displayed back to the default of 1000.*/
SELECT DISTINCT hire_date FROM employees;
SELECT count(emp_no) FROM employees; 
SELECT count(DISTINCT first_name) FROM employees;
/*How many annual contracts with a value higher than or equal to $100,000 have been registered 
in the salaries table? */
SELECT COUNT(*) FROM salaries
WHERE salary >= 100000;
/*How many managers do we have in the “employees” database? */
SELECT count(*) FROM dept_manager;
SELECT * FROM employees
order by first_name;
SELECT * FROM employees
order by first_name DESC;
/*Select all data from the “employees” table, ordering it by “hire date” in descending order.*/
SELECT * FROM employees
ORDER BY hire_date DESC;
SELECT count(*) FROM salaries;
SELECT first_name FROM employees
GROUP BY first_name;
SELECT DISTINCT first_name FROM employees;
SELECT first_name, count(first_name) FROM employees
GROUP BY first_name
ORDER BY first_name;
/*Write a query that obtains two columns. The first column must contain annual salaries higher than
80,000 dollars. The second column, renamed to “emps_with_same_salary”, must show the number of 
employees contracted to that salary. Lastly, sort the output by the first column.*/
SELECT salary, count(*) AS emps_with_same_salary FROM salaries 
WHERE salary > 80000 
GROUP BY salary
ORDER BY salary;

SELECT salary, COUNT(emp_no) AS emps_with_same_salary
FROM salaries
WHERE salary > 80000
GROUP BY salary
ORDER BY salary;
## Having Clause
SELECT * FROM employees
WHERE hire_date > '2000-01-01';
SELECT * FROM employees
HAVING hire_date > '2000-01-01';
SELECT first_name, count(first_name) AS names_count
FROM employees
GROUP BY first_name
HAVING count(first_name) > 250
ORDER BY first_name;
##Select all employees whose average salary is higher than $120,000 per annum.
SELECT emp_no, AVG(salary) AS average_salary
FROM salaries
GROUP BY emp_no
HAVING AVG(salary) > 120000;
/* Extract a list all names that are encountered less than 200 times. Let the data refer to 
the people hired after the 1st of Jan 1999 */
SELECT first_name, count(first_name) FROM employees
WHERE hire_date > '1999-01-01'
GROUP BY first_name
HAVING count(first_name) < '200'
ORDER BY first_name DESC;
/* Select the employee numbers of all individuals who have signed more than 1 contract after 
the 1st of January 2000 */
SELECT emp_no, count(emp_no) AS no_of_contract_signed FROM dept_emp
WHERE from_date > '2000-01-01'
GROUP BY emp_no
HAVING count(emp_no) > 1
ORDER BY emp_no DESC;
## Select the first 100 rows from the ‘dept_emp’ table. 
SELECT * FROM dept_emp
ORDER BY emp_no
LIMIT 100;
SELECT * FROM dept_emp
LIMIT 100;
SELECT * FROM employees
ORDER BY emp_no DESC
LIMIT 10;
INSERT INTO employees (emp_no, birth_date, first_name, last_name, gender, hire_date)
VALUES (999901, '1986-01-01','John', 'Smith', 'M', '2011-01-01');
INSERT INTO employees (birth_date,emp_no,first_name, last_name, gender, hire_date)
VALUES ('2000-01-01', 999902, 'Kshama', 'Dev', 'F', '2000-01-01');
/* Select ten records from the “titles” table to get a better idea about its content.
Then, in the same table, insert information about employee number 999903. State that he/she 
is a “Senior Engineer”, who has started working in this position on October 1st, 1997.
At the end, sort the records from the “titles” table in descending order to check if you have 
successfully inserted the new record. */
SELECT * FROM titles
ORDER BY emp_no DESC
LIMIT 10;
INSERT INTO titles (emp_no, title, from_date, to_date)
VALUES (999902, 'Senior Engineer', '2000-01-01','2023-01-01');
/*Select the employee numbers of all individuals who have signed more than 1 contract after 
the 1st of January 2000.
Hint: To solve this exercise, use the “dept_emp” table */
SELECT emp_no, count(from_date) from dept_emp
WHERE from_date > '2000-01-01'
GROUP BY emp_no
HAVING count(from_date) > 1
ORDER BY emp_no DESC;
/*Insert information about the individual with employee number 999903 into the “dept_emp” table. 
He/She is working for department number 5, and has started work on  October 1st, 1997; her/his 
contract is for an indefinite period of time.
Hint: Use the date ‘9999-01-01’ to designate the contract is for an indefinite period.*/
INSERT INTO dept_emp (emp_no, dept_no, from_date, to_date)
VALUES (999902, 'd005', '2000-01-01', '9999-01-01');
## Inserting data INTO a new table
SELECT * FROM departments;
CREATE TABLE departments_dup
(dept_no CHAR(4) NOT NULL,
dept_name VARCHAR(40) NOT NULL);
SELECT * FROM departments_dup;
INSERT INTO departments_dup
(dept_no, dept_name)
SELECT * FROM departments;
SELECT * FROM departments_dup
ORDER BY dept_no;
/* Create a new department called “Business Analysis”. Register it under number ‘d010’.
Hint: To solve this exercise, use the “departments” table. */
INSERT INTO departments VALUES ('d010', 'Business Analysis');
USE employees;
SELECT * FROM employees WHERE emp_no = 999902;
UPDATE employees
SET 
first_name = 'Stella',
last_name = 'Parkinson',
birth_date = '1990-12-31',
gender = 'F'
WHERE
emp_no = 999902;
SELECT * FROM departments_dup
ORDER BY dept_no; 
COMMIT;
SELECT * FROM departments;
SELECT * FROM employees
WHERE emp_no = 999901;
/*Remove the department number 10 record from the “departments” table.*/
DELETE FROM departments
WHERE dept_no = 'd010';
SELECT COUNT(salary) FROM salaries;
SELECT COUNT(DISTINCT from_date) FROM salaries;
/*How many departments are there in the “employees” database? Use the ‘dept_emp’ table to 
answer the question.*/
SELECT COUNT(DISTINCT dept_no) FROM dept_emp;
SELECT SUM(salary) FROM salaries;
/*What is the total amount of money spent on salaries for all contracts starting after 
the 1st of January 1997?*/
SELECT SUM(salary) FROM salaries
WHERE from_date > '1997-01-01';
SELECT MAX(salary) FROM salaries;
SELECT MIN(salary) FROM salaries;
/*Which is the lowest employee number in the database?*/
SELECT MIN(emp_no) FROM employees;
SELECT MAX(emp_no) FROM employees;
SELECT AVG(salary) FROM salaries;
/*What is the average annual salary paid to employees who started after the 1st of January 1997?*/
SELECT AVG(salary) FROM salaries
WHERE from_date > '1997-01-07';
SELECT ROUND(AVG(salary)) FROM salaries
WHERE from_date > '1997-01-07';
SELECT ROUND(AVG(salary),2) FROM salaries
WHERE from_date > '1997-01-07';
/*Round the average amount of money spent on salaries for all contracts that started after 
the 1st of January 1997 to a precision of cents.*/
SELECT ROUND(AVG(salary)) FROM salaries
WHERE from_date > '1997-01-07';
SELECT * FROM departments_dup;
ALTER TABLE departments_dup
CHANGE COLUMN dept_no dept_no CHAR(4) NULL;
ALTER TABLE departments_dup
CHANGE COLUMN dept_name dept_name VARCHAR(40) NULL;
INSERT INTO departments_dup(dept_name)
VALUES('Public Relations');
DELETE FROM departments_dup
WHERE dept_no = 'd002';
INSERT INTO departments_dup(dept_no) VALUES('d010'),('d011');
/*Create and fill in the ‘dept_manager_dup’ table*/
DROP TABLE IF EXISTS dept_manager_dup;
CREATE TABLE dept_manager_dup
(emp_no int NOT NULL,
dept_no char(4) NULL,
from_date date NOT NULL,
to_date date NULL);
INSERT INTO dept_manager_dup
SELECT * FROM dept_manager;
SELECT * FROM dept_manager_dup;
INSERT INTO dept_manager_dup(emp_no, from_date)
VALUES  (999904, '2017-01-01'),
        (999905, '2017-01-01'),
        (999906, '2017-01-01'),
		(999907, '2017-01-01');
DELETE FROM dept_manager_dup
WHERE dept_no = 'd001';
SELECT * FROM dept_manager_dup
ORDER BY dept_no;
SELECT * FROM departments_dup
ORDER BY dept_no;
/*dept_manager_dup as M and departments_dup as D */
SELECT m.dept_no, m.emp_no, d.dept_name
FROM dept_manager_dup m
INNER JOIN departments_dup d ON m.dept_no = d.dept_no
ORDER BY m.dept_no;
/*Extract a list containing information about all managers’ employee number, first and last name, 
department number, and hire date. */
SELECT e.emp_no, e.first_name, e.last_name, m.dept_no, m.from_date
FROM employees e
INNER JOIN dept_manager_dup m ON e.emp_no = m.emp_no;
##Duplicate Records
INSERT INTO dept_manager_dup
VALUES ('110228', 'd003', '1992-03-21', '9999-01-01');
SELECT * FROM dept_manager_dup;
INSERT INTO departments_dup
VALUES ('d009', 'Customer Service');
SELECT * FROM departments_dup;
SELECT m.dept_no, m.emp_no, d.dept_name
FROM dept_manager_dup m
JOIN departments_dup d ON m.dept_no = d.dept_no
GROUP BY m.dept_no, m.emp_no, d.dept_name
ORDER BY dept_no;
## Remove the duplicates from both the tables
DELETE FROM dept_manager_dup
WHERE emp_no = '110228';
DELETE FROM departments_dup
WHERE dept_no = 'd009';
## Add back the initial records
INSERT INTO dept_manager_dup
VALUES ('110228', 'd003', '1992-03-21','1999-01-01');
INSERT INTO departments_dup
VALUES ('d009', 'Customer Service');
SELECT m.dept_no, m.emp_no, d.dept_name
FROM dept_manager_dup m
LEFT JOIN departments_dup d ON m.dept_no = d.dept_no
GROUP BY m.dept_no, m.emp_no, d.dept_name
ORDER BY m.dept_no; 
##Swapping the directions of the tables
SELECT d.dept_no, m.emp_no, d.dept_name
FROM departments_dup d
LEFT JOIN dept_manager_dup m ON m.dept_no = d.dept_no
ORDER BY d.dept_no;
SELECT e.emp_no, e.first_name, e.last_name, dm.dept_no, dm.from_date
FROM employees e 
LEFT JOIN dept_manager dm ON e.emp_no = dm.emp_no
WHERE e.last_name = "Markovitch"
ORDER BY dm.dept_no DESC, e.emp_no;
##OLd WHERE Syntax
SELECT m.dept_no, m.emp_no, d.dept_name
FROM  
	dept_manager_dup m,
    departments_dup d
WHERE m.dept_no = d.dept_no
ORDER BY m.dept_no;
/*Extract a list containing information about all managers’ employee number, first and 
last name, department number, and hire date. Use the old type of join syntax to obtain the result.*/
SELECT e.emp_no, e.first_name, e.last_name, m.dept_no, e.hire_date
FROM employees e, dept_manager m
WHERE e.emp_no = m.emp_no;
##New Syntax
SELECT e.emp_no, e.first_name, e.last_name, m.dept_no, e.hire_date
FROM employees e
JOIN dept_manager m ON e.emp_no = m.emp_no; 
set @@global.sql_mode := replace(@@global.sql_mode, 'ONLY_FULL_GROUP_BY', '');
/*Select the first and last name, the hire date, and the job title of all employees 
whose first name is “Margareta” and have the last name “Markovitch”.*/
SELECT e.first_name, e.last_name, e.hire_date, t.title
FROM employees e
JOIN titles t ON e.emp_no = t.emp_no
WHERE e.first_name = 'Margareta' and e.last_name = 'Markovitch';
##CROSS JOIN
SELECT dm.*, d.*
FROM dept_manager dm
CROSS JOIN departments d
ORDER BY dm.emp_no, d.dept_no; 
SELECT * FROM departments
ORDER BY dept_no;
SELECT * FROM dept_manager
ORDER BY dept_no;
##CROSS JOIN WITH WHERE
SELECT dm.*, d.*
FROM departments d
CROSS JOIN dept_manager dm
WHERE d.dept_no <> dm.dept_no
ORDER BY dm.emp_no, d.dept_no;
SELECT e.*, d.*
FROM departments d
CROSS JOIN
dept_manager dm
JOIN
employees e ON dm.emp_no = e.emp_no
WHERE d.dept_no <> dm.dept_no
ORDER BY dm.emp_no, d.dept_no; 
/*Use a CROSS JOIN to return a list with all possible combinations between managers from 
the dept_manager table and department number 9.*/
SELECT dm.*, d.*
FROM departments d
CROSS JOIN
dept_manager dm
WHERE d.dept_no = 'd009'
ORDER BY d.dept_no;
/*Return a list with the first 10 employees with all the departments they can be assigned to.*/
SELECT e.*, d.*
FROM employees e
CROSS JOIN 
departments d
WHERE e.emp_no < 10011
ORDER BY e.emp_no, d.dept_name;
##Average salaries of men and women in the company.
SELECT e.gender, AVG(s.salary) AS average_salary
FROM employees e
JOIN salaries s ON s.emp_no = e.emp_no 
GROUP BY e.gender;
SELECT 
e.first_name,
e.last_name,
e.hire_date,
dm.from_date,
d.dept_name
FROM employees e
JOIN dept_manager dm ON e.emp_no = dm.emp_no
JOIN departments d ON dm.dept_no = d.dept_no;
/*Select all managers’ first and last name, hire date, job title, start date, and department name.*/
SELECT 
e.first_name,
e.last_name,
e.hire_date,
t.title,
dm.from_date,
d.dept_name
FROM employees e
JOIN titles t ON e.emp_no = t.emp_no
JOIN dept_manager dm ON e.emp_no = dm.emp_no
JOIN departments d ON dm.dept_no = d.dept_no
WHERE t.title = 'Manager'
ORDER BY e.emp_no;
SELECT e.first_name, e.last_name, e.hire_date, t.title, m.from_date, d.dept_name
FROM employees e
JOIN dept_manager m ON e.emp_no = m.emp_no
JOIN departments d ON m.dept_no = d.dept_no
JOIN titles t ON e.emp_no = t.emp_no
WHERE t.title = 'Manager'
ORDER BY e.emp_no;
/*Let's obtain the names of all departments and calculate the average salary paid to the managers 
in each of them.*/
SELECT d.dept_name, AVG(s.salary)
FROM departments d
JOIN dept_manager dm ON d.dept_no = dm.dept_no
JOIN salaries s ON s.emp_no = dm.emp_no;
/*If you run the above query you will get just 1 row because If you forget to group by 
department name. MySQL will apply a default order to the departments and deliver only the 
first one. This is how MySQL works*/
SELECT d.dept_name, AVG(s.salary)
FROM departments d
JOIN dept_manager dm ON d.dept_no = dm.dept_no
JOIN salaries s ON s.emp_no = dm.emp_no
GROUP BY d.dept_name
ORDER BY AVG(s.salary) DESC;
##We can also use HAVING clause
SELECT d.dept_name, AVG(s.salary)
FROM departments d
JOIN dept_manager dm ON d.dept_no = dm.dept_no
JOIN salaries s ON s.emp_no = dm.emp_no
GROUP BY d.dept_name
HAVING AVG(s.salary) > 60000
ORDER BY AVG(s.salary) DESC;
SELECT * FROM employees;
/*How many male and how many female managers do we have in the ‘employees’ database?*/
SELECT e.gender, COUNT(dm.emp_no)
FROM employees e
JOIN dept_manager dm ON e.emp_no = dm.emp_no
GROUP BY gender;
SELECT e.gender, COUNT(e.gender)
FROM employees e
JOIN titles t ON e.emp_no = t.emp_no
WHERE t.title = 'Manager'
GROUP BY e.gender;
##Create employees dup
DROP TABLE IF EXISTS employees_dup;
CREATE TABLE employees_dup
(emp_no int(11),
birth_date date,
first_name  varchar (14),
last_name varchar(16),
gender enum ('M','F'),
hire_date date );
##Duplicate the structure of the 'employees' table
INSERT INTO employees_dup
SELECT * FROM employees
LIMIT 20;
##Check whether it's done or not
SELECT * FROM employees_dup;
##Insert a duplicate of the first row
INSERT INTO employees_dup VALUES 
('10001', '1953-09-02', 'Georgi','Facello','M','1986-06-26');
##Check whether it's done or not
SELECT * FROM employees_dup;
##UNION ALL
SELECT e.emp_no,
       e.first_name,
       e.last_name,
       NULL AS dept_no,
       NULL AS from_date
FROM employees_dup e
WHERE e.emp_no = 10001
UNION ALL SELECT 
NULL AS emp_no,
NULL AS first_name,
NULL AS last_name,
dm.dept_no,
dm.from_date
FROM dept_manager dm;
/*Go forward to the solution and execute the query. What do you think is the meaning of the 
minus sign before subset A in the last row (ORDER BY -a.emp_no DESC)? */
SELECT * FROM 
(SELECT e.emp_no, e.first_name, e.last_name, NULL AS dept_no, NULL AS from_date
FROM employees e 
WHERE last_name = 'Denis' UNION SELECT 
NULL AS emp_no, NULL AS first_name, NULL AS last_name, dm.dept_no, dm.from_date
FROM dept_manager dm) AS a 
ORDER BY -a.emp_no DESC;
##Subqueries
SELECT * FROM dept_manager;
/* Select the first and last name from the "employees" table for the same employee numbers
that can be found in the "Department Manager" table.*/
SELECT e.first_name, e.last_name FROM employees e
WHERE e.emp_no IN (SELECT dm.emp_no FROM dept_manager dm);
/*Extract the information about all department managers who were hired between the 1st of 
January 1990 and the 1st of January 1995.*/
SELECT * FROM dept_manager 
WHERE emp_no IN (SELECT emp_no FROM employees WHERE hire_date BETWEEN '1990-01-01' AND '1995-01-01');
/* Extract all the information from employees table of those employees who are also present 
in dept_manager table */
SELECT e.first_name, e.last_name FROM employees e
WHERE EXISTS (SELECT * FROM dept_manager dm WHERE dm.emp_no = e.emp_no); 
/*Select the entire information for all employees whose job title is “Assistant Engineer”. */
SELECT * FROM employees e
WHERE EXISTS (SELECT * FROM titles t WHERE t.emp_no = e.emp_no AND title = 'Assistant Engineer');
/* Assign employee number 110022 as a manager to all employees from 10001 to 10020 and 
employee number 110039 as a mnanager to all employees from 10021 to 10040 */
SELECT e.emp_no AS employee_ID, MIN(de.dept_no) AS department_code,
(SELECT emp_no from dept_manager WHERE emp_no = 110022) AS manager_ID
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
WHERE e.emp_no <= 10020
GROUP BY e.emp_no
ORDER BY e.emp_no;
/*We will proceed by inserting this entire code within the from statement of an even outer query.*/
SELECT A.* FROM 
(SELECT e.emp_no AS employee_ID, MIN(de.dept_no) AS department_code,
(SELECT emp_no from dept_manager WHERE emp_no = 110022) AS manager_ID
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
WHERE e.emp_no <= 10020
GROUP BY e.emp_no
ORDER BY e.emp_no) AS A;
/*Finally, we must combine this subset with the other one we will call B.*/
SELECT A.* FROM 
(SELECT e.emp_no AS employee_ID, MIN(de.dept_no) AS department_code,
(SELECT emp_no from dept_manager WHERE emp_no = 110022) AS manager_ID
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
WHERE e.emp_no <= 10020
GROUP BY e.emp_no
ORDER BY e.emp_no) AS A
UNION SELECT B.* FROM 
(SELECT e.emp_no AS employee_ID, MIN(de.dept_no) AS department_code,
(SELECT emp_no from dept_manager WHERE emp_no = 110039) AS manager_ID
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
WHERE e.emp_no > 10020
GROUP BY e.emp_no
ORDER BY e.emp_no
LIMIT 20) AS B;
/*Starting your code with “DROP TABLE”, create a table called “emp_manager” (emp_no – integer of 11,
not null; dept_no – CHAR of 4, null; manager_no – integer of 11, not null).*/
 DROP TABLE IF EXISTS emp_manager;
 CREATE TABLE emp_manager
 (emp_no INT(11) NOT NULL,
 dept_no CHAR(4) NULL,
 manager_no INT(11) NOT NULL);
 SELECT * FROM dept_emp;
 /*Fill emp_manager with data about employees, the number of the department they are working in, 
 and their managers. Your query skeleton must be: Insert INTO emp_manager SELECT U.* FROM (A) 
UNION (B) UNION (C) UNION (D) AS U;
A and B should be the same subsets used in the last lecture (SQL Subqueries Nested in SELECT 
and FROM). In other words, assign employee number 110022 as a manager to all employees from 10001 
to 10020 (this must be subset A), and employee number 110039 as a manager to all employees from 
10021 to 10040 (this must be subset B).
Use the structure of subset A to create subset C, where you must assign employee number 110039 
as a manager to employee 110022.
Following the same logic, create subset D. Here you must do the opposite - assign employee 
110022 as a manager to employee 110039.
Your output must contain 42 rows*/
INSERT INTO emp_manager 
SELECT U.* FROM 
(SELECT A.* FROM 
(SELECT e.emp_no AS employee_ID, MIN(de.dept_no) AS department_code,
(SELECT emp_no FROM dept_manager WHERE emp_no = 110022) AS manager_ID
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no WHERE e.emp_no <= 10020
GROUP BY e.emp_no
ORDER BY e.emp_no) AS A UNION
SELECT B.* FROM 
(SELECT e.emp_no AS employee_ID, MIN(de.dept_no) AS department_code,
(SELECT emp_no from dept_manager WHERE emp_no = 110039) AS manager_ID
FROM employees e 
JOIN dept_emp de ON e.emp_no = de.emp_no
WHERE e.emp_no > 10020
GROUP BY e.emp_no
ORDER BY e.emp_no
LIMIT 20) AS B UNION 
SELECT C.* FROM 
(SELECT e.emp_no AS employee_ID, MIN(de.dept_no) AS department_code,
(SELECT emp_no FROM dept_manager WHERE emp_no = 110039) AS manager_ID
FROM employees e 
JOIN dept_emp de ON e.emp_no = de.emp_no WHERE e.emp_no = 110022
GROUP BY e.emp_no) AS C UNION 
SELECT D.* FROM 
(SELECT e.emp_no AS employee_ID, MIN(de.dept_no) AS department_code,
(SELECT emp_no FROM dept_manager WHERE emp_no = 110022) AS manager_ID
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no WHERE 110039
GROUP BY e.emp_no) AS D) AS U;
##SELF JOIN
/*From the emp_manager table created in the previous exercise extract the record data only of 
those employees who were managers as well */
SELECT DISTINCT e1.* FROM emp_manager e1
JOIN emp_manager e2 ON e1.emp_no = e2.manager_no;
SELECT * FROM emp_manager
ORDER BY emp_manager.emp_no;
SELECT e1.* FROM emp_manager e1
JOIN emp_manager e2 ON e1.emp_no = e2.emp_no;
##If we want to retrieve emp_no, dept_no from e1 and manager_no from e2
SELECT e1.emp_no, e1.dept_no, e2.manager_no
FROM emp_manager e1
JOIN emp_manager e2 ON e1.emp_no = e2.manager_no;
SELECT manager_no FROM emp_manager;
SELECT e1.* FROM emp_manager e1
JOIN emp_manager e2 ON e1.emp_no = e2.manager_no
WHERE e2.emp_no IN (SELECT manager_no FROM emp_manager);
SELECT * FROM dept_emp;
SELECT emp_no, from_date, to_date, COUNT(emp_no) AS Num
FROM dept_emp
GROUP BY emp_no
HAVING Num > 1;
CREATE OR REPLACE VIEW v_dept_emp_latest_date AS 
SELECT emp_no, MAX(from_date) AS from_date, MAX(to_date) AS to_date
FROM dept_emp
GROUP BY emp_no;
/*Create a view that will extract the average salary of all managers registered in the database. 
Round this value to the nearest cent. If you have worked correctly, after executing the view from 
the “Schemas” section in Workbench, you should obtain the value of 66924.27. */
CREATE OR REPLACE VIEW v_manager_avg_salary AS 
SELECT ROUND(AVG(salary),2) FROM salaries s
JOIN dept_manager de ON de.emp_no = s.emp_no;
##Store Procedure
##Write a query to return the first 1000 rows from the 'employees' table.
DROP PROCEDURE IF EXISTS select_employees;
DELIMITER $$
CREATE PROCEDURE select_employees()
BEGIN
SELECT * FROM employees 
LIMIT 1000;
END$$

DELIMITER ;

CALL employees.select_employees();
/*Create a procedure that will provide the average salary of all employees.Then, call the procedure.*/
DELIMITER $$
CREATE PROCEDURE avg_salary()
BEGIN
SELECT AVG(salary) FROM salaries;
END$$

DELIMITER ;

CALL avg_salary();
CALL avg_salary;
CALL employees.avg_salary;
CALL employees.avg_salary();
DELIMITER $$
USE employees $$
CREATE PROCEDURE emp_salary(IN p_emp_no INTEGER)
BEGIN
SELECT e.first_name, e.last_name, s.salary, s.from_date, s.to_date
FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no
WHERE e.emp_no = p_emp_no;
END$$

DELIMITER ;
SELECT salary FROM salaries
ORDER BY salary DESC;
SELECT DISTINCT salary FROM salaries
ORDER BY salary DESC
LIMIT 1 OFFSET 2; 

