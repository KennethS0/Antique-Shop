CREATE TABLE IF NOT EXISTS seen(
	seen_id INT AUTO_INCREMENT PRIMARY KEY,
	product_id INT NOT NULL,
    user_id INT NOT NULL,
    date_seen DATETIME NOT NULL, 
    
    INDEX (date_seen),
    
    CONSTRAINT seen_product_fk 
		FOREIGN KEY (product_id)
		REFERENCES product(id),
    
    CONSTRAINT seen_user_fk
		FOREIGN KEY (user_id)
        REFERENCES useraccount(id)

) ENGINE=INNODB
TABLESPACE=ge_data
COMMENT='Each product that the user is interested in will appear in this table,
as well as the time in which he saw the product.';