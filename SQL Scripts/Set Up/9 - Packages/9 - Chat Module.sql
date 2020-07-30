-- Obtains all the users who the user has chatted with
DELIMITER ;;
DROP PROCEDURE IF EXISTS Chat_GetUsers;
CREATE PROCEDURE Chat_GetUsers(pUserId INT)
BEGIN
	SELECT ua.user_name FROM message AS m
		
    INNER JOIN useraccount AS ua
    ON m.reciever_id = ua.id


END;;