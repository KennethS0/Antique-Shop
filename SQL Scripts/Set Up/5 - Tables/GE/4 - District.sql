CREATE TABLE IF NOT EXISTS district(
	id INT AUTO_INCREMENT PRIMARY KEY,
    
    -- Canton foreign key set up 
    canton_id INT NOT NULL,
    INDEX canton_id_ind (canton_id),
    FOREIGN KEY(canton_id)
		REFERENCES canton(id),
    
    name VARCHAR(100) NOT NULL
    
) ENGINE=INNODB
TABLESPACE=ge_data
COMMENT='Table used to represent districts of
a specific canton.';