use generalstore;

-- example 1

SELECT custname,custnum,creditlimit,
CASE
	WHEN creditlimit > 0 AND creditlimit <= 1000 THEN 'Low credit limit'
	WHEN creditlimit >1000 THEN 'High credit limit'
	ELSE 'No credit limit'
END AS CreditLimitRank
FROM customer;

-- example 2

SELECT producttype , descr, productnum, onhand, msrp,
CASE
	WHEN onhand <10 then 'Low'
    WHEN onhand between 10 and 50 then 'MEDIUM'
    WHEN onhand > 50 then 'High'
    ELSE 'unknown'
END as InventoryLevel
from product;

-- example 3

SELECT custname, count(ordernum) as numoforders,
CASE
	WHEN COUNT(ordernum) between 1 and 2 then 'A1'
    WHEN COUNT(ordernum) >2 then 'A2'
    ELSE 'unknown'
END as custtype

from customer c
LEFT JOIN orders o ON 
c.custnum = o.custnum
group by custname;

-- example 4

SELECT descr, p.productnum, SUM(quantity) as number_sold,
CASE
	WHEN SUM(quantity) < 10 THEN 'P1'
    WHEN SUM(quantity) >= 10 then 'P2'
    ELSE 'P0'
END as product_rank

from product p 
LEFT JOIN orderline ol ON 
p.productnum = ol.productnum
group by descr,p.productnum;

SELECT coalesce(custname,'TOTAL') as Customer_Name,COUNT(ordernum) as num_of_orders
from customer c left join orders o
ON c.custnum = o.custnum
group by custname with rollup;

-- with rollup

SELECT coalesce(custname, 'GRAND TOTAL') as custname, COUNT(ordernum) as num_of_orders
from customer c left join orders o 
ON c.custnum = o.custnum
where orderdate between '1997-12-01' and '1997-12-31'
group by custname with rollup;

-- with union

SELECT custname, COUNT(ordernum) as num_of_orders
from customer c left join orders o 
ON c.custnum = o.custnum
where orderdate between '1997-12-01' and '1997-12-31'
group by custname
UNION ALL
SELECT'Grand Total', COUNT(o.ordernum)
FROM customer c JOIN orders o ON c.custnum= o.custnum
where orderdate between '1997-12-01' and '1997-12-31';




