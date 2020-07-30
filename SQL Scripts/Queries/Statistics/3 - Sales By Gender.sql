DELIMITER ;;
DROP PROCEDURE IF EXISTS sales_by_gender;;
CREATE PROCEDURE sales_by_gender()
	BEGIN
		SELECT ge.name AS Name, COUNT(pr.id) AS Amount,
        (COUNT(*) * 100 / (SELECT COUNT(*) FROM product)) AS percentage 
        FROM gender AS ge
        
        INNER JOIN person AS P
        ON ge.id = p.gender_id
        
        INNER JOIN useraccount AS ua
        ON p.citizenship_id = ua.person_id
        
        INNER JOIN product as pr
        ON pr.buyer_id = ua.id
        
        GROUP BY Name, pr.id;
	END;;
    
-- Procedure used for statistical analysis. Returns total amout of sales per gender

call sales_by_gender();