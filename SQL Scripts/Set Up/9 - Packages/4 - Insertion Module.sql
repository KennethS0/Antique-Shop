DELIMITER ;;
-- Adds a product to the cart of a user.
DROP PROCEDURE IF EXISTS Insertion_AddToCart;
CREATE PROCEDURE Insertion_AddToCart (pUserId INT, pProductId INT)
BEGIN
	INSERT INTO cart (user_id, product_id)
    VALUES
		(pUserId, pProductId);
END;;

DELIMITER ;;
-- Adds a product to the store
DROP PROCEDURE IF EXISTS Insertion_SellProduct;
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
                         state,
                         date_published,
                         price,
                         description)
	VALUES
		(pCategoryId,
         pShipmentId,
         pSellerId,
         pProductname,
         'available',
         pDatePublished,
         pPrice,
         pDescription);
END;;

DELIMITER ;;
-- Lets a user leave a review of how the interaction was with
-- the other user during the transaction.
DROP PROCEDURE IF EXISTS Insertion_LeaveReview;
CREATE PROCEDURE Insertion_LeaveReview (pDescription TEXT,
										pNumStars FLOAT,
										pUser_Reviewed_id INT)
BEGIN
	INSERT INTO review (description,
						num_starts,
                        user_reviewed_id)
	VALUES
		(pDescription,
         pNumStars,
         pUse_Reviewed_id);
END;;