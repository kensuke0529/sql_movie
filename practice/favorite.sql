select 
    m.genre,
    count(*) as watched_times
from customers as c
LEFT JOIN renting as r
    on c.customer_id = r.customer_id
LEFT JOIN movies as m
    on m.movie_id  = r.movie_id
WHERE m.genre is not NULL 
    AND r.date_renting >= '2000-01-01'
GROUP BY m.genre
ORDER BY watched_times desc