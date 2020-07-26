GRANT CREATE ON ge.* TO 'ge'@'localhost';
GRANT ALTER, SELECT, INSERT ON  ge.* TO 'ge'@'localhost';
GRANT REFERENCES ON  ge.* TO 'ge'@'localhost';
GRANT DROP ON ge.* TO 'ge'@'localhost';
GRANT TRIGGER ON ad.* TO 'ad'@'localhost';
GRANT ALTER ROUTINE, CREATE ROUTINE, EXECUTE ON ge.* TO 'ge'@'localhost' ; 
GRANT SELECT ON ge.* TO 'ad'@'localhost';