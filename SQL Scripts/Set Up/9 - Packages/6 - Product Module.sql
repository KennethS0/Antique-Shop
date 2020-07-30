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

-- Adds a product to the cart of the specified user
DELIMITER ;;
DROP PROCEDURE IF EXISTS Product_addToCart;
CREATE PROCEDURE Product_addToCart (pProductID INT, pUserID INT)
BEGIN
	INSERT INTO cart (product_id, user_id) VALUES (pProductID, pUserID);
END;;

-- Adds a product to the wishlist of the specified user
DELIMITER ;;
DROP PROCEDURE IF EXISTS Product_addToWishlist;
CREATE PROCEDURE Product_addToWishlist (pProductID INT, pUserID INT)
BEGIN
	INSERT INTO wishlist (product_id, user_id) VALUES (pProductID, pUserID);
END;;

DELIMITER ;;
-- Gets the products in the wishlist of a specific user
DROP PROCEDURE IF EXISTS Product_getCart;
CREATE PROCEDURE Product_getCart (IN pUserID INT)
BEGIN
	SELECT product.id AS id, product.productname AS product_name, product.price AS price, cat.name AS category
	FROM product
		INNER JOIN productcategory AS cat ON category_id = cat.id
		INNER JOIN cart AS ct ON product.id = ct.product_id
    WHERE ct.user_id = pUserID;	
END;;

DELIMITER ;;
-- Gets the products in the wishlist of a specific user
DROP PROCEDURE IF EXISTS Product_getWishlist;
CREATE PROCEDURE Product_getWishlist (IN pUserID INT)
BEGIN
	SELECT product.id AS id, product.productname AS product_name, product.price AS price, cat.name AS category
	FROM product
		INNER JOIN productcategory AS cat ON category_id = cat.id
		INNER JOIN wishlist AS wl ON product.id = wl.product_id
    WHERE wl.user_id = pUserID;	
END;;

DELIMITER ;;
-- Removes a product from a cart
DROP PROCEDURE IF EXISTS Product_removeCart;
CREATE PROCEDURE Product_removeCart (pProductID INT, pUserID INT)
BEGIN
	DELETE FROM cart WHERE product_id = pProductID AND user_id = pUserID;
END;;

/*
DELIMITER ;;
-- Purchases a product for a user
DROP PROCEDURE IF EXISTS Product_purchase;
CREATE PROCEDURE Product_purchase (pProductID INT, pUserID INT)
BEGIN
	DELETE FROM cart WHERE product_id = pProductID AND user_id = pUserID;
END;;
*/

-- Adds a product to the products seen by a user
DELIMITER ;;
DROP PROCEDURE IF EXISTS Product_addSeen;
CREATE PROCEDURE Product_addSeen (pProductID INT, pUserID INT)
BEGIN
	INSERT INTO seen (product_id, user_id, date_seen) VALUES (pProductID, pUserID, SYSDATE());
END;;