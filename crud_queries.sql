-- CRUD operations and example queries

-- 1. CREATE (INSERT)
-- 1a. Insert a new restaurant
INSERT INTO restaurant (name, street_address, description)
VALUES ('Sate Khas Madura', 'Jl. Anggrek No. 7, Sukabumi', 'Sate ayam dan kambing bumbu kacang.');
SELECT * FROM restaurant ORDER BY id;

-- 1b. Insert a new review for an existing restaurant (Bakso Mantap has id 2 in initial data)
INSERT INTO review (restaurant_id, user_name, rating, review_text, review_date)
VALUES (2, 'Fajar', 4, 'Porsi pas dan cepat saji.', '2025-07-22');
SELECT * FROM review WHERE restaurant_id = 2 ORDER BY review_date;

-- 2. READ (SELECT)
-- 2a. All reviews for a specific restaurant (example: restaurant_id = 2)
SELECT * FROM review WHERE restaurant_id = 2 ORDER BY review_date;

-- 2b. All reviews with rating >= 4
SELECT * FROM review WHERE rating >= 4 ORDER BY review_date;

-- 2c. JOIN: restaurants with their reviews
SELECT r.id AS restaurant_id, r.name AS restaurant, rv.id AS review_id,
       rv.user_name, rv.rating, rv.review_text, rv.review_date
FROM restaurant r
JOIN review rv ON rv.restaurant_id = r.id
ORDER BY r.id, rv.review_date;

-- 3. UPDATE
-- 3a. Update the description of one restaurant (id=1)
UPDATE restaurant
SET description = 'Masakan Minang, bersih dan cepat.'
WHERE id = 1;
SELECT * FROM restaurant WHERE id = 1;

-- 3b. Update the rating of a specific review (pick review by user Dedi)
UPDATE review
SET rating = 4
WHERE user_name = 'Dedi';
SELECT * FROM review WHERE user_name = 'Dedi';

-- 4. DELETE
-- 4a. Delete one review by id (delete the review just inserted by Fajar)
DELETE FROM review WHERE user_name = 'Fajar';
SELECT * FROM review WHERE restaurant_id = 2 ORDER BY review_date;

-- 4b. Delete a restaurant and cascade its reviews (delete 'Nasi Goreng Nusantara')
-- First, show ids so you can confirm the id you will delete:
SELECT id, name FROM restaurant ORDER BY id;

-- Now delete by id (adjust 3 to whatever id belongs to 'Nasi Goreng Nusantara' on your screen)
DELETE FROM restaurant WHERE id = 3;

-- Verify that the restaurant is gone
SELECT * FROM restaurant ORDER BY id;

-- Verify cascade: there should be 0 rows for restaurant_id 3
SELECT COUNT(*) AS reviews_left_for_deleted_restaurant
FROM review
WHERE restaurant_id = 3;
