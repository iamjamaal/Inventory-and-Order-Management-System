              Inventory and Order Management System

Project Overview
E-commerce database system for managing customers, products, inventory, and orders.



Database Schema
- Customer: Customer information and shipping addresses
- Products: Product catalog with categories and pricing
- Inventory: Stock tracking for all products
- Orders: Customer orders with status tracking
- Order_Items: Line items linking orders to products



Setup Instructions
1. Run `01_DDL_Schema.sql` to create database and tables
2. Run `02_Sample_Data.sql` to populate with sample data
3. Run `03_KPI_Queries.sql` to execute business intelligence queries
4. Run `04_Views_Procedures.sql` to create views and stored procedures



 Key Features
- Normalized 3NF database design
- Foreign key constraints for referential integrity
- CHECK constraints for data validation
- Performance indexes on frequently queried columns
- CustomerSalesSummary view for quick analytics
- ProcessNewOrder procedure with transaction management