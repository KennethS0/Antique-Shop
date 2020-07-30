DELIMITER ;;
DROP PROCEDURE IF EXISTS product_search;
CREATE PROCEDURE product_search(pProductName VARCHAR(100),
								pCategoryName VARCHAR(100),
                                pPrice INT)
BEGIN
		IF pCategoryName IS NOT NULL THEN
			SELECT pr.id, pr.productname, pr.price, c.name FROM product AS pr
		
			INNER JOIN productcategory AS c
			ON pr.category_id = c.id
    
			WHERE UPPER(pr.productname) LIKE UPPER(CONCAT('%', pProductName, '%'))
				AND pr.price <= pPrice AND c.name = pCategoryName;
        ELSE
			SELECT pr.id, pr.productname, pr.price, c.name FROM product AS pr
		
			INNER JOIN productcategory AS c
			ON pr.category_id = c.id
    
			WHERE UPPER(pr.productname) LIKE UPPER(CONCAT('%', pProductName, '%'))
				AND pr.price <= pPrice AND state = 'available';
		END IF;
END;;
-- Procedure to search products based on a match between their name and a string stored on the parameters table.
-- Both strings are converted to uppercase so the search is case insensitive.
-- The parameter name is "product_search_keyword" and it has to be changed to the desired value before calling
-- the procedure.
-- Other parameters include category and maximum price, which are also stored on the parameters table
-- Returns the ID, name, price and category of the matching products respectively