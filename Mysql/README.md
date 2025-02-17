# 📌 MySQL Table Creation Exercises

## 📖 Overview
This repository contains structured MySQL table creation exercises categorized into three levels, covering different database modeling scenarios.

---
## 🏆 Levels & Exercises

### 🟢 Level 1 - Basic
#### 📍 Exercise 1: Optical Store
A store named "Cul d'Ampolla" wants to manage customer and glasses sales efficiently.

- **Provider**:
  - Name, Address (Street, Number, Floor, Door, City, Postal Code, Country), Phone, Fax, NIF.
- **Glasses**:
  - Brand, Lens Power, Frame Type, Frame Color, Lens Color, Price.
- **Customer**:
  - Name, Address, Phone, Email, Registration Date, Referral Customer.
- **Sales**:
  - ID, customer_id, glasses_id, sale_date, employer_id.
- **Employer**:
  - ID, phone, email.

#### 📍 Exercise 2: Pizzeria
Design a web-based food ordering system.

- **Customer**:
  - ID, Name, Last Name, Address, Postal Code, City, Province, Phone.
- **Locality**:
  - Cities belong to one province, while a province has multiple cities.
- **Orders**:
  - ID, Date/Time, Delivery or Pickup, Product Quantities, Total Price.
- **Products**:
  - ID, Name, Description, Image, Price.
- **Stores & Employees**:
  - Stores manage multiple orders.
  - Employees have unique IDs and roles (Chef or Delivery Person).
  - Delivery employees are assigned to orders, tracking delivery date/time.

---
### 🔵 Level 2 - Intermediate
#### 📍 Exercise 1: YouTube Clone
A simplified database model for a YouTube-like platform.

- **Users**:
  - ID, Email, Password, Username, Birthdate, Gender, Country, Postal Code.
- **Videos**:
  - ID, Title, Description, File Name, Size, Duration, Thumbnail, Views, Likes, Dislikes, Status (Public/Hidden/Private), Tags.
- **Channels**:
  - ID, Name, Description, Creation Date.
- **Subscriptions**:
  - Users can subscribe to other channels.
- **Interactions**:
  - Likes/Dislikes for videos and comments.
- **Playlists**:
  - ID, Name, Creation Date, Public/Private.
- **Comments**:
  - ID, Text, Date/Time, Likes/Dislikes.

---
### 🔴 Level 3 - Advanced
#### 📍 Exercise 1: Spotify Clone
A simplified database model for a music streaming service.

- **Users**:
  - ID, Email, Password, Username, Birthdate, Gender, Country, Postal Code.
- **Subscriptions**:
  - Premium users have payment records.
- **Payments**:
  - ID, Date, Order Number, Total.
- **Playlists**:
  - ID, Title, Song Count, Creation Date, Status (Active/Deleted), Shared status.
- **Songs & Albums**:
  - Songs belong to one album, albums have multiple songs, each by a single artist.
- **Artists**:
  - ID, Name, Image.
- **User Preferences**:
  - Users can follow artists and mark favorite albums/songs.

---
## 🚀 Technologies
- MySQL
- SQL Schema Design
- Database Normalization

## 💡 How to Use
1. Clone this repository.
2. Implement MySQL scripts for each exercise.
3. Test database models using sample queries.
