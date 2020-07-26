DELIMITER ;;
DROP PROCEDURE IF EXISTS top_rated_buyers;;
CREATE PROCEDURE top_rated_buyers()
	BEGIN
		SELECT ge.product.buyer_id AS id, ge.acc.user_name AS username, AVG(ge.re.num_stars) AS rating
		FROM ge.product 
			INNER JOIN ge.useraccount AS acc ON ge.product.buyer_id = acc.id
            INNER JOIN ge.review as re ON ge.product.buyerReview_id = re.id
        GROUP BY ge.product.buyer_id
        ORDER BY rating;
	END;;
-- Procedure that returns best rated buyers
-- Returns ID, Username and seller rating