/*
 * Write a SQL query SELECT query that:
 * List the first and last names of all actors who have appeared in movies in the "Children" category,
 * but that have never appeared in movies in the "Horror" category.
 */

WITH ChildAct AS (
    SELECT actor_id
    FROM actor
    Join film_actor using (actor_id)
    Join film using (film_id)
    Join film_category using (film_id)
    Join category using (category_id)
    WHERE category_id = 3
),

HorrorAct AS (
    SELECT actor_id
    FROM actor
    Join film_actor using (actor_id)
    Join film using (film_id)
    Join film_category using (film_id)
    Join category using (category_id)
    WHERE category_id = 11
)

SELECT DISTINCT first_name, last_name 
FROM actor
WHERE actor_id IN (SELECT * FROM ChildAct)
AND actor_id NOT IN (SELECT * FROM HorrorAct)
Group By actor_id
Order By last_name, first_name;


