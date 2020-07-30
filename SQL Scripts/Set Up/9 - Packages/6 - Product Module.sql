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

-- Get information about a product based on ID
DELIMITER ;;
DROP PROCEDURE IF EXISTS Product_getProduct;
CREATE PROCEDURE Product_getProduct (pID INT)
BEGIN
	SELECT product.id, productname, ship.name, acc.user_name, price, pic.picture, description
    FROM product
		INNER JOIN useraccount AS acc ON seller_id = acc.id
        INNER JOIN picture AS pic ON  product.id = pic.product_id
        INNER JOIN shipment AS ship ON product.shipment_id = ship.id
	WHERE product.id = pID;
END;;