-- Obtains all the phone types available
DELIMITER ;;
DROP PROCEDURE IF EXISTS getPhoneTypes;; 
CREATE PROCEDURE getPhoneTypes ()
	BEGIN
		SELECT id, name FROM phone_type;
	END;;
    
-- Obtains the phone and its according type
DELIMITER ;;
DROP PROCEDURE IF EXISTS getPhoneAndType;;
CREATE PROCEDURE getPhoneAndType (areaCode INT, pNumber INT, pTypeId INT)
	
    SELECT phone.number, pt.name FROM phonenumber phone
		WHERE phone.number = pNumber;

END;; 

-- Obtains the persons gender
DELIMITER ;; 
DROP PROCEDURE IF EXISTS getGenders;;
CREATE PROCEDURE getGenders ()
	SELECT id, name FROM gender
END;; 