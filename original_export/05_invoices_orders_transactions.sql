--Team of 3 (Sean Wood and two classmates)
--Drop the tables and all instances it may have
DROP TABLE Sales_Invoice CASCADE CONSTRAINTS PURGE;
DROP TABLE Purchase_Order CASCADE CONSTRAINTS PURGE;
DROP TABLE Service_Invoice CASCADE CONSTRAINTS PURGE;
DROP TABLE Car_Sellers CASCADE CONSTRAINTS PURGE;

--Create the sales invoice table
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

--Create the service invoice table
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

--Create the car sellers table
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


--Create car sellers
INSERT INTO Car_Sellers VALUES (301, 'LAX Porsche', 'Alan Jones', '112 Airport Drive', 'Los Angeles', 'CA', '90045', '800-555-1123', '800-555-4211');

INSERT INTO Car_Sellers VALUES (302, 'VSport Auto Sales', 'Alan Jones', '2750 Broad Street', 'San Luis Obispo', 'CA', '93401', '805-547-1515', '805-368-2312');

INSERT INTO Car_Sellers VALUES (303, 'Desert Auto Sales', 'Jamie Ramirez', '4140 W Desert Inn Road', 'Las Vegas', 'NV', '89102', '702-771-1010', '702-942-7490');

INSERT INTO Car_Sellers VALUES (304, 'City Motor Sales', 'Marlene Crame', '400 S Van Ness Avenue', 'San Francisco', 'CA', '94103', '415-672-2234', '415-313-9528');

INSERT INTO Car_Sellers VALUES (305, 'Coast Motors', 'Steve Johnson', '319 E Grand Avenue', 'Arroyo Grande', 'CA', '93420', '805-481-3298', '805-517-1240');


--Vehicle Purchase Transactions
--remove all vehicles from sales vehicle table TESTING PURPOSES ONLY:
DELETE FROM sales_vehicle;

--Transaction 1
INSERT INTO sales_vehicle VALUES ('1GZ9F2', 1979, 'Ferrari', '308', 'Red', 'GTB', 25000, 'Excellent', 'FORSALE', 60000.00, 1.15*60000);
INSERT INTO Purchase_Order VALUES (500001, '4/7/2021', 'Credit', 60000.00, 0, '1GZ9F2', 1000, 302);

--Transaction 2
INSERT INTO sales_vehicle VALUES ('JH7K8N', 1955, 'Chevrolet', 'Bel Air', 'Blue', 'Nomad', 8000, 'Good', 'FORSALE', 75000.00, 1.15*75000);
INSERT INTO Purchase_Order VALUES (500002, '5/11/2021', 'Credit', 75000.00, 300, 'JH7K8N', 1000, 304);

--Transaction 3
INSERT INTO sales_vehicle VALUES ('5T6Y7U', 1969, 'Dodge', 'Charger', 'Black', 'R/T', 3000, 'Excellent', 'FORSALE', 95000.00, 1.15*95000);
INSERT INTO Purchase_Order VALUES (500003, '5/11/2021', 'Credit', 95000.00, 300, '5T6Y7U', 1000, 304);

--Transaction 4
INSERT INTO sales_vehicle VALUES ('X4C3V2', 1971, 'Plymouth', 'Cuda', 'Yellow', '440', 20000, 'Fair', 'FORSALE', 80000.00, 1.15*80000);
INSERT INTO Purchase_Order VALUES (500004, '8/20/2021', 'Credit', 80000.00, 40, 'X4C3V2', 1002, 305);

--Transaction 5
INSERT INTO sales_vehicle VALUES ('9B8V7C', 1965, 'Pontiac', 'GTO', 'Green', 'Judge', 10000, 'Good', 'FORSALE', 90000.00, 1.15*90000);
INSERT INTO Purchase_Order VALUES (500005, '10/12/2021', 'Cash/Credit', 90000.00, 480, '9B8V7C', 1000, 303);

--Transaction 6
INSERT INTO sales_vehicle VALUES ('3AR7K9', 1957, 'Ford', 'Thunderbird', 'White', 'E-Code', 5000, 'Good', 'FORSALE', 95000.00, 1.15*95000);
INSERT INTO Purchase_Order VALUES (500006, '2/8/2022', 'Credit', 95000.00, 0, '3AR7K9', 1000, 302);

--Transaction 7
INSERT INTO sales_vehicle VALUES ('7R3M5D', 1963, 'Chevrolet', 'Corvette', 'Silver', 'Sting Ray', 15000, 'Excellent', 'FORSALE', 120000.00, 1.15*120000);
INSERT INTO Purchase_Order VALUES (500007, '4/19/2022', 'Credit', 120000.00, 480, '7R3M5D', 1000, 303);

--Transaction 8
INSERT INTO sales_vehicle VALUES ('WP0AA0', 1987, 'Porsche', '944S', 'Red', 'Coupe', 60000, 'Fair', 'FORSALE', 23000.00, 1.15*23000.00);
INSERT INTO Purchase_Order VALUES (500008, '6/1/2022', 'Cash', 23000.00, 400, 'WP0AA0', 1000, 301);


--Vehicle Sale Transactions
--Transaction 1 - trade in
INSERT INTO sales_vehicle 
VALUES ('1B6FDJ', 1967, 'Chevrolet', 'Camaro', 'Red', 'RS', 4200, 'Excellent', 'TRADEIN', 55000.00, 1.15*55000);
INSERT INTO Sales_invoice VALUES (600001, '5/1/2023', 'Credit', 1, 1009, NULL, '7R3M5D', '1B6FDJ');
UPDATE Sales_invoice SET Approved_by = 1002 WHERE Sales_Invoice_ID = 600001;
UPDATE sales_vehicle SET status = 'SOLD' WHERE VIN = '7R3M5D';
UPDATE sales_vehicle SET status = 'FORSALE' WHERE VIN = '1B6FDJ';

--Transaction 2 - trade in
INSERT INTO sales_vehicle 
VALUES ('2T2BK1', 1955, 'Cadillac', 'Eldorado', 'White', 'Convertible', 9500, 'Good', 'FORSALE', 80000.00, 1.15*80000);
INSERT INTO Sales_invoice VALUES (600002, '5/2/2023', 'Check', 10, 1006, NULL, '5T6Y7U', '2T2BK1');
UPDATE Sales_invoice SET Approved_by = 1000 WHERE Sales_Invoice_ID = 600002;
UPDATE sales_vehicle SET status = 'SOLD' WHERE VIN = '5T6Y7U';
UPDATE sales_vehicle SET status = 'FORSALE' WHERE VIN = '2T2BK1';

--Transaction 3 - trade in
INSERT INTO sales_vehicle 
VALUES ('3GNFK9', 1969, 'Pontiac', 'Firebird', 'Blue', 'Trans Am', 3000, 'Excellent', 'FORSALE', 72000.00, 1.15*72000);
INSERT INTO Sales_invoice VALUES (600003, '5/3/2023', 'Check', 5, 1006, NULL, 'X4C3V2', '3GNFK9');
UPDATE Sales_invoice SET Approved_by = 1002 WHERE Sales_Invoice_ID = 600003;
UPDATE sales_vehicle SET status = 'SOLD' WHERE VIN = 'X4C3V2';
UPDATE sales_vehicle SET status = 'FORSALE' WHERE VIN = '3GNFK9';

--Transaction 4
INSERT INTO Sales_invoice VALUES (600004, '5/4/2023', 'Check', 6, 1009, NULL, 'WP0AA0', NULL);
UPDATE Sales_invoice SET Approved_by = 1002 WHERE Sales_Invoice_ID = 600004;
UPDATE sales_vehicle SET status = 'SOLD' WHERE VIN = 'WP0AA0';

--Transaction 5
INSERT INTO Sales_invoice VALUES (600005, '5/2/2023', 'Check', 10, 1006, NULL, '1GZ9F2', NULL);
UPDATE Sales_invoice SET Approved_by = 1000 WHERE Sales_Invoice_ID = 600005;
UPDATE sales_vehicle SET status = 'SOLD' WHERE VIN = '1GZ9F2';


--Vehicle Servicing Transactions
--Transaction 1 - sold by us
INSERT INTO service_vehicle (VIN, year, make, model, mileage)
    SELECT VIN, year, make, model, mileage 
    FROM sales_vehicle 
    WHERE VIN = '5T6Y7U';
INSERT INTO Service_Invoice VALUES (700001, '5/3/2023', 10, 1004, '5T6Y7U', NULL, 'TIREROTATE');

--Transaction 2 - sold by us
INSERT INTO service_vehicle (VIN, year, make, model, mileage)
    SELECT VIN, year, make, model, mileage 
    FROM sales_vehicle 
    WHERE VIN = '1GZ9F2';
INSERT INTO Service_Invoice VALUES (700002, '5/3/2023', 10, 1008, '1GZ9F2', 'WIPERBLADES', 'TIREROTATE');

--Transaction 3 - sold by us
INSERT INTO service_vehicle (VIN, year, make, model, mileage)
    SELECT VIN, year, make, model, mileage 
    FROM sales_vehicle 
    WHERE VIN = 'X4C3V2';
INSERT INTO Service_Invoice VALUES (700003, '5/20/2023', 5, 1004, 'X4C3V2', 'OIL10W30', NULL);

--Transaction 4 - sold by us
INSERT INTO service_vehicle (VIN, year, make, model, mileage)
    SELECT VIN, year, make, model, mileage 
    FROM sales_vehicle 
    WHERE VIN = 'WP0AA0';
INSERT INTO Service_Invoice VALUES (700004, '6/1/2023', 6, 1003, 'WP0AA0', 'BELT', 'TUNEUPBASIC');

--Transaction 5
INSERT INTO Customer VALUES (11, 'Orwell', 'George', '2303 Haste Drive', 'Cayucos', 'CA', '93430', '805-622-5390', 'gorwell@example.com');
INSERT INTO service_vehicle VALUES ('3RDG39', 1987, 'BMW', 'M3', 60000);
INSERT INTO Service_Invoice VALUES (700005, '6/2/2023', 11, 1003, '3RDG39', 'BRAKEPADS', 'MAJTUNEUP');

--Transaction 6
INSERT INTO service_vehicle VALUES ('88RBKL', 2001, 'Ford', 'Mustang', 80000);
INSERT INTO Service_Invoice VALUES (700006, '6/2/2023', 7, 1004, '88RBKL', 'AIRFILTER', 'TRANSMISNFLUSH');

--Transaction 7
INSERT INTO service_vehicle VALUES ('THBB10', 1996, 'Porsche', '911', 38000);
INSERT INTO Service_Invoice VALUES (700007, '6/3/2023', 1, 1008, 'THBB10', 'BATTERY', 'OILCHG');


-- Create view
CREATE OR REPLACE VIEW CarSellerList AS
SELECT company_name, CONCAT(contact_name, ' ') AS contact_name, street, city, state, zip, phone, fax
FROM Car_Sellers
ORDER BY company_name;
