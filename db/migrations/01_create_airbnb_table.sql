CREATE DATABASE airbnb;

CREATE TABLE spaces(id SERIAL PRIMARY KEY, name VARCHAR, description VARCHAR, location VARCHAR, price FLOAT(2), account_id INT); 
ALTER TABLE spaces ADD FOREIGN KEY (account_id) REFERENCES accounts(id);

CREATE TABLE bookings(id SERIAL PRIMARY KEY, name VARCHAR, space_id INT, date VARCHAR, account_id INT);
ALTER TABLE bookings ADD FOREIGN KEY (space_id) REFERENCES spaces(id);
ALTER TABLE bookings ADD FOREIGN KEY (account_id) REFERENCES accounts(id);

CREATE TABLE accounts(id SERIAL PRIMARY KEY, username VARCHAR, email VARCHAR, mob VARCHAR, password VARCHAR);

-creating test db

CREATE DATABASE airbnb_test;
CREATE TABLE spaces(id SERIAL PRIMARY KEY, name VARCHAR, description VARCHAR, location VARCHAR, price FLOAT(2)); 

CREATE TABLE bookings(id SERIAL PRIMARY KEY, name VARCHAR, space_id INT, date VARCHAR, account_id INT);
ALTER TABLE bookings ADD FOREIGN KEY (space_id) REFERENCES spaces(id);
ALTER TABLE bookings ADD FOREIGN KEY (account_id) REFERENCES accounts(id);

CREATE TABLE accounts(id SERIAL PRIMARY KEY, username VARCHAR, email VARCHAR, mob VARCHAR, password VARCHAR);