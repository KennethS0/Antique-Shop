DELIMITER ;;
DROP PROCEDURE IF EXISTS min_max_prices;;
CREATE PROCEDURE min_max_prices()
	BEGIN
		SELECT pc.name, MAX(pr.price), MIN(pr.price) FROM productcategory AS pc
        
        INNER JOIN product AS pr
        ON pr.category_id = pc.id
	
		GROUP BY pc.name;
    END;;
-- Procedure to get the top N users with most products purchased
-- Returns ID, Username and number of purchases