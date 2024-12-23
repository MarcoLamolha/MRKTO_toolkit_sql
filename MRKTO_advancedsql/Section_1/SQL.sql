-- Active: 1730444673961@@127.0.0.1@5432@postgres@mrkto
-- This code runs with postgresql

CREATE DATABASE IF NOT EXISTS MRKTO;

CREATE SCHEMA IF NOT EXISTS MRKTO;

CREATE TABLE employees (
    id INT NOT NULL PRIMARY KEY, -- one way to set the primary key
    first_name VARCHAR(50) NOT NULL, 
    last_name VARCHAR(50) NOT NULL, 
    email VARCHAR(100),
    hire_date DATE DEFAULT current_date, 
    department VARCHAR(50) DEFAULT 'Unassigned'
);

CREATE TABLE employees_two (
    id INT NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    hire_date DATE NOT NULL,
    department VARCHAR(50) NOT NULL,
    PRIMARY KEY (id) -- one way to set the primary key
);


SELECT * FROM employees;





ALTER TABLE employees ADD COLUMN age INT
;
ALTER TABLE employees DROP COLUMN age;
ALTER TABLE employees ADD COLUMN age INT;
ALTER TABLE employees ALTER COLUMN age TYPE INT;
ALTER TABLE employees ALTER COLUMN age SET NOT NULL;

UPDATE employees SET age = 15;


-- INSERT
INSERT INTO employees (id, first_name, last_name, email) VALUES
-- (1, 'John', 'Doe', 'johndoe@example.com'),
(9, 'Jane', 'Smith', 'janesmith@example.com'),
(11, 'Bob', 'Johnson', 'bobjohnson@example.com'),
(12, 'Alice', 'Williams', 'alicewilliams@example.com');

INSERT INTO employees_two (id, first_name, last_name, email, hire_date, department)
VALUES
    (1, 'John', 'Doe', 'johndoe@example.com', '2022-01-01', 'Sales'),
    (2, 'Jane', 'Doe', 'janedoe@example.com', '2022-01-02', 'Marketing'),
    (3, 'Bob', 'Smith', 'bobsmith@example.com', '2022-01-03', 'Human Resources'),
    (4, 'Alice', 'Jones', 'alicejones@example.com', '2022-01-04', 'Sales'),
    (6, 'Tom', 'Wilson', 'tomwilson@example.com', '2022-01-05', 'Marketing');

-- UPDATE
UPDATE employees
SET 
    first_name = 'Jane',
    last_name = 'Doe',
    email = 'janedoe@example.com'
WHERE id = 8;

-- DELETE
-- DELETE FROM employees WHERE id = 3;
-- DELETE FROM employees WHERE id in (1, 4);

-- TRUNCATE
-- TRUNCATE TABLE employees;


-- MERGE
MERGE INTO employees AS e
USING employees_two AS e2
ON e.id = e2.id
WHEN MATCHED THEN
    UPDATE SET 
        first_name = e2.first_name,
        last_name = e2.last_name,
        email = e2.email,
        hire_date = e2.hire_date,
        department = e2.department
WHEN NOT MATCHED THEN
    INSERT (id, first_name, last_name, email, hire_date, department)
    VALUES (e2.id, e2.first_name, e2.last_name, e2.email, e2.hire_date, e2.department);

-- DROP
-- drop table employees;
-- drop table employees_two;