use employees;
# 1.
SELECT d.dept_name as departments, AVG(s.salary) as AVG_salary
FROM dept_emp as de
	LEFT JOIN departments as d ON de.dept_no = d.dept_no
	LEFT JOIN employees as e ON de.emp_no = e.emp_no
    LEFT JOIN salaries as s ON de.emp_no = s.emp_no
UNION
SELECT d.dept_name as departments, AVG(s.salary) as AVG_salary
FROM dept_manager as dm
	LEFT JOIN departments as d ON dm.dept_no = d.dept_no
	LEFT JOIN employees as e ON dm.emp_no = e.emp_no
    LEFT JOIN salaries as s ON dm.emp_no = s.emp_no
GROUP BY departments
ORDER BY departments;

# 2.
SELECT CONCAT(e.first_name, " ", e.last_name) AS full_name, MAX(s.salary) AS MAX_salary
FROM  dept_emp AS de
	LEFT JOIN employees AS e ON de.emp_no = e.emp_no
    LEFT JOIN salaries AS s ON de.emp_no = s.emp_no
    GROUP BY full_name
    ORDER BY MAX_salary DESC
    LIMIT 100;

# 3. Не понял как связать информацию из 2 таблиц(рабочие и зарплаты) при удалении.
    
# 4.
SELECT d.dept_name AS departments, COUNT(e.emp_no) as 'count'
 FROM dept_emp AS de
 LEFT JOIN departments AS d ON de.dept_no = d.dept_no
 LEFT JOIN employees AS e ON de.emp_no = e.emp_no
 GROUP BY departments;

# 5.
SELECT d.dept_name AS departments, COUNT(e.emp_no) as 'count', SUM(s.salary) AS departments_money
 FROM dept_emp AS de
 LEFT JOIN departments AS d ON de.dept_no = d.dept_no
 LEFT JOIN employees AS e ON de.emp_no = e.emp_no
 LEFT JOIN salaries AS s ON de.emp_no = s.emp_no
 GROUP BY departments
 ORDER BY departments_money;

    


	