DELIMITER ;;
-- Adds a product to the cart of a user.
CREATE PROCEDURE Insertion_AddToCart (pUserId INT, pProductId INT)
BEGIN
	INSERT INTO cart (user_id, product_id)
    VALUES
		(pUserId, pProductId);
END;;

DELIMITER ;;
-- Adds a product to the cart of a user.
CREATE PROCEDURE Insertion_SellProduct (pCategoryId INT,
										pShipmentId INT,
                                        pSellerId INT,
                                        pProductname VARCHAR(100),
										pDatePublished DATE,
                                        pPrice FLOAT,
                                        pDescription TEXT)
BEGIN
	INSERT INTO product (category_id,
						 shipment_id,
                         seller_id,
                         productname,
                         date_published,
                         price,
                         description)
	VALUES
		(pCatergoryId,
         pShipmentId,
         pSellerId,
         pProductname,
         pDatePublished,
         pPrice,
         pDescription);
END;;