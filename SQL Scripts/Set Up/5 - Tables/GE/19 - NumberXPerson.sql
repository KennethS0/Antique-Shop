CREATE TABLE IF NOT EXISTS numberxperson(
	number_id INT NOT NULL,
    person_id BIGINT NOT NULL,
    
    
    -- Person id foreign key set up
	FOREIGN KEY (person_id) 
		REFERENCES person(citizenship_id)
		ON UPDATE CASCADE
        ON DELETE CASCADE,
        INDEX person_id_ind (person_id),
        
    -- Number id foreign key set up
	FOREIGN KEY (number_id) 
		REFERENCES phonenumber(id)
		ON UPDATE CASCADE
        ON DELETE CASCADE,
        INDEX number_id_ind (number_id),
    
CONSTRAINT PRIMARY KEY (number_id, person_id)
    
) ENGINE=INNODB
TABLESPACE=ge_data
COMMENT='Table used to represent districts of
a specific canton.';