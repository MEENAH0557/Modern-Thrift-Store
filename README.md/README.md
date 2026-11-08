# Portfolio 1: Database Design and Modelling

## 1. Case Study: E-Commerce Management System

### Introduction
This project focuses on designing and implementing a relational database for an e-commerce platform. The system manages customers, product categories, products, inventory, customer orders, order items, payments, and deliveries.

The database was implemented using PostgreSQL 16.

### 2. Business Requirements
The system is designed to:
- Register and manage customer information.
- Organise products into categories.
- Maintain product prices and descriptions.
- Track available product inventory.
- Record customer orders.
- Store products purchased under each order.
- Track payment information and payment status.
- Monitor delivery addresses and delivery status.

### 3. Database Entities

The database consists of eight entities:

1. Customer
2. Category
3. Product
4. Inventory
5. Orders
6. Order_Item
7. Payment
8. Delivery

### 4. Relationships

- One customer can place many orders.
- One category can contain many products.
- Each product has one inventory record.
- One order can contain many order items.
- One product can appear in many order items.
- Each order has at most one payment record.
- Each order has at most one delivery record.

The Order_Item entity resolves the many-to-many relationship between Orders and Products.

### 5. Database Implementation

The database was implemented using PostgreSQL 16.

The following constraints were applied:
- Primary keys to uniquely identify records.
- Foreign keys to maintain relationships between tables.
- UNIQUE constraints to prevent duplicate email addresses, payment references and other unique values.
- NOT NULL constraints for mandatory fields.
- CHECK constraints to prevent negative prices, quantities, and amounts.
- DEFAULT values for timestamps and record statuses.

### 6. Sample Data and Testing

Sample records were inserted into all eight tables.

SQL JOIN queries were executed to retrieve related information across customers, orders, payments, deliveries, products and order items.

The queries successfully demonstrated the relationships between the database entities.

### 7. Database Normalisation

The database structure was designed around separate entities to reduce unnecessary duplication.

- **First Normal Form (1NF):** Each table has a primary key and stores individual values in its columns.
- **Second Normal Form (2NF):** Non-key attributes depend on their respective table's primary key.
- **Third Normal Form (3NF):** Customer, category, product, payment and delivery information are separated into appropriate tables to reduce transitive dependencies.

### 8. Evidence

Implementation screenshots, SQL scripts and the Entity Relationship Diagram are included in this portfolio folder.

### 9. Technology Used

- PostgreSQL 16
- SQL
- Ubuntu Linux
- GitHub