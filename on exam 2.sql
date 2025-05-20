
UPDATE customer
SET creditlimit = 0
WHERE creditlimit IS NULL
limit 10;

insert into customer values(50,"Navish","Brampton",450);

select * from customer;

create view v_brampton_customer as
select *
from customer
where city="Brampton";



select * from v_brampton_customer;

UPDATE v_brampton_customer
SET creditlimit = 1000
LIMIT 10;

create table temp_for_cust as
select custname, count(o.ordernum) as num_of_ordres
from customer c 
left join orders o
ON c.custnum = o.custnum 
where city="Toronto"
group by custname;

select * from temp_for_cust;

select * 
from product
where msrp = (select max(msrp) from product);

select * 
from product
where msrp = (select min(msrp) from product);

select SUM(msrp * onhand) 
as "total value"
from product;

select SUM(salesprice * quantity) as value_of_orders
from orderline; 

select SUM(salesprice * quantity) as value_of_orders
from orderline ol
join orders o ON o.ordernum = ol.ordernum 
where orderdate between "1997-09-01" and "1997-09-31"; 


select SUM(salesprice * quantity) as value_of_orders, COUNT(DISTINCT o.ordernum ) as orders
from orderline ol
join orders o ON o.ordernum = ol.ordernum 
where orderdate between "1997-09-01" and "1997-09-31"; 

select *
from product
where msrp > (SELECT AVG(MSRP) from product);



