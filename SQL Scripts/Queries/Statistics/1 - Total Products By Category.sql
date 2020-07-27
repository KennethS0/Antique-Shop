DELIMITER ;;
DROP PROCEDURE IF EXISTS products_per_category;;
CREATE PROCEDURE products_per_category()
	BEGIN
		SELECT productcategory.name AS category, COUNT(category_id) AS amount
		FROM product
		INNER JOIN productcategory AS cat ON product.category_id = cat.id
		GROUP BY category_id
		ORDER BY amount ASC;
	END;;
    
-- Procedure used for statistical analysis. Returns how many products are in each category