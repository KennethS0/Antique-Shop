GRANT CREATE ON ad.* TO 'ad'@'localhost';
GRANT ALTER, SELECT, INSERT ON  ad.* TO 'ad'@'localhost';
GRANT REFERENCES ON  ad.* TO 'ad'@'localhost';
GRANT REFERENCES ON  ad.* TO 'ge'@'localhost';
GRANT DROP ON ad.* TO 'ad'@'localhost';
GRANT TRIGGER ON ad.* TO 'ad'@'localhost';