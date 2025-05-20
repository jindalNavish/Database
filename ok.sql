use shc;
INSERT INTO salesrep(srepno,srepname,srepstreet,srepcity,srepprov,sreppcode,totcomm,commrate)
VALUES('003','Jim West','5 Main St.','Brampton','ON','K8I9P0',100,0.20);

UPDATE customer
set srepno = '003'
where srepno ='001';

DELETE
FROM salesrep
WHERE srepno ='001';

select * from customer;

update customer
set custno='D02'
where custno='C02';

