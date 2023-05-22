CREATE DEFINER=`test_account`@`%` PROCEDURE `GrossAmountFrom2010`()
BEGIN
	SELECT Title, Year, Gross
	FROM movies
	WHERE Year BETWEEN '2010' AND '2023'
	ORDER BY Gross DESC;
END