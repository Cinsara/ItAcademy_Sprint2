CREATE TABLE user (
id INT PRIMARY KEY AUTO_INCREMENT,
email VARCHAR(50) NOT NULL UNIQUE,
password VARCHAR(255) NOT NULL,
name VARCHAR(25) NOT NULL,
birthdate DATE,
gender ENUM('Male', 'Female'),
country VARCHAR(50),
postal_adress VARCHAR(10));

CREATE TABLE videos (
id INT PRIMARY KEY AUTO_INCREMENT,
title VARCHAR(50) NOT NULL,
description TEXT,
size DECIMAL (10,2) NOT NULL,
archive_name VARCHAR(50) NOT NULL,
video_duration TIME NOT NULL,
thumbnail VARCHAR(255),
n_reproductions INT NOT NULL,
n_likes INT NOT NULL,
n_dislikes INT NOT NULL,
status ENUM('Public', 'Hidden', 'Private') NOT NULL,
publication_date DATETIME NOT NULL,
user_id INT NOT NULL,
channel_id INT NOT NULL,
FOREIGN KEY(user_id) REFERENCES user(id) ON DELETE CASCADE,
FOREIGN KEY(channel_id) REFERENCES channel(id) ON DELETE CASCADE);

CREATE TABLE tag (
id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(50) NOT NULL);

-- Seguramente esto este mal (?)
CREATE TABLE video_tags (
tag_id INT NOT NULL,
video_id INT NOT NULL,
FOREIGN KEY(tag_id) REFERENCES tag(id) ON DELETE CASCADE,
FOREIGN KEY(video_id) REFERENCES videos(id) ON DELETE CASCADE,
PRIMARY KEY(tag_id, video_id));
--

CREATE TABLE channel (
id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(50) NOT NULL,
description TEXT,
date_creation DATE NOT NULL DEFAULT CURRENT_TIMESTAMP,
user_id INT NOT NULL,
FOREIGN KEY(user_id) REFERENCES user(id) ON DELETE CASCADE);

CREATE TABLE suscriptions (
id INT PRIMARY KEY AUTO_INCREMENT,
channel_id INT NOT NULL,
user_id INT NOT NULL,
FOREIGN KEY(channel_id) REFERENCES channel(id) ON DELETE CASCADE,
FOREIGN KEY(user_id) REFERENCES user(id) ON DELETE CASCADE,
UNIQUE(user_id, channel_id));

CREATE TABLE likes_dislikes (
user_id INT NOT NULL,
video_id INT NOT NULL,
type ENUM('Like', 'Dislike') NOT NULL,
FOREIGN KEY(user_id) REFERENCES user(id) ON DELETE CASCADE,
FOREIGN KEY(video_id) REFERENCES videos(id) ON DELETE CASCADE,
PRIMARY KEY(user_id, video_id));

CREATE TABLE playlist (
id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(50) NOT NULL,
date_creation DATE NOT NULL DEFAULT CURRENT_TIMESTAMP,
status ENUM('Public', 'Private') NOT NULL,
user_id INT NOT NULL,
FOREIGN KEY(user_id) REFERENCES user(id) ON DELETE CASCADE);

CREATE TABLE playlist_videos (
playlist_id INT NOT NULL,
video_id INT NOT NULL,
PRIMARY KEY(playlist_id, video_id),
FOREIGN KEY(video_id) REFERENCES videos(id) ON DELETE CASCADE,
FOREIGN KEY(playlist_id) REFERENCES playlist(id) ON DELETE CASCADE);

CREATE TABLE comments (
id INT PRIMARY KEY AUTO_INCREMENT,
comment_text TEXT,
date_creation DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
video_id INT NOT NULL,
user_id INT NOT NULL,
FOREIGN KEY(video_id) REFERENCES videos(id) ON DELETE CASCADE,
FOREIGN KEY(user_id) REFERENCES user(id) ON DELETE CASCADE);

CREATE TABLE comment_like_dislike (
user_id INT NOT NULL,
comment_id INT NOT NULL,
type ENUM('Like', 'Dislike') NOT NULL,
FOREIGN KEY(user_id) REFERENCES user(id) ON DELETE CASCADE,
FOREIGN KEY(comment_id) REFERENCES comments(id) ON DELETE CASCADE),
PRIMARY KEY(user_id, comment_id));




