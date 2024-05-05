SELECT users.name, count(*) FROM users GROUP BY users.name
SELECT COUNT(*) FROM (SELECT DISTINCT users.name FROM users) AS temp;
