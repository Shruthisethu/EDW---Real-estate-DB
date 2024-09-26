CREATE USER 'berealty_user'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON RealEstateDB.* TO 'berealty_user'@'localhost';

SET FOREIGN_KEY_CHECKS = 1;
SET autocommit = 0;


CREATE TABLE Property (
    property_id INT PRIMARY KEY AUTO_INCREMENT,
    address VARCHAR(255),
    type ENUM('residential', 'commercial'),
    price DECIMAL(10, 2),
    status ENUM('available', 'rented', 'sold')
);

CREATE TABLE Agent (
    agent_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255),
    phone_number VARCHAR(15),
    email VARCHAR(255)
);

CREATE TABLE Client (
    client_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255),
    contact_info VARCHAR(255)
);

CREATE TABLE Transaction (
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    property_id INT,
    agent_id INT,
    client_id INT,
    date DATE,
    amount DECIMAL(10, 2),
    FOREIGN KEY (property_id) REFERENCES Property(property_id),
    FOREIGN KEY (agent_id) REFERENCES Agent(agent_id),
    FOREIGN KEY (client_id) REFERENCES Client(client_id)
);

    CREATE TABLE Lease (
    lease_id INT PRIMARY KEY AUTO_INCREMENT,
    property_id INT,
    client_id INT,
    start_date DATE,
    end_date DATE,
    rent_amount DECIMAL(10, 2),
    last_payment_date DATE,
    FOREIGN KEY (property_id) REFERENCES Property(property_id),
    FOREIGN KEY (client_id) REFERENCES Client(client_id)
);

CREATE TABLE Payment (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    lease_id INT,
    payment_date DATE,
    amount DECIMAL(10, 2),
    FOREIGN KEY (lease_id) REFERENCES Lease(lease_id)
);


-- Residential Properties
INSERT INTO Property (address, type, price, status) 
VALUES 
    ('101 Maple St', 'residential', 450000, 'available'),
    ('202 Pine Ave', 'residential', 800000, 'available'),
    ('303 Elm Dr', 'residential', 1200000, 'rented'),
    ('404 Birch Blvd', 'residential', 600000, 'sold');
    
-- Commercial Properties
INSERT INTO Property (address, type, price, status) 
VALUES 
    ('500 Oak St', 'commercial', 2000000, 'available'),
    ('600 Cedar Rd', 'commercial', 3500000, 'available'),
    ('700 Walnut Ave', 'commercial', 5000000, 'rented');


INSERT INTO Property (address, type, price, status)
VALUES 
    ('500 Oak St', 'commercial', 2000000, 'available'),
    ('600 Cedar Rd', 'commercial', 3500000, 'available'),
    ('700 Walnut Ave', 'commercial', 5000000, 'rented'),
    ('801 Spruce St', 'residential', 300000, 'available'),
    ('902 Ash Ln', 'commercial', 2200000, 'sold'),
    ('110 Cherry St', 'residential', 250000, 'rented'),
    ('215 Fir Ave', 'commercial', 4500000, 'rented'),
    ('321 Palm Blvd', 'residential', 320000, 'available'),
    ('432 Cypress St', 'residential', 520000, 'sold'),
    ('543 Redwood Dr', 'commercial', 2500000, 'available'),
    ('654 Poplar Ct', 'residential', 780000, 'available');
    
INSERT INTO Property (address, type, price, status)
VALUES
    ('201 Oak St', 'residential', 400000, 'available'),
    ('202 Pine Ave', 'residential', 600000, 'available'),
    ('203 Elm Dr', 'residential', 750000, 'available'),
    ('204 Birch Blvd', 'residential', 800000, 'available'),
    ('205 Cedar Rd', 'residential', 500000, 'available');


-- Agents
INSERT INTO Agent (name, phone_number, email) 
VALUES 
    ('John Doe', '1234567890', 'john@example.com'),
    ('Jane Smith', '0987654321', 'jane@example.com'),
    ('Alex Johnson', '1122334455', 'alex@example.com');

INSERT INTO Agent (name, phone_number, email)
VALUES 
    ('Emily White', '1223344556', 'emily@realestate.com'),
    ('Lucas Brown', '1334455667', 'lucas@realestate.com'),
    ('Ava Lee', '1445566778', 'ava@realestate.com'),
    ('Oliver Davis', '1556677889', 'oliver@realestate.com'),
    ('Sophia Clark', '1667788990', 'sophia@realestate.com'),
    ('Liam Harris', '1778899001', 'liam@realestate.com'),
    ('Isabella Moore', '1889900112', 'isabella@realestate.com'),
    ('Mason Young', '1990011223', 'mason@realestate.com'),
    ('Charlotte Martin', '1112223334', 'charlotte@realestate.com'),
    ('James Thompson', '2223334445', 'james@realestate.com'),
    ('Amelia Scott', '3334445556', 'amelia@realestate.com'),
    ('Benjamin King', '4445556667', 'benjamin@realestate.com');


-- Clients
INSERT INTO Client (name, contact_info)
VALUES 
    ('Michael Brown', 'michael@domain.com'),
    ('Sarah Davis', 'sarah@domain.com'),
    ('Emma Wilson', 'emma@domain.com'),
    ('Liam Miller', 'liam@domain.com');
    
INSERT INTO Client (name, contact_info)
VALUES 
    ('Olivia Martinez', 'olivia@domain.com'),
    ('William Anderson', 'william@domain.com'),
    ('Ava Taylor', 'ava@domain.com'),
    ('Sophia Thompson', 'sophia@domain.com'),
    ('James White', 'james@domain.com'),
    ('Isabella Lee', 'isabella@domain.com'),
    ('Ethan Moore', 'ethan@domain.com'),
    ('Mia Martin', 'mia@domain.com'),
    ('Alexander Harris', 'alexander@domain.com'),
    ('Grace Clark', 'grace@domain.com'),
    ('Lucas King', 'lucas@domain.com');

-- Linking clients, agents, and properties
INSERT INTO Transaction (property_id, agent_id, client_id, date, amount)
VALUES 
    (1, 1, 1, '2024-09-01', 450000),
    (2, 2, 2, '2024-09-10', 800000),
    (3, 3, 3, '2024-08-15', 1200000);
    
INSERT INTO Transaction (property_id, agent_id, client_id, date, amount)
VALUES 
    (4, 4, 4, '2024-07-05', 600000),
    (5, 5, 5, '2024-09-20', 2000000),
    (6, 6, 6, '2024-09-22', 3500000),
    (7, 7, 7, '2024-06-12', 5000000),
    (8, 8, 8, '2024-05-01', 300000),
    (9, 9, 9, '2024-07-15', 2200000),
    (10, 10, 10, '2024-08-05', 250000),
    (11, 11, 11, '2024-04-20', 4500000),
    (12, 12, 12, '2024-03-18', 320000),
    (13, 13, 13, '2024-02-10', 520000),
    (14, 14, 14, '2024-01-30', 2500000),
    (15, 15, 15, '2024-09-10', 780000);

INSERT INTO Transaction (property_id, agent_id, client_id, date, amount)
VALUES
    (16, 1, 1, '2024-08-01', 400000),
    (17, 1, 2, '2024-08-10', 600000),
    (18, 1, 3, '2024-08-15', 750000),
    (19, 1, 4, '2024-08-20', 800000),
    (20, 1, 5, '2024-08-25', 500000);
    
INSERT INTO Transaction (property_id, agent_id, client_id, date, amount)
VALUES
    (1, 1, 6, '2024-09-01', 450000),
    (1, 2, 7, '2024-09-02', 450000),
    (1, 3, 8, '2024-09-03', 450000),
    (1, 4, 9, '2024-09-04', 450000),
    (1, 5, 10, '2024-09-05', 450000);
    
INSERT INTO Transaction (property_id, agent_id, client_id, date, amount)
VALUES
    (2, 1, 11, CURDATE(), 800000),
    (3, 2, 12, CURDATE(), 1200000),
    (4, 3, 13, CURDATE(), 600000),
    (5, 4, 14, CURDATE(), 2000000),
    (6, 5, 15, CURDATE(), 3500000);


 -- Inserting lease details   
INSERT INTO Lease (property_id, client_id, start_date, end_date, rent_amount, last_payment_date)
VALUES 
    (1, 1, '2024-01-01', '2025-01-01', 1500, '2024-09-01'),
    (2, 2, '2023-05-01', '2024-05-01', 2000, '2024-08-01'),
    (3, 3, '2023-07-15', '2024-07-15', 1200, '2024-07-01'),
    (4, 4, '2024-03-01', '2025-03-01', 1800, '2024-09-01'),
    (5, 5, '2024-04-15', '2025-04-15', 2200, '2024-09-01'),
    (6, 6, '2023-08-01', '2024-08-01', 1750, '2024-09-01'),
    (7, 7, '2024-01-01', '2025-01-01', 1550, '2024-09-01'),
    (8, 8, '2023-06-01', '2024-06-01', 3000, '2024-09-01'),
    (9, 9, '2023-09-01', '2024-09-01', 2800, '2024-09-01'),
    (10, 10, '2024-02-15', '2025-02-15', 2500, '2024-09-01'),
    (11, 11, '2023-10-01', '2024-10-01', 1750, '2024-09-01'),
    (12, 12, '2024-03-01', '2025-03-01', 1900, '2024-09-01'),
    (13, 13, '2024-05-01', '2025-05-01', 2000, '2024-09-01'),
    (14, 14, '2023-12-01', '2024-12-01', 2250, '2024-09-01'),
    (15, 15, '2024-06-01', '2025-06-01', 1800, '2024-09-01');

INSERT INTO Lease (property_id, client_id, start_date, end_date, rent_amount, last_payment_date)
VALUES
    (7, 1, '2024-01-01', DATE_ADD(CURDATE(), INTERVAL 1 MONTH), 2000, CURDATE()),
    (8, 2, '2024-01-01', DATE_ADD(CURDATE(), INTERVAL 2 MONTH), 2500, CURDATE()),
    (9, 3, '2024-01-01', DATE_ADD(CURDATE(), INTERVAL 3 MONTH), 1800, CURDATE()),
    (10, 4, '2024-01-01', DATE_ADD(CURDATE(), INTERVAL 2 MONTH), 2200, CURDATE()),
    (11, 5, '2024-01-01', DATE_ADD(CURDATE(), INTERVAL 1.5 MONTH), 3000, CURDATE());
    
INSERT INTO Lease (property_id, client_id, start_date, end_date, rent_amount, last_payment_date)
VALUES 
    (1, 1, '2024-01-01', '2025-01-01', 1500, '2024-08-01'),
    (2, 2, '2023-05-01', '2024-05-01', 2000, '2024-08-01'),
    (3, 3, '2023-07-15', '2024-07-15', 1200, '2024-07-01'),
    (4, 4, '2024-03-01', '2025-03-01', 1800, '2024-09-01'),
    (5, 5, '2024-04-15', '2025-04-15', 2200, '2024-09-01');


-- Inserting some initial payments
INSERT INTO Payment (lease_id, payment_date, amount)
VALUES 
    (16, '2024-08-01', 1500),
    (17, '2024-08-10', 2000),
    (18, '2024-07-15', 1200),
    (30, '2024-09-05', 1800),
    (45, '2024-09-15', 2200);

-- Alter Lease table to add payment_status column
ALTER TABLE Lease ADD COLUMN payment_status ENUM('paid', 'due', 'overdue') DEFAULT 'due';

-- Alter Client and Agent table to comply 1NF
ALTER TABLE Client
ADD COLUMN `First name` VARCHAR(100),
ADD COLUMN `Last name` VARCHAR(100);

SET SQL_SAFE_UPDATES = 0;
UPDATE Client
SET `First name` = SUBSTRING_INDEX(Name, ' ', 1),
    `Last name` = SUBSTRING_INDEX(Name, ' ', -1);
ALTER TABLE Client
DROP COLUMN Name;

ALTER TABLE Agent
ADD COLUMN `First name` VARCHAR(100),
ADD COLUMN `Last name` VARCHAR(100);

SET SQL_SAFE_UPDATES = 0;
UPDATE Agent
SET `First name` = SUBSTRING_INDEX(Name, ' ', 1),
    `Last name` = SUBSTRING_INDEX(Name, ' ', -1);
    
ALTER TABLE Agent
DROP COLUMN Name;

