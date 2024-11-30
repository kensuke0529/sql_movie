SELECT 
    title,
    genre,
    renting_price
FROM movies
WHERE renting_price > 2
INTERSECT
SELECT
    title,
    genre,
    renting_price
FROM movies
WHERE genre = 'Action & Adventure'