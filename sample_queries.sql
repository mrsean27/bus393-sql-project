-- Sample queries for the SLO Vintage Auto database
-- Run after schema.sql, seed_data.sql and views.sql.

-- 1. Current inventory: cars for sale, highest list price first
SELECT VIN, year, make, model, trim, condition, list_price
FROM sales_vehicle
WHERE status = 'FORSALE'
ORDER BY list_price DESC;

-- 2. Estimated gross profit on every car sold (list price minus purchase price; the schema stores no final sale price)
SELECT sv.VIN, sv.year || ' ' || sv.make || ' ' || sv.model AS vehicle,
       sv.purchase_price, sv.list_price,
       sv.list_price - sv.purchase_price AS gross_profit
FROM sales_vehicle sv
WHERE sv.status = 'SOLD'
ORDER BY gross_profit DESC;

-- 3. Sales by salesperson: number of cars sold and total sales value
SELECT e.first_name || ' ' || e.last_name AS salesperson,
       COUNT(*) AS cars_sold,
       SUM(sv.list_price) AS total_sales
FROM sales_invoice si
JOIN employee e       ON si.sales_person  = e.employee_id
JOIN sales_vehicle sv ON si.sales_vehicle = sv.VIN
GROUP BY e.first_name, e.last_name
ORDER BY total_sales DESC;

-- 4. Which vendors we buy from, and total spend incl. shipping
SELECT cs.company_name, COUNT(*) AS cars_bought,
       SUM(po.purchase_price + po.shipping_cost) AS total_cost
FROM purchase_order po
JOIN car_sellers cs ON po.vendor = cs.company_id
GROUP BY cs.company_name
ORDER BY total_cost DESC;

-- 5. Customers who traded in a car, and what they traded
SELECT c.first_name || ' ' || c.last_name AS customer,
       bought.make || ' ' || bought.model AS bought,
       traded.make || ' ' || traded.model AS traded_in
FROM sales_invoice si
JOIN customer c            ON si.customer = c.customer_id
JOIN sales_vehicle bought  ON si.sales_vehicle = bought.VIN
JOIN sales_vehicle traded  ON si.trade_in_vehicle = traded.VIN;

-- 6. Service revenue and margin by service type
SELECT s.description, COUNT(*) AS times_performed,
       SUM(s.price) AS revenue, SUM(s.price - s.cost) AS margin
FROM service_invoice inv
JOIN service s ON inv.service_performed = s.service_code
GROUP BY s.description
ORDER BY revenue DESC;

-- 7. Customers with no saved car preference (marketing follow-up list)
SELECT c.first_name, c.last_name, c.phone, c.email
FROM customer c
WHERE NOT EXISTS (SELECT 1 FROM preference p WHERE p.customer_id = c.customer_id);

-- 8. Match open customer preferences to cars in stock under their max price
--    (returns no rows with the sample data: no open preference matches current stock)
SELECT c.first_name || ' ' || c.last_name AS customer,
       p.make, p.model AS wanted_model, p.max_price,
       sv.VIN, sv.year, sv.model AS in_stock_model, sv.list_price
FROM preference p
JOIN customer c       ON p.customer_id = c.customer_id
JOIN sales_vehicle sv ON UPPER(sv.make) = UPPER(p.make)
                     AND sv.status = 'FORSALE'
                     AND sv.list_price <= p.max_price
WHERE p.end_date IS NULL OR p.end_date >= SYSDATE;

-- 9. Org chart: each employee and who they report to (uses the team's view)
SELECT * FROM Emp_Report_List;

-- 10. Repeat buyers: cars purchased per customer, most first (uses the team's view)
SELECT * FROM Num_cars_purchased;
