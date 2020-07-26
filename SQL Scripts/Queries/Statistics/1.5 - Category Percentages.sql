DELIMITER ;;
DROP PROCEDURE IF EXISTS category_percentages;;
CREATE PROCEDURE category_percentages()
	BEGIN
		DECLARE total INT;
		SELECT COUNT(*) FROM product INTO total;
		SELECT productcategory.name AS category, (COUNT(category_id)/total)*100 AS percentage
		FROM product
		INNER JOIN productcategory AS cat ON product.category_id = cat.id
		GROUP BY category_id
		ORDER BY total ASC;
	END;;
    
-- Procedure used for statistical analysis. Returns percentage of each category