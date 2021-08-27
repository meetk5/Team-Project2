
-- select all movies on NETFLIX  
SELECT m.imdb_id, title FROM moviesandshows m
JOIN moviesource a on m.imdb_id=a.imdb_id
JOIN source p on p.source_id= a.source_id
WHERE source='Netflix';

-- select movies and platform by Title(name), in this case "Captain America" (will list all of them)   
SELECT m.imdb_id, title, source, actors FROM moviesandshows m
JOIN moviesource a on m.imdb_id=a.imdb_id
JOIN source p on p.source_id= a.source_id
WHERE title LIKE '%Captain America%';

--select movies from all platform by actors name - in this case Samuel Jackson 
SELECT m.imdb_id, title, actors, source FROM moviesandshows m
JOIN moviesource a on m.imdb_id=a.imdb_id
JOIN source p on p.source_id= a.source_id
WHERE actors LIKE '%Samuel%Jackson%';
