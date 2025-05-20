
USE shc;
DROP TABLE IF EXISTS invprod;
DROP TABLE IF EXISTS invoice;
DROP TABLE IF EXISTS orderprod;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS salesrep;
DROP TABLE IF EXISTS part;
CREATE TABLE part
(partno CHAR(4) PRIMARY KEY,
partdesc VARCHAR(20),
onhand INTEGER,
partclass CHAR(2),
unitprice DECIMAL(6,2)
);
CREATE TABLE salesrep
(srepno CHAR(3) PRIMARY KEY,
srepname VARCHAR(25)NOT NULL,
srepstreet VARCHAR(30)NOT NULL,
srepcity VARCHAR(15) NOT NULL,
srepprov VARCHAR(3) NOT NULL,
sreppcode VARCHAR(6) NOT NULL,
totcomm DECIMAL(8,2),
commrate DECIMAL(3,2)
);


CREATE TABLE customer
(custno CHAR(3),
custname VARCHAR(25) NOT NULL,
custstreet VARCHAR(30) NOT NULL,
custcity VARCHAR(15) NOT NULL,
custprov VARCHAR(3) NOT NULL,
custpcode VARCHAR(6) NOT NULL,
disc DECIMAL(3,1),
balance DECIMAL(7,2),
creditlimit DECIMAL(5),
srepno CHAR(3),
PRIMARY KEY (custno),
FOREIGN KEY (srepno) REFERENCES salesrep(srepno)
);
CREATE TABLE orders
(orderno CHAR(5) PRIMARY KEY,
orderdate DATE,
custno CHAR(3) NOT NULL,
CONSTRAINT fkordercust FOREIGN KEY (custno) REFERENCES customer
(custno)
);
CREATE TABLE orderprod
(orderno CHAR(5),
partno CHAR(4),
orderqty INTEGER CHECK (orderqty>0),
orderprice DECIMAL(7,2),
CONSTRAINT pkorderprod PRIMARY KEY (orderno, partno),
CONSTRAINT fkordprdord FOREIGN KEY (orderno) REFERENCES
orders(orderno),
CONSTRAINT fkordprdpar FOREIGN KEY (partno) REFERENCES
part(partno)
);
CREATE TABLE invoice
(invno VARCHAR(10) PRIMARY KEY,
invdate date,
orderno CHAR(5),
FOREIGN KEY (orderno) REFERENCES orders(orderno)
);
CREATE TABLE invprod
(invno VARCHAR(10),
partno CHAR(4),
shipqty INT,
PRIMARY KEY (invno, partno),
FOREIGN KEY (invno) REFERENCES invoice(invno),
FOREIGN KEY (partno) REFERENCES part(partno)
);

select * from invoice;