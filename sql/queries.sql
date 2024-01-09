SELECT orders.id, orders.product_id, users.name
FROM orders
INNER JOIN users ON orders.user_id=users.id;