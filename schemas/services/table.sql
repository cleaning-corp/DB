CREATE TABLE services
(
  id          SERIAL PRIMARY KEY,
  name        VARCHAR(80)   NOT NULL,
  description VARCHAR(200),
  price       NUMERIC(8, 2) NOT NULL
);
