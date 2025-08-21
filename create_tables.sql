-- Create database schema for restaurant_reviews (SQLite)
PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS review;
DROP TABLE IF EXISTS restaurant;

CREATE TABLE restaurant (
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  street_address TEXT NOT NULL,
  description TEXT
);

CREATE TABLE review (
  id INTEGER PRIMARY KEY,
  restaurant_id INTEGER NOT NULL,
  user_name TEXT NOT NULL,
  rating INTEGER NOT NULL CHECK (rating BETWEEN 1 AND 5),
  review_text TEXT,
  review_date DATE NOT NULL,
  FOREIGN KEY (restaurant_id) REFERENCES restaurant(id) ON DELETE CASCADE
);
