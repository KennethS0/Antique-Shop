DELIMITER ;;
DROP PROCEDURE IF EXISTS set_categoryParam;; -- Set Category parameter
CREATE PROCEDURE set_categoryParam (IN pValue VARCHAR(64))
	BEGIN
		DECLARE param_id INT;
        SELECT id FROM ad.parameter WHERE ad.parameter.name = 'category' INTO param_id;
		UPDATE ad.parameter SET value = pValue WHERE ad.parameter.id = param_id;
	END;;

DELIMITER ;;
DROP PROCEDURE IF EXISTS set_priceParam;; -- Set price parameter
CREATE PROCEDURE set_priceParam (IN pValue VARCHAR(64))
	BEGIN
		DECLARE param_id INT;
        DECLARE price VARCHAR(32);
        SELECT id FROM ad.parameter WHERE ad.parameter.name = 'price' INTO param_id;
        IF pValue = 'ANY' THEN SET price = '999999999'; ELSE SET price = pValue; END IF;
		UPDATE ad.parameter SET value = price WHERE ad.parameter.id = param_id;
	END;;
    
DELIMITER ;;
DROP PROCEDURE IF EXISTS set_keywordParam;; -- Set price parameter
CREATE PROCEDURE set_keywordParam (IN pValue VARCHAR(64))
	BEGIN
		DECLARE param_id INT;
        SELECT id FROM ad.parameter WHERE ad.parameter.name = 'product_search_keyword' INTO param_id;
		UPDATE ad.parameter SET value = pValue WHERE ad.parameter.id = param_id;
	END;;