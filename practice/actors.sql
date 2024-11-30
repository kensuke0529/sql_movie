
select 
    m.genre,
    a.gender,
    ROUND(MAX(a.year_of_birth),0) as younger_birth_year,
    ROUND(MIN(a.year_of_birth),0) as oldest_birth_year
FROM movies AS m
LEFT JOIN renting AS r
    ON m.movie_id = r.movie_id
LEFT JOIN actsin AS asin
    ON m.movie_id = asin.movie_id
LEFT JOIN actors AS a
    ON asin.actor_id = a.actor_id
WHERE m.genre IN ('Science Fiction & Fantasy', 'Comedy') 
    AND a.gender = 'female'
Group by m.genre, a.gender
ORDER BY m.genre, a.gender
