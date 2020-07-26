DELIMITER ;;
-- Procedure used to look for accounts in the system.
CREATE PROCEDURE LogIn_User (IN pUsername VARCHAR(20),
							 IN pPassword VARCHAR(200))
BEGIN
	SELECT id, user_name, password, person_id FROM useraccount
    WHERE user_name = pUsername AND password = MD5(pPassword);

END;;

call LogIn_User('KENNETHS0', 'Passwordxd')