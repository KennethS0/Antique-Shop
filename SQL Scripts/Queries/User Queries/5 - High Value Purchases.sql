DELIMITER ;;
DROP PROCEDURE IF EXISTS expensive_purchases;;
CREATE PROCEDURE expensive_purchases(IN user_id INT)
	BEGIN
		SELECT product.id AS id, product.productname AS product_name, acc.user_name AS username, cnt.name AS country, product.price AS price, product.date_bought AS sale_date
		FROM product 
			INNER JOIN useraccount AS acc ON product.seller_id = acc.id
            INNER JOIN person AS per ON acc.person_id = per.citizenship_id
            INNER JOIN community AS com ON per.community_id = com.id
            INNER JOIN district AS dis ON com.district_id = dis.id
            INNER JOIN canton AS can ON dis.canton_id = can.id
            INNER JOIN province AS pro ON can.province_id = pro.id
            INNER JOIN country AS cnt ON pro.country_id = cnt.id
            INNER JOIN ad.parameter AS par ON par.name = "category"
		WHERE product.price >= 1000
			AND product.buyer_id = user_id
            AND product.category_id = par.value;
	END;;
    
-- Procedure used to get the purchass user, in which the product is of a certain category 
-- and of a price greater than 1000 USD
-- The category ID is stored on the Parameter with the name "category"
-- The INPUT parameter is the id of the user who bought the products
-- Outputs the product ID, name of the product, the seller username, seller's country, 
-- -- product price, the sale date. 