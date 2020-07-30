DELIMITER;;
CREATE TRIGGER picture_update
	BEFORE update ON ge.picture
    FOR EACH ROW
	BEGIN
		SET 
			NEW.modification_date = CURDATE(),
			NEW.modification_user = USER();
    END;;