CREATE TABLE employees
(
    employee_id SERIAL PRIMARY KEY,
    first_name  VARCHAR(50)   NOT NULL,
    last_name   VARCHAR(50)   NOT NULL,
    phone       VARCHAR(20)   NOT NULL,
    email       VARCHAR(100),
    hire_date   DATE          NOT NULL,
    position    position_type NOT NULL,
    is_active   BOOLEAN DEFAULT TRUE
);
