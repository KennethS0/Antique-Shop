DELIMITER ;;
DROP PROCEDURE IF EXISTS profit_by_gender;;
CREATE PROCEDURE profit_by_gender()
	BEGIN
		SELECT gen.name AS gender, SUM(price) AS total_value
        FROM product 
			INNER JOIN useraccount AS acc ON product.seller_id = acc.id
            INNER JOIN person AS per ON acc.person_id = per.citizenship_id
            INNER JOIN gender AS gen ON per.gender_id = gen.id
		WHERE product.state = 'sold'
        GROUP BY gen.name;
	END;;
    
-- Procedure used for statistical analysis. Returns total price of sales per gender