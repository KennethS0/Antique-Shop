CREATE TABLE IF NOT EXISTS phonenumber(
    id INT AUTO_INCREMENT PRIMARY KEY,
    
    number INT NOT NULL,
    areacode SMALLINT NOT NULL,
    
    
    
    -- Type id foreign key set up
    type_id INT NOT NULL,
	FOREIGN KEY (type_id) 
		REFERENCES phone_type(id)
		ON UPDATE CASCADE
        ON DELETE CASCADE,
        INDEX type_id_ind (type_id)
        
) ENGINE=INNODB
TABLESPACE=ge_data
COMMENT = 'Table used to store information regarding a phone number)';