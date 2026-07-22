-- Questão 01
--  A)
CREATE VIEW vw_dptmgr 
AS SELECT D.dnumber, E.fname AS nome 
FROM department AS D, employee AS E
WHERE E.ssn = D.mgrssn;

-- B)
CREATE VIEW vw_empl_houston
AS SELECT ssn, fname AS nome 
FROM employee 
WHERE address LIKE '%, Houston, %';

-- C)
CREATE VIEW vw_deptstats
AS SELECT dnumber, dname, COUNT(*) AS qtd_funcionarios
FROM department, employee
Where dnumber = dno 
GROUP BY Dnumber; 

-- D)
CREATE VIEW vw_projstats
AS SELECT P.pnumber AS id_project, COUNT(W.essn) AS qtd_funcionarios
FROM project AS P
LEFT JOIN works_on AS W ON P.pnumber = W.pno
GROUP BY P.pnumber;


-- Questão 2
-- consultas
SELECT nome from vw_dptmgr;