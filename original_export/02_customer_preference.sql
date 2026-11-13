--Team of 3 (Sean Wood and two classmates)
--Drop the tables and all instances it may have
DROP TABLE Preference CASCADE CONSTRAINTS PURGE;
DROP TABLE Customer CASCADE CONSTRAINTS PURGE;

--Created the customer table
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

--Inserted all of the values into the customer table, 5 of them use the default CA value
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

--Created the preference table
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

--Inserted all of the values into the preference table
--1 customer had 3 preference instances
--1 customer had 2 preference instances
--3 customers had 1 prefence instance
--5 customers had 0 preference instance

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

--Created the view of all of the data in the employee table
CREATE OR REPLACE VIEW empinfo
AS SELECT first_name, last_name, street, city, state, ZIP, phone, email
FROM customer;

--Created the view of all the customers who have a preference instance
CREATE OR REPLACE VIEW cust_with_pref
AS SELECT c.first_name, c.last_name, p.make, p.model, p.start_date, p.end_date
FROM customer c RIGHT OUTER JOIN preference p 
ON (c.customer_ID = p.customer_ID);

--Created the view of all customers with those who have no preference are titled No preference under Make
CREATE OR REPLACE VIEW cust_with_pref_NULL
AS SELECT c.first_name, c.last_name, c.phone, NVL(p.make, 'No Preference') AS make, p.model, p.start_date, p.end_date
FROM customer c LEFT OUTER JOIN preference p 
ON (c.customer_ID = p.customer_ID);
