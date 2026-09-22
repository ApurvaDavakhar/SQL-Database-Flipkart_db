CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    product_id INT REFERENCES products(product_id),
    quantity INT NOT NULL CHECK (quantity > 0),
    order_date DATE DEFAULT CURRENT_DATE
);

INSERT INTO orders (product_id, quantity, order_date)
VALUES
(1, 2, '2026-09-20'),
(2, 1, '2026-09-20'),
(3, 3, '2026-09-21'),
(4, 1, '2026-09-21'),
(5, 5, '2026-09-22');

-- INNER JOIN: Get product details for each order

SELECT
    o.order_id,
    p.name AS product_name,
    o.quantity,
    p.price,
    o.quantity * p.price AS total_amount,
    o.order_date
FROM orders o
INNER JOIN products p
ON o.product_id = p.product_id;
