GRANT CREATE ON ad.* TO 'ad'@'localhost';
GRANT ALTER, SELECT, INSERT, DELETE ON  ad.* TO 'ad'@'localhost';
GRANT REFERENCES ON  ad.* TO 'ad'@'localhost';
GRANT REFERENCES ON  ad.* TO 'ge'@'localhost';
GRANT DROP ON ad.* TO 'ad'@'localhost';
GRANT ALTER ROUTINE, CREATE ROUTINE, EXECUTE ON ad.* TO 'ad'@'localhost' ; 
GRANT TRIGGER ON ad.* TO 'ad'@'localhost';