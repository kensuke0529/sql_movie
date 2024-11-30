SELECT 
    customer_id,
    name,
    country,
    gender
FROM customers AS c 
WHERE EXISTS (
    SELECT *
    FROM renting AS r
    WHERE rating >= 4  
        AND date_renting >= '2000-01-01'
        AND r.customer_id = c.customer_id
)