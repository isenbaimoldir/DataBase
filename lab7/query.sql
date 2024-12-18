CREATE DATABASE lab7;


CREATE TABLE countries(
    country_id SERIAL PRIMARY KEY,
    name VARCHAR(25)
);

CREATE TABLE departments(
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(50) UNIQUE,
    budget INT
);

CREATE TABLE employees(
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50),
    phone_number VARCHAR(20),
    salary INT,
    department_id INT REFERENCES departments
);

--1
CREATE INDEX name_index ON countries(name);

--2
CREATE INDEX employee_name_index ON employees(first_name, last_name);


--3
CREATE UNIQUE INDEX employee_id_index ON employees(employee_id);

--4
CREATE INDEX sub_name_index ON employees(substring(first_name FROM 1 FOR 4));

SELECT * FROM employees WHERE substring(first_name from 1 for 4) = 'abcd';
--5
CREATE INDEX budget_index ON departments(budget);
CREATE INDEX salary_index ON employees(salary);
