CREATE TABLE IF NOT EXISTS canton(
	id INT PRIMARY KEY,
    
    -- Province foreign key set up 
    province_id INT NOT NULL,
    INDEX province_id_ind (province_id),
    FOREIGN KEY(province_id)
		REFERENCES province(id)
		ON UPDATE CASCADE
        ON DELETE CASCADE,
    
    name VARCHAR(100) NOT NULL
    
) ENGINE=INNODB
TABLESPACE=ge_data
COMMENT='Table used to represent cantons of
a specific province.';