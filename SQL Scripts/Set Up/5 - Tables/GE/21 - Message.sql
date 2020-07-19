CREATE TABLE IF NOT EXISTS message(
	sender_id INT NOT NULL,
    reciever_id INT NOT NULL,
    content VARCHAR(300) NOT NULL,
    dateSent DATETIME NOT NULL,
    
    INDEX dateSent_ind (dateSent),
    
    CONSTRAINT message_sender_fk 
		FOREIGN KEY (sender_id)
		REFERENCES useraccount(id),
    
    CONSTRAINT message_reciever_fk
		FOREIGN KEY (reciever_id)
        REFERENCES useraccount(id),
        
	CONSTRAINT message_pk
		PRIMARY KEY (sender_id, reciever_id)
    
) ENGINE=INNODB
TABLESPACE=ge_data
COMMENT='Different accounts are able to send messages to each other,
this is done by saving the message information in this table.';