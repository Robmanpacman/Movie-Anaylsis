CREATE DEFINER=`test_account`@`%` PROCEDURE `GenreCount`()
BEGIN
	SELECT Genre, COUNT(Genre) As 'Amount in Top 250'
	FROM movies
	GROUP BY Genre;
END