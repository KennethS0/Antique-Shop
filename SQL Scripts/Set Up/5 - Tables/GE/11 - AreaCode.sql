CREATE TABLE IF NOT EXISTS areacode(
    id INT AUTO_INCREMENT PRIMARY KEY,
    
    areacode SMALLINT NOT NULL,
    
    -- Country id foreign key set up
    country_id INT NOT NULL,
	FOREIGN KEY (country_id) 
		REFERENCES country(id)
		ON UPDATE CASCADE
        ON DELETE CASCADE,
        INDEX county_id_ind (country_id)
        
) ENGINE=INNODB
TABLESPACE=ge_data
COMMENT = 'Table used to store information regarding an area code of a phone number.';