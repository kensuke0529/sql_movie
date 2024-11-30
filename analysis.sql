--Do customers give better ratings to movies which were recently produced than to older ones?

select 
    CASE
        WHEN m.year_of_release >= 2010 then 'Recent'
        ELSE 'Old'
    END as movie_age,
    ROUND(avg(r.rating),0),
    COUNT(*) as total_rental,
    COUNT(DISTINCT m.movie_id) as total_movie,
    ROUND(COUNT(*) / COUNT(DISTINCT m.movie_id),2) as rent_per_movie 
from renting as r
LEFT JOIN movies as m
    ON r.movie_id = m.movie_id
LEFT JOIN customers as c
    ON r.customer_id = c.customer_id
WHERE
    r.date_renting > '2000-04-01' --Use only records of movie rentals since 2018-04-01
GROUP BY movie_age
Having count(*) > 2;