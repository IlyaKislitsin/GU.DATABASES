use employees;

DROP TRIGGER IF EXISTS bonus_salary;

DELIMITER //

CREATE TRIGGER bonus_salary

AFTER  INSERT ON employees

FOR EACH ROW

BEGIN

	SET @employee = (SELECT emp_no FROM employees WHERE emp_no = NEW.emp_no);
    
    INSERT INTO salaries (emp_no, salary, from_date, to_date) 
    VALUES (@employee, 10000, NOW(), NOW());
    
END//

DELIMITER ;


INSERT INTO employees (emp_no, birth_date, first_name, last_name, gender, hire_date)
VALUES (55555555, DATE('1990-07-31'), 'Ilya','Kislitsin','M', NOW());

DELETE FROM employees WHERE emp_no = 55555555;