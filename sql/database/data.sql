-- drop tables

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(20),
    email VARCHAR UNIQUE
);

CREATE TABLE staff(
    staff_id INT PRIMARY KEY,
    name VARCHAR(20),
    role ENUM('admin', 'support', 'seller')
);

CREATE TABLE products(
    product_id INT PRIMARY KEY,
    name VARCHAR(20) UNIQUE,
    price DOUBLE(5, 2),
    stock INT,
    partner_id INT,
    FOREIGN KEY(partner_id) REFERENCES external_partner(partner_id)
);

CREATE TABLE orders(
    order_id INT PRIMARY KEY,
    status ENUM('processing', 'shipped', 'delivered'),
    product_id INT,
    FOREIGN KEY(product_id) REFERENCES products(product_id),
    delivery_id INT,
    FOREIGN KEY(delivery_id) REFERENCES deliveries(delivery_id)
);

CREATE TABLE order_items(
    order_item_id INT PRIMARY KEY,
    order_id INT,
    FOREIGN KEY order_id REFERENCES orders(order_id),
    product_id INT,
    FOREIGN KEY product_id REFERENCES products(product_id)
);

CREATE TABLE deliveries(
    delivery_id INT PRIMARY KEY,
    track_number INT,
    partner_id INT,
    FOREIGN KEY(partner_id) REFERENCES external_partners(partner_id)
);

CREATE TABLE external_partners(
    partner_id INT PRIMARY KEY,
    name VARCHAR(20) UNIQUE,
    type ENUM('supplier', 'delivery')
);

CREATE TABLE reviews(
    review_id INT PRIMARY KEY,
    product_id INT,
    FOREIGN KEY(product_id) REFERENCES products(product_id),
    customer_id INT,
    FOREIGN KEY(customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE payment(
    payment_id INT PRIMARY KEY,
    order_id INT,
    FOREIGN KEY order_id REFERENCES orders(order_id),
    status ENUM('successful', 'unsuccessful', 'returned', 'refunded')
);

