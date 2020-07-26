DELIMITER ;;
DROP PROCEDURE IF EXISTS sale_history;;
CREATE PROCEDURE sale_history(IN user_id INT)
	BEGIN
		SELECT product.id AS id, product.productname AS product_name, useraccount.user_name AS username, country.name AS country, product.price AS price, product.date_bought AS sale_date
		FROM product 
			INNER JOIN useraccount AS acc ON product.buyer_id = acc.id
            INNER JOIN person AS per ON acc.person_id = per.citizenship_id
            INNER JOIN community AS com ON per.community_id = com.id
            INNER JOIN district AS dis ON com.district_id = dis.id
            INNER JOIN canton AS can ON dis.canton_id = can.id
            INNER JOIN province AS pro ON can.province_id = pro.id
            INNER JOIN country AS cnt ON pro.country_id = cnt.id
		WHERE product.seller_id = user_id;
	END;;
    
-- Procedure used to get all the sales made by one user.
-- The INPUT parameter is the id of the user for whom the history is being shown.
-- Outputs the product ID, name of the product, the buyer username, buyer's country, 
-- -- product price, the sale date. 