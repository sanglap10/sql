/* ================================
   Create Database
================================ */
CREATE DATABASE MyShopDB;
GO

USE MyShopDB;
GO

/* ================================
   Create Tables
================================ */

-- Category table
CREATE TABLE category (
    categoryId INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

-- Product table (includes stock)
CREATE TABLE product (
    productId INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    stockQty INT NOT NULL,
    categoryId INT NOT NULL,
    CONSTRAINT fk_product_category
        FOREIGN KEY (categoryId) REFERENCES category(categoryId)
);

-- Sales table
CREATE TABLE sales (
    saleId INT PRIMARY KEY,
    productId INT NOT NULL,
    quantitySold INT NOT NULL,
    saleDate DATE NOT NULL,
    CONSTRAINT fk_sales_product
        FOREIGN KEY (productId) REFERENCES product(productId)
);

/* ================================
   Insert Sample Data
================================ */

-- Categories
INSERT INTO category (categoryId, name)
VALUES
(1, 'Personal Care'),
(2, 'Groceries'),
(3, 'Snacks');

-- Products
INSERT INTO product (productId, name, price, stockQty, categoryId)
VALUES
(101, 'Soap',        35.00, 50, 1),
(102, 'Hair Oil',   120.00, 30, 1),
(103, 'Shampoo',     95.00, 40, 1),
(104, 'Rice 5kg',   350.00, 20, 2),
(105, 'Salt Packet', 25.00, 60, 2),
(106, 'Chips',       30.00, 80, 3),
(107, 'Candy',        5.00, 200, 3);

-- Sales
INSERT INTO sales (saleId, productId, quantitySold, saleDate)
VALUES
(1, 101, 5, '2026-01-10'),
(2, 104, 2, '2026-01-10'),
(3, 106, 10, '2026-01-11'),
(4, 107, 25, '2026-01-11'),
(5, 103, 3, '2026-01-12');
