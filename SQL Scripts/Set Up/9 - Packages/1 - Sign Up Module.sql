DELIMITER ;;
-- Procedure used to insert new people into the database.
DROP PROCEDURE IF EXISTS SignUp_Person;
CREATE PROCEDURE SignUp_Person(IN pCitizenshipId BIGINT,
							  IN pFirst_name VARCHAR(20),
                              IN pMiddle_name VARCHAR(20),
                              IN pLast_name VARCHAR(20),
                              IN pSecond_last_name VARCHAR(20),
                              IN email VARCHAR(50),
                              IN birth_date DATE,
                              IN gender_id INT,
                              IN nationality_id INT,
                              IN community_id INT)
                              
	BEGIN
		-- Duplicate data handler
		DECLARE duplicate_data CONDITION FOR SQLSTATE '45000';
        DECLARE EXIT HANDLER FOR 1062
        BEGIN
			SIGNAL SQLSTATE VALUE '45000'
            SET MESSAGE_TEXT = 'Do not insert duplicate ID\'s, or try another E-Mail.';
        END;
        
        -- Data Insertion
        INSERT INTO person (citizenship_id,
							first_name,
                            middle_name,
                            last_name,
                            second_last_name,
                            email,
                            birth_date,
                            gender_id,
                            nationality_id,
                            community_id)
		VALUES
			(pCitizenshipId,
			 pFirst_name,
             pMiddle_name,
             pLast_name,
             pSecond_last_name,
             email,
             birth_date,
             gender_id,
             nationality_id,
             community_id);
   END;;

-- Procedure used to insert new users into table
-- useraccount
DROP PROCEDURE IF EXISTS SignUp_Account;
CREATE PROCEDURE SignUp_Account (IN pPerson_id BIGINT, 
							 IN pUser_name VARCHAR(20), 
                             IN pPassword VARCHAR(200))
	BEGIN
		-- Duplicate data handler
		DECLARE duplicate_data CONDITION FOR SQLSTATE '45001';
        DECLARE EXIT HANDLER FOR 1062
        BEGIN
			SIGNAL SQLSTATE VALUE '45000'
            SET MESSAGE_TEXT = 'Username already taken';
        END;
        
		-- DATA INSERTION
        INSERT INTO useraccount(person_id, user_name, password)
		VALUES
			(pPerson_id, pUser_name, MD5(pPassword));
   END;;