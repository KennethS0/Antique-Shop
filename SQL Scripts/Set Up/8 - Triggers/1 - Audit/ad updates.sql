DELIMITER ;;
CREATE TRIGGER parameter_update
	BEFORE UPDATE ON ad.parameter
    FOR EACH ROW
	BEGIN
		SET 
			NEW.modification_date = CURDATE(),
			NEW.modification_user = USER();
	END;;