--Team of 3 (Sean Wood and two classmates)
--Drop the table and all instances it may have
DROP TABLE employee CASCADE CONSTRAINTS PURGE;

--Create the employee table
CREATE TABLE Employee
(
    Employee_ID NUMBER(6) PRIMARY KEY,
    First_name VARCHAR2(20) NOT NULL,
    Last_name VARCHAR2(20) NOT NULL,
    Address VARCHAR2(20) NOT NULL,
    City VARCHAR2(20) NOT NULL,
    State CHAR(2) DEFAULT 'CA' NOT NULL,
    Zip CHAR(5) NOT NULL,
    Phone VARCHAR2(11) UNIQUE,
    Email VARCHAR2(40) UNIQUE,
    Hire_date DATE,
    Title VARCHAR2(20) NOT NULL,
    Commission_pct NUMBER(2,2),
    Manager_ID NUMBER(6) REFERENCES Employee(Employee_ID),
    CHECK ((Title LIKE 'Sales%') AND (Commission_pct BETWEEN 0.2 AND 0.3)
        OR (Title <> 'Sales%' AND Commission_pct IS NULL))
);

--Insert all employees, all of whom make use of the default State of 'CA'
INSERT INTO Employee (Employee_ID, First_name, Last_name, Address, City, Zip, Phone, Email, Title)
VALUES (1000, 'Larry', 'Margaria', '123 Auto Lane', 'San Luis Obispo', '93405', '805-234-9919', 'lmargaria@slovintageauto.com', 'Owner/Manager');

INSERT INTO Employee (Employee_ID, First_name, Last_name, Address, City, Zip, Phone, Email, Hire_date, Title, Manager_ID)
VALUES (1001, 'Jim', 'Kaney', '23 Orange Street', 'San Luis Obispo', '93405', '805-782-4853', 'jkaney@slovintageauto.com', '03/19/2018', 'Accounting Manager', 1000);

INSERT INTO Employee (Employee_ID, First_name, Last_name, Address, City, Zip, Phone, Email, Hire_date, Title, Manager_ID)
VALUES (1005, 'Steve', 'Euro', '610 Westmond Blvd', 'Santa Maria', '93458', '805-010-8234', 'seuro@slovintageauto.com', '08/07/2018', 'Cashier', 1001);

INSERT INTO Employee (Employee_ID, First_name, Last_name, Address, City, Zip, Phone, Email, Hire_date, Title, Manager_ID)
VALUES (1007, 'Alice', 'Credit', '112 Elm Street', 'Arroyo Grande', '93420', '805-762-7956', 'acredit@slovintageauto.com', '05/13/2020', 'Bookkeper', 1005);

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

--Create a view of every employee and their contact information
CREATE OR REPLACE VIEW emp_contact_list
AS SELECT First_name, Last_name, Phone, Email
FROM employee e
ORDER BY Last_name;

--Create a view of the manager each employee reports to, called a "Reportee", leaving out any employees who do not have a manager, as well as the title for both manager and employee
CREATE OR REPLACE VIEW Emp_Report_List 
AS SELECT
    M.First_name || ' ' || M.Last_name AS "Manager",
    M.Title AS "Manager Title",
    E.First_name || ' ' || E.Last_name AS "Reportee",
    E.Title AS "Reportee Title"
FROM Employee E
LEFT JOIN Employee M ON E.Manager_ID = M.Employee_ID
WHERE E.Manager_ID IS NOT NULL
ORDER BY M.Last_name;
