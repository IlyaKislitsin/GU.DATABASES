USE employees;

DELIMITER // 

DROP FUNCTION IF EXISTS find_manager//

CREATE FUNCTION find_manager (surname VARCHAR(60), fname VARCHAR(60))
returns int
reads sql data
BEGIN
	DECLARE manager_no INT;
	SET manager_no = (SELECT employees.emp_no FROM employees 
		LEFT JOIN dept_manager
		ON employees.emp_no = dept_manager.emp_no
	WHERE employees.first_name = fname AND employees.last_name = surname 
    AND employees.emp_no = dept_manager.emp_no);
	RETURN (SELECT emp_no FROM employees
    WHERE emp_no = manager_no);
END//

DELIMITER ;

SELECT find_manager('Markovitch', 'Margareta') AS manager_id;