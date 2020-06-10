-- (Quantos empregados do departamento 5 trabalham mais de 10h por semana no projeto chamado "ProductX"?) -
SELECT COUNT (*)
FROM empregado, trabalha_em, projeto
WHERE SSN=ESSN 
and PNO=PNUMERO 
AND PJNOME = 'ProductX' 
AND horas > 10 
AND dno = 5;


-- (Qual o nome do departamento com a menor média de salário entre seus funcionários?) -
SELECT dnome, AVG(salario)
FROM empregado, departamento
WHERE dno=dnumero 
GROUP BY 1 ORDER BY 2;

-- (Quantos empregados possuem um dependente com o mesmo primeiro nome que o deles?) -
SELECT COUNT (*)
FROM empregado, dependente
WHERE SSN=ESSN 
AND PNOME=NOME_DEPENDENTE;

-- (Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?) -
SELECT SUM(salario)
FROM empregado, departamento
WHERE DNOME='Research' 
AND DNO=DNUMERO;

-- (Qual seria o custo do projeto com folha salarial (soma de todos os salários), caso a empresa desse 10% de aumento para todos os empregados que trabalham no projeto 'ProductX'?) -
SELECT 1.1*SUM(salario)
FROM empregado, trabalha_em, projeto
WHERE SSN=ESSN AND PNO=PNUMERO AND PJNOME='ProductX';

-- (Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?) -
SELECT empreg.pnome
FROM empregado AS empreg, empregado AS ger
WHERE empreg.SUPERSSN=ger.SSN 
AND ger.pnome='Franklin' 
AND ger.unome='Wong';

-- (Quem é a pessoa que possui mais tempo de alocação no projeto 'Newbenefits'?) -
SELECT empregado.PNOME, trabalha_em.horas
FROM empregado, trabalha_em, projeto
WHERE projeto.PJNOME='Newbenefits' 
AND trabalha_em.PNO=projeto.pnumero
AND trabalha_em.ESSN=empregado.SSN
ORDER BY 2 DESC;