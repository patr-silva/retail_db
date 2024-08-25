-- drop tables

CREATE_TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(20),
    email VARCHAR UNIQUE,
    order_id INT,
    FOREIGN KEY (order_id) REFERENCES
orders(order_id)
);

CREATE_TABLE staff(
    staff_id INT PRIMARY KEY,
    name VARCHAR(20),
    role ENUM('admin', 'support', 'seller')
);

CREATE_TABLE products(
    product_id INT PRIMARY KEY,
    name VARCHAR(20) UNIQUE,
    price DOUBLE(5, 2),
    stock INT,
    review_id INT,
    FOREIGN KEY(review_id) REFERENCES
    reviews(review_id),
    partner_id INT,
    FOREIGN_KEY(partner_id) REFERENCES
    external_partner(partner_id)
);

CREATE_TABLE orders(
    order_id INT PRIMARY KEY,
    status ENUM('processing', 'shipped', 'delivered'),
    product_id INT,
    FOREIGN_KEY(product_id) REFERENCES
    products(product_id),
    delivery_id INT,
    FOREIGN_KEY(delivery_id) REFERENCES
    deliveries(delivery_id)
);

CREATE_TABLE deliveries(
    delivery_id INT PRIMARY KEY,
    track_number INT,
    partner_id INT,
    FOREIGN KEY(partner_id) REFERENCES
    external_partners(partner_id)
);

CREATE_TABLE external_partners(
    partner_id INT PRIMARY KEY,
    name VARCHAR(20) UNIQUE,
    type ENUM('supplier', 'delivery'),
);

CREATE_TABLE reviews(
    review_id INT PRIMARY KEY,
    product_id INT,
    FOREIGN KEY(product_id) REFERENCES
    products(product_id),
    customer_id INT,
    FOREIGN KEY(customer_id) REFERENCES
    customers(customer_id)
);

CREATE_TABLE payment(
    payment_id INT PRIMARY KEY,
    order_id INT,
    FOREIGN KEY order_id REFERENCES
    orders(order_id),
    status ENUM('successful', 'unsuccessful', 'returned', 'refunded')
);

