-- VIEW: CustomerSalesSummary

CREATE OR REPLACE VIEW CustomerSalesSummary AS
SELECT 
    c.customer_id,
    c.full_name,
    c.email,
    COUNT(o.order_id) AS total_orders,
    COALESCE(SUM(o.total_amount), 0) AS total_spent
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.full_name, c.email;





-- STORED PROCEDURE: ProcessNewOrder
DELIMITER //
CREATE PROCEDURE ProcessNewOrder(
    IN p_customer_id INT,
    IN p_product_id INT,
    IN p_quantity INT
)
BEGIN
    DECLARE v_stock INT;
    DECLARE v_price DECIMAL(10,2);
    DECLARE v_order_id INT;
    
    -- Start transaction
    START TRANSACTION;
    
    -- Check stock
    SELECT quantity_in_stock INTO v_stock
    FROM Inventory
    WHERE product_id = p_product_id
    FOR UPDATE;
    
    -- Get product price
    SELECT price INTO v_price
    FROM Products
    WHERE product_id = p_product_id;
    
    -- Validate stock
    IF v_stock < p_quantity THEN
        ROLLBACK;
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Insufficient stock';
    ELSE
        -- Reduce inventory
        UPDATE Inventory
        SET quantity_in_stock = quantity_in_stock - p_quantity
        WHERE product_id = p_product_id;
        
        -- Create order
        INSERT INTO Orders (customer_id, order_date, total_amount, order_status)
        VALUES (p_customer_id, CURDATE(), v_price * p_quantity, 'Pending');
        
        SET v_order_id = LAST_INSERT_ID();
        
        -- Create order item
        INSERT INTO Order_Items (order_id, product_id, quantity, price_at_purchase)
        VALUES (v_order_id, p_product_id, p_quantity, v_price);
        
        COMMIT;
        SELECT 'Order processed successfully' AS message, v_order_id AS order_id;
    END IF;
END //
DELIMITER ;