CREATE TABLE IF NOT EXISTS ProductCategory(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(32) NOT NULL
) ENGINE = INNODB
Tablespace = ge_data
COMMENT='Table used to store product categories';