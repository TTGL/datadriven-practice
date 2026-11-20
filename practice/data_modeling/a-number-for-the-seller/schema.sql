CREATE TABLE sellers (
    seller_id UUID,
    email VARCHAR,
    name VARCHAR,
    status_id UUID,
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    PRIMARY KEY (seller_id)
);

CREATE TABLE products (
    product_id UUID,
    product_name VARCHAR,
    seller_id UUID,
    status_id UUID,
    created_at TEXT,  /* no type on the canvas */
    updated_at TEXT,  /* no type on the canvas */
    PRIMARY KEY (product_id)
);

CREATE TABLE product_status (
    status_id UUID,
    name VARCHAR,
    PRIMARY KEY (status_id)
);

CREATE TABLE seller_status (
    status_id UUID,
    name VARCHAR,
    PRIMARY KEY (status_id)
);

CREATE TABLE sales (
    sale_id UUID,
    product_id UUID,
    amount INT,
    cost DECIMAL,
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

ALTER TABLE products
    ADD FOREIGN KEY (seller_id) REFERENCES sellers (seller_id);

ALTER TABLE sellers
    ADD FOREIGN KEY (status_id) REFERENCES seller_status (status_id);

ALTER TABLE products
    ADD FOREIGN KEY (status_id) REFERENCES product_status (status_id);

ALTER TABLE sales
    ADD FOREIGN KEY (product_id) REFERENCES products (product_id);
