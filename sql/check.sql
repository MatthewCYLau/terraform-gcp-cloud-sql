ALTER TABLE users ADD CONSTRAINT users_date_of_birth
   CHECK (date_of_birth >= '1990-01-01' AND date_of_birth <'2019-12-31');