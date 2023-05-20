CREATE DEFINER=`test_account`@`%` PROCEDURE `FindActor`(IN search_name VARCHAR(255))
BEGIN
	DECLARE result INT;
    
    SET result = (SELECT COUNT(*) FROM top_250
		WHERE Actor1 = search_name OR Actor2 = search_name OR Actor3 = search_name OR Actor4 = search_name);
	
    IF result > 0 THEN
		SELECT CONCAT(search_name, ' has been in ', result, ' movies!') AS Results;
	ELSE
		SELECT CONCAT(search_name, ' did not feature in any top 250 movies.') AS Results;
    END IF;
END