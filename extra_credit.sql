-- Extra credit: menu table and combined query
PRAGMA foreign_keys = ON;

CREATE TABLE IF NOT EXISTS menu (
  id INTEGER PRIMARY KEY,
  restaurant_id INTEGER NOT NULL,
  item_name TEXT NOT NULL,
  price DECIMAL(10,2) NOT NULL CHECK (price >= 0),
  FOREIGN KEY (restaurant_id) REFERENCES restaurant(id) ON DELETE CASCADE
);

-- Insert at least 3 items for each restaurant (for those that exist)
INSERT INTO menu (restaurant_id, item_name, price)
SELECT id, 'Rendang', 30000 FROM restaurant WHERE name = 'Warung Sederhana';
INSERT INTO menu (restaurant_id, item_name, price)
SELECT id, 'Ayam Pop', 28000 FROM restaurant WHERE name = 'Warung Sederhana';
INSERT INTO menu (restaurant_id, item_name, price)
SELECT id, 'Gulai Tunjang', 35000 FROM restaurant WHERE name = 'Warung Sederhana';

INSERT INTO menu (restaurant_id, item_name, price)
SELECT id, 'Bakso Urat', 20000 FROM restaurant WHERE name = 'Bakso Mantap';
INSERT INTO menu (restaurant_id, item_name, price)
SELECT id, 'Mie Bakso', 22000 FROM restaurant WHERE name = 'Bakso Mantap';
INSERT INTO menu (restaurant_id, item_name, price)
SELECT id, 'Es Teh', 5000 FROM restaurant WHERE name = 'Bakso Mantap';

-- If 'Nasi Goreng Nusantara' was deleted, use Sate Khas Madura instead
INSERT INTO menu (restaurant_id, item_name, price)
SELECT id, 'Sate Ayam', 25000 FROM restaurant WHERE name = 'Sate Khas Madura';
INSERT INTO menu (restaurant_id, item_name, price)
SELECT id, 'Sate Kambing', 35000 FROM restaurant WHERE name = 'Sate Khas Madura';
INSERT INTO menu (restaurant_id, item_name, price)
SELECT id, 'Lontong', 5000 FROM restaurant WHERE name = 'Sate Khas Madura';

-- Query: each restaurant with its menu and average rating from its reviews
SELECT r.id AS restaurant_id, r.name AS restaurant,
       m.item_name, m.price,
       (SELECT ROUND(AVG(rv.rating),2) FROM review rv WHERE rv.restaurant_id = r.id) AS avg_rating
FROM restaurant r
LEFT JOIN menu m ON m.restaurant_id = r.id
ORDER BY r.id, m.item_name;
