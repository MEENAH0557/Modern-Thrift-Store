--MIT 8103 Advanced Database Systems
--Portfolio 1: Database Design and Modelling
--Case Study: E-Commerce Platform

CREATE TABLE customer (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    phone VARCHAR(20),
    address TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE category (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT
);


-- 3. PRODUCT TABLE
CREATE TABLE product (
    product_id SERIAL PRIMARY KEY,
    category_id INTEGER NOT NULL,
    product_name VARCHAR(150) NOT NULL,
    description TEXT,
    price NUMERIC(12, 2) NOT NULL CHECK (price >= 0),
    status VARCHAR(20) NOT NULL DEFAULT 'active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (category_id)
        REFERENCES category(category_id)
);

-- 4. INVENTORY TABLE
CREATE TABLE inventory (
    inventory_id SERIAL PRIMARY KEY,
    product_id INTEGER NOT NULL UNIQUE,
    quantity_available INTEGER NOT NULL DEFAULT 0
        CHECK (quantity_available >= 0),
    reorder_level INTEGER NOT NULL DEFAULT 10
        CHECK (reorder_level >= 0),
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (product_id)
        REFERENCES product(product_id)
);

-- 5. ORDERS TABLE
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    order_status VARCHAR(30) NOT NULL DEFAULT 'pending',
    total_amount NUMERIC(12, 2) NOT NULL DEFAULT 0
        CHECK (total_amount >= 0),

    FOREIGN KEY (customer_id)
        REFERENCES customer(customer_id)
);

-- 6. ORDER ITEM TABLE
CREATE TABLE order_item (
    order_item_id SERIAL PRIMARY KEY,
    order_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL CHECK (quantity > 0),
    unit_price NUMERIC(12, 2) NOT NULL CHECK (unit_price >= 0),
    subtotal NUMERIC(12, 2) NOT NULL CHECK (subtotal >= 0),

    FOREIGN KEY (order_id)
        REFERENCES orders(order_id)
        ON DELETE CASCADE,

    FOREIGN KEY (product_id)
        REFERENCES product(product_id)
);

-- 7. PAYMENT TABLE
CREATE TABLE payment (
    payment_id SERIAL PRIMARY KEY,
    order_id INTEGER NOT NULL UNIQUE,
    payment_reference VARCHAR(100) NOT NULL UNIQUE,
    amount NUMERIC(12, 2) NOT NULL CHECK (amount >= 0),
    payment_method VARCHAR(30) NOT NULL,
    payment_status VARCHAR(30) NOT NULL DEFAULT 'pending',
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (order_id)
        REFERENCES orders(order_id)
);

-- 8. DELIVERY TABLE
CREATE TABLE delivery (
    delivery_id SERIAL PRIMARY KEY,
    order_id INTEGER NOT NULL UNIQUE,
    delivery_address TEXT NOT NULL,
    delivery_status VARCHAR(30) NOT NULL DEFAULT 'pending',
    tracking_number VARCHAR(100) UNIQUE,
    shipped_date TIMESTAMP,
    delivered_date TIMESTAMP,

    FOREIGN KEY (order_id)
        REFERENCES orders(order_id)
);
