-- Additional queries

-- 1. Highest-rated restaurant by average rating
SELECT r.id, r.name, ROUND(AVG(rv.rating), 2) AS avg_rating
FROM restaurant r
JOIN review rv ON rv.restaurant_id = r.id
GROUP BY r.id, r.name
ORDER BY avg_rating DESC, r.name
LIMIT 1;

-- 2. Number of reviews each restaurant has received
SELECT r.id, r.name, COUNT(rv.id) AS review_count
FROM restaurant r
LEFT JOIN review rv ON rv.restaurant_id = r.id
GROUP BY r.id, r.name
ORDER BY review_count DESC, r.name;

-- 3. Most recent review for each restaurant
SELECT r.id AS restaurant_id, r.name AS restaurant,
       rv.id AS review_id, rv.user_name, rv.rating, rv.review_text, rv.review_date
FROM restaurant r
JOIN review rv
  ON rv.restaurant_id = r.id
WHERE rv.review_date = (
  SELECT MAX(rv2.review_date)
  FROM review rv2
  WHERE rv2.restaurant_id = r.id
)
ORDER BY r.id;
