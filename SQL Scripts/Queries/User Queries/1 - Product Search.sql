DELIMITER ;;
DROP PROCEDURE IF EXISTS product_search;
CREATE PROCEDURE product_search()
	BEGIN
		SELECT product.id AS id, product.productname AS product_name, product.price AS price, product.category AS category 
		FROM product 
			INNER JOIN ad.parameter AS par_keyword ON par_keyword.name = "product_search_keyword"
            INNER JOIN ad.parameter AS par_category ON par_category.name = "category"
            INNER JOIN ad.parameter AS par_price ON par_price.name = "price"
		WHERE UPPER(product_name) LIKE UPPER(CONCAT('%',par_keyword.value,'%')) 
			AND CAST(category_id AS CHAR(32)) = par_category.value
			AND price <= CAST(par_price AS UNSIGNED);
	END;;
-- Procedure to search products based on a match between their name and a string stored on the parameters table.
-- Both strings are converted to uppercase so the search is case insensitive.
-- The parameter name is "product_search_keyword" and it has to be changed to the desired value before calling
-- the procedure.
-- Other parameters include category and maximum price, which are also stored on the parameters table
-- Returns the ID, name, price and category of the matching products respectively