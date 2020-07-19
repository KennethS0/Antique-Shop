CREATE TABLE IF NOT EXISTS person(
    citizenship_id BIGINT PRIMARY KEY,
    
    first_name VARCHAR(20) NOT NULL,
    middle_name VARCHAR(20),
    last_name VARCHAR(20) NOT NULL,
    second_last_name varchar(20),
    email VARCHAR(50) NOT NULL,
    photo BLOB,
    birth_date DATE NOT NULL,
    
    -- Nationality id foreign key set up
    nationality_id INT NOT NULL,
	FOREIGN KEY (nationality_id) 
		REFERENCES nationality(id)
		ON UPDATE CASCADE
        ON DELETE CASCADE,
        INDEX nationality_id_ind (nationality_id),
        
    -- Community id foreign key set up
    community_id INT NOT NULL,
	FOREIGN KEY (community_id) 
		REFERENCES community(id)
		ON UPDATE CASCADE
        ON DELETE CASCADE,
        INDEX community_id_ind (community_id)
) ENGINE=INNODB
TABLESPACE=ge_data
COMMENT = 'Table used to store all the data corresponding to a specific person in the system';