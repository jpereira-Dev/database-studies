--questão 1
SELECT COUNT(*)
FROM employee
WHERE sex = 'F';

--questão2
SELECT AVG(salary)
FROM employee
WHERE address LIKE '%, TX' and sex = 'M';

--questão 3
SELECT E.superssn AS ssn_supervisor, COUNT(*) AS qtd_supervisionados
FROM employee AS E
GROUP BY E.superssn
ORDER BY qtd_supervisionados;

--questão 4
 SELECT sup.FNAME AS supevisor_name, COUNT(sup.ssn) AS qtd_supervisionados
 FROM employee AS sup
 INNER JOIN employee AS sub ON sup.ssn = sub.superssn
 GROUP BY sup.ssn
 ORDER BY  qtd_supervisionados;

 --questão 5
 SELECT sup.FNAME AS supevisor_name, COUNT(*) AS qtd_supervisionados
 FROM employee AS sup
 RIGHT JOIN employee AS sub ON sup.ssn = sub.superssn
 GROUP BY sup.ssn;

--questão 6
SELECT MIN(qtd) FROM (SELECT COUNT(*) AS qtd
FROM project AS proj, works_on AS trab, employee AS func
WHERE proj.Pnumber = trab.pno AND trab.Essn = func.ssn
GROUP BY Pnumber) AS qtd_funcionarios;



--questão 7


-- questão 8
SELECT proj.Pnumber AS number_project, AVG(salary) AS Average_salary
FROM works_on AS trab, employee AS func, project AS proj
WHERE proj.Pnumber = trab.pno and trab.Essn = func.ssn
GROUP BY proj.Pnumber;

-- questão 9
SELECT proj.Pnumber AS number_project, proj.Pname AS project_name, AVG(salary) AS Average_salary
FROM works_on AS trab, employee AS func, project AS proj
WHERE proj.Pnumber = trab.pno and trab.Essn = func.ssn
GROUP BY proj.Pnumber;

