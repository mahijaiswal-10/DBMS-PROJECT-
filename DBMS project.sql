-- Database Creation
CREATE DATABASE travel;
USE travel;

-- Table Creations
CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    password VARCHAR(255) NOT NULL,
    profile_picture VARCHAR(255),
    created_at DATETIME
);

CREATE TABLE Blogs (
    blog_id INT PRIMARY KEY,
    user_id INT NOT NULL,
    title VARCHAR(100) NOT NULL,
    content TEXT NOT NULL,
    created_at DATETIME,
    updated_at DATETIME,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE Itineraries (
    itinerary_id INT PRIMARY KEY,
    user_id INT NOT NULL,
    title VARCHAR(100) NOT NULL,
    summary TEXT,
    created_at DATETIME,
    updated_at DATETIME,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE Itinerary_Items (
    itinerary_id INT NOT NULL,
    item_id INT NOT NULL,
    sequence_number INT NOT NULL,
    activity_description TEXT NOT NULL,
    location VARCHAR(100) NOT NULL,
    time DATETIME NOT NULL,
    PRIMARY KEY (itinerary_id, item_id),
    FOREIGN KEY (itinerary_id) REFERENCES Itineraries(itinerary_id)
);

CREATE TABLE Packages (
    package_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10,2) NOT NULL,
    duration INT
);

CREATE TABLE Package_Dates (
    package_id INT NOT NULL,
    available_date DATE NOT NULL,
    PRIMARY KEY (package_id, available_date),
    FOREIGN KEY (package_id) REFERENCES Packages(package_id)
);

CREATE TABLE Destinations (
    destination_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    type VARCHAR(50) NOT NULL,
    description TEXT,
    image VARCHAR(255)
);

CREATE TABLE Package_Destinations (
    package_id INT NOT NULL,
    destination_id INT NOT NULL,
    PRIMARY KEY (package_id, destination_id),
    FOREIGN KEY (package_id) REFERENCES Packages(package_id),
    FOREIGN KEY (destination_id) REFERENCES Destinations(destination_id)
);

CREATE TABLE User_Visits (
    visit_id INT PRIMARY KEY,
    user_id INT NOT NULL,
    destination_id INT NOT NULL,
    visit_date DATE NOT NULL,
    notes TEXT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (destination_id) REFERENCES Destinations(destination_id)
);

CREATE TABLE Dashboard_Settings (
    dashboard_id INT PRIMARY KEY,
    user_id INT NOT NULL,
    layout_settings TEXT,
    widget_preferences TEXT,
    last_updated DATETIME,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Data Insertions
INSERT INTO Users VALUES
(1, 'rahul_sharna', 'rahul@gmail.com', '$2a$10$3mJg7Wq0M9yVlbQaXpSZz.ILdFkGZh5s5rRtU9vIw7cN3qK5YHb6', 'rahul.jpg', '2023-01-19'),
(2, 'priya_patel', 'priya@gmail.com', '$2a$10$7tRf2vHx.VAL9pWloBcHDePq3sfBjKL6whXrs2uVMyCLiL8dfg9T', 'priya.jpg', '2023-01-15'),
(3, 'arjun_singh', 'arjun@gmail.com', '$2a$10$9MLnSnR2.WAP3sD4fGh7LuJ8v81cM0mQw2oZ3pX6yA7dS5rT9hV', 'arjun.jpg', '2023-02-05'),
(4, 'neha_gupta', 'neha@gmail.com', '$2a$10$5bN8vC1x.RFZws3dYh6ZuP7q9H1jkWLZnO3px6yA7cV5fDBg9H', 'neha.jpg', '2023-02-10'),
(5, 'vikran_verma', 'vikran@gmail.com', '$2a$10$2cV5fDBg9H1jkWLZnO3px6yA7cV5fDBg9H1jkWLZnO3px6yA7cV5', 'vikran.jpg', '2023-03-01'),
(6, 'ananya_reddy', 'ananya@gmail.com', '$2a$10$4dW7hJ9HL2nH3pQ6sv5fDBg9H1jkWLZnO3px6yA7cV5fDBg9H1j', 'ananya.jpg', '2023-03-10'),
(7, 'rohit_nishra', 'rohit@gmail.com', '$2a$10$6eX8hJ9HL2nH3pQ6sv5fDBg9H1jkWLZnO3px6yA7cV5fDBg9H1jN', 'rohit.jpg', '2023-04-02'),
(8, 'divya_choudhavy', 'divya@gmail.com', '$2a$10$8fY9hJ9HL2nH3pQ6sv5fDBg9H1jkWLZnO3px6yA7cV5fDBg9H1jNN', 'divya.jpg', '2023-04-16'),
(9, 'aman_kumar', 'aman@gmail.com', '$2a$10$9gH1jkWLZnO3px6yA7cV5fDBg9H1jkWLZnO3px6yA7cV5fDBg9H1', 'aman.jpg', '2023-05-01'),
(10, 'pooja_shah', 'pooja@gmail.com', '$2a$10$1hJ2kGL4m8M6o7PBg9RBgTLuV2wX3yZ4A8B6C7D8E9FGG1H213J', 'pooja.jpg', '2023-05-15');

INSERT INTO Destinations VALUES
(1, 'Taj Mahal', 'Monument', 'Iconic white marble mausoleum in Agra', 'tajmahal.jpg'),
(2, 'Jaipur', 'City', 'Pink City with palaces and forts', 'jaipur.jpg'),
(3, 'Goa Beaches', 'Beach', 'Famous beaches and nightlife', 'goa.jpg'),
(4, 'Kerala Backwaters', 'Nature', 'Serene network of Lagoons', 'kerala.jpg'),
(5, 'Leh-Ladakh', 'Mountain', 'High altitude desert landscape', 'ladakh.jpg'),
(6, 'Varanasi', 'Spiritual', 'Ancient holy city on Ganges', 'varanasi.jpg'),
(7, 'Mysore Palace', 'Heritage', 'Grand royal palace in Karnataka', 'mysore.jpg'),
(8, 'Andaman Islands', 'Island', 'Pristine beaches and coral reefs', 'andaman.jpg'),
(9, 'Rishikesh', 'Adventure', 'Yoga capital and river rafting', 'rishikesh.jpg'),
(10, 'Ajanta Ellora', 'Heritage', 'Ancient rock-cut cave temples', 'ajanta.jpg');

INSERT INTO Packages VALUES
(1, 'Golden Triangle', 'Delhi-Agra-Jaipur tour', 25000, 7),
(2, 'Kerala Bliss', 'Backwaters and houseboat stay', 32000, 5),
(3, 'Ladakh Adventure', 'High altitude trekking', 45000, 10),
(4, 'Goa Beach Holiday', 'Relaxing beach vacation', 28000, 6),
(5, 'Spiritual India', 'Varanasi-Rishikesh tour', 22000, 5),
(6, 'South India Heritage', 'Mysore-Hampi temples', 35000, 8),
(7, 'Andaman Escape', 'Island hopping and snorkeling', 42000, 7),
(8, 'Rajasthan Royalty', 'Desert forts and palaces', 38000, 9),
(9, 'Himalayan Trek', 'Manali-Leh expedition', 52000, 12),
(10, 'Wildlife Safari', 'Ranthambore and Bandipur', 29000, 6);

INSERT INTO Package_Dates VALUES
(1, '2023-11-15'), (1, '2023-12-01'), (1, '2024-01-10'),
(2, '2023-10-20'), (2, '2023-11-05'), (2, '2023-12-15'),
(3, '2023-09-01'), (3, '2024-05-15'), (3, '2024-06-20'),
(4, '2023-12-10'), (4, '2024-01-05'), (4, '2024-02-20'),
(5, '2023-11-01'), (5, '2023-11-20'), (5, '2023-12-10'),
(6, '2023-10-15'), (6, '2023-11-25'), (6, '2024-01-05'),
(7, '2023-12-05'), (7, '2024-01-15'), (7, '2024-02-25'),
(8, '2023-10-10'), (8, '2023-11-20'), (8, '2023-12-30'),
(9, '2024-06-01'), (9, '2024-07-15'), (9, '2024-08-20'),
(10, '2023-11-05'), (10, '2023-12-15'), (10, '2024-01-25');

INSERT INTO Package_Destinations VALUES
(1,1), (1,2),
(2,4),
(3,5),
(4,3),
(5,6), (5,9),
(6,7),
(7,8),
(8,2),
(9,5),
(10,2), (10,7);

INSERT INTO Blogs VALUES
(1, 1, 'My Taj Mahal Experience', 'Visiting at sunrise was magical...', '2023-01-20', '2023-01-20'),
(2, 2, 'Goa Beach Guide', 'Best beaches and hidden gems...', '2023-02-01', '2023-02-05'),
(3, 3, 'Ladakh Road Trip', 'Complete itinerary for Manali-Leh...', '2023-02-15', '2023-03-01'),
(4, 4, 'Kerala Backwaters', 'Staying on a houseboat was...', '2023-03-10', '2023-03-12'),
(5, 5, 'Varanasi Ghats', 'Spiritual awakening at dawn...', '2023-03-25', '2023-03-30'),
(6, 6, 'Andaman Travel Tips', 'Must-know before visiting...', '2023-04-05', '2023-04-10'),
(7, 7, 'Rajasthan Forts', 'Architecture and history guide...', '2023-04-20', '2023-05-01'),
(8, 8, 'Himalayan Trek Prep', 'Essential gear and training...', '2023-05-10', '2023-05-15'),
(9, 9, 'South Indian Temples', 'Art and culture exploration...', '2023-05-25', '2023-06-01'),
(10, 10, 'Wildlife Photography', 'Best spots and seasons for...', '2023-06-10', '2023-06-15');

INSERT INTO Itineraries VALUES
(1, 1, 'Golden Triangle Tour', '7-day Delhi-Agra-Jaipur', '2023-01-25', '2023-01-28'),
(2, 2, 'Goa Vacation', 'Beach hopping itinerary', '2023-02-10', '2023-02-15'),
(3, 3, 'Ladakh Adventure', '14-day high altitude trip', '2023-03-05', '2023-03-10'),
(4, 4, 'Kerala Relaxation', 'Backwaters and ayurveda', '2023-03-20', '2023-03-25'),
(5, 5, 'Spiritual Journey', 'Varanasi and Rishikesh', '2023-04-05', '2023-04-10'),
(6, 6, 'Andaman Explorer', 'Island-hopping schedule', '2023-04-20', '2023-04-25'),
(7, 7, 'Rajasthan Heritage', 'Palaces and forts tour', '2023-05-05', '2023-05-10'),
(8, 8, 'Himalayan Trek', 'Manali to Leh route', '2023-05-20', '2023-05-25'),
(9, 9, 'Temple Trail', 'South Indian architecture', '2023-06-05', '2023-06-10'),
(10, 10, 'Wildlife Safari', 'Tiger spotting schedule', '2023-06-20', '2023-06-25');

INSERT INTO Itinerary_Items VALUES
(1,1,1,'Flight to Delhi','Delhi Airport','2023-11-15 08:00'),
(1,2,2,'Red Fort Visit','Delhi','2023-11-16 10:00'),
(2,1,1,'Beach Relaxation','Calangute Beach','2023-12-10 09:00'),
(3,1,1,'Acclimatization Day','Leh','2024-06-01 00:00'),
(4,1,1,'Houseboat Check-in','Alleppey','2023-10-20 14:00'),
(5,1,1,'Ganga Aarti','Dashashwameh Ghat','2023-11-01 18:00'),
(6,1,1,'Snorkeling Trip','Havelock Island','2023-12-05 08:00'),
(7,1,1,'Amber Fort Visit','Jaipur','2023-10-10 09:00'),
(8,1,1,'Start Trek','Manali','2024-06-01 07:00'),
(9,1,1,'Mysore Palace','Mysore','2023-10-15 10:00'),
(10,1,1,'Morning Safari','Ranthambore','2023-11-05 06:00');

INSERT INTO User_Visits VALUES
(1,1,1,'2023-01-15','Beautiful at sunrise'),
(2,2,3,'2023-02-05','Loved the beaches'),
(3,3,5,'2023-03-01','Breathtaking landscapes'),
(4,4,4,'2023-03-15','Peaceful backwaters'),
(5,5,6,'2023-04-02','Spiritual experience'),
(6,6,8,'2023-04-18','Amazing corals'),
(7,7,2,'2023-05-10','Rich history'),
(8,8,5,'2023-05-25','Challenging trek'),
(9,9,7,'2023-06-08','Stunning architecture'),
(10,10,10,'2023-06-22','Saw a tiger!');

INSERT INTO Dashboard_Settings VALUES
(1,1,'{"theme":"light","layout":"compact"}','{"weather":true,"recent":true}','2023-01-12'),
(2,2,'{"theme":"dark","layout":"spacious"}','{"recommendations":true}','2023-01-18'),
(3,3,'{"theme":"light","layout":"default"}','{"upcoming":true}','2023-02-08'),
(4,4,'{"theme":"dark","layout":"compact"}','{"saved":true}','2023-02-13'),
(5,5,'{"theme":"light","layout":"spacious"}','{"recent":true}','2023-03-03'),
(6,6,'{"theme":"dark","layout":"default"}','{"weather":true}','2023-03-18'),
(7,7,'{"theme":"light","layout":"compact"}','{"recommendations":true}','2023-04-05'),
(8,8,'{"theme":"dark","layout":"spacious"}','{"upcoming":true}','2023-04-13'),
(9,9,'{"theme":"light","layout":"default"}','{"saved":true}','2023-05-03'),
(10,10,'{"theme":"dark","layout":"compact"}','{"recent":true}','2023-05-18');

-- Query Examples
-- Find packages between ₹25,000 and ₹35,000
SELECT * FROM Packages
WHERE price BETWEEN 25000 AND 35000;

-- Get all blogs with author information
SELECT u.username, b.title, b.created_at
FROM Blogs b
JOIN Users u ON b.user_id = u.user_id;

-- Find destinations visited more than 5 times
SELECT d.name, COUNT(uv.visit_id) AS visit_count
FROM Destinations d
JOIN User_Visits uv ON d.destination_id = uv.destination_id
GROUP BY d.destination_id
HAVING visit_count > 5
ORDER BY visit_count DESC;

-- Update user profile picture
UPDATE Users
SET profile_picture = 'new_profile.jpg'
WHERE user_id = 3;

-- Find packages available in December 2023
SELECT p.name, pd.available_date
FROM Packages p
JOIN Package_Dates pd ON p.package_id = pd.package_id
WHERE pd.available_date BETWEEN '2023-12-01' AND '2023-12-31';

-- Find users who visited the Taj Mahal
SELECT u.username
FROM Users u
WHERE u.user_id IN (
    SELECT uv.user_id
    FROM User_Visits uv
    WHERE uv.destination_id = 1
);

-- Count blogs per user
SELECT u.username, COUNT(b.blog_id) AS blog_count
FROM Users u
LEFT JOIN Blogs b ON u.user_id = b.user_id
GROUP BY u.user_id;

-- Increase prices of all packages by 10%
UPDATE Packages
SET price = price * 1.1;

-- Delete inactive users (no blogs, no itineraries)
DELETE FROM Users
WHERE user_id NOT IN (
    SELECT user_id FROM Blogs
    UNION
    SELECT user_id FROM Itineraries
);

-- Transaction example (Booking a package)
START TRANSACTION;
INSERT INTO User_Visits VALUES (11, 3, 2, '2023-12-15', 'Package booking');
UPDATE Packages SET price = price - 500 WHERE package_id = 2;
COMMIT;

-- Users with their itineraries
SELECT u.username, i.title
FROM Users u
INNER JOIN Itineraries i ON u.user_id = i.user_id;

-- All users and all blogs (with matches where they exist)
SELECT u.username, b.title
FROM Users u
LEFT JOIN Blogs b ON u.user_id = b.user_id
UNION
SELECT u.username, b.title
FROM Users u
RIGHT JOIN Blogs b ON u.user_id = b.user_id
WHERE u.user_id IS NULL;

-- Find packages with duration longer than average
SELECT p1.name, p1.duration
FROM Packages p1
JOIN Packages p2 ON p1.duration > (
    SELECT AVG(duration) FROM Packages
)
GROUP BY p1.package_id;

-- Complete package details with destinations and dates
SELECT p.name, d.name AS destination, pd.available_date
FROM Packages p
JOIN Package_Destinations pds ON p.package_id = pds.package_id
JOIN Destinations d ON pds.destination_id = d.destination_id
JOIN Package_Dates pd ON p.package_id = pd.package_id
ORDER BY p.name;

-- User Management
CREATE USER 'delhi_admin'@'localhost' IDENTIFIED BY 'Delhi@123';
CREATE USER 'mumbai_agent'@'localhost' IDENTIFIED BY 'Mumbai@456';
CREATE USER 'bangalore_agent'@'localhost' IDENTIFIED BY 'BLr@789';
CREATE USER 'kolkata_staff'@'localhost' IDENTIFIED BY 'Kol@2023';

-- Granting Privileges
GRANT ALL PRIVILEGES ON Travel.* TO 'delhi_admin'@'localhost';
GRANT SELECT, INSERT, UPDATE ON Travel.Packages TO 'mumbai_agent'@'localhost';
GRANT SELECT, INSERT ON Travel.User_Visits TO 'mumbai_agent'@'localhost';
GRANT SELECT, INSERT, UPDATE ON Travel.Blogs TO 'bangalore_agent'@'localhost';
GRANT SELECT ON Travel.Destinations TO 'bangalore_agent'@'localhost';
GRANT SELECT ON Travel.* TO 'kolkata_staff'@'localhost';

-- Revoking Access
REVOKE DELETE ON Travel.Packages FROM 'mumbai_agent'@'localhost';
REVOKE UPDATE ON Travel.Blogs FROM 'bangalore_agent'@'localhost';

-- Find packages to specific Indian destinations
SELECT * FROM Packages
WHERE package_id IN (1, 3, 5); -- Golden Triangle, Ladakh, Spiritual India

-- Packages that don't include beach destinations
SELECT name FROM Packages
WHERE package_id NOT IN (
    SELECT package_id FROM Package_Destinations
    WHERE destination_id IN (
        SELECT destination_id FROM Destinations
        WHERE type = 'Beach'
    )
);

-- Find users who booked premium packages
WITH PremiumUsers AS (
    SELECT DISTINCT uv.user_id
    FROM User_Visits uv
    JOIN Package_Dates pd ON uv.visit_date = pd.available_date
    JOIN Packages p ON pd.package_id = p.package_id
    WHERE p.price > 40000
)
SELECT u.username, u.email
FROM Users u
JOIN PremiumUsers pu ON u.user_id = pu.user_id;
-- Packages that never had any bookings
SELECT package_id FROM Packages
EXCEPT
SELECT DISTINCT package_id FROM Package_Dates;

-- Find Destinations ending with ur, ore, am
SELECT name FROM Destinations
WHERE name REGEXP 'ur$|ore$|am$'; -- Mysore, Thiruvananthapuram, etc.