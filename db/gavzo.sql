DROP TABLE transactions;
DROP TABLE types;
DROP TABLE merchants;


CREATE TABLE merchants (
  id SERIAL4 primary key,
  merch_name VARCHAR(255)
);

CREATE TABLE types (
  id SERIAL4 primary key,
  type_name VARCHAR(255)
);

CREATE TABLE transactions (
  id SERIAL4 primary key,
  type_id INT4 REFERENCES types(id),
  merch_id INT4 REFERENCES merchants(id),
  value INT4
);
