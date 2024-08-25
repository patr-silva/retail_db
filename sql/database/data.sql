INSERT INTO customers(customer_id, name, email) VALUES 
    (1, 'Alex Albon', 'aa@williams.com'),
    (2, 'Oscar Piastri', 'op@maclaren'),
    (3, 'Carlos Sainz', 'cs@ferrari.com'),
    (4, 'Lando Noris', 'ln@maclaren.com');

INSERT INTO staff(staff_id, name, role) VALUES
    (50, 'John Smith', 'support'),
    (51, 'Bob Williams', 'sales'),
    (52, 'Alice Brown', 'sales'),
    (53, 'Jane Johnson', 'support'),
    (54, 'Emily Thomas', 'admin');

    INSERT INTO external_partners(partner_id, name, type) VALUES
    (501, 'technova', 'supplier'),
    (502, 'nexus', 'supplier'),
    (503, 'parcelprime', 'delivery'),
    (504, 'shiftshift', 'delivery'),
    (505, 'pixel', 'supplier'),
    (506, 'digitalnex', 'supplier');

INSERT INTO products(product_id, name, price, stock, partner_id) VALUES
    (101, 'laptop', 999, 10, 501),
    (102, 'phone', 799, 20, 501),
    (103, 'headphones', 249, 25, 501), 
    (104, 'watch', 299, 30, 502),
    (105, 'console', 399, 5, 505),
    (106, 'tv', 799, 3, 506),
    (107, 'camera', 599, 8, 502),
    (108, 'keyboard', 79, 40, 501),
    (109, 'mouse', 29, 8, 501);

INSERT INTO deliveries(delivery_id, track_number, partner_id) VALUES
    (401, 597856, 503),
    (402, 789665, 504), 
    (403, 325967, 503),
    (404, 123448, 504);

INSERT INTO orders(order_id, status, customer_id, delivery_id) VALUES
    (201, 'shipped', 1, 401),
    (202, 'processing', 3, 402), 
    (203, 'processing', 2, 403),
    (204, 'delivered', 4, 404);

INSERT INTO order_items(order_item_id, order_id, product_id) VALUES
    (301, 201, 102),
    (302, 201, 107),
    (303, 201, 105),
    (304, 202, 101),
    (305, 202, 108),
    (306, 202, 109),
    (307, 202, 103),
    (308, 203, 102),
    (309, 203, 103),
    (310, 203, 104),
    (311, 204, 106),
    (312, 204, 105);

INSERT INTO reviews(review_id, rating, product_id, customer_id) VALUES
    (601, 4, 106, 4),
    (602, 5, 105, 4);

INSERT INTO payments(payment_id, order_id, status) VALUES 
    (701, 201, 'successful'),
    (702, 202, 'successful'),
    (703, 203, 'successful'),
    (704, 204, 'successful');

