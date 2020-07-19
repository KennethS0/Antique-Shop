CREATE TABLE IF NOT EXISTS Pictures(
	id INT AUTO_INCREMENT PRIMARY KEY,
    picture BLOB NOT NULL,
    
    -- Product foreign key set up 
    product_id INT NOT NULL,
    INDEX product_id_ind (product_id),
    FOREIGN KEY(product_id)
		REFERENCES product(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
        
) ENGINE = INNODB
Tablespace = ge_data
COMMENT='Table used to store pictures of the products';