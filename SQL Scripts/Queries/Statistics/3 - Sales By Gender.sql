DELIMITER ;;
DROP PROCEDURE IF EXISTS sales_by_gender;;
CREATE PROCEDURE sales_by_gender()
	BEGIN
		SELECT gen.name AS gender, COUNT(*) AS sales
        FROM product 
			INNER JOIN useraccount AS acc ON product.seller_id = acc.id
            INNER JOIN person AS per ON acc.person_id = per.citizenship_id
            INNER JOIN gender AS gen ON per.gender_id = gen.id
		WHERE product.state = 'sold'
        GROUP BY gen.name;
	END;;
    
-- Procedure used for statistical analysis. Returns total amout of sales per gender