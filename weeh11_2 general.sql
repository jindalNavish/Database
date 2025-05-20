use generalstore;

-- maybe in exam

select * 
from customer
where custnum not in(Select distinct custnum from orders where custnum IS not NULL);

select *
from customer c left join orders o
ON o.custnum = c.custnum
where  ordernum is NULL ;

create or replace view  vCustomerOrder as
select * 
from customer
where custnum not in(Select distinct custnum from orders where custnum IS not NULL);

select * from vCustomerOrder;
desc vCustomerOrder;

