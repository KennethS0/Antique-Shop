DELIMITER ;;
DROP PROCEDURE IF EXISTS users_by_age;;
CREATE PROCEDURE users_by_age()
	BEGIN
		SELECT 
		CASE 
			WHEN (DATE_FORMAT(NOW(), '%Y') - DATE_FORMAT(birth_date, '%Y') - (DATE_FORMAT(NOW(), '00-%m-%d') < DATE_FORMAT(birth_date, '00-%m-%d'))) <= 20 THEN '1-20'
			WHEN (DATE_FORMAT(NOW(), '%Y') - DATE_FORMAT(birth_date, '%Y') - (DATE_FORMAT(NOW(), '00-%m-%d') < DATE_FORMAT(birth_date, '00-%m-%d'))) <= 30 THEN '20-30'
			WHEN (DATE_FORMAT(NOW(), '%Y') - DATE_FORMAT(birth_date, '%Y') - (DATE_FORMAT(NOW(), '00-%m-%d') < DATE_FORMAT(birth_date, '00-%m-%d'))) <= 50 THEN '30-50'
			WHEN (DATE_FORMAT(NOW(), '%Y') - DATE_FORMAT(birth_date, '%Y') - (DATE_FORMAT(NOW(), '00-%m-%d') < DATE_FORMAT(birth_date, '00-%m-%d'))) <= 50 THEN '50+' 
		END 
		AS age,
		COUNT(*) total
		FROM person
		GROUP BY age;
	END;;

-- Procedure used to divide users between 4 age groups:
-- 1 - 20 years
-- 20 - 30 years
-- 30 - 50 years
-- 50+ years