use generalstore;

select productnum, descr, msrp, avgmsrp
from ( SELECT AVG(msrp) AS avgmsrp FROM product) ap, product
where msrp>avgmsrp;

select *
from customer c join orders o on c.CustNum = o.CustNum;

-- equijoin

select *
from customer c , orders o where c.CustNum = o.CustNum;

-- natural join ( no duplicate row)

select *
from customer c natural join orders o where  c.CustNum = o.CustNum;



