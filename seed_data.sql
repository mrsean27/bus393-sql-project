-- Sample data and business transactions from the team project
-- Dates are written as MM/DD/YYYY strings, so set the session format first:
ALTER SESSION SET NLS_DATE_FORMAT = 'MM/DD/YYYY';
-- Note: the original also ran DELETE FROM sales_vehicle before reloading; kept as-is.

INSERT INTO Employee (Employee_ID, First_name, Last_name, Address, City, Zip, Phone, Email, Title)
VALUES (1000, 'Larry', 'Margaria', '123 Auto Lane', 'San Luis Obispo', '93405', '805-234-9919', 'lmargaria@slovintageauto.com', 'Owner/Manager');

INSERT INTO Employee (Employee_ID, First_name, Last_name, Address, City, Zip, Phone, Email, Hire_date, Title, Manager_ID)
VALUES (1001, 'Jim', 'Kaney', '23 Orange Street', 'San Luis Obispo', '93405', '805-782-4853', 'jkaney@slovintageauto.com', '03/19/2018', 'Accounting Manager', 1000);

INSERT INTO Employee (Employee_ID, First_name, Last_name, Address, City, Zip, Phone, Email, Hire_date, Title, Manager_ID)
VALUES (1005, 'Steve', 'Euro', '610 Westmond Blvd', 'Santa Maria', '93458', '805-010-8234', 'seuro@slovintageauto.com', '08/07/2018', 'Cashier', 1001);

INSERT INTO Employee (Employee_ID, First_name, Last_name, Address, City, Zip, Phone, Email, Hire_date, Title, Manager_ID)
VALUES (1007, 'Alice', 'Credit', '112 Elm Street', 'Arroyo Grande', '93420', '805-762-7956', 'acredit@slovintageauto.com', '05/13/2020', 'Bookkeeper', 1005);

INSERT INTO Employee (Employee_ID, First_name, Last_name, Address, City, Zip, Phone, Email, Hire_date, Title, Commission_pct, Manager_ID)
VALUES (1002, 'Mary', 'Long', '777 Lucky Lane', 'Pismo Beach', '93449', '805-777-9876', 'mlong@slovintageauto.com', '04/11/2018', 'Sales Manager', 0.25, 1000);

INSERT INTO Employee (Employee_ID, First_name, Last_name, Address, City, Zip, Phone, Email, Hire_date, Title, Commission_pct, Manager_ID)
VALUES (1006, 'Adam', 'Packer', '101 Low Street', 'Avila Beach', '93424', '805-334-6015', 'apacker@slovintageauto.com', '12/02/2019', 'Salesperson', 0.22, 1002);

INSERT INTO Employee (Employee_ID, First_name, Last_name, Address, City, Zip, Phone, Email, Hire_date, Title, Commission_pct, Manager_ID)
VALUES (1009, 'Larry', 'Jones', '72 Main Street', 'Atascadero', '93422', '805-888-1801', 'ljones@slovintageauto.com', '02/08/2022', 'Salesperson', 0.24, 1006);

INSERT INTO Employee (Employee_ID, First_name, Last_name, Address, City, Zip, Phone, Email, Hire_date, Title, Manager_ID)
VALUES (1003, 'Norm', 'Allen', '809 Forest Road', 'Atascadero', '93422', '805-472-9214', 'nallen@slovintageauto.com', '04/25/2018', 'Service Manager', 1000);

INSERT INTO Employee (Employee_ID, First_name, Last_name, Address, City, Zip, Phone, Email, Hire_date, Title, Manager_ID)
VALUES (1004, 'Alan', 'Wrench', '1700 Beach Way', 'Morro Bay', '93442', '805-556-2743', 'awrench@slovintageauto.com', '07/17/2018', 'Service Worker', 1003);

INSERT INTO Employee (Employee_ID, First_name, Last_name, Address, City, Zip, Phone, Email, Hire_date, Title, Manager_ID)
VALUES (1008, 'Woody', 'Apple', '421 Murray Lane', 'Los Osos', '93402', '805-841-982', 'wapple@slovintageauto.com', '07/07/2021', 'Service Worker', 1004);

INSERT INTO Employee (Employee_ID, First_name, Last_name, Address, City, Zip, Phone, Email, Hire_date, Title, Manager_ID)
VALUES (1010, 'Sherry', 'Sophomore', '1 Grand Avenue','San Luis Obispo', '93407', '805-483-0878', 'ssophomore@slovintageauto.com', '03/16/2023', 'Intern', 1008);

INSERT INTO Customer (Customer_ID, Last_Name, First_Name, Street, City, Zip, Phone, email)
VALUES (1, 'Jones', 'John', '10 Albert Dr.', 'San Luis Obispo', '93405', '805-812-9023', 'jjones@example.com');

INSERT INTO Customer (Customer_ID, Last_Name, First_Name, Street, City, Zip, Phone, email)
VALUES (2, 'James', 'Mike', '101 Slack Dr.', 'San Luis Obispo', '93405', '805-822-4356', 'mjames@example.com');

INSERT INTO Customer (Customer_ID, Last_Name, First_Name, Street, City, Zip, Phone, email)
VALUES (3, 'Smith', 'Jake', '800 Longview Dr.', 'San Luis Obispo', '93405', '805-902-7102', 'jsmith@example.com');

INSERT INTO Customer (Customer_ID, Last_Name, First_Name, Street, City, Zip, Phone, email)
VALUES (4, 'Robert', 'Luke', '1009 Foothill Blvd.', 'San Luis Obispo', '93405', '805-302-9012', 'lrobert@example.com');

INSERT INTO Customer (Customer_ID, Last_Name, First_Name, Street, City, Zip, Phone, email)
VALUES (5, 'Truman', 'Ron', '8219 John Dr.', 'Los Angeles', '90473', '849-902-9203', 'rtruman@example.com');

INSERT INTO Customer (Customer_ID, Last_Name, First_Name, Street, City, State, Zip, Phone, email)
VALUES (6, 'Walter', 'Jessie', '1001 Newberry Dr.', 'Santa Fe', 'NM', '83021', '134-029-8236', 'jwalter@example.com');

INSERT INTO Customer (Customer_ID, Last_Name, First_Name, Street, City, State, Zip, Phone, email)
VALUES (7, 'Patrick', 'Logan', '101 James Dr.', 'Dallas', 'TX', '08290', '102-302-9900', 'lpatrick@example.com');

INSERT INTO Customer (Customer_ID, Last_Name, First_Name, Street, City, State, Zip, Phone, email)
VALUES (8, 'Starr', 'Josh', '1110 Logan Dr.', 'Reno', 'NV', '72031', '210-109-2910', 'jstarr@example.com');

INSERT INTO Customer (Customer_ID, Last_Name, First_Name, Street, City, State, Zip, Phone, email)
VALUES (9, 'Thompson', 'Steph', '2810 Oracle Dr.', 'Portland', 'OR', '29102', '819-902-6472', 'sthompson@example.com');

INSERT INTO Customer (Customer_ID, Last_Name, First_Name, Street, City, State, Zip, Phone, email)
VALUES (10, 'Jordan', 'Michael', '1902 Bulls Dr.', 'Chicago', 'IL', '21930', '329-961-7426', 'mjordan@example.com');

INSERT INTO Preference (Preference_ID, Make, Model, Max_Price, Start_Date, End_Date, Customer_ID)
VALUES (1, 'Porsche', '911', 70000,'04-04-2010', '05-20-2014', 1);

INSERT INTO Preference (Preference_ID, Make, Model, Max_Price, Start_Date, End_Date, Customer_ID)
VALUES (2, 'Honda', 'Accord', 20000,'04-14-2015', SYSDATE, 1);

INSERT INTO Preference (Preference_ID, Make, Model, Max_Price, Start_Date, End_Date, Customer_ID)
VALUES (3, 'Acura', 'TSX', 15000,'02-24-2018', '06-20-2019', 1);

INSERT INTO Preference (Preference_ID, Make, Model, Max_Price, Start_Date, Customer_ID)
VALUES (4, 'Jeep', 'Compass', 20000, '04-04-2020', 2);

INSERT INTO Preference (Preference_ID, Make, Model, Max_Price, Start_Date, Customer_ID)
VALUES (5, 'Jeep', 'Cherokee', 30000,'06-04-2020', 2);

INSERT INTO Preference (Preference_ID, Make, Max_Price, Customer_ID)
VALUES (6, 'Porsche', 60000, 3);

INSERT INTO Preference (Preference_ID, Make, Model, Max_Price, Customer_ID)
VALUES (7, 'Honda', 'Pilot', 60000, 4);

INSERT INTO Preference (Preference_ID, Make, Model, Max_Price, Customer_ID)
VALUES (8, 'Jeep', 'Wrangler', 40000, 5);

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

INSERT INTO Car_Sellers VALUES (301, 'LAX Porsche', 'Alan Jones', '112 Airport Drive', 'Los Angeles', 'CA', '90045', '800-555-1123', '800-555-4211');

INSERT INTO Car_Sellers VALUES (302, 'VSport Auto Sales', 'Alan Jones', '2750 Broad Street', 'San Luis Obispo', 'CA', '93401', '805-547-1515', '805-368-2312');

INSERT INTO Car_Sellers VALUES (303, 'Desert Auto Sales', 'Jamie Ramirez', '4140 W Desert Inn Road', 'Las Vegas', 'NV', '89102', '702-771-1010', '702-942-7490');

INSERT INTO Car_Sellers VALUES (304, 'City Motor Sales', 'Marlene Crame', '400 S Van Ness Avenue', 'San Francisco', 'CA', '94103', '415-672-2234', '415-313-9528');

INSERT INTO Car_Sellers VALUES (305, 'Coast Motors', 'Steve Johnson', '319 E Grand Avenue', 'Arroyo Grande', 'CA', '93420', '805-481-3298', '805-517-1240');

DELETE FROM sales_vehicle;

INSERT INTO sales_vehicle VALUES ('1GZ9F2', 1979, 'Ferrari', '308', 'Red', 'GTB', 25000, 'Excellent', 'FORSALE', 60000.00, 1.15*60000);

INSERT INTO Purchase_Order VALUES (500001, '4/7/2021', 'Credit', 60000.00, 0, '1GZ9F2', 1000, 302);

INSERT INTO sales_vehicle VALUES ('JH7K8N', 1955, 'Chevrolet', 'Bel Air', 'Blue', 'Nomad', 8000, 'Good', 'FORSALE', 75000.00, 1.15*75000);

INSERT INTO Purchase_Order VALUES (500002, '5/11/2021', 'Credit', 75000.00, 300, 'JH7K8N', 1000, 304);

INSERT INTO sales_vehicle VALUES ('5T6Y7U', 1969, 'Dodge', 'Charger', 'Black', 'R/T', 3000, 'Excellent', 'FORSALE', 95000.00, 1.15*95000);

INSERT INTO Purchase_Order VALUES (500003, '5/11/2021', 'Credit', 95000.00, 300, '5T6Y7U', 1000, 304);

INSERT INTO sales_vehicle VALUES ('X4C3V2', 1971, 'Plymouth', 'Cuda', 'Yellow', '440', 20000, 'Fair', 'FORSALE', 80000.00, 1.15*80000);

INSERT INTO Purchase_Order VALUES (500004, '8/20/2021', 'Credit', 80000.00, 40, 'X4C3V2', 1002, 305);

INSERT INTO sales_vehicle VALUES ('9B8V7C', 1965, 'Pontiac', 'GTO', 'Green', 'Judge', 10000, 'Good', 'FORSALE', 90000.00, 1.15*90000);

INSERT INTO Purchase_Order VALUES (500005, '10/12/2021', 'Cash/Credit', 90000.00, 480, '9B8V7C', 1000, 303);

INSERT INTO sales_vehicle VALUES ('3AR7K9', 1957, 'Ford', 'Thunderbird', 'White', 'E-Code', 5000, 'Good', 'FORSALE', 95000.00, 1.15*95000);

INSERT INTO Purchase_Order VALUES (500006, '2/8/2022', 'Credit', 95000.00, 0, '3AR7K9', 1000, 302);

INSERT INTO sales_vehicle VALUES ('7R3M5D', 1963, 'Chevrolet', 'Corvette', 'Silver', 'Sting Ray', 15000, 'Excellent', 'FORSALE', 120000.00, 1.15*120000);

INSERT INTO Purchase_Order VALUES (500007, '4/19/2022', 'Credit', 120000.00, 480, '7R3M5D', 1000, 303);

INSERT INTO sales_vehicle VALUES ('WP0AA0', 1987, 'Porsche', '944S', 'Red', 'Coupe', 60000, 'Fair', 'FORSALE', 23000.00, 1.15*23000.00);

INSERT INTO Purchase_Order VALUES (500008, '6/1/2022', 'Cash', 23000.00, 400, 'WP0AA0', 1000, 301);

INSERT INTO sales_vehicle 
VALUES ('1B6FDJ', 1967, 'Chevrolet', 'Camaro', 'Red', 'RS', 4200, 'Excellent', 'TRADEIN', 55000.00, 1.15*55000);

INSERT INTO Sales_invoice VALUES (600001, '5/1/2023', 'Credit', 1, 1009, NULL, '7R3M5D', '1B6FDJ');

UPDATE Sales_invoice SET Approved_by = 1002 WHERE Sales_Invoice_ID = 600001;

UPDATE sales_vehicle SET status = 'SOLD' WHERE VIN = '7R3M5D';

UPDATE sales_vehicle SET status = 'FORSALE' WHERE VIN = '1B6FDJ';

INSERT INTO sales_vehicle 
VALUES ('2T2BK1', 1955, 'Cadillac', 'Eldorado', 'White', 'Convertible', 9500, 'Good', 'FORSALE', 80000.00, 1.15*80000);

INSERT INTO Sales_invoice VALUES (600002, '5/2/2023', 'Check', 10, 1006, NULL, '5T6Y7U', '2T2BK1');

UPDATE Sales_invoice SET Approved_by = 1000 WHERE Sales_Invoice_ID = 600002;

UPDATE sales_vehicle SET status = 'SOLD' WHERE VIN = '5T6Y7U';

UPDATE sales_vehicle SET status = 'FORSALE' WHERE VIN = '2T2BK1';

INSERT INTO sales_vehicle 
VALUES ('3GNFK9', 1969, 'Pontiac', 'Firebird', 'Blue', 'Trans Am', 3000, 'Excellent', 'FORSALE', 72000.00, 1.15*72000);

INSERT INTO Sales_invoice VALUES (600003, '5/3/2023', 'Check', 5, 1006, NULL, 'X4C3V2', '3GNFK9');

UPDATE Sales_invoice SET Approved_by = 1002 WHERE Sales_Invoice_ID = 600003;

UPDATE sales_vehicle SET status = 'SOLD' WHERE VIN = 'X4C3V2';

UPDATE sales_vehicle SET status = 'FORSALE' WHERE VIN = '3GNFK9';

INSERT INTO Sales_invoice VALUES (600004, '5/4/2023', 'Check', 6, 1009, NULL, 'WP0AA0', NULL);

UPDATE Sales_invoice SET Approved_by = 1002 WHERE Sales_Invoice_ID = 600004;

UPDATE sales_vehicle SET status = 'SOLD' WHERE VIN = 'WP0AA0';

INSERT INTO Sales_invoice VALUES (600005, '5/2/2023', 'Check', 10, 1006, NULL, '1GZ9F2', NULL);

UPDATE Sales_invoice SET Approved_by = 1000 WHERE Sales_Invoice_ID = 600005;

UPDATE sales_vehicle SET status = 'SOLD' WHERE VIN = '1GZ9F2';

INSERT INTO service_vehicle (VIN, year, make, model, mileage)
    SELECT VIN, year, make, model, mileage 
    FROM sales_vehicle 
    WHERE VIN = '5T6Y7U';

INSERT INTO Service_Invoice VALUES (700001, '5/3/2023', 10, 1004, '5T6Y7U', NULL, 'TIREROTATE');

INSERT INTO service_vehicle (VIN, year, make, model, mileage)
    SELECT VIN, year, make, model, mileage 
    FROM sales_vehicle 
    WHERE VIN = '1GZ9F2';

INSERT INTO Service_Invoice VALUES (700002, '5/3/2023', 10, 1008, '1GZ9F2', 'WIPERBLADES', 'TIREROTATE');

INSERT INTO service_vehicle (VIN, year, make, model, mileage)
    SELECT VIN, year, make, model, mileage 
    FROM sales_vehicle 
    WHERE VIN = 'X4C3V2';

INSERT INTO Service_Invoice VALUES (700003, '5/20/2023', 5, 1004, 'X4C3V2', 'OIL10W30', NULL);

INSERT INTO service_vehicle (VIN, year, make, model, mileage)
    SELECT VIN, year, make, model, mileage 
    FROM sales_vehicle 
    WHERE VIN = 'WP0AA0';

INSERT INTO Service_Invoice VALUES (700004, '6/1/2023', 6, 1003, 'WP0AA0', 'BELT', 'TUNEUPBASIC');

INSERT INTO Customer VALUES (11, 'Orwell', 'George', '2303 Haste Drive', 'Cayucos', 'CA', '93430', '805-622-5390', 'gorwell@example.com');

INSERT INTO service_vehicle VALUES ('3RDG39', 1987, 'BMW', 'M3', 60000);

INSERT INTO Service_Invoice VALUES (700005, '6/2/2023', 11, 1003, '3RDG39', 'BRAKEPADS', 'MAJTUNEUP');

INSERT INTO service_vehicle VALUES ('88RBKL', 2001, 'Ford', 'Mustang', 80000);

INSERT INTO Service_Invoice VALUES (700006, '6/2/2023', 7, 1004, '88RBKL', 'AIRFILTER', 'TRANSMISNFLUSH');

INSERT INTO service_vehicle VALUES ('THBB10', 1996, 'Porsche', '911', 38000);

INSERT INTO Service_Invoice VALUES (700007, '6/3/2023', 1, 1008, 'THBB10', 'BATTERY', 'OILCHG');

COMMIT;
