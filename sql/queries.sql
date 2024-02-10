SELECT orders.id, orders.product_id, users.name, users.email, users.timestamp
FROM orders
INNER JOIN users ON orders.user_id=users.id;

SELECT users.name, users.email FROM users WHERE users.email = '1@2.com';
EXPLAIN SELECT users.name, users.email FROM users WHERE users.email = '1@2.com';