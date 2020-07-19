ALTER TABLE parameter
	ADD creation_date DATE NOT NULL,
    ADD creation_user VARCHAR(10) NOT NULL,
    ADD modification_date DATE,
    ADD modification_user VARCHAR(10);