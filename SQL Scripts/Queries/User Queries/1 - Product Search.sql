DELIMITER ;;
CREATE PROCEDURE product_search (IN user_id INT)
	BEGIN
		SELECT product.id 
		FROM product INNER JOIN ad.parameter as par ON par.name = "product_search_keyword"
		WHERE productname LIKE CONCAT('%',par.value,'%')
			AND product.buyer_id = user_id;
	END;;