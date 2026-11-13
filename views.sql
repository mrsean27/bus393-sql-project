-- Views from the team project (run after schema.sql and seed_data.sql)
-- Part 1: reference lists from the APEX export. Part 2: customer reports from Scripts.docx.

CREATE OR REPLACE VIEW emp_contact_list
AS SELECT First_name, Last_name, Phone, Email
FROM employee e
ORDER BY Last_name;

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

CREATE OR REPLACE VIEW cust_contact_info
AS SELECT first_name, last_name, street, city, state, ZIP, phone, email
FROM customer;

CREATE OR REPLACE VIEW cust_with_pref
AS SELECT c.first_name, c.last_name, p.make, p.model, p.start_date, p.end_date
FROM customer c RIGHT OUTER JOIN preference p 
ON (c.customer_ID = p.customer_ID);

CREATE OR REPLACE VIEW cust_with_pref_NULL
AS SELECT c.first_name, c.last_name, c.phone, NVL(p.make, 'No Preference') AS make, p.model, p.start_date, p.end_date
FROM customer c LEFT OUTER JOIN preference p 
ON (c.customer_ID = p.customer_ID);

CREATE OR REPLACE VIEW Service_list AS
SELECT service_code, description, cost, price, months, mileage
FROM service
ORDER BY service_code;

CREATE OR REPLACE VIEW Part_list AS
SELECT part_code, description, cost, price
FROM part
ORDER BY part_code;

CREATE OR REPLACE VIEW CarSellerList AS
SELECT company_name, CONCAT(contact_name, ' ') AS contact_name, street, city, state, zip, phone, fax
FROM Car_Sellers
ORDER BY company_name;


-- Customer reports (team's Scripts.docx; SELECT UNIQUE changed to the standard DISTINCT)

-- Customers who purchased a car from us
CREATE OR REPLACE VIEW List_of_Customers AS
SELECT DISTINCT c.first_name || ' ' || c.last_name "Customer Name", c.phone
FROM customer c INNER JOIN sales_invoice s
ON (c.customer_ID = s.customer);

-- Number of customers by city
CREATE OR REPLACE VIEW Number_of_Customers_by_City AS
SELECT city, COUNT(*) "Number of Customers"
FROM customer
GROUP BY city;

-- Customers who bought a car but never had one serviced
CREATE OR REPLACE VIEW Customers_No_Service AS
SELECT DISTINCT c.first_name || ' ' || c.last_name "Customer Name", c.phone
FROM customer c INNER JOIN sales_invoice i
ON (c.customer_ID = i.customer)
LEFT JOIN service_invoice s
ON (i.customer = s.customer_ID)
WHERE s.customer_ID IS NULL;

-- Customers with an open preference for a Porsche
CREATE OR REPLACE VIEW Customers_Interest_Porsche AS
SELECT c.first_name || ' ' || c.last_name "Customer Name", c.phone, p.end_date
FROM customer c JOIN preference p
ON (c.customer_ID = p.customer_ID)
WHERE p.end_date IS NULL AND p.make = 'Porsche';

-- Customers who bought a car without a trade-in
CREATE OR REPLACE VIEW Bought_No_Trade AS
SELECT DISTINCT c.first_name || ' ' || c.last_name "Customer Name"
FROM customer c INNER JOIN sales_invoice i
ON (c.customer_ID = i.customer)
WHERE i.trade_in_vehicle IS NULL;

-- Cars purchased per customer, most first (team's task 6a)
CREATE OR REPLACE VIEW Num_cars_purchased AS
SELECT c.first_name || ' ' || c.last_name "Customer Name", COUNT(*) "Number of Cars Purchased"
FROM customer c
JOIN sales_invoice s
ON (c.customer_id = s.customer)
GROUP BY c.first_name, c.last_name
ORDER BY COUNT(*) DESC;
