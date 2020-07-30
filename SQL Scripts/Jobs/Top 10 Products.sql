DELIMITER ;;
CREATE EVENT IF NOT EXISTS generate_reports ON SCHEDULE EVERY 24 DAY_HOUR
COMMENT 'Event that generates reports every day'
DO
    INSERT INTO daily_top_sales(report_date, product1_id, product2_id, product3_id, product4_id, 
		product5_id, product6_id, product7_id, product8_id, product9_id, product10_id) 
    SELECT id FROM product ORDER BY price LIMIT 10;