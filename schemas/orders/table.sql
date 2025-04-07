CREATE TABLE orders
(
  order_id           SERIAL PRIMARY KEY,
  client_id          INTEGER       NOT NULL REFERENCES clients (client_id),
  employee_id        INTEGER       NOT NULL REFERENCES employees (employee_id),
  service_date       DATE          NOT NULL,
  service_type       service_type  NOT NULL,
  additional_details VARCHAR(300),
  price              DECIMAL(8, 2) NOT NULL,
  created_at         TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
