-- active users
SELECT *
FROM customers
WHERE customer_id IN( 
    select customer_id   
	FROM renting
	GROUP BY customer_id
	Having count(*)> 10);