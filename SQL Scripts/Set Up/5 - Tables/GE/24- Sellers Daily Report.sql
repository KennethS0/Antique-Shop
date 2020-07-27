CREATE TABLE IF NOT EXISTS daily_top_sellers(
	id INT AUTO_INCREMENT PRIMARY KEY,
    
    report_date DATE,
    
    -- Sellers foreign key set up 
    seller1_id INT,
    FOREIGN KEY(seller1_id)
		REFERENCES useraccount(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    seller2_id INT,
    FOREIGN KEY(seller2_id)
		REFERENCES useraccount(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    seller3_id INT,
    FOREIGN KEY(seller3_id)
		REFERENCES useraccount(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    seller4_id INT,
    FOREIGN KEY(seller4_id)
		REFERENCES useraccount(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    seller5_id INT,
    FOREIGN KEY(seller5_id)
		REFERENCES useraccount(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
)ENGINE=INNODB
TABLESPACE=ge_data
COMMENT='Table that stores daily reports about the top rated sellers';