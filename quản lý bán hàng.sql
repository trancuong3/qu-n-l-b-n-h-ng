CREATE DATABASE qlbh;
USE qlbh;

CREATE TABLE Customer (
    cID INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    cAge TINYINT
);

CREATE TABLE `Order` (
    oID INT PRIMARY KEY,
    cID INT,
    oDate DATETIME,
    oTotalPrice INT,
    FOREIGN KEY (cID) REFERENCES Customer(cID)
);

CREATE TABLE Product (
    pID INT PRIMARY KEY,
    pName VARCHAR(255) NOT NULL,
    pPrice INT
);

CREATE TABLE OrderDetail (
    oID INT,
    pID INT,
    oDQty INT,
    PRIMARY KEY (oID, pID),
    FOREIGN KEY (oID) REFERENCES `Order`(oID),
    FOREIGN KEY (pID) REFERENCES Product(pID)
);
INSERT INTO Customer (cID, Name, cAge) VALUES
(1, 'Minh Quan', 10),
(2, 'Ngoc Oanh', 20),
(3, 'Hong Ha', 50);
INSERT INTO `Order` (oID, cID, oDate, oTotalPrice) VALUES
(1, 1, '2006-03-21', NULL),
(2, 2, '2006-03-23', NULL),
(3, 1, '2006-03-16', NULL);
INSERT INTO Product (pID, pName, pPrice) VALUES
(1, 'May Giat', 3),
(2, 'Tu Lanh', 5),
(3, 'Dieu Hoa', 7),
(4, 'Quat', 1),
(5, 'Bep Dien', 2);
INSERT INTO OrderDetail (oID, pID, oDQty) VALUES
(1, 1, 3),
(1, 3, 7),
(1, 4, 2),
(2, 1, 1),
(3, 1, 8),
(2, 5, 4),
(2, 3, 3);
select * from `Order`;
select * from customer 
join `Order` on customer.cid=`Order`.cid;
SELECT Customer.*, `Order`.*, OrderDetail.*, Product.*
FROM Customer
JOIN `Order` ON Customer.cID = `Order`.cID
JOIN OrderDetail ON `Order`.oID = OrderDetail.oID
JOIN Product ON OrderDetail.pID = Product.pID;
SELECT Customer.*, `Order`.*
FROM Customer
JOIN `Order` ON Customer.cID = `Order`.cID
WHERE Customer.cID != `Order`.cID;



