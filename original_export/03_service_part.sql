--Team of 3 (Sean Wood and two classmates)
DROP TABLE Service CASCADE CONSTRAINTS PURGE;
DROP TABLE Part CASCADE CONSTRAINTS PURGE;

--Created the Service table
CREATE TABLE Service
(
    Service_code VARCHAR2 (15) PRIMARY KEY,
    Description VARCHAR2(150) NOT NULL,
    Cost NUMBER(9,2) NOT NULL,
    Price NUMBER (9,2) NOT NULL,
    Months NUMBER (4) NOT NULL CHECK (Months >= 0),
    Mileage NUMBER (8) NOT NULL CHECK (Mileage > 0)
);

--Inserted the values into service implicitly
INSERT INTO Service
VALUES ( 'OILCHG', 'Oil Change', 9.95, 10.95, 6, 6000);

INSERT INTO Service
VALUES ('TIREROTATE', 'Tire Rotation', 6.95, 9.95, 12, 12000);

INSERT INTO Service
VALUES ('FLUIDS', 'Fluid Replacement', 29.95, 49.96, 30, 30000);

INSERT INTO Service
VALUES ('TUNEUPBASIC', 'Basic Engine tune up', 69.95, 149.95, 18, 18000);

INSERT INTO Service
VALUES ('MULTIPOINTINSP', 'Multi-Point Inspection', 29.95, 59.95, 6, 6000);

INSERT INTO Service
VALUES ('MAINT', 'Maintenance', 49.99, 89.99, 24, 24000);

INSERT INTO Service
VALUES ('MAJTUNEUP', 'Major Tune-up', 89.99, 139.99, 36, 36000);

INSERT INTO Service
VALUES ('TRANSMISNFLUSH', 'Transmission Flush', 85.95, 165.95, 24, 48000);

INSERT INTO Service
VALUES ('BRAKEREP', 'Brake Repair', 159.99, 265.99, 48, 48000);

--Created the Part table
CREATE TABLE Part
(
    Part_code VARCHAR2 (15) PRIMARY KEY,
    Description VARCHAR2(150) NOT NULL,
    Cost NUMBER (9,2) NOT NULL CHECK (Cost >= 0),
    Price NUMBER (9,2) NOT NULL CHECK (Price >= 0)
);

--Inserted the values into the Part table implicitly
INSERT INTO Part
VALUES ('OIL10W30', 'Oil 10W30', 2.79, 3.95);

INSERT INTO Part
VALUES ('OILFILTER', 'Oil Filter', 6.95, 11.95);

INSERT INTO Part
VALUES ('WINDSHIELDFLUID', 'Windshield Fluid', 2.96, 4.95);

INSERT INTO Part
VALUES ('SPARKPLUG4', 'Spark Plug Set (4)', 9.95, 19.95);

INSERT INTO Part
VALUES ('AIRFILTER', 'Air Filter', 3.95, 8.95);

INSERT INTO Part
VALUES ('BATTERY', 'Car Battery', 99.99, 155.95);

INSERT INTO Part
VALUES ('BELT', 'Engine Belt', 19.99, 39.99);

INSERT INTO Part
VALUES ('BRAKEPADS', 'Brake Pads', 49.99, 89.99);

INSERT INTO Part
VALUES ('WIPERBLADES', 'Wiper Blade Set (2)', 13.99, 20.99);

--Created the view of the service list

CREATE OR REPLACE VIEW Service_list AS
SELECT service_code, description, cost, price, months, mileage
FROM service
ORDER BY service_code;

--Created the view of the Part list

CREATE OR REPLACE VIEW Part_list AS
SELECT part_code, description, cost, price
FROM part
ORDER BY part_code;
