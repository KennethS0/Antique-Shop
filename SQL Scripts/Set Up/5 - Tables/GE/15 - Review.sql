CREATE TABLE review(
    id INT AUTO_INCREMENT PRIMARY KEY,
    description TEXT NOT NULL,
    num_stars FLOAT NOT NULL,
    user_reviewed_id INT NOT NULL,
    CONSTRAINT fk_user_reviewed_id
    FOREIGN KEY (user_reviewed_id) 
    REFERENCES useraccount(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
) ENGINE=INNODB
TABLESPACE=ge_data
COMMENT = 'Table used to save reviews that users give each other.';