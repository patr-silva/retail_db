--------------------------------------------------------------------------------
-- Customers 
--------------------------------------------------------------------------------
-- Create customer
INSERT INTO customers(customer_id, name, email) VALUES 
    (5, 'Logan Sargeant', 'ls@williams');

-- Login (retrieve customer details by email)
SELECT * FROM customers WHERE email = 'aa@williams.com';

-- Update customer email by customer ID
UPDATE customers SET email = 'cs@williams.com' WHERE customer_id = 3;

-- Retrieve customer name by customer ID
SELECT name FROM customers WHERE customer_id = 2;

-- Delete customer by name
DELETE FROM customers WHERE name = 'Logan Sargeant';

-- Retrieve all customers for marketing (e.g., to send a promotional email)
SELECT name, email FROM customers;
--------------------------------------------------------------------------------
-- Staff
--------------------------------------------------------------------------------
-- Create staff member
INSERT INTO staff(staff_id, name, role) VALUES 
    (55, 'George Martin', 'sales');

-- Update staff role by staff ID
UPDATE staff SET role = 'admin' WHERE staff_id = 52;

-- Retrieve staff name by staff ID
SELECT name FROM staff WHERE staff_id = 53;

-- Retrieve all staff with 'sales' role
SELECT name FROM staff WHERE role = 'sales';

-- Delete staff member by name
DELETE FROM staff WHERE name = 'John Smith';

-- Retrieve all staff members for payroll processing
SELECT staff_id, name, role FROM staff;
--------------------------------------------------------------------------------
-- External Partners
--------------------------------------------------------------------------------
-- Add new external partner 
INSERT INTO external_partners(partner_id, name, type) VALUES 
    (507, 'postoffice', 'delivery');


-- Retrieve partner name by type (corrected spelling mistake from 'supllier' to 'supplier')
SELECT name FROM external_partners WHERE type = 'supplier';

-- Retrieve partner ID and name for all external partners
SELECT partner_id, name FROM external_partners;

-- Retrieve all delivery partners
SELECT partner_id, name FROM external_partners WHERE type = 'delivery';

-- Delete external partner by partner ID
DELETE FROM external_partners WHERE partner_id = 504;
--------------------------------------------------------------------------------
-- Products
--------------------------------------------------------------------------------
-- Create product
INSERT INTO products(product_id, name, price, stock, partner_id) VALUES
     (110, 'printer', 179, 18, 501);

-- Retrieve products with low stock (e.g., less than 5 items)
SELECT * FROM products WHERE stock < 5;

-- Retrieve products within a specific price range
SELECT * FROM products WHERE price BETWEEN 30.00 AND 200.00;

-- Retrieve products by partner ID
SELECT * FROM products WHERE partner_id = 501;

-- Retrieve products sorted by price in descending order
SELECT * FROM products ORDER BY price DESC;

-- Update product stock by product ID
UPDATE products SET stock = stock + 10 WHERE product_id = 102;

-- Delete product by product ID
DELETE FROM products WHERE product_id = 107;

-- Retrieve all products for a specific partner and order them by stock quantity
SELECT * FROM products WHERE partner_id = 501 ORDER BY stock ASC;
--------------------------------------------------------------------------------
-- Orders
--------------------------------------------------------------------------------
-- Create an order
INSERT INTO orders(order_id, status, customer_id, delivery_id) VALUES
    (1001, 'processing', 1, 201);

-- Retrieve orders by customer ID
SELECT * FROM orders WHERE customer_id = 1;

-- Retrieve order details for a specific product (Correcting the query to join with order_items)
SELECT o.order_id, oi.product_id 
FROM orders o 
JOIN order_items oi ON o.order_id = oi.order_id 
WHERE oi.product_id = 101;

-- Retrieve orders along with customer names
SELECT o.order_id, c.name as customer_name 
FROM orders o 
JOIN customers c ON o.customer_id = c.customer_id;

-- Retrieve the total amount spent by a customer (assuming there's a 'total' column in orders)
SELECT SUM(total) AS total_spent 
FROM orders 
WHERE customer_id = 1;

-- Retrieve the number of orders by status
SELECT status, COUNT(*) AS num_orders 
FROM orders 
GROUP BY status;

-- Retrieve the most recent orders
SELECT * FROM orders ORDER BY order_id DESC LIMIT 10;

-- Retrieve the orders that have not been delivered yet
SELECT * FROM orders WHERE status IN ('processing', 'shipped');
--------------------------------------------------------------------------------
-- Order Items
--------------------------------------------------------------------------------
-- Add items to an order
INSERT INTO order_items(order_item_id, order_id, product_id) VALUES
    (2001, 1001, 101),
    (2002, 1001, 102);

-- Retrieve all items for a specific order
SELECT * FROM order_items WHERE order_id = 1001;

-- Retrieve all orders that include a specific product
SELECT o.order_id, oi.product_id 
FROM orders o 
JOIN order_items oi ON o.order_id = oi.order_id 
WHERE oi.product_id = 101;

-- Count the number of items in a specific order
SELECT COUNT(*) AS num_items 
FROM order_items 
WHERE order_id = 1001;
--------------------------------------------------------------------------------
-- Reviews
--------------------------------------------------------------------------------
-- Add a review
INSERT INTO reviews(review_id, rating, product_id, customer_id) VALUES
    (301, 5, 101, 1);

-- Retrieve reviews for a specific product
SELECT * FROM reviews WHERE product_id = 101;

-- Retrieve the average rating for a specific product
SELECT AVG(rating) AS avg_rating 
FROM reviews 
WHERE product_id = 101;

-- Retrieve reviews along with customer names
SELECT r.rating, c.name 
FROM reviews r 
JOIN customers c ON r.customer_id = c.customer_id 
WHERE r.product_id = 101;
--------------------------------------------------------------------------------
-- Payments
--------------------------------------------------------------------------------
-- Create a payment record
INSERT INTO payments(payment_id, order_id, status) VALUES
    (401, 1001, 'successful');

-- Retrieve payment details for a specific order
SELECT * FROM payments WHERE order_id = 1001;

-- Retrieve all successful payments
SELECT * FROM payments WHERE status = 'successful';

-- Retrieve the number of payments by status
SELECT status, COUNT(*) AS num_payments 
FROM payments 
GROUP BY status;

-- Retrieve the total number of refunds processed
SELECT COUNT(*) AS total_refunds 
FROM payments 
WHERE status = 'refunded';