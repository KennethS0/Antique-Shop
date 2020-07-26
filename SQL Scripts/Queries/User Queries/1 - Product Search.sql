DELIMITER ;;
DROP PROCEDURE IF EXISTS product_search;
CREATE PROCEDURE product_search()
	BEGIN
		SELECT product.id AS id, product.productname AS product_name, product.price AS price, product.category AS category 
		FROM product INNER JOIN ad.parameter as par ON par.name = "product_search_keyword"
		WHERE UPPER(product_name) LIKE UPPER(CONCAT('%',par.value,'%'));
	END;;
-- Procedure to search products based on a match between their name and a string stored on the parameters table.
-- Both strings are converted to uppercase so the search is case insensitive.
-- The parameter name is "product_search_keyword" and it has to be changed to the desired value before calling
-- the procedure.
-- Returns the ID, name, price and category of the matching products respectively