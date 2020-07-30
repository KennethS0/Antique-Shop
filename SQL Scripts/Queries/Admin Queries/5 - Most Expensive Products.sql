DELIMITER ;;
DROP PROCEDURE IF EXISTS most_expensive_products;;
CREATE PROCEDURE most_expensive_products()
	BEGIN
		DECLARE parameter INT;
    
		SELECT value INTO parameter FROM ad.parameter WHERE name = 'MOST_EXPENSIVE';
		
        SELECT pc.name, top5.price FROM productcategory AS pc
        
		INNER JOIN (
			SELECT price, category_id FROM product
			ORDER BY price DESC
            LIMIT parameter
            
            INNER JOIN productcategory
            ON cart
            
        ) AS top5 
        ON pc.id = top5.category_id
        
        GROUP BY pc.name;
	END;;
-- Procedure to get most expensive product on each category
-- Returns ID, name, price and category

call most_expensive_products()