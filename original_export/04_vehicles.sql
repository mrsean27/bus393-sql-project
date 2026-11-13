--Team of 3 (Sean Wood and two classmates)
--Drop the tables and all instances it may have
DROP TABLE sales_vehicle CASCADE CONSTRAINTS PURGE;
DROP TABLE service_vehicle CASCADE CONSTRAINTS PURGE;


--Create the sales vehicle table
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

--Create the service vehicle table
CREATE TABLE service_vehicle (
    VIN VARCHAR2(6) PRIMARY KEY,
    year NUMBER(4) NOT NULL,
    make VARCHAR2(20) NOT NULL,
    model VARCHAR2(20) NOT NULL,
    mileage NUMBER(6) CHECK(mileage > 0)
);
