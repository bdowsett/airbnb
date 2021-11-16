CREATE DATABASE airbnb;
CREATE TABLE spaces(id SERIAL PRIMARY KEY, name VARCHAR, description VARCHAR, location VARCHAR, price FLOAT(2)); 

CREATE TABLE bookings(id SERIAL PRIMARY KEY, name VARCHAR, space_id INT, date VARCHAR);
ALTER TABLE bookings ADD FOREIGN KEY (space_id) REFERENCES spaces(id);

-creating test db
CREATE DATABASE airbnb_test;
CREATE TABLE spaces(id SERIAL PRIMARY KEY, name VARCHAR, description VARCHAR, location VARCHAR, price FLOAT(2)); 

CREATE TABLE bookings(id SERIAL PRIMARY KEY, name VARCHAR, space_id INT, date VARCHAR);
ALTER TABLE bookings ADD FOREIGN KEY (space_id) REFERENCES spaces(id);
