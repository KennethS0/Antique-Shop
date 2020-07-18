CREATE TABLE IF NOT EXISTS community(
	id INT AUTO_INCREMENT PRIMARY KEY,
    
    -- District foreign key set up 
    district_id INT NOT NULL,
    INDEX district_id_ind (district_id),
    FOREIGN KEY(district_id)
		REFERENCES district(id),
    
    name VARCHAR(100) NOT NULL
    
) ENGINE=INNODB
TABLESPACE=ge_data
COMMENT='Table used to represent communities of
a specific district.';