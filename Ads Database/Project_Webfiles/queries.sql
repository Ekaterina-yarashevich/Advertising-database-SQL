
-- view show names, company, phone number of customer purchased last year.
SELECT CUSTOMER.fname, CUSTOMER.lname, CUSTOMER.Company, CUSTOMER.Address, SUM(ORDERS.Cost) AS Total_spend 
FROM CUSTOMER INNER JOIN ORDERS ON CUSTOMER.Customer_id = ORDERS.Customer_id 
WHERE YEAR(ORDERS.Date_purchased) = (YEAR(current_date) - 1) 
GROUP BY ORDERS.Customer_id;

-- Create a view which has first names and last names of all members who purchased the mass market
-- via email.

SELECT DISTINCT CUSTOMER.fname, CUSTOMER.lname 
FROM ((CUSTOMER INNER JOIN ORDERS ON CUSTOMER.Customer_id = ORDERS.Customer_id ) 
INNER JOIN PRODUCT ON ORDERS.Product_id = PRODUCT.Product_id)
WHERE PRODUCT.Ad_template = 'mass market' AND PRODUCT.Medium = 'email';

-- Create a view which shows the product name and manufacturer of all products that sold more than 25 units and generated more than $200 revenue
SELECT PRODUCT.Name, PRODUCT.Type, Manufacturer_name, COUNT(ORDERS.Order_id), SUM(ORDERS.Cost)
FROM ((PRODUCT INNER JOIN ORDERS ON PRODUCT.Product_id = ORDERS.Product_id) 
INNER JOIN MANUFACTURERS ON MANUFACTURERS.Manufacturer_id = PRODUCT.Manufacturer_id)
GROUP BY ORDERS.Product_id
HAVING COUNT(ORDERS.Order_id) >= 25 AND SUM(ORDERS.Cost) > 200;