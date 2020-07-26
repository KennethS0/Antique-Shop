DELIMITER ;;
-- Procedure used to get all the data from a user.
DROP PROCEDURE IF EXISTS Admin_GetUserData;
CREATE PROCEDURE Admin_GetUserData(pUser VARCHAR(20))
BEGIN
	-- Data selection
	SELECT id, user_name, password FROM useraccount
    WHERE user_name = pUser;
END;;

DELIMITER ;;
-- Procedure used to make a user an admin based on their 
-- id
DROP PROCEDURE IF EXISTS Admin_MakeAdmin;
CREATE PROCEDURE Admin_MakeAdmin(pUserId INT)
BEGIN
	-- Duplicate data handler
		DECLARE duplicate_data CONDITION FOR SQLSTATE '45000';
        DECLARE EXIT HANDLER FOR 1062
        BEGIN
			SIGNAL SQLSTATE VALUE '45000'
            SET MESSAGE_TEXT = 'That user is already an admin.';
        END;

	-- Data Insertion
	INSERT INTO administrator (user_id)
		VALUES
			(pUserId);
            
	COMMIT;
END;;

DELIMITER ;;
-- Procedure used to remove admin power to a certain user.
DROP PROCEDURE IF EXISTS Admin_RevokeAdmin;
CREATE PROCEDURE Admin_RevokeAdmin(pUserId INT)
BEGIN
	DELETE FROM administrator WHERE
		user_id = pUserId;
        
	COMMIT;
END;;