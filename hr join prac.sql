use hr;
desc locations;

SELECT DISTINCT e.EMPLOYEE_ID AS Customer_Number, e.FIRST_NAME, e.LAST_NAME, jh.Job_ID AS Order_Number
FROM employees e
JOIN departments d ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
JOIN locations l ON d.LOCATION_ID = l.Location_id
JOIN job_history jh ON e.EMPLOYEE_ID = jh.Employee_ID
WHERE l.City = 'Toronto' AND e.MANAGER_ID IS NULL
ORDER BY e.FIRST_NAME ASC;

SELECT e.FIRST_NAME AS Customer_Name, e.LAST_NAME, jh.Job_ID AS Order_Number, jh.Start_Date AS Order_Date
FROM employees e
JOIN job_history jh ON e.EMPLOYEE_ID = jh.Employee_ID
JOIN jobs j ON h.Job_ID = jh.Job_ID
WHERE LOWER(j.Job_Title) LIKE '%dishwasher%';

SELECT AVG((j.Min_Salary + j.Max_Salary) / 2) AS Avg_Order_Price
FROM job_history jh
JOIN jobs j ON jh.Job_ID = j.Job_ID
WHERE LOWER(j.Job_Title) LIKE '%sports%'
  AND jh.Start_Date BETWEEN '2020-01-01' AND '2022-11-30';



