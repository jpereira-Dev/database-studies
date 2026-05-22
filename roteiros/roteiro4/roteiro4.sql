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

-- questão 9
SELECT E.Fname, S.Fname FROM employee AS E, employee AS S WHERE E.superssn = S.ssn;

--questão 10
SELECT E.Fname FROM employee AS E, employee AS S WHERE E.superssn = S.ssn and S.Fname = 'Franklin';

--questão 11
SELECT T.Dname, E.Dlocation FROM department AS T, dept_locations AS E;

-- questão 12
SELECT T.Dname FROM department AS T, dept_locations AS E WHERE T.Dnumber = E.Dnumber and E.Dlocation LIKE 'S%';

--questão 13
SELECT T.Fname,T.Lname,E.Dependent_name FROM employee AS T, dependent AS E WHERE E.Essn = T.ssn;

--questão 14
SELECT T.Fname ||' '||  T.Lname AS Full_name, T.salary FROM employee AS T WHERE T.salary > 50000;

--questão 15
SELECT P.Pname AS project_name, D.Dname AS department_name FROM project AS P, department AS D WHERE P.Dnum = D.Dnumber;

--questão 16
SELECT P.Pname AS project_name, E.Fname AS gerent_name FROM project P, department D, employee E WHERE P.pnumber > 30 and P.dnum = D.dnumber and D.mgrssn = E.ssn;

--questão 17
SELECT P.Pname AS project_name, E.Fname AS employee_name FROM project P, works_on w, employee E Where P.pnumber = w.pno and w.Essn = E.ssn;

--questão 18

SELECT E.Fname AS employee_name, D.dependent_name, D.relationship FROM employee E, dependent D, works_on w WHERE E.ssn = D.essn and w.essn = e.ssn and w.pno = 91;