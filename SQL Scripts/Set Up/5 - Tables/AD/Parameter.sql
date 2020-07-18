CREATE TABLE IF NOT EXISTS parameter (
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    value VARCHAR(30) NOT NULL
)ENGINE=INNODB
TABLESPACE=ad_data
COMMENT='This table is used to give the administrators of the DB the
ability to change how many rows are displayed in various queries in real
time without the need of restarting any parametersystem.';