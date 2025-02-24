# 📌 MySQL Data Structure & Query Exercises

## 📖 Overview
This repository contains structured MySQL exercises focused on table creation and querying. Exercises are categorized into three levels, covering different database modeling scenarios and SQL query challenges.

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

## 🗃️ Database Queries

### 🛒 Store Database
Tables:
- **Product**: (code, name, price, manufacturer_code)
- **Manufacturer**: (code, name)
- The `manufacturer_code` in the `product` table references the `code` in the `manufacturer` table.

Query Examples:
- List all product names.
- Retrieve product names and prices.
- Display all columns from the product table.
- Show product prices in EUR and USD with aliases.
- Convert product names to uppercase/lowercase.
- List distinct manufacturer codes from the product table.
- Retrieve the cheapest and most expensive product.
- Get all products from a specific manufacturer.
- Show all manufacturers, including those without products.

### 🎓 University Database

Requires the `schema_universidad.sql` file.

Query Examples:
- List all students' first and last names, sorted alphabetically.
- Retrieve students without a registered phone number.
- Find all students born in 1999.
- List subjects taught in the first semester of the third year of a specific degree.
- Show all teachers and their department names.
- Retrieve all courses a student with a specific ID is enrolled in.
- Find teachers without a department.
- Retrieve the total number of students.
- Count how many students were born in 1999.
- List degrees and the number of subjects they contain.
- Find professors who do not teach any subject.

---

## 🚀 Technologies
- MySQL
- SQL Schema Design
- Database Normalization

## 💡 How to Use
1. Clone this repository.
2. Implement MySQL scripts for each exercise.
3. Test database models using sample queries.

