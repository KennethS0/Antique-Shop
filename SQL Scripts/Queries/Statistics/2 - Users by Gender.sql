DELIMITER ;;
DROP PROCEDURE IF EXISTS sellers_by_gender;;
CREATE PROCEDURE sellers_by_gender()
	BEGIN
		SELECT g.name AS name, COUNT(DISTINCT pr.seller_id),
         (COUNT(DISTINCT pr.seller_id) * 100 / (SELECT COUNT(DISTINCT seller_id) FROM product)) AS percentage
         FROM gender AS g
        
        INNER JOIN person AS p
        ON p.gender_id = g.id
        
        INNER JOIN useraccount AS ua
        ON p.citizenship_id = ua.person_id
        
        INNER JOIN product AS pr
        ON seller_id = ua.id
        
        GROUP BY name, pr.seller_id;
	END;;
    
-- Procedure used for statistical analysis. Returns total persons by gender
call sellers_by_gender();