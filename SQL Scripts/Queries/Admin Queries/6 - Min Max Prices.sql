DELIMITER ;;
DROP PROCEDURE IF EXISTS min_max_prices;;
CREATE PROCEDURE min_max_prices()
	BEGIN
		SELECT ge.productcategory.name AS category, MAX(ge.product.price) AS maximum, MIN(ge.product.price) AS minimum
		FROM ge.product 
			INNER JOIN ge.productcategory AS cat ON ge.product.category_id = cat.id;
	END;;
-- Procedure to get the top N users with most products purchased
-- Returns ID, Username and number of purchases