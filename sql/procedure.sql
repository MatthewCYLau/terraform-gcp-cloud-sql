CREATE PROCEDURE insert_user(username VARCHAR(255), email VARCHAR(255), date_of_birth DATE)
LANGUAGE SQL
BEGIN ATOMIC
  INSERT INTO users (name, email, date_of_birth) VALUES (username, email, date_of_birth);
END;

CALL insert_user('Jon Doe', 'jon@doe.com', '1990-06-11');