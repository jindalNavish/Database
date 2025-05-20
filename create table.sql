use shc;

create table samplepart
(partno char(4) primary key,
partdesc varchar(20),
onhand integer,
partclass char(2),
unitprice decimal(6,2));

INSERT INTO
samplepart(partno,partdesc,onhand,partclass,unitprice)
SELECT
partno,partdesc,onhand,partclass,unitprice
FROM part
WHERE partno='p002';

create table samplepart2 as
select * from part;

select * from samplepart2;
desc samplepart2;

create table samplepart2a like part;
desc samplepart2a;

alter table samplepart add partname varchar(20);
desc samplepart;

update samplepart set partname='UNKNOWN'
where partname is NULL
limit 10;

alter table samplepart modify partname varchar(30) not null default 'unknown';
alter table samplepart drop partname;

select * from customer;
select * from customer where custcity = 'toronto' and balance > 0;

desc samplepart;
alter table samplepart DROP partclass;

select * from customer;
