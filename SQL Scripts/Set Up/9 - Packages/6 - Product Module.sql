DELIMITER ;;
-- Gets product categories
DROP PROCEDURE IF EXISTS Product_getCategories;
CREATE PROCEDURE Product_getCategories ()
BEGIN
	SELECT id, name FROM productcategory;
END;;

DELIMITER ;;
-- Gets products sold by a specific user
DROP PROCEDURE IF EXISTS Product_getMerchandise;
CREATE PROCEDURE Product_getMerchandise (IN pUserID INT)
BEGIN
	SELECT productname FROM product WHERE seller_id = pUserID;
END;;

DELIMITER ;;
-- Gets possible shipping methods
DROP PROCEDURE IF EXISTS Product_getShipments;
CREATE PROCEDURE Product_getShipments ()
BEGIN
	SELECT id, name FROM shipment;
END;;

