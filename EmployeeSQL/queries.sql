-- List the following details of each employee: 
-- employee number, last name, first name, sex, and salary.
SELECT Employee.emp_no, last_name, first_name, sex, salary FROM Employee
INNER JOIN salaries
ON Employee.emp_no = salaries.emp_no;

-- List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date FROM Employee
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31'
ORDER BY hire_date

-- List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name.
SELECT dept_manager.emp_no, dept_manager.dept_no, dept_name, first_name, last_name FROM dept_manager
INNER JOIN Employee
ON dept_manager.emp_no = Employee.emp_no
INNER JOIN departments
ON dept_manager.dept_no = departments.dept_no;

-- List the department number of each employee with the following information:
-- employee number, last name, first name, and department name.
SELECT Employee.emp_no,  last_name, first_name, dept_name, departments.dept_no  FROM Employee
LEFT JOIN dept_emp ON Employee.emp_no = dept_emp.emp_no
LEFT JOIN departments ON dept_emp.dept_no = departments.dept_no;

-- List first name, last name, and sex for employees whose 
-- first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex FROM Employee
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- List all employees in the Sales department, including their 
-- employee number, last name, first name, and department name.
SELECT Employee.emp_no, last_name, first_name, dept_name FROM Employee
LEFT JOIN dept_emp ON Employee.emp_no = dept_emp.emp_no
LEFT JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE dept_name = 'Sales';

-- List all employees in the Sales and Development departments, including 
-- their employee number, last name, first name, and department name.
SELECT Employee.emp_no, last_name, first_name, dept_name FROM Employee
LEFT JOIN dept_emp ON Employee.emp_no = dept_emp.emp_no
LEFT JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE dept_name = 'Sales' OR dept_name = 'Development';

-- In descending order, list the frequency count of employee
-- last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) FROM Employee
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;
