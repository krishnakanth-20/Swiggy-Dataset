# 🍔 Swiggy SQL Data Analysis Project

A complete **Swiggy Food Delivery Database & SQL Analysis Project** built using MySQL.  
This project demonstrates relational database design, data insertion, SQL queries, joins, aggregations, subqueries, and business-oriented data analysis.

---

## 📌 Project Overview

This project simulates a food delivery platform similar to **Swiggy**.

The database contains information about:

- 👤 Customers
- 🍽️ Restaurants
- 📋 Menu Categories
- 🍔 Menu Items
- 🛒 Orders
- 🛵 Delivery Partners
- 📦 Deliveries
- 💳 Payments
- ⭐ Reviews

The main objective of this project is to practice **SQL database management and real-world business data analysis**.

---

## 🎯 Objectives

- Design a relational food delivery database.
- Create tables with primary and foreign key relationships.
- Insert and manage large datasets.
- Perform SQL-based data analysis.
- Understand relationships between customers, restaurants, orders, deliveries, and payments.
- Generate business insights using SQL queries.
- Practice advanced SQL concepts for interviews and data analyst roles.

---

## 🛠️ Technologies Used

| Technology | Purpose |
|---|---|
| MySQL | Database Management |
| SQL | Data Analysis & Queries |
| GitHub | Project Repository |
| MySQL Workbench | Database Development |

---

## 🗂️ Database Structure

The project contains the following major tables:

```text
Customers
    │
    └── Orders
          │
          ├── Payments
          │
          ├── Delivery
          │      │
          │      └── DeliveryPartners
          │
          └── Reviews
          
Restaurants
    │
    ├── MenuCategories
    │       │
    │       └── MenuItems
    │
    └── Orders
