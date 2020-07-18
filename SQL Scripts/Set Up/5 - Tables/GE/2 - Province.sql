CREATE TABLE IF NOT EXISTS province(
	id INT AUTO_INCREMENT PRIMARY KEY,
    
    -- Country foreign key set up 
    country_id INT NOT NULL,
    INDEX country_id_ind (country_id),
    FOREIGN KEY(country_id)
		REFERENCES country(id),
    
    name VARCHAR(100) NOT NULL
    
) ENGINE=INNODB
TABLESPACE=ge_data
COMMENT='Table used to represent provinces/states of
a specific country.';