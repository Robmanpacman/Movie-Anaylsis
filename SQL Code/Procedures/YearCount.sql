CREATE DEFINER=`test_account`@`%` PROCEDURE `YearCount`()
BEGIN	
    SELECT Year, COUNT(Year) AS Amount
	FROM movies
	GROUP BY Year
	ORDER BY Amount DESC;
END