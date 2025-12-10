-- 1. TOTAL REVENUE from shipped/delivered orders
SELECT SUM(total_amount) AS total_revenue
FROM Orders
WHERE order_status IN ('Shipped', 'Delivered');



-- 2. TOP 10 CUSTOMERS by spending
SELECT c.customer_id, c.full_name, SUM(o.total_amount) AS total_spent
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.full_name
ORDER BY total_spent DESC
LIMIT 10;


-- 3. BEST-SELLING PRODUCTS (Top 5 by quantity)
SELECT p.product_id, p.product_name, SUM(oi.quantity) AS total_sold
FROM Products p
JOIN Order_Items oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_sold DESC
LIMIT 5;


-- 4. MONTHLY SALES TREND
SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    SUM(total_amount) AS monthly_revenue
FROM Orders
WHERE order_status IN ('Shipped', 'Delivered')
GROUP BY month
ORDER BY month;


-- 5. SALES RANK BY CATEGORY (Window Function)
SELECT 
    category,
    product_name,
    total_revenue,
    RANK() OVER (PARTITION BY category ORDER BY total_revenue DESC) AS rank_in_category
FROM (
    SELECT p.category, p.product_name, 
           SUM(oi.quantity * oi.price_at_purchase) AS total_revenue
    FROM Products p
    JOIN Order_Items oi ON p.product_id = oi.product_id
    GROUP BY p.product_id, p.category, p.product_name
) AS product_sales;


-- 6. CUSTOMER ORDER FREQUENCY (LAG Window Function)
SELECT 
    customer_id,
    order_id,
    order_date,
    LAG(order_date) OVER (PARTITION BY customer_id ORDER BY order_date) AS previous_order_date
FROM Orders
ORDER BY customer_id, order_date;