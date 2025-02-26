CREATE TABLE customer (
id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(25) NOT NULL,
surname VARCHAR(25) NOT NULL,
direction VARCHAR(100),
postal_adress VARCHAR(10),
locality_id INT NOT NULL,
phone VARCHAR(20) NOT NULL,
FOREIGN KEY(locality_id) REFERENCES locality(id));

CREATE TABLE locality (
id INT PRIMARY KEY AUTO_INCREMENT,
province_id INT NOT NULL,
name VARCHAR(50) NOT NULL,
FOREIGN KEY(province_id) REFERENCES province(id));

CREATE TABLE province (
id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(50) NOT NULL);

CREATE TABLE shop (
id INT PRIMARY KEY AUTO_INCREMENT,
direction VARCHAR(100) NOT NULL,
postal_adress VARCHAR(10),
locality_id INT NOT NULL,
FOREIGN KEY(locality_id) REFERENCES locality(id));

CREATE TABLE employee (
id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(25) NOT NULL,
surname VARCHAR(25) NOT NULL,
NIF VARCHAR(15) UNIQUE NOT NULL,
phone VARCHAR(20) NOT NULL,
work ENUM('Delivery man','Chef') NOT NULL,
shop_id INT NOT NULL,
FOREIGN KEY(shop_id) REFERENCES shop(id));

CREATE TABLE categories (
id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(50) NOT NULL);

CREATE TABLE products (
id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(50) NOT NULL,
description TEXT NOT NULL,
image BLOB,
price DECIMAL(3,2) NOT NULL,
type ENUM('Pizza','Hamburger','Drink') NOT NULL,
categories_id INT NOT NULL,
FOREIGN KEY(categories_id) REFERENCES categories(id));

CREATE TABLE orders (
id INT PRIMARY KEY AUTO_INCREMENT,
date DATETIME NOT NULL,
home_delivery ENUM('Yes','Not, pick up in store') NOT NULL,
total_price DECIMAL(10,2) NOT NULL,
customer_id INT NOT NULL,
shop_id INT NOT NULL,
delivery_man_id INT NOT NULL,
FOREIGN KEY(customer_id) REFERENCES customer(id),
FOREIGN KEY(shop_id) REFERENCES shop(id),
FOREIGN KEY(delivery_man_id) REFERENCES employee(id));

CREATE TABLE product_orders (
order_id INT NOT NULL,
product_id INT NOT NULL,
amount INT NOT NULL,
PRIMARY KEY(order_id, product_id),
FOREIGN KEY(order_id) REFERENCES orders(id),
FOREIGN KEY(product_id) REFERENCES products(id));


