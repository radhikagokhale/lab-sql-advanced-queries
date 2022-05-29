-- 1.Get all pairs of actors that worked together.
select distinct fa1.film_id, fa1.actor_id as actor_id1, fa2.actor_id as actor_id2
from film_actor fa1
inner join film_actor fa2 
on fa1.film_id = fa2.film_id
where fa1.actor_id <> fa2.actor_id;  

-- 2. For each film, list actor that has acted in more films.
with cte as (
	select actor_id, count(film_id) as n_of_film
	from film_actor
	group by actor_id
	order by n_of_film asc
)
select film_id, actor_id, max(n_of_film) as no_films
from film_actor
join cte using(actor_id)
group by film_id
order by film_id;
