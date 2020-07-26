CREATE TABLE IF NOT EXISTS administrator(
    id INT AUTO_INCREMENT PRIMARY KEY,
    
    -- User id foreign key set up
    user_id INT NOT NULL,
	FOREIGN KEY (user_id) 
		REFERENCES useraccount(id)
		ON UPDATE CASCADE
        ON DELETE CASCADE,
        INDEX user_id_ind (user_id)
        
) ENGINE=INNODB
TABLESPACE=ge_data
COMMENT = 'Table used to store information regarding an administrator.';