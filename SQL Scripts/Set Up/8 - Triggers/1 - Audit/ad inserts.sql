DELIMITER ;;
CREATE TRIGGER parameter_insert
	BEFORE INSERT ON ad.parameter 
    FOR EACH ROW
	BEGIN
		SET 
			NEW.creation_date = CURDATE(),
			NEW.creation_user = USER();
    END;;