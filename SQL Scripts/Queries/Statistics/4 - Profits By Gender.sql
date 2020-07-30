DELIMITER ;;
DROP PROCEDURE IF EXISTS profit_by_gender;;
CREATE PROCEDURE profit_by_gender()
	BEGIN
		DECLARE total_profits FLOAT;
    
		SELECT gen.name, SUM(pr.price) AS total,
        (SUM(pr.price) * 100/ (SELECT pr.price FROM product
			WHERE buyer_id IS NOT NULL)) AS percentage
        
        FROM gender AS gen
        
        
        
        INNER JOIN person AS p
        ON p.gender_id = gen.id
        
        INNER JOIN useraccount AS ua
        ON ua.person_id = p.citizenship_id
        
        INNER JOIN product AS pr
        ON pr.buyer_id = ua.id
        
        GROUP BY gen.name, pr.price;
	END;;
    
-- Procedure used for statistical analysis. Returns total price of sales per gender

call profit_by_gender();