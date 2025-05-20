CREATE TABLE CUSTOMERS (
    CustomerID INTEGER PRIMARY KEY NOT NULL,
    CustomerName  VARCHAR(20) NOT NULL,
    CustomerEmail VARCHAR(20) NOT NULL
)

CREATE TABLE MANUFACTURER (
    ProductManufacturerId INTEGER PRIMARY KEY NOT NULL,
    ManufacturerName VARCHAR(20) NOT NULL
)

CREATE TABLE PRODUCTS (
    ProductID INTEGER PRIMARY KEY NOT NULL,
    ProductCategory VARCHAR(20) NOT NULL,
    ProductDescription VARCHAR(50) NOT NULL,
    ProductListPrice DECIMAL NOT NULL,
    ProductManufacturerId INTEGER NOT NULL,
    CONSTRAINT ProductManufacturerId_FK FOREIGN KEY (ProductManufacturerId) REFERENCES Manufacturer(ProductManufacturerId)
)

CREATE TABLE TRANSACTIONS (
    TransactionID INTEGER PRIMARY KEY NOT NULL,
    CustomerID INTEGER NOT NULL,
    TransactionDate Date,
    TransactionTime Time,
    TransactionTotalAmount DECIMAL NOT NULL,
    TransactionTax DECIMAL NOT NULL,
    ProductID INTEGER NOT NULL,
    CONSTRAINT CustomerID_FK FOREIGN KEY (CustomerID) REFERENCES CUSTOMERS(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES PRODUCTS(ProductID)  
);
CREATE TABLE ProductTransactions (
    TransactionID INTEGER NOT NULL,
    ProductID INTEGER NOT NULL,
    ProductPurchasePrice DECIMAL NOT NULL,
    ProductQuantity INTEGER NOT NULL,
    TransactionProductTotal DECIMAL NOT NULL,
    CONSTRAINT TransactionID_FK FOREIGN KEY (TransactionID) REFERENCES TRANSACTIONS(TransactionID),
    FOREIGN KEY (ProductID) REFERENCES PRODUCTS(ProductID)
)

INSERT INTO CUSTOMERS (CustomerID, CustomerName, CustomerEmail) VALUES
(1, 'John Walker', 'john@yahoo.com'),
(2, 'Jenna Smith', 'jsmith@hotmail.com'),
(3, 'Jeremy Johnson', 'jerry@gmail.com'),
(4, 'Caleb Brown', 'caleb@gmail.com'),
(5, 'David Williams', 'david@sheridan.com');

INSERT INTO MANUFACTURER (ProductManufacturerId, ManufacturerName) VALUES
(1, 'A'),
(2, 'B'),
(3, 'C'),
(4, 'D'),
(5, 'E');

INSERT INTO PRODUCTS (ProductID, ProductCategory, ProductDescription, ProductListPrice, ProductManufacturerId) VALUES
(10, 'Book', 'Novel', 10.59, 1),
(12, 'Chair', 'Wooden Chair', 20.00, 2),
(14, 'Watch', 'Apple Watch', 157.50, 3),
(15, 'Table', 'Glass Table', 80.50, 1),
(16, 'Pen', 'Parker Pen', 2.99, 2);

INSERT INTO TRANSACTIONS (TransactionID, CustomerID, TransactionDate, TransactionTime, TransactionTotalAmount, TransactionTax, ProductID) VALUES
(20, 1, '2024-03-27', '10:30:00', 22.18, 1.00, 10),
(21, 2, '2024-03-23', '11:15:00', 81.00, 1.00, 12),
(22, 3, '2023-12-19', '12:10:00', 157.00, 1.50, 14),
(23, 4, '2023-08-09', '23:55:00', 163.00, 2.00, 15),
(24, 5, '2023-06-14', '14:30:00', 15.95, 1.00, 16);

INSERT INTO ProductTransactions (TransactionID, ProductID, ProductPurchasePrice, ProductQuantity, TransactionProductTotal) VALUES
(20, 10, 10.59, 2, 21.18),
(21, 12, 20.00, 4, 80.00),
(22, 14, 155.50, 1, 155.50),
(23, 15, 80.50, 2, 161.00),
(24, 16, 2.99, 5, 14.95);

SELECT * FROM CUSTOMERS;
SELECT * FROM MANUFACTURER;
SELECT * FROM PRODUCTS;
SELECT * FROM TRANSACTIONS;
SELECT * FROM ProductTransactions;

ALTER TABLE PRODUCTS
ADD Weight DECIMAL(9,2);

UPDATE PRODUCTS
SET Weight = 1.5
WHERE ProductId = 10;

UPDATE PRODUCTS
SET Weight = 10
WHERE ProductId = 12;

UPDATE PRODUCTS
SET Weight = 0.25
WHERE ProductId = 14;

UPDATE PRODUCTS
SET Weight = 15.25
WHERE ProductId = 15;

UPDATE PRODUCTS
SET Weight = 0.23
WHERE ProductId = 16;

ALTER TABLE PRODUCTS
DROP COLUMN Weight;

DELETE FROM ProductTransactions
WHERE TransactionID IN (SELECT TransactionID 
                        FROM TRANSACTIONS 
                        WHERE ProductID > 10);


DELETE FROM TRANSACTIONS
WHERE ProductID > 10;

DELETE FROM PRODUCTS
WHERE ProductID > 10;

DROP TABLE ProductTransactions;
DROP TABLE TRANSACTIONS;
DROP TABLE PRODUCTS;
DROP TABLE MANUFACTURER;
DROP TABLE CUSTOMERS;

