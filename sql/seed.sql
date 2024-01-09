CREATE TABLE users(
  id SERIAL NOT NULL PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE products(
  id SERIAL NOT NULL PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE orders(
    id SERIAL NOT NULL PRIMARY KEY,
    user_id INT NOT NULL references users(id),
    product_id INT NOT NULL references products(id)
);

INSERT INTO users (name) VALUES ('Paul');
INSERT INTO products (name) VALUES ('Apply');
INSERT INTO orders (user_id, product_id) VALUES (1, 1);
