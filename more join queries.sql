use generalstore;

-- show products that has never been ordered

select p.* 
from product p left join orderline ol 
ON p.productnum = ol.productnum
where ol.productnum is null;

-- show customers who have never replaced any order
select * 
from customer c left join orders o 
ON c.CustNum = o.CustNum
where ordernum is Null ;

-- show products that have been ordered in september 1997
select * from product where
productnum in(select distinct productnum from orderline
where ordernum in (select ordernum from orders
where orderdate between "1997-09-1" and '1997-9-30')); 

-- disply product name, order number, order date, customer number
select descr,o.ordernum,orderdate,custnum
from orders o join orderline ol On o.orderNum = ol.orderNum
join product p ON ol.productnum = p.productnum
where orderdate between "1997-09-1" and '1997-9-30';

select * from orders;

-- Show customers who have places orders

select  c.*,Orderdate,OrderNum
from customer c left join
orders o ON c.custnum = o.custnum;

-- show all the customers who have placed order
-- tip if the question asks all the customers it means outter join

select c.*
from customer c left join orders o
ON o.custnum = c.custnum
where  ordernum is NULL ;

-- show customers who never placed any orders

	
	
	
SELECT custname, custnum FROM customer WHERE custnum IN(
SELECT DISTINCT custnum FROM orders);