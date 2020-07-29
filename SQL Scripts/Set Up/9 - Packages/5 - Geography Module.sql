DELIMITER ;;
-- Gets every country in the system
DROP PROCEDURE IF EXISTS Geography_getCountries;
CREATE PROCEDURE Geography_getCountries ()
BEGIN
	SELECT id, name FROM country;
END;;

DELIMITER ;;
-- Gets every province in the system from a specific country
DROP PROCEDURE IF EXISTS Geography_getProvinces;
CREATE PROCEDURE Geography_getProvinces (pCountryId INT)
BEGIN
	SELECT id, name FROM province
		WHERE country_id = pCountryId;
END;;

DELIMITER ;;
-- Gets every canton in the system from a specific province
DROP PROCEDURE IF EXISTS Geography_getCantons;
CREATE PROCEDURE Geography_getCantons (pProvinceId INT)
BEGIN
	SELECT id, name FROM canton
		WHERE province_id = pProvinceId;
END;;

DELIMITER ;;
-- Gets every canton in the system from a specific province
DROP PROCEDURE IF EXISTS Geography_getDistricts;
CREATE PROCEDURE Geography_getDistricts (pCantonId INT)
BEGIN
	SELECT id, name FROM district
		WHERE canton_id = pCantonId;
END;;


DELIMITER ;;
-- Gets every canton in the system from a specific province
DROP PROCEDURE IF EXISTS Geography_getCommunities;
CREATE PROCEDURE Geography_getCommunities (pDistrictId INT)
BEGIN
	SELECT id, name FROM community
		WHERE district_id = pDistrictId;
END;;

DELIMITER ;;
-- Gets every nationality available.
DROP PROCEDURE IF EXISTS Geography_getNationalities;
CREATE PROCEDURE Geography_getNationalities ()
BEGIN
	SELECT id, name FROM nationality;
END;;

DELIMITER ;;
-- Gets the phone number code of a certain country
DROP PROCEDURE IF EXISTS Geography_getAreaCode;
CREATE PROCEDURE Geography_getAreaCode (pCountryId INT)
BEGIN
	SELECT id, areacode FROM areacode
		WHERE country_id = pCountryId;
END;;

DELIMITER ;;
-- Obtains the ID of the community
DROP PROCEDURE IF EXISTS Geography_getCommunityId;
CREATE PROCEDURE Geography_getCommunityId (pCountry VARCHAR(100),
										   pProvince VARCHAR(100),
                                           pCanton VARCHAR(100),
                                           pDistrict VARCHAR(100),
                                           pCom VARCHAR(100))
BEGIN
	SELECT com.id FROM community AS com
		INNER JOIN district AS dis
        ON dis.id = com.district_id
        
        INNER JOIN canton AS can
        ON can.id = dis.canton_id
        
        INNER JOIN province AS pro
        ON pro.id = can.province_id
        
        INNER JOIN country AS con
        ON con.id = pro.country_id
        
        WHERE com.name = pCom AND dis.name = pDistrict AND
			  can.name = pCanton AND pro.name = pProvince AND
              con.name = pCountry;
END;;

CALL checkUniqueMobile(3, 71106941);