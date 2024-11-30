--Is there a difference across countries?

select 
    c.country,
    COUNT(renting_id) as total_rental,
    ROUND(avg(r.rating)) as avg_rating
from renting as r
LEFT JOIN movies as m
    ON r.movie_id = m.movie_id
LEFT JOIN customers as c
    ON r.customer_id = c.customer_id
GROUP BY country
Order by total_rental desc