








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
SELECT proj.Pnumber AS number_project, COUNT(*) AS qtd
FROM project AS proj, works_on AS trab, employee AS func 
WHERE proj.Pnumber = trab.pno AND trab.Essn = func.ssn 
GROUP BY Pnumber;