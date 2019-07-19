DROP TABLE merchants;
DROP TABLE types;
DROP TABLE transactions;

CREATE TABLE transactions (
  id SERIAL4 primary key,
  type_id INT4 REFERENCES types(id),
  merchant_id INT4 REFERENCES merchants(id),
  value INT4
);

CREATE TABLE types (
  id SERIAL4 primary key,
  type_name VARCHAR(255)
);

CREATE TABLE merchants (
  id SERIAL4 primary key,
  merchant_name VARCHAR(255)
);
