use generalstore;
select * from customer;
SELECT * FROM customer WHERE city='Toronto' OR city='Oakville';
	
SELECT * FROM customer WHERE city IN('Toronto','Oakville');

SELECT * FROM customer WHERE city='Toronto' AND city='Oakville';

update Product_T set Unit_Price = 775 