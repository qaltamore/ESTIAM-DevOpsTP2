CREATE DATABASE numbers_db;USE numbers_db;
CREATE TABLE numbers (id SERIAL, name VARCHAR(20) UNIQUE NOT NULL, value int(11) DEFAULT 0); INSERT INTO numbers(name) VALUES('defaultNumber');