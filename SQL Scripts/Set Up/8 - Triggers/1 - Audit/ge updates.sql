DELIMITER ;;
CREATE TRIGGER administrator_update
	BEFORE update ON ge.administrator
    FOR EACH ROW
	BEGIN
		SET 
			NEW.modification_date = CURDATE(),
			NEW.modification_user = USER();
    END;;
    
CREATE TRIGGER areacode_update
	BEFORE update ON ge.areacode
    FOR EACH ROW
	BEGIN
		SET 
			NEW.modification_date = CURDATE(),
			NEW.modification_user = USER();
    END;;
    

CREATE TRIGGER canton_update
	BEFORE update ON ge.canton
    FOR EACH ROW
	BEGIN
		SET 
			NEW.modification_date = CURDATE(),
			NEW.modification_user = USER();
    END;;
    

CREATE TRIGGER cart_update
	BEFORE update ON ge.cart
    FOR EACH ROW
	BEGIN
		SET 
			NEW.modification_date = CURDATE(),
			NEW.modification_user = USER();
    END;;
    

CREATE TRIGGER community_update
	BEFORE update ON ge.community
    FOR EACH ROW
	BEGIN
		SET 
			NEW.modification_date = CURDATE(),
			NEW.modification_user = USER();
    END;;
    

CREATE TRIGGER country_update
	BEFORE update ON ge.country
    FOR EACH ROW
	BEGIN
		SET 
			NEW.modification_date = CURDATE(),
			NEW.modification_user = USER();
    END;;
    

CREATE TRIGGER district_update
	BEFORE update ON ge.district
    FOR EACH ROW
	BEGIN
		SET 
			NEW.modification_date = CURDATE(),
			NEW.modification_user = USER();
    END;;
    

CREATE TRIGGER gender_update
	BEFORE update ON ge.gender
    FOR EACH ROW
	BEGIN
		SET 
			NEW.modification_date = CURDATE(),
			NEW.modification_user = USER();
    END;;
    

CREATE TRIGGER message_update
	BEFORE update ON ge.message
    FOR EACH ROW
	BEGIN
		SET 
			NEW.modification_date = CURDATE(),
			NEW.modification_user = USER();
    END;;
    

CREATE TRIGGER nationality_update
	BEFORE update ON ge.nationality
    FOR EACH ROW
	BEGIN
		SET 
			NEW.modification_date = CURDATE(),
			NEW.modification_user = USER();
    END;;
    

CREATE TRIGGER numberxperson_update
	BEFORE update ON ge.numberxperson
    FOR EACH ROW
	BEGIN
		SET 
			NEW.modification_date = CURDATE(),
			NEW.modification_user = USER();
    END;;
    

CREATE TRIGGER person_update
	BEFORE update ON ge.person
    FOR EACH ROW
	BEGIN
		SET 
			NEW.modification_date = CURDATE(),
			NEW.modification_user = USER();
    END;;
    

CREATE TRIGGER phone_type_update
	BEFORE update ON ge.phone_type
    FOR EACH ROW
	BEGIN
		SET 
			NEW.modification_date = CURDATE(),
			NEW.modification_user = USER();
    END;;
    

CREATE TRIGGER phonenumber_update
	BEFORE update ON ge.phonenumber
    FOR EACH ROW
	BEGIN
		SET 
			NEW.modification_date = CURDATE(),
			NEW.modification_user = USER();
    END;;
    

CREATE TRIGGER picture_update
	BEFORE update ON ge.picture
    FOR EACH ROW
	BEGIN
		SET 
			NEW.modification_date = CURDATE(),
			NEW.modification_user = USER();
    END;;
    

CREATE TRIGGER product_update
	BEFORE update ON ge.product
    FOR EACH ROW
	BEGIN
		SET 
			NEW.modification_date = CURDATE(),
			NEW.modification_user = USER();
    END;;
    

CREATE TRIGGER productcategory_update
	BEFORE update ON ge.productcategory
    FOR EACH ROW
	BEGIN
		SET 
			NEW.modification_date = CURDATE(),
			NEW.modification_user = USER();
    END;;
    

CREATE TRIGGER province_update
	BEFORE update ON ge.province
    FOR EACH ROW
	BEGIN
		SET 
			NEW.modification_date = CURDATE(),
			NEW.modification_user = USER();
    END;;
    

CREATE TRIGGER review_update
	BEFORE update ON ge.review
    FOR EACH ROW
	BEGIN
		SET 
			NEW.modification_date = CURDATE(),
			NEW.modification_user = USER();
    END;;
    

CREATE TRIGGER seen_update
	BEFORE update ON ge.seen
    FOR EACH ROW
	BEGIN
		SET 
			NEW.modification_date = CURDATE(),
			NEW.modification_user = USER();
    END;;
    

CREATE TRIGGER shipment_update
	BEFORE update ON ge.shipment
    FOR EACH ROW
	BEGIN
		SET 
			NEW.modification_date = CURDATE(),
			NEW.modification_user = USER();
    END;;
    

CREATE TRIGGER useraccount_update
	BEFORE update ON ge.useraccount
    FOR EACH ROW
	BEGIN
		SET 
			NEW.modification_date = CURDATE(),
			NEW.modification_user = USER();
    END;;
    

CREATE TRIGGER wishlist_update
	BEFORE update ON ge.wishlist
    FOR EACH ROW
	BEGIN
		SET 
			NEW.modification_date = CURDATE(),
			NEW.modification_user = USER();
    END;;