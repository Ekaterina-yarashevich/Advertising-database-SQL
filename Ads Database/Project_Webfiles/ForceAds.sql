DROP DATABASE IF EXISTS ForceAds;
CREATE DATABASE ForceAds;
USE ForceAds;

DROP TABLE IF EXISTS PRODUCTS;
CREATE TABLE PRODUCT (
  Product_id INT NOT NULL,
  Name VARCHAR(25) NOT NULL,
  Description VARCHAR(100),
  Type VARCHAR(25),
  Ad_template VARCHAR(50),
  Medium VARCHAR(50),
  Cost FLOAT,
  Unit_Cost INT,
  Information VARCHAR(100),
  PRIMARY KEY (Product_id)
);
DROP TABLE IF EXISTS CUSTOMER;
CREATE TABLE CUSTOMER(
  Customer_id INT NOT NULL,
  fname VARCHAR(25) NOT NULL,
  lname VARCHAR(25) NOT NULL,
  Company VARCHAR(25),
  Address VARCHAR(30),
  Order_id INT,
  Email VARCHAR(30),
  Phone_number INT(10),
  Amount_spent INT,
  Date_of_submission DATE,
  Payment_total INT,
  PRIMARY KEY(Customer_id)
);

DROP TABLE IF EXISTS PROMOTION QUALITIED;
CREATE TABLE PROMOTION_QUALITIED(
  Fname VARCHAR(25) NOT NULL,
  Lname VARCHAR(25) NOT NULL,
  Email VARCHAR(30),
  Phone_number INT(10),
  Amount_spent INT,
  Date_of_submission DATE
);



DROP TABLE IF EXISTS ORDERS;
CREATE TABLE ORDERS(
  Order_id INT NOT NULL,
  Product_id INT NOT NULL,
  Customer_id INT NOT NULL,
  Date_purchased DATE,
  Date_to_execute DATE,
  Ad_frequency INT NOT NULL,
  Location_to_run VARCHAR(50),
  Cost FLOAT,
  PRIMARY KEY (Order_id),
  FOREIGN KEY (Product_id) REFERENCES PRODUCT(Product_id),
  FOREIGN KEY (Customer_id) REFERENCES CUSTOMER(Customer_id)
);


DROP TABLE IF EXISTS SHIPPING;
CREATE TABLE SHIPPING(
  Shipping_id INT NOT NULL,
  Shipping_type VARCHAR(50) NOT NULL,
  Cost FLOAT,
  Delivery_date DATE NOT NULL,
  Order_id INT,
  PRIMARY KEY(Shipping_id),
  FOREIGN KEY(Order_id) REFERENCES ORDERS(Order_id)
);

DROP TABLE IF EXISTS PAYMENT;
CREATE TABLE PAYMENT(
  Number INT NOT NULL,
  Customer_id INT NOT NULL,
  Type VARCHAR(50),
  Description VARCHAR(50),
  Expiration DATE,
  Verification_code INT,
  FOREIGN KEY(Customer_id) REFERENCES CUSTOMER(Customer_id),
  PRIMARY KEY(Number)
);


DROP TABLE IF EXISTS CAMPAIGN;
CREATE TABLE CAMPAIGN(
  Campaigns_id INT NOT NULL,
  Campaigns_purchased INT NOT NULL,
  Date_start DATE NOT NULL,
  Date_end DATE NOT NULL,
  Activity VARCHAR(10) NOT NULL,
  Countries VARCHAR(50) NOT NULL,
  Media VARCHAR(50) NOT NULL,
  Information VARCHAR(100) NOT NULL,
  Order_id INT NOT NULL,
  PRIMARY KEY(Campaigns_id),
  FOREIGN KEY(Order_id) REFERENCES ORDERS(Order_id)
);


DROP TABLE IF EXISTS IMPRESSION;
CREATE TABLE IMPRESSION(
  Impression_id INT NOT NULL,
  URL VARCHAR(2000) NOT NULL,
  Media VARCHAR(50) NOT NULL,
  Website VARCHAR(50) NOT NULL,
  Number_an_hour INT NOT NULL,
  Impression_on_site_an_hour INT NOT NULL,
  Clicks INT NOT NULL,
  Date DATE NOT NULL,
  Hour TIME NOT NULL,
  Campaigns_id INT NOT NULL,
  PRIMARY KEY(Impression_id),
  FOREIGN KEY(Campaigns_id) REFERENCES CAMPAIGN(Campaigns_id)
);

DROP TABLE IF EXISTS MEDIA_PARTNERS;
CREATE TABLE MEDIA_PARTNERS(
  Supplier_id int NOT NULL,
  Product_name VARCHAR(30),
  Product_id INT NOT NULL,
  Supplier_name VARCHAR(30),
  Address VARCHAR(30),
  Phone_number int(10),
  Cost INT,
  PRIMARY KEY(Supplier_id)
);