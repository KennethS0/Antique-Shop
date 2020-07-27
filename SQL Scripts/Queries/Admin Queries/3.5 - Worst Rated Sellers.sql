DELIMITER ;;
DROP PROCEDURE IF EXISTS worst_rated_sellers;;
CREATE PROCEDURE worst_rated_sellers()
	BEGIN
		SELECT ge.product.seller_id AS id, ge.acc.user_name AS username, AVG(ge.re.num_stars) AS rating
		FROM ge.product 
			INNER JOIN ge.useraccount AS acc ON ge.product.seller_id = acc.id
            INNER JOIN ge.review as re ON ge.product.sellerReview_id = re.id
        GROUP BY ge.product.seller_id
        ORDER BY rating DESC;
	END;;
-- Procedure that returns worst rated sellers
-- Returns ID, Username and seller rating