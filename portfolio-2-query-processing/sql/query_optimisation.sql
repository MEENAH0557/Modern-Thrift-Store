
-- MIT 8103 Advanced Database Systems
-- Portfolio 2: Query Processing and Optimisation
-- Case Study: E-Commerce Management System

-- 1. Baseline query: Retrieve a customer's orders
EXPLAIN (ANALYZE, BUFFERS)
SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    o.order_id,
    o.order_date,
    o.order_status,
    o.total_amount
FROM customer c
JOIN orders o
    ON c.customer_id = o.customer_id
WHERE c.customer_id = 1
ORDER BY o.order_date DESC;

-- 2. Create an index on customer_id
CREATE INDEX IF NOT EXISTS idx_orders_customer_id
ON orders(customer_id);

-- 3. Recheck the customer's orders query
EXPLAIN (ANALYZE, BUFFERS)
SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    o.order_id,
    o.order_date,
    o.order_status,
    o.total_amount
FROM customer c
JOIN orders o
    ON c.customer_id = o.customer_id
WHERE c.customer_id = 1
ORDER BY o.order_date DESC;

-- 4. Identify products with low inventory
EXPLAIN (ANALYZE, BUFFERS)
SELECT
    p.product_id,
    p.product_name,
    i.quantity_available,
    i.reorder_level
FROM product p
JOIN inventory i
    ON p.product_id = i.product_id
WHERE i.quantity_available <= i.reorder_level
ORDER BY i.quantity_available ASC;

-- 5. Create a partial index for low-stock products
CREATE INDEX IF NOT EXISTS idx_inventory_low_stock
ON inventory(quantity_available)
WHERE quantity_available <= reorder_level;

-- 6. Recheck the low-stock query
EXPLAIN (ANALYZE, BUFFERS)
SELECT
    p.product_id,
    p.product_name,
    i.quantity_available,
    i.reorder_level
FROM product p
JOIN inventory i
    ON p.product_id = i.product_id
WHERE i.quantity_available <= i.reorder_level
ORDER BY i.quantity_available ASC;
