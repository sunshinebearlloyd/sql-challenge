--verify import
SELECT * FROM departments LIMIT 5;
SELECT * FROM dept_emp LIMIT 5;
SELECT * FROM dept_manager LIMIT 5;
SELECT * FROM employees LIMIT 5;
SELECT * FROM salaries LIMIT 5;
SELECT * FROM titles LIMIT 5;

--List the employee number, last name, first name, sex, and salary of each employee
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
INNER JOIN salaries AS s
ON e.emp_no=s.emp_no;


--List the first name, last name, and hire date for the employees who were hired in 1986
SELECT first_name, last_name, hire_date
FROM employees
WHERE DATE_PART('year',hire_date)='1986';

--List the manager of each department 
--along with their department number, department name, employee number, last name, and first name
SELECT man.dept_no, dept.dept_name, man.emp_no, empl.last_name, empl.first_name
FROM employees empl
INNER JOIN dept_emp de ON de.emp_no = empl.emp_no
INNER JOIN departments dept ON dept.dept_no = de.dept_no
INNER JOIN dept_manager man ON man.emp_no = empl.emp_no;

--List the department number for each employee 
--along with that employee’s employee number, last name, first name, and department name
SELECT dept.dept_no, empl.emp_no, empl.last_name, empl.first_name, dept.dept_name
FROM employees empl
INNER JOIN dept_emp de ON de.emp_no = empl.emp_no
INNER JOIN departments dept ON dept.dept_no = de.dept_no;

--List first name, last name, and sex of each employee 
--whose first name is Hercules and whose last name begins with the letter B
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%'

--List each employee in the Sales department,
--including their employee number, last name, and first name 
SELECT empl.emp_no, empl.last_name, empl.first_name
FROM employees empl
INNER JOIN dept_emp de ON de.emp_no = empl.emp_no
INNER JOIN departments dept ON dept.dept_no = de.dept_no
WHERE dept.dept_name = 'Sales';

--List each employee in the Sales and Development departments,
--including their employee number, last name, first name, and department name
SELECT empl.emp_no, empl.last_name, empl.first_name, dept.dept_name
FROM employees empl
INNER JOIN dept_emp de ON de.emp_no = empl.emp_no
INNER JOIN departments dept ON dept.dept_no = de.dept_no
WHERE dept.dept_name = 'Sales'
OR dept.dept_name = 'Development';


--List the frequency counts, in descending order, of all the employee last names 
--(that is, how many employees share each last name)
SELECT last_name,COUNT(last_name) 
FROM employees 
GROUP BY last_name
ORDER BY last_name DESC;



