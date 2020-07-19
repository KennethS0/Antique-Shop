CREATE TABLE IF NOT EXISTS cart(
	product_id INT NOT NULL,
    user_id INT NOT NULL,
    
    CONSTRAINT cart_product_fk 
		FOREIGN KEY (product_id)
		REFERENCES product(id),
    
    CONSTRAINT cart_user_fk
		FOREIGN KEY (user_id)
        REFERENCES useraccount(id),
        
	CONSTRAINT cart_pk
		PRIMARY KEY (product_id, user_id)
    
    
) ENGINE=INNODB
TABLESPACE=ge_data
COMMENT='Different accounts are able to add different items to their
cart, which is represented by this table.';