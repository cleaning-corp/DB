CREATE TABLE clients
(
  client_id  SERIAL PRIMARY KEY,
  first_name VARCHAR(50)  NOT NULL,
  last_name  VARCHAR(50)  NOT NULL,
  phone      VARCHAR(20)  NOT NULL,
  email      VARCHAR(100),
  address    VARCHAR(200) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  notes      VARCHAR(300)
);
