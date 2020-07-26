DELIMITER ;;
CREATE TRIGGER administrator_insert
	BEFORE INSERT ON ge.administrator
    FOR EACH ROW
	BEGIN
		SET 
			NEW.creation_date = CURDATE(),
			NEW.creation_user = USER();
    END;;
    
CREATE TRIGGER areacode_insert
	BEFORE INSERT ON ge.areacode
    FOR EACH ROW
	BEGIN
		SET 
			NEW.creation_date = CURDATE(),
			NEW.creation_user = USER();
    END;;
    

CREATE TRIGGER canton_insert
	BEFORE INSERT ON ge.canton
    FOR EACH ROW
	BEGIN
		SET 
			NEW.creation_date = CURDATE(),
			NEW.creation_user = USER();
    END;;
    

CREATE TRIGGER cart_insert
	BEFORE INSERT ON ge.cart
    FOR EACH ROW
	BEGIN
		SET 
			NEW.creation_date = CURDATE(),
			NEW.creation_user = USER();
    END;;
    

CREATE TRIGGER community_insert
	BEFORE INSERT ON ge.community
    FOR EACH ROW
	BEGIN
		SET 
			NEW.creation_date = CURDATE(),
			NEW.creation_user = USER();
    END;;
    

CREATE TRIGGER country_insert
	BEFORE INSERT ON ge.country
    FOR EACH ROW
	BEGIN
		SET 
			NEW.creation_date = CURDATE(),
			NEW.creation_user = USER();
    END;;
    

CREATE TRIGGER district_insert
	BEFORE INSERT ON ge.district
    FOR EACH ROW
	BEGIN
		SET 
			NEW.creation_date = CURDATE(),
			NEW.creation_user = USER();
    END;;
    

CREATE TRIGGER gender_insert
	BEFORE INSERT ON ge.gender
    FOR EACH ROW
	BEGIN
		SET 
			NEW.creation_date = CURDATE(),
			NEW.creation_user = USER();
    END;;
    

CREATE TRIGGER message_insert
	BEFORE INSERT ON ge.message
    FOR EACH ROW
	BEGIN
		SET 
			NEW.creation_date = CURDATE(),
			NEW.creation_user = USER();
    END;;
    

CREATE TRIGGER nationality_insert
	BEFORE INSERT ON ge.nationality
    FOR EACH ROW
	BEGIN
		SET 
			NEW.creation_date = CURDATE(),
			NEW.creation_user = USER();
    END;;
    

CREATE TRIGGER numberxperson_insert
	BEFORE INSERT ON ge.numberxperson
    FOR EACH ROW
	BEGIN
		SET 
			NEW.creation_date = CURDATE(),
			NEW.creation_user = USER();
    END;;
    

CREATE TRIGGER person_insert
	BEFORE INSERT ON ge.person
    FOR EACH ROW
	BEGIN
		SET 
			NEW.creation_date = CURDATE(),
			NEW.creation_user = USER();
    END;;
    

CREATE TRIGGER phone_type_insert
	BEFORE INSERT ON ge.phone_type
    FOR EACH ROW
	BEGIN
		SET 
			NEW.creation_date = CURDATE(),
			NEW.creation_user = USER();
    END;;
    

CREATE TRIGGER phonenumber_insert
	BEFORE INSERT ON ge.phonenumber
    FOR EACH ROW
	BEGIN
		SET 
			NEW.creation_date = CURDATE(),
			NEW.creation_user = USER();
    END;;
    

CREATE TRIGGER picture_insert
	BEFORE INSERT ON ge.picture
    FOR EACH ROW
	BEGIN
		SET 
			NEW.creation_date = CURDATE(),
			NEW.creation_user = USER();
    END;;
    

CREATE TRIGGER product_insert
	BEFORE INSERT ON ge.product
    FOR EACH ROW
	BEGIN
		SET 
			NEW.creation_date = CURDATE(),
			NEW.creation_user = USER();
    END;;
    

CREATE TRIGGER productcategory_insert
	BEFORE INSERT ON ge.productcategory
    FOR EACH ROW
	BEGIN
		SET 
			NEW.creation_date = CURDATE(),
			NEW.creation_user = USER();
    END;;
    

CREATE TRIGGER province_insert
	BEFORE INSERT ON ge.province
    FOR EACH ROW
	BEGIN
		SET 
			NEW.creation_date = CURDATE(),
			NEW.creation_user = USER();
    END;;
    

CREATE TRIGGER review_insert
	BEFORE INSERT ON ge.review
    FOR EACH ROW
	BEGIN
		SET 
			NEW.creation_date = CURDATE(),
			NEW.creation_user = USER();
    END;;
    

CREATE TRIGGER seen_insert
	BEFORE INSERT ON ge.seen
    FOR EACH ROW
	BEGIN
		SET 
			NEW.creation_date = CURDATE(),
			NEW.creation_user = USER();
    END;;
    

CREATE TRIGGER shipment_insert
	BEFORE INSERT ON ge.shipment
    FOR EACH ROW
	BEGIN
		SET 
			NEW.creation_date = CURDATE(),
			NEW.creation_user = USER();
    END;;
    

CREATE TRIGGER useraccount_insert
	BEFORE INSERT ON ge.useraccount
    FOR EACH ROW
	BEGIN
		SET 
			NEW.creation_date = CURDATE(),
			NEW.creation_user = USER();
    END;;
    

CREATE TRIGGER wishlist_insert
	BEFORE INSERT ON ge.wishlist
    FOR EACH ROW
	BEGIN
		SET 
			NEW.creation_date = CURDATE(),
			NEW.creation_user = USER();
    END;;