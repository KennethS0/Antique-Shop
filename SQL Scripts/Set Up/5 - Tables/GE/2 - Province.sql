CREATE TABLE IF NOT EXISTS province(
	id INT PRIMARY KEY,
    
    -- Country foreign key set up 
    country_id INT NOT NULL,
    INDEX country_id_ind (country_id),
    FOREIGN KEY(country_id)
		REFERENCES country(id)
            ON UPDATE CASCADE
			ON DELETE CASCADE,
            
    name VARCHAR(100) NOT NULL
    
) ENGINE=INNODB
TABLESPACE=ge_data
COMMENT='Table used to represent provinces/states of
a specific country.';