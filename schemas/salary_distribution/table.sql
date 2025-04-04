CREATE TABLE order_salary_distribution
(
    distribution_id SERIAL PRIMARY KEY,
    order_id        INTEGER        NOT NULL REFERENCES orders (order_id),
    employee_id     INTEGER        NOT NULL REFERENCES employees (employee_id),
    amount          DECIMAL(10, 2) NOT NULL,
    percentage      DECIMAL(5, 2)  NOT NULL,
    position        position_type  NOT NULL,
    created_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
