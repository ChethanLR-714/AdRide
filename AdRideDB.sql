CREATE DATABASE AdRideDB;

USE AdRideDB;

-- Users table
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role ENUM('Wall Owner', 'Advertiser', 'Rickshaw Operator') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Walls table
CREATE TABLE walls (
    id INT AUTO_INCREMENT PRIMARY KEY,
    owner_id INT NOT NULL,
    location VARCHAR(255) NOT NULL,
    size VARCHAR(50),
    availability BOOLEAN DEFAULT TRUE,
    price DECIMAL(10, 2),
    FOREIGN KEY (owner_id) REFERENCES users(id)
);

-- Campaigns table
CREATE TABLE campaigns (
    id INT AUTO_INCREMENT PRIMARY KEY,
    advertiser_id INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    budget DECIMAL(10, 2) NOT NULL,
    start_date DATE,
    end_date DATE,
    status ENUM('Active', 'Completed', 'Pending') DEFAULT 'Pending',
    FOREIGN KEY (advertiser_id) REFERENCES users(id)
);

-- Ads table
CREATE TABLE ads (
    id INT AUTO_INCREMENT PRIMARY KEY,
    campaign_id INT NOT NULL,
    wall_id INT NOT NULL,
    content_url VARCHAR(255),
    impressions INT DEFAULT 0,
    clicks INT DEFAULT 0,
    FOREIGN KEY (campaign_id) REFERENCES campaigns(id),
    FOREIGN KEY (wall_id) REFERENCES walls(id)
);
