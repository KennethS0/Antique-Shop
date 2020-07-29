-- Obtains all the phone types available
DELIMITER ;;
DROP PROCEDURE IF EXISTS getPhoneTypes;; 
CREATE PROCEDURE getPhoneTypes ()
	BEGIN
		SELECT id, name FROM phone_type;
	END;;
    
-- Obtains the phone and its according type
DELIMITER ;;
DROP PROCEDURE IF EXISTS checkUniqueMobile;;
CREATE PROCEDURE checkUniqueMobile (pAreaCodeId INT, pNumber INT)
BEGIN
    SELECT id FROM phonenumber
        WHERE number = pNumber AND areacode_id = pAreaCodeId;
END;; 

-- Obtains the persons gender
DELIMITER ;; 
DROP PROCEDURE IF EXISTS getGenders;;
CREATE PROCEDURE getGenders ()
	SELECT id, name FROM gender
END;;

-- Obtains the gender Id
DELIMITER ;; 
DROP PROCEDURE IF EXISTS getGenderId;
CREATE PROCEDURE getGenderId (pName VARCHAR(20))
BEGIN
	SELECT id FROM gender
    WHERE name = pName;
END;; 

-- Obtains the id of a specific nationality
DELIMITER ;;
DROP PROCEDURE IF EXISTS getNationalityId;
CREATE PROCEDURE getNationalityId (pName VARCHAR(100))
BEGIN
	SELECT id FROM nationality
    WHERE name = pName;
END;

-- Obtains the id of a specific phone type
DELIMITER ;; 
DROP PROCEDURE IF EXISTS getPhoneTypeId;
CREATE PROCEDURE getPhoneTypeId (pName VARCHAR(100))
BEGIN
	SELECT id FROM phone_type
    WHERE name = pName;
END;