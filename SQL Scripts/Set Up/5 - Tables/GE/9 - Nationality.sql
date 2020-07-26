CREATE TABLE IF NOT EXISTS nationality(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
) ENGINE=INNODB
TABLESPACE=ge_data
COMMENT='Catalogue table that defines the different nationalities';

alter table nationality add column country_id int after name;
alter table nationality add FOREIGN KEY (country_id) 
		REFERENCES country(id)
		ON UPDATE CASCADE
        ON DELETE CASCADE;