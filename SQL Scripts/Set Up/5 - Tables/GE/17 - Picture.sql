CREATE TABLE IF NOT EXISTS Picture(
	id INT AUTO_INCREMENT PRIMARY KEY,
    picture VARCHAR(64),
    
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