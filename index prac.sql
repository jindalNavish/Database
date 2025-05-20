-- creating index unique for a field to only happens once eg:- customer can only join once

create unique index pkcustomer ON customer(custnum);
create index pkorderline ON orderline(productnum,ordernum);
create index pkorders ON orders(ordernum);
create index pkproduct ON product(productnum);

-- drop index

drop index pkproduct ON customer;
drop index pkorders ON orders;
drop index pkproduct ON product;


desc orderline;