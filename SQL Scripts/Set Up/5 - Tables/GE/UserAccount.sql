CREATE TABLE IF NOT EXISTS useraccount(
    id INT AUTO_INCREMENT PRIMARY KEY,
    
    user_name VARCHAR(20) NOT NULL,
    password VARCHAR(20) NOT NULL,
    
    -- Person id foreign key set up
    person_id BIGINT NOT NULL,
	FOREIGN KEY (person_id) 
		REFERENCES person(citizenship_id)
		ON UPDATE CASCADE
        ON DELETE CASCADE,
        INDEX person_id_ind (person_id)
        
) ENGINE=INNODB
TABLESPACE=ge_data
COMMENT = 'Table used to store information regarding a specific user (username, password, id, and the
respective person)';