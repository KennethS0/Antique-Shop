DELIMITER ;;
DROP PROCEDURE IF EXISTS seen_products;;
CREATE PROCEDURE seen_products(IN user_id INT)
	BEGIN
		SELECT product.id AS id, product.productname AS product_name, product.price AS price, product.category AS category 
		FROM product
			INNER JOIN seen ON product.id = seen.product_id
		WHERE seen.user_id = user_id;
	END;;
    
-- Procedure used to show the user every product he has seen. 
-- Returns the IDs, name, price and category of those products