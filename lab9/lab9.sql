CREATE TABLE employees(
    id INT,
    name VARCHAR(10),
    position VARCHAR(10),
    salary INTEGER
);

-- 1
CREATE OR REPLACE FUNCTION increase_value(value INT)
RETURNS INT AS $$
BEGIN
    RETURN value + 10;
END;
$$ LANGUAGE plpgsql;

-- 2
CREATE OR REPLACE FUNCTION compare_numbers(num1 INT, num2 INT)
RETURNS TEXT AS $$
BEGIN
    IF num1 > num2 THEN
        RETURN 'Greater';
    ELSIF num1 = num2 THEN
        RETURN 'Equal';
    ELSE
        RETURN 'Lesser';
    END IF;
END;
$$ LANGUAGE plpgsql;

-- 3
CREATE OR REPLACE FUNCTION number_series(n INT)
RETURNS TEXT AS $$
DECLARE
    i INT := 1;
    series TEXT := '';
BEGIN
    WHILE i <= n LOOP
        series := series || i || CASE WHEN i < n THEN ', ' ELSE '' END;
        i := i + 1;
    END LOOP;
    RETURN series;
END;
$$ LANGUAGE plpgsql;


-- 4
CREATE OR REPLACE FUNCTION find_employee(emp_name TEXT)
RETURNS TEXT AS $$
DECLARE
    emp_details TEXT;
BEGIN
    SELECT CONCAT('ID: ', id, ', Name: ', name, ', Position: ', position)
    INTO emp_details
    FROM employees
    WHERE name = emp_name;
    RETURN emp_details;
END;
$$ LANGUAGE plpgsql;


CREATE TABLE products();

-- 5
CREATE OR REPLACE FUNCTION list_products(category_name TEXT)
RETURNS TABLE(id INT, name TEXT, price NUMERIC, category TEXT) AS $$
BEGIN
    RETURN QUERY SELECT * FROM products WHERE category = category_name;
END;
$$ LANGUAGE plpgsql;

-- 6
CREATE OR REPLACE FUNCTION calculate_bonus(emp_id INT)
RETURNS NUMERIC AS $$
DECLARE
    bonus NUMERIC;
BEGIN
    SELECT salary * 0.1 INTO bonus FROM employees WHERE id = emp_id;
    RETURN bonus;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION update_salary(emp_id INT)
RETURNS VOID AS $$
DECLARE
    bonus NUMERIC;
BEGIN
    bonus := calculate_bonus(emp_id);
    UPDATE employees SET salary = salary + bonus WHERE id = emp_id;
END;
$$ LANGUAGE plpgsql;

-- 7
CREATE OR REPLACE FUNCTION complex_calculation(num1 INT, text1 TEXT)
RETURNS TEXT AS $$
DECLARE
    numeric_result INT;
    text_result TEXT;
    final_result TEXT;
BEGIN
    BEGIN
        numeric_result := num1 * 3;
    END;

    BEGIN
        text_result := text1 || ' is processed';
    END;

    final_result := 'The numeric result is: ' || numeric_result || ', ' || 'The text result is: ' || text_result;

    RETURN final_result;
END;
$$ LANGUAGE plpgsql;