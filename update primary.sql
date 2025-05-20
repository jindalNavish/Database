use generalstore;

select * from orders;
select * from orderline;

insert into orders(select '100',OrderDate,Filled,CustNum from orders where OrderNum='1');
update orderline
set OrderNum='100'
where OrderNum='1';

delete from orders where OrderNum='1';

create table temp as
select * from orders where OrderNum='100';

update temp
set OrderNum='1'
where OrderNum='100'
limit 5;

insert into orders(select * from temp);

update orderline
set OrderNum='1'
where OrderNum='100';

delete from orders
where OrderNum='100';

drop table temp;

select * from orders;
