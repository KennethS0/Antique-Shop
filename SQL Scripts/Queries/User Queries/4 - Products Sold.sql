DELIMITER ;;
DROP PROCEDURE IF EXISTS sale_history;;
CREATE PROCEDURE sale_history(IN user_id INT)
	BEGIN
		SELECT product.id AS Product_Id, product.productname AS Product, acc.user_name AS Buyer, product.price AS Price, product.date_bought AS Date_Bought
		FROM product 
			INNER JOIN useraccount AS acc 
			ON product.buyer_id = acc.id
            
            INNER JOIN person AS per 
            ON acc.person_id = per.citizenship_id
		
        WHERE product.seller_id = user_id;
	END;;
    
-- Procedure used to get all the sales made by one user.
-- The INPUT parameter is the id of the user for whom the history is being shown.
-- Outputs the product ID, name of the product, the buyer username, 
-- -- product price, the sale date. 