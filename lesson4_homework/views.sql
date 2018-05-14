USE employees;

# 1.
CREATE VIEW employees_avg_salary AS

SELECT departments.dept_name AS departments, ROUND(AVG(salaries.salary), 2) AS AVG_salary
FROM dept_emp

	LEFT JOIN departments
    ON dept_emp.dept_no = departments.dept_no
    
	LEFT JOIN employees 
    ON dept_emp.emp_no = employees.emp_no
    
    LEFT JOIN salaries 
    ON dept_emp.emp_no = salaries.emp_no

GROUP BY departments
ORDER BY departments;

SELECT * FROM employees_avg_salary;

# 2.
CREATE VIEW employees_max_salary AS

SELECT CONCAT(employees.first_name, " ", employees.last_name) AS full_name, 
MAX(salaries.salary) AS MAX_salary
FROM  employees

    LEFT JOIN salaries 
    ON employees.emp_no = salaries.emp_no
    
GROUP BY full_name
ORDER BY MAX_salary DESC
LIMIT 100;

SELECT * FROM employees_max_salary;

# 3. С удалением так и не разобрался, 
#    почему-то не могу добиться чтобы вложенные запросы работали.

# 4.
CREATE VIEW count_dept_emp AS

SELECT departments.dept_name AS departments, 
COUNT(employees.emp_no) as 'count'
FROM dept_emp

	LEFT JOIN departments 
	ON dept_emp.dept_no = departments.dept_no

	LEFT JOIN employees 
	ON dept_emp.emp_no = employees.emp_no

GROUP BY departments;

SELECT * FROM count_dept_emp;

# 5.
CREATE VIEW dept_money AS

SELECT departments.dept_name AS departments, 
COUNT(employees.emp_no) as 'count',
SUM(salaries.salary) AS departments_money
FROM dept_emp

	LEFT JOIN departments 
	ON dept_emp.dept_no = departments.dept_no

	LEFT JOIN employees 
	ON dept_emp.emp_no = employees.emp_no

	LEFT JOIN salaries
	ON dept_emp.emp_no = salaries.emp_no

WHERE dept_emp.to_date > NOW()
AND salaries.to_date > NOW()

GROUP BY dept_emp.dept_no
ORDER BY departments_money DESC;

SELECT * FROM dept_money;