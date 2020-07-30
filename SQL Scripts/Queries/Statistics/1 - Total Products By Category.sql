DELIMITER ;;
DROP PROCEDURE IF EXISTS products_per_category;;
CREATE PROCEDURE products_per_category()
	BEGIN
		SELECT pc.name AS category, COUNT(p.category_id) AS amount,
        (COUNT(p.category_id) * 100 / (SELECT COUNT(p.category_id) FROM product)) AS percentage
        FROM productcategory AS pc
        
         INNER JOIN product AS p
         WHERE p.category_id = pc.id
       
         GROUP BY category, p.category_id;
	END;;
    
-- Procedure used for statistical analysis. Returns how many products are in each category
