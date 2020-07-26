DELIMITER ;;
DROP PROCEDURE IF EXISTS top_buyers;;
CREATE PROCEDURE top_buyers(IN top INT)
	BEGIN
		SELECT ge.product.buyer_id AS id, ge.useraccount.user_name AS username, COUNT(*) AS purchases
		FROM ge.product 
			INNER JOIN ge.useraccount AS acc ON ge.product.buyer_id = acc.id
        GROUP BY ge.product.buyer_id
        ORDER BY purchases
        LIMIT top;
	END;;
-- Procedure to get the top N users with most products purchased
-- Returns ID, Username and number of purchases