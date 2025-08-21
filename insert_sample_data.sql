-- Insert initial sample data
INSERT INTO restaurant (name, street_address, description) VALUES
('Warung Mang Saleh', 'Jl. Mita No. 16 Sukabumi', 'Masakan khas Sunda.'),
('Mie Ayam Lajur', 'Jl. Lajur No. 2, Cianjur', 'Mie Ayam Dengan Bumbu Turun Temurun.'),
('Seblak Parasmanan Yandi', 'Jl. Bayangkara No. 11, Sukabumi', 'Seblak Parasmanan Dengan Kuah Yang Medok.');

-- 5 reviews
INSERT INTO review (restaurant_id, user_name, rating, review_text, review_date) VALUES
(1, 'Dinda', 5, 'Rasanya Enak dan mantap.', '2025-07-10'),
(1, 'Abdul', 4, 'Enak, tapi suka abis kalo udh mau magrib.', '2025-07-12'),
(2, 'Rafi', 5, 'Bumbunya mantap!', '2025-07-15'),
(2, 'Adi', 3, 'Harga murah banget, tapi jaraknya jauh.', '2025-07-18'),
(3, 'Alya', 4, 'makanannya top markotop.', '2025-07-20');

