/*Joe
SampleInsert.sql
Inserting data
*/
USE shc;

INSERT INTO salesrep(srepno,srepname,srepstreet,srepcity,srepprov,sreppcode,totcomm,commrate)
VALUES('001','JOE','123 Street W.','Brampton','ON','L6K6H4',100,0.20);
INSERT INTO customer(custno,custname,custstreet,custcity,custprov,custpcode,disc,balance,creditlimit,srepno)
VALUES('C01','Jones','23 Bloor St.W.','Toronto','ON','P8M0U0',0,0,0,'001');
INSERT INTO part(partno,partdesc,onhand,partclass,unitprice)
VALUES('p001','Washer',2,'AP',200);
INSERT INTO part(partno,partdesc,onhand,partclass,unitprice)
VALUES('p002','Dish Washer',2,'AP',200);

INSERT INTO customer(custno,custname,custstreet,custcity,custprov,custpcode,disc,balance,creditlimit,srepno)
VALUES('C02','John Smith','1 Bloor St.','Brampton','ON','L6N5T4',0,500,1000,'001');

INSERT INTO salesrep(srepno,srepname,srepstreet,srepcity,srepprov,sreppcode,totcomm,commrate)
VALUES('002','JOSH TO','2 Green St.','Brampton','ON','L6L6H4',100,0.20);

select * from salesrep;
select * from customer;

update customer
set srepno = '002'
where custno = 'C02';


