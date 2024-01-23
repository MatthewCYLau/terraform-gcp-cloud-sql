CREATE TABLE users(
  id SERIAL NOT NULL PRIMARY KEY,
  name VARCHAR(255),
  email VARCHAR(255),
  date_of_birth DATE,
  timestamp TIMESTAMP DEFAULT current_timestamp,
  CONSTRAINT users_email_key UNIQUE (email)
);

CREATE TABLE products(
  id SERIAL NOT NULL PRIMARY KEY,
  timestamp TIMESTAMP DEFAULT current_timestamp,
  name VARCHAR(255)
);

CREATE TABLE orders(
    id SERIAL NOT NULL PRIMARY KEY,
    timestamp TIMESTAMP DEFAULT current_timestamp,
    user_id INT NOT NULL references users(id),
    product_id INT NOT NULL references products(id)
);

INSERT INTO users (name, email, date_of_birth) VALUES ('Paul', '1@2.com', '1990-06-12');
INSERT INTO users (name, email, date_of_birth) VALUES ('Mary', '2@2.com', '1991-07-22');
INSERT INTO products (name) VALUES ('Apple');
INSERT INTO orders (user_id, product_id) VALUES (1, 1);
