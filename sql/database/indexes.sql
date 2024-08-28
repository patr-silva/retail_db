-- To filter orders based on status
CREATE INDEX idx_order_status ON orders(status);
    -- SELECT * FROM orders WHERE status = 'shipped';

-- To retrieve items of a specific order
CREATE INDEX idx_order_items_order_product ON order_items(order_id, product_id);
    -- SELECT * FROM order_items WHERE order_id = 204;
    -- SELECT * FROM order_items WHERE order_id = 203 AND product_id = 103;

-- To retrieve reviews of a specific product
CREATE INDEX idx_reviews_product_rating ON reviews(product_id, rating);
    -- SELECT * FROM reviews WHERE product_id = 106;
    -- SELECT * FROM reviews WHERE product_id = 105 ORDER BY rating DESC;