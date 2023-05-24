DELETE FROM actors
WHERE ActorID IN(
	SELECT ActorID
		FROM(SELECT ActorID, Name, ROW_NUMBER() OVER (PARTITION BY Name ORDER BY Name) AS row_num
		FROM 	actors
	ORDER BY ActorID) t
WHERE row_num > 1);