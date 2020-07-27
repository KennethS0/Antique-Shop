DELIMITER ;;
DROP PROCEDURE IF EXISTS users_by_gender;;
CREATE PROCEDURE users_by_gender()
	BEGIN
		SELECT gen.name AS gender, COUNT(gender_id) AS amount
		FROM person
		INNER JOIN gender AS gen ON person.gender_id = gen.id
		GROUP BY gender_id
		ORDER BY amount ASC;
	END;;
    
-- Procedure used for statistical analysis. Returns total persons by gender