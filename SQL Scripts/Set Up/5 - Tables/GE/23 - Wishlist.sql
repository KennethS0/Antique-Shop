CREATE TABLE IF NOT EXISTS wishlist(
	product_id INT NOT NULL,
    user_id INT NOT NULL,
    
    CONSTRAINT wishlist_product_fk 
		FOREIGN KEY (product_id)
		REFERENCES product(id),
    
    CONSTRAINT wishlist_user_fk
		FOREIGN KEY (user_id)
        REFERENCES useraccount(id),
        
	CONSTRAINT wishlist_pk
		PRIMARY KEY (product_id, user_id)
    
    
) ENGINE=INNODB
TABLESPACE=ge_data
COMMENT='Different accounts are able to add different items to their
wishlist, which is represented by this table.';