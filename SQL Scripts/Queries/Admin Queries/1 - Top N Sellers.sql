DELIMITER ;;
DROP PROCEDURE IF EXISTS top_sellers;;
CREATE PROCEDURE top_sellers(IN top INT)
	BEGIN
		SELECT ge.product.seller_id AS id, ge.useraccount.user_name AS username, COUNT(*) AS sales
		FROM ge.product 
			INNER JOIN ge.useraccount AS acc ON ge.product.seller_id = acc.id
        GROUP BY ge.product.seller_id
        ORDER BY sales
        LIMIT top;
	END;;
-- Procedure to get the top N users with most products sold
-- Returns ID, Username and number of sales