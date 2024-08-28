DROP TABLE customers;
DROP TABLE staff;
DROP TABLE external_partners;
DROP TABLE products;
DROP TABLE deliveries; 
DROP TABLE orders;
DROP TABLE order_items;
DROP TABLE reviews; 
DROP TABLE payments;



CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    email VARCHAR(20) UNIQUE NOT NULL
);

CREATE TABLE staff(
    staff_id INT PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    role ENUM('admin', 'support', 'sales') NOT NULL
);

CREATE TABLE external_partners(
    partner_id INT PRIMARY KEY,
    name VARCHAR(20) UNIQUE NOT NULL,
    type ENUM('supplier', 'delivery') NOT NULL
);

CREATE TABLE products(
    product_id INT PRIMARY KEY,
    name VARCHAR(20) UNIQUE NOT NULL,
    price DOUBLE(5, 2) NOT NULL CHECK (price >= 0),
    stock INT NOT NULL (stock >= 0),
    partner_id INT NOT NULL,
    FOREIGN KEY(partner_id) REFERENCES external_partners(partner_id)
);

CREATE TABLE deliveries(
    delivery_id INT PRIMARY KEY,
    track_number INT NOT NULL,
    partner_id INT NOT NULL,
    FOREIGN KEY(partner_id) REFERENCES external_partners(partner_id)
);

CREATE TABLE orders(
    order_id INT PRIMARY KEY,
    status ENUM('processing', 'shipped', 'delivered') NOT NULL DEFAULT 'processing',
    customer_id INT NOT NULL,
    FOREIGN KEY(customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE,
    delivery_id INT NOT NULL,
    FOREIGN KEY(delivery_id) REFERENCES deliveries(delivery_id) ON DELETE SET NULL
);

CREATE TABLE order_items(
    order_item_id INT PRIMARY KEY,
    order_id INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE,
    product_id INT NOT NULL,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE reviews(
    review_id INT PRIMARY KEY,
    rating INT NOT NULL CHECK (rating BETWEEN 1 AND 5),
    product_id INT NOT NULL,
    FOREIGN KEY(product_id) REFERENCES products(product_id),
    customer_id INT NOT NULL,
    FOREIGN KEY(customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE payments(
    payment_id INT PRIMARY KEY,
    order_id INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    status ENUM('successful', 'unsuccessful', 'returned', 'refunded') NOT NULL
);