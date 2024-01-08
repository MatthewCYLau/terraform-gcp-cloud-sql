CREATE TABLE users(
  id SERIAL NOT NULL PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE orders(
    id SERIAL NOT NULL PRIMARY KEY,
    user_id INT NOT NULL references users(id)
);

INSERT INTO users (name) VALUES ('Paul');
INSERT INTO orders (user_id) VALUES (1);