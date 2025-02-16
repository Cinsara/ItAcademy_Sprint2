CREATE TABLE user (
id INT PRIMARY KEY AUTO_INCREMENT,
type ENUM('Free', 'Premium') NOT NULL DEFAULT 'Free',
mail VARCHAR(50) NOT NULL UNIQUE,
pasword VARCHAR(255) NOT NULL,
user_name VARCHAR(50) NOT NULL UNIQUE,
birth_date DATE NOT NULL,
gender ENUM('Female', 'Male'),
country VARCHAR(50) NOT NULL,
zip_code VARCHAR(15) NOT NULL);

CREATE TABLE suscriptions (
id INT PRIMARY KEY AUTO_INCREMENT,
start_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
renewal_date TIMESTAMP NOT NULL,
payment_method_id INT NOT NULL,
user_id INT NOT NULL UNIQUE,
FOREIGN KEY(user_id) REFERENCES user(id) ON DELETE CASCADE,
FOREIGN KEY(payment_method_id) REFERENCES payment_method(id) ON DELETE CASCADE);

CREATE TABLE payment_method (
id INT PRIMARY KEY AUTO_INCREMENT,
user_id INT NOT NULL,
type ENUM('Credit card', 'PayPal') NOT NULL,

card_number VARCHAR(25) UNIQUE,
expiration_month INT,
expiration_year INT,
security_code INT,

paypal_user VARCHAR(50) UNIQUE,
FOREIGN KEY(user_id) REFERENCES user(id) ON DELETE CASCADE);
 
 CREATE TABLE payments (
 id INT PRIMARY KEY AUTO_INCREMENT,
 user_id INT NOT NULL,
 payment_method_id INT NOT NULL,
 date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
 order_number VARCHAR(50) NOT NULL UNIQUE,
 total DECIMAL(10,2) NOT NULL,
 FOREIGN KEY(user_id) REFERENCES user(id) ON DELETE CASCADE,
 FOREIGN KEY(payment_method_id) REFERENCES payment_method(id) ON DELETE CASCADE);
 
 CREATE TABLE playlist (
id INT PRIMARY KEY AUTO_INCREMENT,
title VARCHAR(100) NOT NULL,
n_songs INT DEFAULT 0,
creation_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
status ENUM('Active', 'Deleted') DEFAULT 'Active',
user_id INT NOT NULL,
FOREIGN KEY(user_id) REFERENCES user(id) ON DELETE CASCADE);

CREATE TABLE songs (
id INT PRIMARY KEY AUTO_INCREMENT,
artist_id INT NOT NULL,
title VARCHAR(100) NOT NULL,
duration DECIMAL (10,2) NOT NULL,
play_count INT NOT NULL DEFAULT 0,
FOREIGN KEY(artist_id) REFERENCES artist(id) ON DELETE CASCADE);

CREATE TABLE album (
id INT PRIMARY KEY AUTO_INCREMENT,
title VARCHAR(100) NOT NULL,
publication_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
image VARCHAR(255),
FOREIGN KEY(artist_id) REFERENCES artist(id) ON DELETE CASCADE);

CREATE TABLE artist (
id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(50) NOT NULL,
image VARCHAR(255));

CREATE TABLE users_follow_artist (
follower_id INT NOT NULL,
artist_id INT NOT NULL,
FOREIGN KEY(follower_id) REFERENCES user(id) ON DELETE CASCADE,
FOREIGN KEY(artist_id) REFERENCES artist(id) ON DELETE CASCADE,
PRIMARY KEY(follower_id, artist_id));

CREATE TABLE related_artist (
artist_id INT NOT NULL,
artist_id INT NOT NULL,
FOREIGN KEY(artist_id) REFERENCES artist(id) ON DELETE CASCADE,
FOREIGN KEY(artist_id) REFERENCES artist(id) ON DELETE CASCADE,
PRIMARY KEY(artist_id, artist_id));

CREATE TABLE user_favorite_songs (
user_id INT NOT NULL,
song_id INT NOT NULL,
FOREIGN KEY(user_id) REFERENCES user(id) ON DELETE CASCADE,
FOREIGN KEY(song_id) REFERENCES songs(id) ON DELETE CASCADE,
PRIMARY KEY(user_id, song_id));

CREATE TABLE user_favorite_albums (
user_id INT NOT NULL,
album_id INT NOT NULL,
FOREIGN KEY(user_id) REFERENCES user(id) ON DELETE CASCADE,
FOREIGN KEY(album_id) REFERENCES album(id) ON DELETE CASCADE,
PRIMARY KEY(user_id, album_id));

CREATE TABLE playlist_songs (
playlist_id INT NOT NULL,
song_id INT NOT NULL,
added_by_user INT NOT NULL,
FOREIGN KEY(playlist_id) REFERENCES playlist(id),
FOREIGN KEY(song_id) REFERENCES songs(id),
FOREIGN KEY(added_by_user) REFERENCES user(id),
PRIMARY KEY(playlist_id, song_id));


 