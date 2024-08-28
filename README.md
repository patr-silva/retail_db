<div align="center">
<h1 align="center">Retail DB Exercise 🛒</h1>
<p align="center">This project is a SQL-based e-commerce database simulating online shopping, managing internal staff, partners, customers, products, orders, deliveries, reviews, and payments.</p>
<p>
⚠️ This project is currently under development and will continue to be refined to enhance both functionality and user experience.
</p>
</div>

# Table of Contents

1. [Introduction](#introduction)
    * [About the project](#about)
    * [Goals and Objectives](#goals)
    * [Built with](#built)
2. [Features](#features)
3. [Database Schema](#schema)

<h1 id="introduction">Introduction</h1>
<h2 id="about">About the project</h2>
This project is a simple SQL-based online shopping system. It simulates an e-commerce database where internal staff, external partners, customers, products, orders, deliveries, reviews, and payments are managed. This database is designed to capture essential aspects of an online shopping platform, including order processing, payment handling, product tracking, and customer feedback.

<h2 id="goals">Goals and objectives</h2>
This project serves as an exercise to enhance my MySQL skills. While the database is currently functional, I plan to further develop it by creating views for efficient data retrieval, implementing stored procedures for automation and optimization, and integrating a Java GUI for a more user-friendly interface. Additionally, I aim to document the entire project to ensure clarity and maintainability.

<h2 id="built">Built with</h2>

![MySQL](https://img.shields.io/badge/mysql-4479A1.svg?style=flat-square&logo=mysql&logoColor=white)

<h1 id="features">Features</h1>

# Project Features

**User Management:**
* Handles registration, login, and updating of customer and staff details.

**Order Management:**
* Stores and retrieves details of customer orders, order items, and their associated deliveries.

**Product Management:**
* Manages products, including their pricing, stock levels, and supplier details.

**Payment Processing:**
* Handles payment records, including tracking payment status and managing refunds.

**Review System:**
* Captures and retrieves customer reviews and ratings for products.

**Partner Management:**
* Manages external partners (suppliers and delivery services).

<h1 id="schema">Database Schema</h1>

## Table: customers
| Column      | Data Type  | Constraints        |
|-------------|------------|--------------------|
| customer_id | INT        | PRIMARY KEY        |
| name        | VARCHAR(20)| NOT NULL           |
| email       | VARCHAR(20)| UNIQUE, NOT NULL   |

## Table: staff
| Column   | Data Type  | Constraints        |
|----------|------------|--------------------|
| staff_id | INT        | PRIMARY KEY        |
| name     | VARCHAR(20)| NOT NULL           |
| role     | ENUM       | NOT NULL, ENUM('admin', 'support', 'sales') |

## Table: external_partners
| Column    | Data Type  | Constraints        |
|-----------|------------|--------------------|
| partner_id| INT        | PRIMARY KEY        |
| name      | VARCHAR(20)| UNIQUE, NOT NULL   |
| type      | ENUM       | NOT NULL, ENUM('supplier', 'delivery') |

## Table: products
| Column    | Data Type    | Constraints        |
|-----------|--------------|--------------------|
| product_id| INT          | PRIMARY KEY        |
| name      | VARCHAR(20)  | UNIQUE, NOT NULL   |
| price     | DOUBLE(5, 2) | NOT NULL, CHECK(price >= 0) |
| stock     | INT          | NOT NULL, CHECK(stock >= 0) |
| partner_id| INT          | FOREIGN KEY (partner_id) REFERENCES external_partners(partner_id) |

## Table: deliveries
| Column      | Data Type  | Constraints        |
|-------------|------------|--------------------|
| delivery_id | INT        | PRIMARY KEY        |
| track_number| INT        | NOT NULL           |
| partner_id  | INT        | FOREIGN KEY (partner_id) REFERENCES external_partners(partner_id) |

## Table: orders
| Column      | Data Type  | Constraints        |
|-------------|------------|--------------------|
| order_id    | INT        | PRIMARY KEY        |
| status      | ENUM       | NOT NULL, ENUM('processing', 'shipped', 'delivered') |
| customer_id | INT        | FOREIGN KEY (customer_id) REFERENCES customers(customer_id) |
| delivery_id | INT        | FOREIGN KEY (delivery_id) REFERENCES deliveries(delivery_id) |

## Table: order_items
| Column       | Data Type  | Constraints        |
|--------------|------------|--------------------|
| order_item_id| INT        | PRIMARY KEY        |
| order_id     | INT        | FOREIGN KEY (order_id) REFERENCES orders(order_id) |
| product_id   | INT        | FOREIGN KEY (product_id) REFERENCES products(product_id) |

## Table: reviews
| Column      | Data Type  | Constraints        |
|-------------|------------|--------------------|
| review_id   | INT        | PRIMARY KEY        |
| rating      | INT        | NOT NULL, CHECK(rating BETWEEN 1 AND 5) |
| product_id  | INT        | FOREIGN KEY (product_id) REFERENCES products(product_id) |
| customer_id | INT        | FOREIGN KEY (customer_id) REFERENCES customers(customer_id) |

## Table: payments
| Column      | Data Type  | Constraints        |
|-------------|------------|--------------------|
| payment_id  | INT        | PRIMARY KEY        |
| order_id    | INT        | FOREIGN KEY (order_id) REFERENCES orders(order_id) |
| status      | ENUM       | NOT NULL, ENUM('successful', 'unsuccessful', 'returned', 'refunded') |
