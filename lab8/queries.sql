-- 1
CREATE DATABASE lab8;

-- 2
CREATE TABLE salesman(
    salesman_id SERIAL PRIMARY KEY,
    name VARCHAR(25),
    city VARCHAR(50),
    commission FLOAT
);

CREATE TABLE customers(
    customer_id SERIAL PRIMARY KEY,
    cust_name VARCHAR(50),
    city VARCHAR(50),
    grade INT,
    salesman_id INT REFERENCES salesman(salesman_id)
);

CREATE TABLE orders(
    ord_no SERIAL PRIMARY KEY,
    purch_amt FLOAT,
    ord_date DATE,
    customer_id INT REFERENCES customers(customer_id),
    salesman_id INT REFERENCES salesman(salesman_id)
);

-- 3
CREATE ROLE junior_dev LOGIN;

-- 4
CREATE VIEW salesmen_in_New_York AS 
    SELECT * FROM salesman WHERE city = 'New York';


-- 5
CREATE VIEW cust_salesman_names AS 
    SELECT c.cust_name, s.name 
    FROM customers c 
    JOIN salesman s ON c.salesman_id = s.salesman_id;

GRANT ALL ON cust_salesman_names TO junior_dev;

-- 6
CREATE VIEW highest_grade AS 
    SELECT * FROM customers 
    WHERE grade = (SELECT MAX(grade) FROM customers);

GRANT SELECT ON highest_grade TO junior_dev;

-- 7
CREATE VIEW num_of_salesmen AS 
    SELECT city, COUNT(salesman_id) AS num_salesmen 
    FROM salesman 
    GROUP BY city;

-- 8
CREATE VIEW salesmen_with_cust AS 
    SELECT s.salesman_id, s.name 
    FROM customers c 
    JOIN salesman s ON s.salesman_id = c.salesman_id 
    GROUP BY s.salesman_id, s.name 
    HAVING COUNT(c.customer_id) > 1;

-- 9
CREATE ROLE intern;
GRANT junior_dev TO intern;