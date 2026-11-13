-- SLO Vintage Auto: dealership database (Oracle SQL)
-- Cal Poly BUS 393 Database Systems in Business, Spring 2023, Team 10
-- Authors: Team of 3 (Sean Wood and two classmates)
-- Tables only, in dependency order (parents first). Run seed_data.sql next, then views.sql.

-- Clean re-run: drop children first (errors on first run are expected and harmless)
DROP TABLE PURCHASE_ORDER CASCADE CONSTRAINTS PURGE;
DROP TABLE SERVICE_INVOICE CASCADE CONSTRAINTS PURGE;
DROP TABLE SALES_INVOICE CASCADE CONSTRAINTS PURGE;
DROP TABLE CAR_SELLERS CASCADE CONSTRAINTS PURGE;
DROP TABLE SERVICE_VEHICLE CASCADE CONSTRAINTS PURGE;
DROP TABLE SALES_VEHICLE CASCADE CONSTRAINTS PURGE;
DROP TABLE PART CASCADE CONSTRAINTS PURGE;
DROP TABLE SERVICE CASCADE CONSTRAINTS PURGE;
DROP TABLE PREFERENCE CASCADE CONSTRAINTS PURGE;
DROP TABLE CUSTOMER CASCADE CONSTRAINTS PURGE;
DROP TABLE EMPLOYEE CASCADE CONSTRAINTS PURGE;

CREATE TABLE Employee
(
    Employee_ID NUMBER(6) PRIMARY KEY,
    First_name VARCHAR2(20) NOT NULL,
    Last_name VARCHAR2(20) NOT NULL,
    Address VARCHAR2(20) NOT NULL,
    City VARCHAR2(20) NOT NULL,
    State CHAR(2) DEFAULT 'CA' NOT NULL,
    Zip CHAR(5) NOT NULL,
    Phone VARCHAR2(12) UNIQUE,  -- fixed: original VARCHAR2(11) rejects 555-555-5555 format phones
    Email VARCHAR2(40) UNIQUE,
    Hire_date DATE,
    Title VARCHAR2(20) NOT NULL,
    Commission_pct NUMBER(2,2),
    Manager_ID NUMBER(6) REFERENCES Employee(Employee_ID),
    CHECK ((Title LIKE 'Sales%') AND (Commission_pct BETWEEN 0.2 AND 0.3)
        OR (Title NOT LIKE 'Sales%' AND Commission_pct IS NULL))  -- fixed: original used <> 'Sales%', which compares literal text, so a salesperson could have no commission
);

CREATE TABLE Customer
(
    Customer_ID NUMBER(6) PRIMARY KEY,
    Last_name VARCHAR2(20) NOT NULL,
    First_Name VARCHAR2(20) NOT NULL,
    Street VARCHAR2(20) NOT NULL,
    City VARCHAR2(20) NOT NULL,
    State CHAR(2) DEFAULT 'CA' NOT NULL,
    Zip CHAR(5) NOT NULL,
    Phone VARCHAR2(15) NOT NULL UNIQUE,
    email VARCHAR2(20) NOT NULL UNIQUE
);

CREATE TABLE Preference
(
    Preference_ID NUMBER(6) PRIMARY KEY,
    Make VARCHAR2(20) NOT NULL,
    Model VARCHAR2(20),
    Max_Price NUMBER(8,2) NOT NULL CHECK(Max_Price > 0),
    Start_Date DATE DEFAULT SYSDATE NOT NULL,
    End_Date DATE,
    Customer_ID NUMBER(6) NOT NULL REFERENCES customer(Customer_ID),
    CHECK (End_Date > Start_Date)
);

CREATE TABLE Service
(
    Service_code VARCHAR2 (15) PRIMARY KEY,
    Description VARCHAR2(150) NOT NULL,
    Cost NUMBER(9,2) NOT NULL,
    Price NUMBER (9,2) NOT NULL,
    Months NUMBER (4) NOT NULL CHECK (Months >= 0),
    Mileage NUMBER (8) NOT NULL CHECK (Mileage > 0)
);

CREATE TABLE Part
(
    Part_code VARCHAR2 (15) PRIMARY KEY,
    Description VARCHAR2(150) NOT NULL,
    Cost NUMBER (9,2) NOT NULL CHECK (Cost >= 0),
    Price NUMBER (9,2) NOT NULL CHECK (Price >= 0)
);

CREATE TABLE sales_vehicle (
    VIN VARCHAR2(6) PRIMARY KEY,
    year NUMBER(4) NOT NULL,
    make VARCHAR2(20) NOT NULL,
    model VARCHAR2(20) NOT NULL,
    exterior_color VARCHAR2(15),
    trim VARCHAR2(15),
    mileage NUMBER(6) CHECK(mileage > 0),
    condition VARCHAR2(30),
    status VARCHAR2(7) CHECK(status IN ('SOLD', 'FORSALE', 'TRADEIN')),
    purchase_price NUMBER(8,2) NOT NULL CHECK (purchase_price >= 0),
    list_price NUMBER(8,2) CHECK (list_price >= 0)
);

CREATE TABLE service_vehicle (
    VIN VARCHAR2(6) PRIMARY KEY,
    year NUMBER(4) NOT NULL,
    make VARCHAR2(20) NOT NULL,
    model VARCHAR2(20) NOT NULL,
    mileage NUMBER(6) CHECK(mileage > 0)
);

CREATE TABLE Car_Sellers
(
    Company_ID NUMBER (6) PRIMARY KEY,
    Company_Name VARCHAR2 (20) NOT NULL,
    Contact_Name VARCHAR2 (20),
    Street VARCHAR2 (30),
    City VARCHAR2 (20),
    State CHAR (2),
    ZIP CHAR (5),
    Phone VARCHAR2 (15) UNIQUE,
    Fax VARCHAR2 (15)
);

CREATE TABLE Sales_Invoice 
(
    Sales_Invoice_ID NUMBER (6) PRIMARY KEY,
    Sale_date DATE NOT NULL,
    Terms VARCHAR2(15) NOT NULL,
    Customer NUMBER (6) NOT NULL REFERENCES CUSTOMER(Customer_ID),
    Sales_person NUMBER (6) NOT NULL REFERENCES EMPLOYEE(Employee_ID),
    Approved_by NUMBER (6) REFERENCES EMPLOYEE(Employee_ID),
    Sales_vehicle VARCHAR2 (6) NOT NULL REFERENCES SALES_VEHICLE(VIN),
    Trade_in_vehicle VARCHAR2 (6) REFERENCES SALES_VEHICLE(VIN)
);

CREATE TABLE Service_Invoice
(
    Service_Invoice_ID NUMBER (6) PRIMARY KEY,
    Date_of_Invoice DATE NOT NULL,
    Customer_ID NUMBER (6) NOT NULL REFERENCES Customer(Customer_ID),
    Employee_ID NUMBER (6) NOT NULL REFERENCES Employee(Employee_ID),
    Service_vehicle VARCHAR2 (6) NOT NULL REFERENCES service_vehicle (VIN),
    Part_used VARCHAR2(15) REFERENCES Part(Part_code),
    Service_performed VARCHAR2 (15) REFERENCES Service(Service_code),
    CHECK (Part_used IS NOT NULL OR Service_performed IS NOT NULL)
);

CREATE TABLE Purchase_Order
(
    Invoice_number NUMBER(6) PRIMARY KEY,
    Purchase_Date DATE NOT NULL,
    Terms VARCHAR2(15) NOT NULL,
    Purchase_price NUMBER(8,2) NOT NULL CHECK (purchase_price >= 0),
    Shipping_cost NUMBER(6) NOT NULL CHECK (Shipping_cost >= 0),
    Purchase_Vehicle VARCHAR2 (6) NOT NULL REFERENCES SALES_VEHICLE(VIN),
    Approved_by NUMBER (6) REFERENCES EMPLOYEE(Employee_ID),
    Vendor NUMBER (6) NOT NULL REFERENCES Car_Sellers(Company_ID)
);
