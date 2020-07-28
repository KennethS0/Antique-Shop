DELIMITER ;;
-- Gets product categories
DROP PROCEDURE IF EXISTS Product_getCategories;
CREATE PROCEDURE Product_getCategories ()
BEGIN
	SELECT id, name FROM productcategory;
END;;

