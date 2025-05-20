use generalstore;

-- Question 1
SELECT COUNT(*) AS Total_Customers
FROM customer
WHERE CreditLimit = 1000
AND City IN ('Toronto', 'Brampton');

-- Question 2
SELECT *
FROM product
WHERE msrp = (SELECT MIN(msrp) FROM product)
LIMIT 5;


