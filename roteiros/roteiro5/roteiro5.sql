








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
