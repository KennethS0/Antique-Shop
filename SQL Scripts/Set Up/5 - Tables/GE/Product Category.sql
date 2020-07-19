CREATE TABLE IF NOT EXISTS ProductCategory(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name varchar(32) not null
) ENGINE = INNODB
Tablespace = ge_data
COMMENT='Table used to store product categories';