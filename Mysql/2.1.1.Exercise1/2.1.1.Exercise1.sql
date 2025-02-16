CREATE TABLE provider (
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(50) NOT NULL,
direction_street VARCHAR(100),
direction_number INT,
direction_floor VARCHAR(10),
direction_door VARCHAR(10),
direction_city VARCHAR(50),
direction_country VARCHAR(50),
direction_postal_adress VARCHAR(10),
phone VARCHAR(25),
fax INT,
NIF VARCHAR(20) UNIQUE NOT NULL);

CREATE TABLE glasses (
id INT AUTO_INCREMENT PRIMARY KEY,
brand VARCHAR(50),
cristal_graduation_right DECIMAL(3,2) NOT NULL,
cristal_graduation_left DECIMAL(3,2) NOT NULL,
frame ENUM('Floating','Paste','Metalic'),
frame_color VARCHAR(25),
cristal_color VARCHAR(25),
price DECIMAL(3,2) NOT NULL,
provider_id INT NOT NULL,
FOREIGN KEY (provider_id) REFERENCES provider(id) ON DELETE CASCADE);

CREATE TABLE customer (
id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(50) NOT NULL,
postal_adress VARCHAR(10),
phone VARCHAR(25),
email VARCHAR(50),
registration_date DATETIME NOT NULL,
recommender_id INT,
FOREIGN KEY(recommender_id) REFERENCES customer(id) ON DELETE CASCADE);

CREATE TABLE employer (
id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(50) NOT NULL,
phone VARCHAR(25),
email VARCHAR(50));

CREATE TABLE sales (
id INT PRIMARY KEY AUTO_INCREMENT,
customer_id INT NOT NULL,
glasses_id INT NOT NULL,
sale_date DATETIME NOT NULL,
employer_id INT NOT NULL,
FOREIGN KEY(customer_id) REFERENCES customer(id) ON DELETE CASCADE,
FOREIGN KEY(glasses_id) REFERENCES glasses(id) ON DELETE CASCADE,
FOREIGN KEY(employer_id) REFERENCES employer(id) ON DELETE CASCADE);
