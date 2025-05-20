CREATE DATABASE GeneralStore;

USE GeneralStore;

Create table Customer(
    CustNum Int Auto_Increment Primary Key,
    CustName Char(25),
    City Char(20),
    CreditLimit Dec(7, 2 )
);

Insert Into Customer (CustName, City, CreditLimit)
  Values
  ('Foxbar', 'Toronto', 1000.00);
Insert Into Customer (CustName, City, CreditLimit)
  Values
  ('Ironwood', 'Oakville', 100.00);
Insert Into Customer (CustName, City, CreditLimit)
  Values
  ('Kent', 'Burlington', 2000.00);
Insert Into Customer (CustName, City, CreditLimit)
  Values
  ('Moore', 'Toronto', 1000.00);
Insert Into Customer (CustName, City, CreditLimit)
  Values
  ('Felipe', 'Mississauga', 4500.00);
Insert Into Customer (CustName, City, CreditLimit)
  Values
  ('Kwan', 'Toronto', 0.00);
Insert Into Customer (CustName, City, CreditLimit)
  Values
  ('Khoury', 'Mississauga', 1000.00);
Insert Into Customer (CustName, City, CreditLimit)
  Values
  ('Brant', 'Oakville',1500.00);
Insert Into Customer (CustName, City, CreditLimit)
  Values
  ('Wells', 'Burlington', 0.00);
Insert Into Customer (CustName, City, CreditLimit)
  Values
  ('Wright', 'Toronto', 1000.00);
  

Create table Orders(
    OrderNum Int Auto_Increment Primary Key,
    OrderDate Date,
    Filled BOOLEAN,
    CustNum Int(5),
	FOREIGN KEY (custnum) REFERENCES customer(custnum)
);

Insert Into Orders (OrderDate, Filled, CustNum)
  Values
  ('1997-09-05', 1, 2);
Insert Into Orders (OrderDate, Filled, CustNum)
  Values
  ('1997-09-05', 1, 9);
Insert Into Orders (OrderDate, Filled, CustNum)
  Values
  ('1997-09-05', 0, 6);
Insert Into Orders (OrderDate, Filled, CustNum)
  Values
  ('1997-10-01', 0, 10);
Insert Into Orders (OrderDate, Filled, CustNum)
  Values
  ('1997-10-08', 1, 3);
Insert Into Orders (OrderDate, Filled, CustNum)
  Values
  ('1997-10-19', 1, 5);
Insert Into Orders (OrderDate, Filled, CustNum)
  Values
  ('1997-10-15', 1, 5);
Insert Into Orders (OrderDate, Filled, CustNum)
  Values
  ('1997-10-17', 1, 8);
Insert Into Orders (OrderDate, Filled, CustNum)
  Values
  ('1997-11-04', 1, 9);
Insert Into Orders (OrderDate, Filled, CustNum)
  Values
  ('1997-11-06', 1, 3);
Insert Into Orders (OrderDate, Filled, CustNum)
  Values
  ('1997-12-01', 0, 7);
Insert Into Orders (OrderDate, Filled, CustNum)
  Values
  ('1997-12-04', 0, 1);
Insert Into Orders (OrderDate, Filled, CustNum)
  Values
  ('1997-12-08', 0, 6);
Insert Into Orders (OrderDate, Filled, CustNum)
  Values
  ('1997-12-15', 0, 4);
Insert Into Orders (OrderDate, Filled, CustNum)
  Values
  ('1997-12-17', 0, 5);
  
Create table Product(
    ProductNum Int Auto_Increment Primary Key,
    Descr CHAR(20),
    ProductType CHAR(15),
    MSRP Decimal(8, 2 ),
    Onhand INT(4)
);

INSERT INTO Product(Descr, ProductType, MSRP,Onhand)
  VALUES
('Swiss army knife', 'Sports',44.95, 22);
INSERT INTO Product(Descr, ProductType, MSRP,Onhand)
  VALUES
('Electric heater', 'Hardware',99.99, 10);
INSERT INTO Product(Descr, ProductType, MSRP,Onhand)
  VALUES
('Snowboard', 'Sports',299.99, 37);
INSERT INTO Product(Descr, ProductType, MSRP,Onhand)
  VALUES
('Hockey stick', 'Sports',27.50, 172);
INSERT INTO Product(Descr, ProductType, MSRP,Onhand)
  VALUES
('Snow shovel', 'Hardware',29.99, 53);
INSERT INTO Product(Descr, ProductType, MSRP,Onhand)
  VALUES
('Stove', 'Appliance',989.99, 7);
INSERT INTO Product(Descr, ProductType, MSRP,Onhand)
  VALUES
('Toaster', 'Appliance',34.99, 12);
INSERT INTO Product(Descr, ProductType, MSRP,Onhand)
  VALUES
('Jumper cables', 'Hardware',25.99, 38);

Create TABLE Orderline(
    OrderNum INT(4),
    ProductNum INT(4),
    Quantity INT(4),
    SalesPrice Decimal(8, 2 ),
	PRIMARY KEY(ordernum, productnum),
	FOREIGN KEY (ordernum) REFERENCES orders(ordernum),
	FOREIGN KEY(productnum) REFERENCES product(productnum)
);

INSERT INTO Orderline
  VALUES
(1,7,2,34.99);
INSERT INTO Orderline
  VALUES
(2,6,1,980.00);
INSERT INTO Orderline
  VALUES
(3,4,16,25.00);
INSERT INTO Orderline
  VALUES
(4,1,1,44.95);
INSERT INTO Orderline
  VALUES
(5,2,1,99.99);
INSERT INTO Orderline
  VALUES
(5,8,1,25.99);
INSERT INTO Orderline
  VALUES
(6,7,1,34.99);
INSERT INTO Orderline
  VALUES
(7,3,1,299.99);
INSERT INTO Orderline
  VALUES
(8,2,1,99.99);
INSERT INTO Orderline
  VALUES
(9,5,2,29.99);
INSERT INTO Orderline
  VALUES
(10,5,11,27.50);
INSERT INTO Orderline
  VALUES
(11,3,1,295.00);
INSERT INTO Orderline
  VALUES
(11,4,3,42.00);
INSERT INTO Orderline
  VALUES
(11,5,4,27.50);
INSERT INTO Orderline
  VALUES
(12,8,1,25.99);
INSERT INTO Orderline
  VALUES
(13,6,1,975.00);
INSERT INTO Orderline
  VALUES
(14,7,2,34.99);
INSERT INTO Orderline
  VALUES
(15,2,1,105.00);
INSERT INTO Orderline
  VALUES
(15,7,1,34.99);
