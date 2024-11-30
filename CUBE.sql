-- CUBE
-- average rating by country and genre

SELECT 
    m.genre,
    c.country,
    ROUND(avg(r.rating),0) as avg_rating,
    COUNT(*)
from renting as r
LEFT JOIN customers as c
    ON r.customer_id = c.customer_id
LEFT JOIN movies as m
    ON r.movie_id = m.movie_id
Where rating is not NULL AND (country = 'USA' OR country =  'Spain')
--GROUP BY CUBE (m.genre, c.country);
--GROUP BY ROLLUP (m.genre, c.country);
GROUP BY GROUPING sets (
    (m.genre, c.country), --group by genre and country
     (m.genre), -- group by genre
     (c.country), -- group by country
     () -- no group by
    );


-- in result, genre + NULL means subtotal of each genre.
