DELIMITER ;;
DROP PROCEDURE IF EXISTS top_sellers;;
CREATE PROCEDURE top_sellers()
BEGIN
	DECLARE parameter INT;
    
    SELECT value INTO parameter FROM ad.parameter WHERE name = 'BEST_SELLERS';

	SELECT ge.product.seller_id AS id, ge.acc.user_name AS username, COUNT(*) AS sales
	FROM ge.product 
		
	INNER JOIN ge.useraccount AS acc ON ge.product.seller_id = acc.id
        
	WHERE ge.product.buyer_id IS NOT NULL
        
	GROUP BY ge.product.seller_id
	ORDER BY sales
	LIMIT parameter;

END;;
-- Procedure to get the top N users with most products sold
-- Returns ID, Username and number of sales
