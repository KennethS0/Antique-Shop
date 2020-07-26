CREATE TABLE IF NOT EXISTS shipment(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
) ENGINE=INNODB
TABLESPACE=ge_data
COMMENT='Catalogue table to represent the types of shipments available.';