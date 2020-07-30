DELIMITER ;;
DROP PROCEDURE IF EXISTS top_buyers;;
CREATE PROCEDURE top_buyers()
BEGIN
	DECLARE parameter INT;
    
    SELECT value INTO parameter FROM ad.parameter WHERE name = 'BEST_BUYERS';

	SELECT ge.product.buyer_id AS id, ge.acc.user_name AS username, COUNT(*) AS purchases
	FROM ge.product 
		
	INNER JOIN ge.useraccount AS acc ON ge.product.buyer_id = acc.id
        
	WHERE ge.product.buyer_id IS NOT NULL
        
	GROUP BY ge.product.buyer_id
	ORDER BY purchases
	LIMIT parameter;

END;;
-- Procedure to get the top N users with most products purchased
-- Returns ID, Username and number of purchases

call top_buyers;