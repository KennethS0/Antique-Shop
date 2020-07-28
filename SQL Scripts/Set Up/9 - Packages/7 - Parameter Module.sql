DELIMITER ;;
DROP PROCEDURE IF EXISTS set_categoryParam;; -- Set Category parameter
CREATE PROCEDURE set_categoryParam (IN pValue VARCHAR(64))
	BEGIN
		DECLARE param_id INT;
        SELECT id FROM ad.parameter WHERE ad.parameter.name = 'category' INTO param_id;
		UPDATE ad.parameter SET value = pValue WHERE ad.parameter.id = param_id;
	END;;
    
    