-- Retrieve orders and customer details (inner join)
SELECT o.order_id, o.status, c.name AS customer_name, c.email AS customer_email 
    FROM orders o
    JOIN customers c ON o.customer_id = c.customer_id;

-- Retrieve all products and their suppliers (inner join)
SELECT p.product_id, p.name AS product_name, p.price, ep.name AS supplier_name
    FROM products p
    JOIN external_partners ep ON p.partner_id = ep.partner_id
    WHERE ep.type = 'supplier';

-- Retrieve order items of a specific order and all ots details (inner join)
SELECT oi.order_item_id, p.name AS product_name, p.price
    FROM order_items oi
    JOIN products p ON oi.product_id = p.product_id
    WHERE oi.order_id = 1001;    

