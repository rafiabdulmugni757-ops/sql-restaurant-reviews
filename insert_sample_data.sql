-- Insert initial sample data
INSERT INTO restaurant (name, street_address, description) VALUES
('Warung Sederhana', 'Jl. Mawar No. 10, Sukabumi', 'Masakan rumahan khas Minang.'),
('Bakso Mantap', 'Jl. Kenanga No. 5, Sukabumi', 'Spesialis bakso urat dan kuah gurih.'),
('Nasi Goreng Nusantara', 'Jl. Melati No. 20, Sukabumi', 'Aneka nasi goreng dengan topping lokal.');

-- 5 reviews
INSERT INTO review (restaurant_id, user_name, rating, review_text, review_date) VALUES
(1, 'Alya', 5, 'Rasanya otentik dan porsinya besar.', '2025-07-10'),
(1, 'Budi', 4, 'Enak, tapi agak ramai saat makan siang.', '2025-07-12'),
(2, 'Citra', 5, 'Baksonya kenyal, kuahnya mantap!', '2025-07-15'),
(2, 'Dedi', 3, 'Harga oke, tapi tempatnya sempit.', '2025-07-18'),
(3, 'Eka', 4, 'Nasi goreng kambingnya top.', '2025-07-20');
