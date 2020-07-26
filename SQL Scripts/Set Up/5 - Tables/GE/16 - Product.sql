CREATE TABLE IF NOT EXISTS Product(
	id INT AUTO_INCREMENT PRIMARY KEY,
    
    -- Category foreign key set up 
    category_id INT NOT NULL,
    INDEX category_id_ind (category_id),
    FOREIGN KEY(category_id)
		REFERENCES productcategory(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
        
    -- Shipment foreign key set up 
    shipment_id INT NOT NULL,
    INDEX shipment_id_ind (shipment_id),
    FOREIGN KEY(shipment_id)
		REFERENCES shipment(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    
    -- Review foreign key set up 
    buyerReview_id INT,
    INDEX buyerReview_id_ind (buyerReview_id),
    FOREIGN KEY(buyerReview_id)
		REFERENCES review(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    
    sellerReview_id INT,
    INDEX sellerReview_id_ind (sellerReview_id),
    FOREIGN KEY(sellerReview_id)
		REFERENCES review(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    
    -- Buyer foreign key set up 
    buyer_id INT,
    INDEX buyer_id_ind (buyer_id),
    FOREIGN KEY(buyer_id)
		REFERENCES useraccount(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    
    -- Seller foreign key set up 
    seller_id INT NOT NULL,
    INDEX seller_id_ind (seller_id),
    FOREIGN KEY(seller_id)
		REFERENCES useraccount(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    
    productname VARCHAR(100) NOT NULL,
    INDEX productname_ind (productname),
    state VARCHAR(32) NOT NULL CHECK (state in ('sold', 'available')),	#	Creates constraint that allows only 2 possible states
    INDEX state_ind (state),
    date_published DATE NOT NULL,
    INDEX date_published_ind (date_published),
    date_bought DATE, 
    INDEX date_bought_ind (date_bought),
    price FLOAT NOT NULL,
    INDEX price_ind (price),
    description TEXT NOT NULL
        
) ENGINE=INNODB
TABLESPACE=ge_data
COMMENT='Table where all the products are stored';