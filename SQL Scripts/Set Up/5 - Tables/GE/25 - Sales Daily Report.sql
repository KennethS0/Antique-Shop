CREATE TABLE IF NOT EXISTS daily_top_sales(
	id INT AUTO_INCREMENT PRIMARY KEY,
    
    report_date DATE,
    
    -- Sales foreign key set up 
    product1_id INT,
    FOREIGN KEY(product1_id)
		REFERENCES product(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    product2_id INT,
    FOREIGN KEY(product2_id)
		REFERENCES product(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    product3_id INT,
    FOREIGN KEY(product3_id)
		REFERENCES product(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    product4_id INT,
    FOREIGN KEY(product4_id)
		REFERENCES product(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    product5_id INT,
    FOREIGN KEY(product5_id)
		REFERENCES product(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    product6_id INT,
    FOREIGN KEY(product6_id)
		REFERENCES product(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    product7_id INT,
    FOREIGN KEY(product7_id)
		REFERENCES product(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    product8_id INT,
    FOREIGN KEY(product8_id)
		REFERENCES product(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    product9_id INT,
    FOREIGN KEY(product9_id)
		REFERENCES product(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    product10_id INT,
    FOREIGN KEY(product10_id)
		REFERENCES product(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
)ENGINE=INNODB
TABLESPACE=ge_data
COMMENT='Table that stores daily reports about the 10 most expensive sales';