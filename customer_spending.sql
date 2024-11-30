
select 
    c.customer_id,
    sum(mr.renting_price) as renting_price_sum
from (
    select *
    from movies as m
    LEFT JOIN renting as r
    on m.movie_id = r.movie_id
) as mr
Left JOIN customers as c
ON c.customer_id = mr.customer_id
group by c.customer_id
order by renting_price_sum desc
Limit 10;