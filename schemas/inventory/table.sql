CREATE TABLE inventory
(
    item_id           SERIAL PRIMARY KEY,
    name              VARCHAR(100)       NOT NULL,
    description       TEXT,
    category          inventory_category NOT NULL,
    quantity          INTEGER            NOT NULL DEFAULT 0,
    unit              unit_type          NOT NULL,
    cost_per_unit     DECIMAL(8, 2),
    min_stock_level   INTEGER,     -- минимальный запас
    location          VARCHAR(50), -- место хранения на складе
    barcode           VARCHAR(50),
    is_active         BOOLEAN                     DEFAULT TRUE,
    last_restock_date DATE,        --дата пополнения запаса
    expiration_date   DATE,        --срок годности (для расходников)
    created_at        TIMESTAMP                   DEFAULT CURRENT_TIMESTAMP,
    updated_at        TIMESTAMP                   DEFAULT CURRENT_TIMESTAMP
);
