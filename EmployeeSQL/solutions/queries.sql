﻿-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employee_info As e
INNER JOIN salaries As s ON
e.emp_no = s.emp_no
ORDER BY emp_no;

-- 2. List first name, last name, and hire date for employees who were hired in 1986. 
SELECT first_name, last_name, hire_date
FROM employee_info
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM 
(
	(dept_managers As dm
	   INNER JOIN departments As d ON dm.dept_no = d.dept_no)
		INNER JOIN employee_info As e ON dm.emp_no = e.emp_no)
ORDER BY dept_no, emp_no;

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM 
(
	(dept_employees As de
	   INNER JOIN departments As d ON de.dept_no = d.dept_no)
		INNER JOIN employee_info As e ON de.emp_no = e.emp_no)
ORDER BY emp_no;

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM employee_info
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM 
(
	(dept_employees As de
	   INNER JOIN departments As d ON de.dept_no = d.dept_no)
		INNER JOIN employee_info As e ON de.emp_no = e.emp_no)
WHERE dept_name = 'Sales'
ORDER BY emp_no;

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM 
(
	(dept_employees As de
	   INNER JOIN departments As d ON de.dept_no = d.dept_no)
		INNER JOIN employee_info As e ON de.emp_no = e.emp_no)
WHERE dept_name = 'Sales'
OR dept_name = 'Development'
ORDER BY emp_no;

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) As "last_name_count"
FROM employee_info
GROUP BY last_name
ORDER BY "last_name_count" DESC;