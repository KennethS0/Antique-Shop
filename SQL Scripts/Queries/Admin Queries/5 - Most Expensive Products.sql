DELIMITER ;;
DROP PROCEDURE IF EXISTS most_expensive_products;;
CREATE PROCEDURE most_expensive_products(IN top INT)
	BEGIN
		SELECT ge.product.id AS id, ge.product.productname AS product_name, ge.product.price AS price, ge.product.category AS category 
		FROM ge.product 
			INNER JOIN ad.parameter AS par ON par.name = "category"
		WHERE category = par.value
        ORDER BY price
        LIMIT top;
	END;;
-- Procedure to get most expensive product on each category
-- Returns ID, name, price and category