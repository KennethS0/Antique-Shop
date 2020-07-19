CREATE TABLE IF NOT EXISTS nationality(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
) ENGINE=INNODB
TABLESPACE=ge_data
COMMENT='Catalogue table that defines the different nationalities';