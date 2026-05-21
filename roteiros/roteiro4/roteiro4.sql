-- questão 1
SELECT * FROM department;

-- questão 2
SELECT * FROM  dependent;

-- questão 3
SELECT * FROM dept_locations;

-- questão 4
SELECT * FROM employee;

-- questão 5
SELECT * FROM project;

-- questão 6
SELECT * FROM works_on;

-- questão 7
SELECT Fname,Lname FROM employee WHERE Sex ='M';

-- questão 8
SELECT Fname FROM employee WHERE Sex = 'M' and Superssn IS NULL;