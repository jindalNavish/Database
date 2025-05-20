use generalstore;

-- all customers 

select custname,city, count(ordernum) as num_of_orders
from customer c left join orders o on c.Custnum = o.Custnum
group by custname, city;

-- 

select custname,city, count(ordernum) as num_of_orders, 'A' as cust_type
from customer c left join orders o on c.Custnum = o.Custnum
group by custname, city
having count(ordernum)=0
union all
select custname,city, count(ordernum) as num_of_orders, 'B' as cust_type
from customer c left join orders o on c.Custnum = o.Custnum
group by custname, city
having count(ordernum)=1
union all
select custname,city, count(ordernum) as num_of_orders, 'C' as cust_type
from customer c left join orders o on c.Custnum = o.Custnum
group by custname, city
having count(ordernum)=2
union all
select custname,city, count(ordernum) as num_of_orders, 'D' as cust_type
from customer c left join orders o on c.Custnum = o.Custnum
group by custname, city
having count(ordernum)>2
union all
select 'total','', count(ordernum) as num_of_orders, '' as cust_type
from customer c left join orders o on c.Custnum = o.Custnum;

select city, count(*) as num_of_customer
from customer 
where city in
('BRAMPTON','MISSISSAUGA','OAKVILLE','TORONTO')
group by city
having count(*) > 2
order by 2 desc,city;

select custname,city, count(ordernum) as num_of_orders
from customer c join orders o ON c.custnum = o.custnum 
where city in
('OAKVILLE','TORONTO')
group by custname,city
having count(ordernum) > 1
order by city,custname;

