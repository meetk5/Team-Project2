
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

--select movies from all platform by actors name - in this case Samuel Jackson OR Chris Evans 
SELECT m.imdb_id, title, actors, source FROM moviesandshows m
JOIN moviesource a on m.imdb_id=a.imdb_id
JOIN source p on p.source_id= a.source_id
WHERE actors LIKE '%Samuel%Jackson%'
OR actors LIKE '%Chris Evans%';

--select movies from all platform by actors name - in this case Samuel Jackson AND Chris Evans 
SELECT m.imdb_id, title, actors, source FROM moviesandshows m
JOIN moviesource a on m.imdb_id=a.imdb_id
JOIN source p on p.source_id= a.source_id
WHERE actors LIKE '%Samuel%Jackson%'
AND actors LIKE '%Chris Evans%';


--select movies by year - in this case 2020
SELECT m.imdb_id, title, year, source FROM moviesandshows m
JOIN moviesource a on m.imdb_id=a.imdb_id
JOIN source p on p.source_id= a.source_id
WHERE year = '2020';

--select movies where rating is higher than .. - in this case 8.5, higher rating first 
SELECT m.imdb_id, title, imdb_rating, source FROM moviesandshows m
JOIN moviesource a on m.imdb_id=a.imdb_id
JOIN source p on p.source_id= a.source_id
WHERE imdb_rating >= '8.5'
AND imdb_rating <> 'N/A'
ORDER BY imdb_rating DESC;

--select movies by language - in this case Italian AND French
SELECT m.imdb_id, title, language, source FROM moviesandshows m
JOIN moviesource a on m.imdb_id=a.imdb_id
JOIN source p on p.source_id= a.source_id
WHERE language LIKE '%French%'
AND language LIKE '%Italian%';


