use generalstore;

select * from product;
select * from orderline;
select * from product where
productnum not in( select distinct productnum 
from orderline);

select * from product where
productnum in(select distinct productnum from orderline
where ordernum in (select ordernum from orders
where orderdate between "1997-09-1" and '1997-9-30')); 

select sum(salesprice) as total_price from orderline where
productnum in(select distinct productnum from orderline
where ordernum in (select ordernum from orders
where orderdate between "1997-09-1" and '1997-9-30')); 

select *  from orderline where
productnum in(select  productnum from orderline
where ordernum in (select ordernum from orders
where orderdate between "1997-09-1" and '1997-9-30')); 