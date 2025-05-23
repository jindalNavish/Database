USE HR
SELECT*
FROM JOBS
WHERE MAX_SALARY BETWEEN 6000 AND 16000;

SELECT* 
FROM JOBS
WHERE MAX_SALARY >= 6000 AND MAX_SALARY >=16000

SELECT*
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL

SELECT* 
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NULL

SELECT*
FROM EMPLOYEES
WHERE DEPARTMENT_ID IS NULL

SELECT*
FROM EMPLOYEES
WHERE LAST_NAME != 'BERNSTEIN' AND 
LAST_NAME != 'ERNST' AND
FIRST_NAME != 'DAVID'
AND 
FIRST_NAME != 'BRUCE'

SELECT*
FROM EMPLOYEES
WHERE NOT (FIRST_NAME ='DAVID' AND LAST_NAME = 'BERNSTEIN')
AND NOT (FIRST_NAME = 'BRUCE' AND LAST_NAME = 'ERNST')

SELECT*
FROM EMPLOYEES
WHERE (FIRST_NAME = 'AMIT' AND LAST_NAME = 'BANDA')

SELECT*
FROM LOCATIONS
WHERE CITY ='TORONTO'

SELECT* FROM EMPLOYEES
WHERE FIRST_NAME LIKE 'HERMAN_'

SELECT FIRST_NAME, LAST_NAME
FROM EMPLOYEES
ORDER BY FIRST_NAME , LAST_NAME 

SELECT FIRST_NAME, LAST_NAME
FROM EMPLOYEES
ORDER BY FIRST_NAME DESC

SELECT FIRST_NAME, LAST_NAME
FROM EMPLOYEES
ORDER BY FIRST_NAME DESC, LAST_NAME

SELECT FIRST_NAME, LAST_NAME
FROM EMPLOYEES
ORDER BY FIRST_NAME DESC

SELECT*
FROM EMPLOYEES
ORDER BY DEPARTMENT_ID DESC, MANAGER_ID DESC

SELECT*
FROM EMPLOYEES
ORDER BY HIRE_DATE ,DEPARTMENT_ID DESC

SELECT*
FROM EMPLOYEES
ORDER BY SALARY

SELECT DISTINCT FIRST_NAME --will eliminate similar rows
FROM EMPLOYEES

SELECT DISTINCT FIRST_NAME 
FROM EMPLOYEES 
WHERE DEPARTMENT_ID IN (60,70,80)

SELECT ROUND (SALARY,0)
FROM EMPLOYEES

SELECT CAST(ROUND($1211.946,2)AS INT)  'NEW''S NUMBER' 

SELECT CONCAT(FIRST_NAME,'------', LAST_NAME)AS 'SUBTRACTION'
FROM EMPLOYEES

SELECT CONCAT('HELLO AND', 'WORLD') AS 'THIS IS A STRING'

SELECT REPLACE (FIRST_NAME , 'ST', 'RT') AS 'MODIFIED STRING'
FROM EMPLOYEES
WHERE FIRST_NAME = 'STEVEN '

SELECT LTRIM('      HELLO WORLD   ')
AS 'SHORT STRING'

SELECT UPPER(FIRST_NAME) AS 'UPPERCASE FIRSTNAME'
FROM EMPLOYEES
WHERE UPPER(FIRST_NAME) = 'STEVEN'

SELECT SUBSTRING('SQL, DDL AND DML ' , 3 , 5) AS 'NEW STRING'

SELECT FLOOR(4.2) AS'NEW FLOOR VALUE'

SELECT SYSDATETIME() AS'Date and time'


SELECT CEILING(4,2)AS 'NEW CEILING VALUE';



SELECT SALARY*2
FROM EMPLOYEES
-- TO GET DATE AND TIME
SELECT SYSDATETIME() AS 'DATE AND TIME';

SELECT SYSDATETIME()  AS 'DATE AND TIME'
FROM EMPLOYEES

SELECT*
FROM EMPLOYEES
WHERE HIRE_DATE LIKE '2005'
ORDER BY HIRE_DATE;

--DATE PART TO EXTRACT THE PART OF DATE SUCH AS YEAR, MONTH , DAY
 SELECT DATEPART(YEAR, HIRE_DATE) AS 'HIRE''S YEARS' , HIRE_DATE
 FROM EMPLOYEES

 SELECT*
 FROM EMPLOYEES
 WHERE DATEPART(YYYY,HIRE_DATE) = 2008

 select COUNT(*) AS 'TOTAL NUMBER OF EMPLOYEES'
 FROM EMPLOYEES

  select COUNT(EMPLOYEE_ID) AS 'TOTAL NUMBER OF EMPLOYEES'
 FROM EMPLOYEES

  select COUNT(MANAGER_ID) AS 'TOTAL NUMBER OF EMPLOYEES'
 FROM EMPLOYEES

 SELECT MIN(SALARY) 
 FROM EMPLOYEES
 
 SELECT COUNT(DEPARTMENT_ID)
 FROM EMPLOYEES

















