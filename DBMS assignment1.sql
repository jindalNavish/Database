SELECT * 
FROM PURCHASING.ProductVendor
SELECT *
FROM PURCHASING.PurchaseOrderDetail
SELECT*
FROM PURCHASING.PurchaseOrderHeader
SELECT *
FROM PURCHASING.ShipMethod
SELECT *
FROM PURCHASING.Vendor

SELECT ProductID, Name
FROM Purchasing.ProductVendor A, Purchasing.Vendor B
WHERE A.BusinessEntityID = B.BusinessEntityID;

SELECT *
FROM Purchasing.ProductVendor
WHERE StandardPrice > (SELECT AVG(StandardPrice) FROM Purchasing.ProductVendor);

SELECT*
FROM EMPLOYEES
SELECT*
FROM JOBS
SELECT*
FROM JOB_HISTORY
SELECT* 
FROM DEPARTMENTS
SELECT*
FROM LOCATIONS
SELECT* 
FROM COUNTRIES
SELECT*
FROM REGIONS

SELECT E.FIRST_NAME, J.Job_Title
FROM Employees E , Jobs J , Departments D , Locations L
WHERE E.Job_ID = J.Job_ID AND E.Department_ID = D.Department_ID AND D.Location_ID = L.Location_ID AND (Commission_PCT IS NULL OR Commission_PCT = 0)
      AND Country_ID != ('CA') AND COUNTRY_ID != ('UK');

SELECT *
FROM Employees E , Jobs J , Departments D , Locations L , Countries C , Regions R
WHERE E.Job_ID = J.Job_ID AND E.Department_ID = D.Department_ID AND D.Location_ID = L.Location_ID 
AND L.Country_ID = C.Country_ID AND C.Region_ID = R.Region_ID;

SELECT First_Name, Last_Name
FROM Employees
WHERE Salary > (
    SELECT AVG(Salary)
    FROM Employees
    WHERE Department_ID = (
        SELECT Department_ID
        FROM Departments
        WHERE Department_Name = 'Sales' ))
AND Job_ID IN (
    SELECT Job_ID
    FROM Jobs
    WHERE Job_Title LIKE '%Clerk%');









