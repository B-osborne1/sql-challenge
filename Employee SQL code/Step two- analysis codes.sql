--Analysis Section

--Section 1: List the employee number, last name, first name, sex, and salary of each employee
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM salaries
INNER JOIN employees ON
employees.emp_no=salaries.emp_no
LIMIT 10;

--Section 2: List the first name, last name, and hire date for the employees who were hired in 1986
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '%1986'
LIMIT 10;

--Section 3: List the manager of each department along with their department number, department name, employee number, last name, and first name
SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.first_name, employees.last_name
FROM dept_manager
INNER JOIN departments ON
dept_manager.dept_no = departments.dept_no
INNER JOIN employees ON
dept_manager.emp_no = employees.emp_no
LIMIT 10;


--Section 4: List the department number for each employee along with that employee’s employee number, last name, first name, and department name
SELECT departments.dept_no, dep_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name 
FROM dep_emp
INNER JOIN departments ON
dep_emp.dept_no = departments.dept_no
INNER JOIN employees ON
dep_emp.emp_no = employees.emp_no
ORDER BY dep_emp.emp_no
LIMIT 10;

--Section 5: List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%'
ORDER BY last_name
LIMIT 10;

--Section 6: List each employee in the Sales department, including their employee number, last name, and first name
SELECT emp_no, last_name, first_name
FROM employees
WHERE emp_no IN
	(
	SELECT emp_no
	FROM dep_emp
	WHERE dept_no IN
		(
		SELECT dept_no
		FROM departments
		WHERE dept_name = 'Sales'
		)
	)
LIMIT 10;

--Section 7: List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN dep_emp 
ON employees.emp_no = dep_emp.emp_no
JOIN departments ON dep_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales' 
OR departments.dept_name = 'Development'
LIMIT 10;

--Section 8: List the frequency counts, in descending order, of all the employee last names
SELECT last_name, COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC
LIMIT 10;